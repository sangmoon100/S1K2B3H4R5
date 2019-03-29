unit PIT20501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, Grids, DBGrids, OnFocusButton, ComCtrls,
  ExtCtrls, OnShapeLabel, DBAccess, Ora, Db, MemDS, OnScheme, OnSkinBtn
  ,comobj;

type
  TFm_SubForm1 = class(TForm)
    sgd_1: TStringGrid;
    Panel8: TPanel;
    bt_find: TOnSkinButton;
    bt_close: TOnSkinButton;
    cbx_monum: TComboBox;
    Shape1: TShape;
    Label5: TLabel;
    Label1: TLabel;
    procedure bt_findClick(Sender: TObject);
    procedure bt_closeClick(Sender: TObject);
    procedure sgd_1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
     procedure SelQuery;
  public
    SelForm     : TForm;    // 현재 작업중인 Form
  end;

var
  Fm_SubForm1: TFm_SubForm1;

implementation

uses PIT20500;

{$R *.DFM}
//-----------------------------------------------------------------------------------------------------------------------
procedure TFm_SubForm1.SelQuery;
var
   iIdx, jIdx, kIdx, xIdx : Integer;
   sCnt1, sCnt2, sCnt3 : String;
begin
   MainForm.PStringGridClear(sgd_1, sgd_1.ColCount, sgd_1.RowCount);

   with MainForm.Qry_dept do
   begin
      Close;
      Sql.Clear;
      Sql.add(' select a.deptcode                                                                          deptcode   ');
      Sql.add('      , (select deptname from pycdept where deptcode = a.deptcode and orgnum = a.orgnum  )  deptname   ');
      Sql.add('      , a.collectcnt                                                                        collectcnt ');
      Sql.add('      , a.supplecnt                                                                         supplecnt  ');
      Sql.add('   from pischndept a                                                                                   ');
      Sql.add('  where a.monum = :pmonum                                                                              ');
      Sql.add('    and a.conyn = ''Y''                                                                                ');

      ParamByName('pmonum'       ).AsString        := cbx_monum.Text;

      Open;
//      Showmessage(IntToStr(RecordCount));
   end;

   for iIdx := 0 to MainForm.Qry_dept.RecordCount - 1 do
   begin

      sgd_1.Cells[0, iIdx + 1] := MainForm.Qry_dept.FieldByName('deptname').AsString ;
      sgd_1.Cells[1, iIdx + 1] := MainForm.Qry_dept.FieldByName('collectcnt').AsString ;
      sgd_1.Cells[2, iIdx + 1] := MainForm.Qry_dept.FieldByName('supplecnt').AsString ;

      with MainForm.Qry_pmas1  do
      begin
         Close;
         Sql.Clear;

         Sql.add('  select a.aftdeptcode1         aftdeptcode1    ');
         Sql.add('       , count(a.aftdeptcode1)  dept1_cnt       ');
         Sql.add('    from pischnmas a                            ');
         Sql.add('   where monum = :pmonum                        ');
         Sql.add('     and a.aftdeptcode1 = :paftdeptcode         ');
         Sql.add('     and a.state1 in (''1'',''2'',''3'')        ');
         Sql.add('   group by a.aftdeptcode1                      ');

         ParamByName('pmonum'      ).AsString := cbx_monum.Text;
         ParamByName('paftdeptcode').AsString := MainForm.Qry_dept.FieldByName('deptcode').AsString  ;
         Open;

         
         if   FieldByName('dept1_cnt').AsString  = '' then sgd_1.Cells[3, iIdx + 1] := '0'
         else                                              sgd_1.Cells[3, iIdx + 1] := FieldByName('dept1_cnt').AsString;
//         sgd_1.Cells[3, iIdx + 1] := FieldByName('dept1_cnt').AsString ;
      end;
      with MainForm.Qry_pmas2  do
      begin
         Close;
         Sql.Clear;

         Sql.add('  select a.aftdeptcode2         aftdeptcode2    ');
         Sql.add('       , count(a.aftdeptcode2)  dept2_cnt       ');
         Sql.add('    from pischnmas a                            ');
         Sql.add('   where monum = :pmonum                        ');
         Sql.add('     and a.aftdeptcode2 = :paftdeptcode         ');
         Sql.add('     and a.state2 in (''1'',''2'',''3'')        ');
         Sql.add('   group by a.aftdeptcode2                      ');

         ParamByName('pmonum'      ).AsString := cbx_monum.Text;
         ParamByName('paftdeptcode').AsString := MainForm.Qry_dept.FieldByName('deptcode').AsString  ;
         Open;

         if   FieldByName('dept2_cnt').AsString  = '' then sgd_1.Cells[4, iIdx + 1] := '0'
         else                                              sgd_1.Cells[4, iIdx + 1] := FieldByName('dept2_cnt').AsString;

//         sgd_1.Cells[4, iIdx + 1] := FieldByName('dept2_cnt').AsString ;
      end;
      with MainForm.Qry_pmas3  do
      begin
         Close;
         Sql.Clear;

         Sql.add('  select a.aftdeptcode3         aftdeptcode2    ');
         Sql.add('       , count(a.aftdeptcode3)  dept3_cnt       ');
         Sql.add('    from pischnmas a                            ');
         Sql.add('   where monum = :pmonum                        ');
         Sql.add('     and a.aftdeptcode3 = :paftdeptcode         ');
         Sql.add('     and a.state3 in (''1'',''2'',''3'')        ');
         Sql.add('   group by a.aftdeptcode3                      ');

         ParamByName('pmonum'       ).AsString := cbx_monum.Text;
         ParamByName('paftdeptcode').AsString  := MainForm.Qry_dept.FieldByName('deptcode').AsString  ;
         Open;
         if   FieldByName('dept3_cnt').AsString  = '' then sgd_1.Cells[5, iIdx + 1] := '0'
         else                                              sgd_1.Cells[5, iIdx + 1] := FieldByName('dept3_cnt').AsString;
      end;
      MainForm.Qry_dept.Next;
   end;

   if MainForm.Qry_dept.RecordCount = 0 then sgd_1.RowCount := 2
   else                                      sgd_1.RowCount := MainForm.Qry_dept.RecordCount + 1;


   {      Sql.add(' select decode(x.c_cnt, 1, aftdeptcode1, '''') aftdeptcode1, count(decode(x.c_cnt, 1, aftdeptcode1, '''')) aftdeptcnt_1  ');
         Sql.add('      , decode(x.c_cnt, 2, aftdeptcode2, '''') aftdeptcode2, count(decode(x.c_cnt, 2, aftdeptcode2, '''')) aftdeptcnt_2  ');
         Sql.add('      , decode(x.c_cnt, 3, aftdeptcode3, '''') aftdeptcode3, count(decode(x.c_cnt, 3, aftdeptcode3, '''')) aftdeptcnt_3  ');
         Sql.add('   from ( select c_cnt           c_cnt                                                                                   ');
         Sql.add('               , a.empno         empno                                                                                   ');
         Sql.add('               , a.monum         monum                                                                                   ');
         Sql.add('               , a.aftdeptcode1  aftdeptcode1                                                                            ');
         Sql.add('               , a.aftdeptcode2  aftdeptcode2                                                                            ');
         Sql.add('               , a.aftdeptcode3  aftdeptcode3                                                                            ');
         Sql.add('            from pischnmas a                                                                                             ');
         Sql.add('               , (select rownum c_cnt from pischnmas where rownum < 4)                                                   ');
         Sql.add('       		  where monum = :pMonum                                                                                         ');
         Sql.add('           order by a.empno) x                                                                                           ');
         Sql.add('           group by decode(x.c_cnt, 1, aftdeptcode1, '''')                                                               ');
         Sql.add('               ,    decode(x.c_cnt, 2, aftdeptcode2, '''')                                                               ');
         Sql.add('               ,    decode(x.c_cnt, 3, aftdeptcode3, '''')                                                               ');
    }
{ with Qry_cnt do
   begin
      if Qry_dept.RecordCount = 0 then showmessage('모집부서 없음')
      else
      begin
         for iIdx := 0 to Qry_dept.RecordCount - 1 do
         begin
            for jIdx := 0 to Qry_pmas.RecordCount - 1 do
            begin
               if Qry_dept.FieldByName('deptcode').AsString =  Qry_pmas.FieldByName('aftdeptcode1').AsString then
                  sCnt1 := Qry_pmas.FieldByName('aftdeptcnt_1').AsString;
               if Qry_dept.FieldByName('deptcode').AsString =  Qry_pmas.FieldByName('aftdeptcode2').AsString then
                  sCnt2 := Qry_pmas.FieldByName('aftdeptcnt_2').AsString;
               if Qry_dept.FieldByName('deptcode').AsString =  Qry_pmas.FieldByName('aftdeptcode3').AsString then
                  sCnt3 := Qry_pmas.FieldByName('aftdeptcnt_2').AsString;

               Sql.add('select a.deptcode  ');
               for kIdx := 0 to  Qry_dept.RecordCount - 1 do
               begin
                for xIdx := 1 to 3 do
                  Sql.add(', a.deptcode, decode(a.deptcode,  :pDeptcode1, ''1'' ) ');
                  Sql.add(', a.deptcode, decode(a.deptcode,  :pDeptcode2, ''2'' ) ');
                  Sql.add(', a.deptcode, decode(a.deptcode,  :pDeptcode3, ''3'' ) ');
               end;
               Sql.add('  from pischndept a                           ');
               Sql.add(' where a.monum = ''M01'' and a.conyn = ''Y''  ');

               ParamByName('pDeptcode1').AsString := Qry_dept.FieldByName('deptcode').AsString;
               ParamByName('pDeptcode2').AsString := Qry_dept.FieldByName('deptcode').AsString;
               ParamByName('pDeptcode3').AsString := Qry_dept.FieldByName('deptcode').AsString;
               Open;

               Qry_pmas.Next;
            end;
            Qry_dept.Next;
         end;
      end; // if
   end; //with        }
end;
//-----------------------------------------------------------------------------------------------------------------------
procedure TFm_SubForm1.bt_findClick(Sender: TObject);
begin
   SelQuery;
end;
//-----------------------------------------------------------------------------------------------------------------------
procedure TFm_SubForm1.bt_closeClick(Sender: TObject);
begin
   Close;
end;
//-----------------------------------------------------------------------------------------------------------------------
procedure TFm_SubForm1.sgd_1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
   TW , TH : Integer;
begin
  sgd_1.canvas.fillRect(rect);
  sgd_1.canvas.TextRect(Rect, Rect.Left + 3, Rect.Top + 3, sgd_1.cells[acol, arow]);

  if (ACol >= 1) then
  begin
    with sgd_1.Canvas do
    begin
      FillRect(Rect);
      TW := TextWidth(sgd_1.Cells[ACol , ARow]);
      TH := TextHeight(sgd_1.Cells[ACol , ARow]);
      TextOut((Rect.Left + Rect.Right - TW) div 2, (Rect.Top + Rect.Bottom - TH) div 2 , sgd_1.Cells[ ACol , ARow] );
      Exit;
    end;
  end;
end;
//-----------------------------------------------------------------------------------------------------------------------
procedure TFm_SubForm1.FormShow(Sender: TObject);
begin
   cbx_monum.ItemIndex :=  cbx_monum.Items.Count - 1;

   sgd_1.Cells[0,0] := '모집부서';
   sgd_1.Cells[1,0] := '충원인원';
   sgd_1.Cells[2,0] := '확정인원';
   sgd_1.Cells[3,0] := '제1지망';
   sgd_1.Cells[4,0] := '제2지망';
   sgd_1.Cells[5,0] := '제3지망';

   bt_findClick(Sender);

end;
//-----------------------------------------------------------------------------------------------------------------------
end.
