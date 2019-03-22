unit pic4012;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,datelib,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables, Grids, DBGrids,pass;

type
  Tpic4012aForm = class(TForm)
    Qbase: TQuery;
    DataSource1: TDataSource;
    QbaseMARK1: TStringField;
    QbaseLENG1: TFloatField;
    QbaseVALUE1: TStringField;
    QbaseMARK2: TStringField;
    QbaseLENG2: TFloatField;
    QbaseVALUE2: TStringField;
    QbaseMARK3: TStringField;
    QbaseLENG3: TFloatField;
    QbaseVALUE3: TStringField;
    QbaseMARK4: TStringField;
    QbaseLENG4: TFloatField;
    QbaseVALUE4: TStringField;
    QbaseMARK5: TStringField;
    QbaseLENG5: TFloatField;
    QbaseVALUE5: TStringField;
    QbaseMARK6: TStringField;
    QbaseLENG6: TFloatField;
    QbaseVALUE6: TStringField;
    QbaseMARK7: TStringField;
    QbaseLENG7: TFloatField;
    QbaseVALUE7: TStringField;
    QbaseMARK8: TStringField;
    QbaseLENG8: TFloatField;
    QbaseVALUE8: TStringField;
    QbaseMARK9: TStringField;
    QbaseLENG9: TFloatField;
    QbaseVALUE9: TStringField;
    DBGrid1: TDBGrid;
    dataPanel: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    BBselect: TBitBtn;
    BBclose: TBitBtn;
    QbaseRAYEAR: TStringField;
    QbaseGUBUN: TStringField;
    QbasePAYCL: TStringField;
    QbasePAYCLNAME: TStringField;
    QbaseJOBGUN: TStringField;
    QbaseJOBGUNNAME: TStringField;
    QbaseJOBLINE: TStringField;
    QbaseJOBLINENAME: TStringField;
    QbaseSGUBUN1: TStringField;
    QbaseSGUBUN2: TStringField;
    QbaseSGUBUN3: TStringField;
    Qcd: TQuery;
    save: TBitBtn;
    mark1: TEdit;
    leng1: TEdit;
    value1: TEdit;
    mark2: TEdit;
    leng2: TEdit;
    value2: TEdit;
    mark3: TEdit;
    leng3: TEdit;
    value3: TEdit;
    mark4: TEdit;
    leng4: TEdit;
    value4: TEdit;
    mark5: TEdit;
    leng5: TEdit;
    value5: TEdit;
    mark6: TEdit;
    leng6: TEdit;
    value6: TEdit;
    mark7: TEdit;
    leng7: TEdit;
    value7: TEdit;
    mark8: TEdit;
    leng8: TEdit;
    value8: TEdit;
    mark9: TEdit;
    leng9: TEdit;
    value9: TEdit;
    mark10: TEdit;
    leng10: TEdit;
    value10: TEdit;
    Qup: TQuery;
    procedure exitClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure QbaseCalcFields(DataSet: TDataSet);
    procedure BBcloseClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure mark1Change(Sender: TObject);
    procedure saveClick(Sender: TObject);
  private
    start : integer;
    procedure serchDisp;
    procedure serchvariable(key1,key2,key3,key4,key5,key6,key7,key8 : string);
    procedure paramData;
    { Private declarations }
  public
    SelGubun : Boolean;
    change : boolean;
    { Public declarations }
  end;

var
  pic4012aForm: Tpic4012aForm;
  lrayear,lgubun,lpaycl,ljobgun,ljobline,lsgubun1,lsgubun2,lsgubun3 : string;
implementation
uses pic4011;
{$R *.DFM}

procedure Tpic4012aForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure Tpic4012aForm.exitClick(Sender: TObject);
begin
  Qbase.Close;
   if ((pic4011aForm.rayear.text)='') or
      ((pic4011aForm.gubun.text)='')  or
      ((pic4011aForm.paycl.text)='')  or
      ((pic4011aForm.jobgun.text)='')  or
      ((pic4011aForm.jobline.text)='') or
      ((pic4011aForm.sgubun1.text)='') or
      ((pic4011aForm.sgubun2.text)='') or
      ((pic4011aForm.sgubun3.text)='') then begin
      pic4011aForm.rayear.SetFocus;
  end else
  begin
      if pic4011aForm.Mark1.Text <> '' then  pic4011aForm.Mark1.SetFocus
      else pic4011aForm.rayear.SetFocus;
  end;;
  close;
end;


procedure Tpic4012aForm.DBGrid1DblClick(Sender: TObject);
begin
     pic4011aForm.rayear.Text  := Qbase.FieldByName('rayear').AsString;
     pic4011aForm.gubun.Text   := Qbase.FieldByName('gubun').AsString;
     pic4011aForm.paycl.Text   := Qbase.FieldByName('paycl').AsString;
     pic4011aForm.jobgun.Text  := Qbase.FieldByName('jobgun').AsString;
     pic4011aForm.jobline.Text := Qbase.FieldByName('jobline').AsString;
     pic4011aForm.sgubun1.Text := Qbase.FieldByName('sgubun1').AsString;
     pic4011aForm.sgubun2.Text := Qbase.FieldByName('sgubun2').AsString;
     pic4011aForm.sgubun3.Text := Qbase.FieldByName('sgubun3').AsString;

     pic4011aForm.SerchData;

     SelGubun := True;
     pic4011aForm.DataChange := 0; {조회일때에는 데이타체인지를 변화시키지 않는다.}
     Qbase.Close;  close;
end;

procedure Tpic4012aForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key = chr(vk_return) then begin
        if TComponent(Sender).Name = 'DBGrid1' then DBGrid1DblClick(Sender);
        key := chr(0);
     end;
end;

procedure Tpic4012aForm.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
     if gdSelected in state then
        with (Sender as TDBGrid).Canvas do begin
             Font.Color  := clBlue;
             Brush.Color := clYellow;
             Pen.Color   := clBlue;
             FillRect(Rect);
             case Field.Index of
                  0 : TextOut(Rect.Left,Rect.Top+1,'  ☞ '+Field.AsString);
                  1 : TextOut(Rect.Left,Rect.Top+1,' '+Field.AsString);
                  2 : TextOut(Rect.Left,Rect.Top+1,' '+Field.AsString);
                  3 : TextOut(Rect.Left,Rect.Top+1,' '+Field.AsString);
                  4 : TextOut(Rect.Left,Rect.Top+1,' '+Field.AsString);
                  5 : TextOut(Rect.Left,Rect.Top+1,' '+Field.AsString);
                  6 : TextOut(Rect.Left,Rect.Top+1,' '+Field.AsString);
                  7 : TextOut(Rect.Left,Rect.Top+1,' '+Field.AsString);
             end;
        end
     else  with (Sender as TDBGrid).Canvas do begin
        Font.Color  := clBlack;
        Brush.Color := $00E2E2E2;
        FillRect(Rect);
        case Field.Index of
             0 : TextOut(Rect.Left,Rect.Top+1,'     '+field.AsString);
             1 : TextOut(Rect.Left,Rect.Top+1,' '+field.AsString);
             2 : TextOut(Rect.Left,Rect.Top+1,' '+field.AsString);
             3 : TextOut(Rect.Left,Rect.Top+1,' '+field.AsString);
             4 : TextOut(Rect.Left,Rect.Top+1,' '+field.AsString);
             5 : TextOut(Rect.Left,Rect.Top+1,' '+field.AsString);
             6 : TextOut(Rect.Left,Rect.Top+1,' '+field.AsString);
             7 : TextOut(Rect.Left,Rect.Top+1,' '+field.AsString);
        end;
     end;
end;

procedure Tpic4012aForm.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
   if change = True then begin
      change := False;
      save.Caption := '실행';
      save.glyph.loadfromfile(pic4011aForm.HomeDir+'\pic\pbutt014.bmp');
   end;
         SerchDisp;
end;

procedure Tpic4012aForm.serchvariable(key1,key2,key3,key4,key5,key6,key7,key8 : string);
begin
     Qbase.Close;
     Qbase.Sql.Clear;
     Qbase.Sql.Add('select * from pimraba ');
     Qbase.Sql.Add(Format('where (rayear like ''%s'') and (gubun like ''%s'') and ',[key1+'%',key2+'%']));
     Qbase.Sql.Add(Format('      (paycl like ''%s'') and  (jobgun like ''%s'') and ',[key3+'%',key4+'%']));
     Qbase.Sql.Add(Format('      (jobline like ''%s'') and (sgubun1 like ''%s'') and ',[key5+'%',key6+'%']));
     Qbase.Sql.Add(Format('      (sgubun2 like ''%s'') and (sgubun3 like ''%s'') ',[key7+'%',key8+'%']));
     Qbase.Open;
     DBgrid1.SetFocus;
end;


procedure  Tpic4012aForm.serchDisp;
begin
    mark1.text := Qbase.FieldByName('mark1').AsString;
    mark2.text  := Qbase.FieldByName('mark2').AsString;
    mark3.text  := Qbase.FieldByName('mark3').AsString;
    mark4.text  := Qbase.FieldByName('mark4').AsString;
    mark5.text  := Qbase.FieldByName('mark5').AsString;
    mark6.text  := Qbase.FieldByName('mark6').AsString;
    mark7.text  := Qbase.FieldByName('mark7').AsString;
    mark8.text  := Qbase.FieldByName('mark8').AsString;
    mark9.text  := Qbase.FieldByName('mark9').AsString;
    leng1.text  := Format(' %2d',[Qbase.FieldByName('leng1').AsInteger]);
    leng2.text  := Format(' %2d',[Qbase.FieldByName('leng2').AsInteger]);
    leng3.text  := Format(' %2d',[Qbase.FieldByName('leng3').AsInteger]);
    leng4.text  := Format(' %2d',[Qbase.FieldByName('leng4').AsInteger]);
    leng5.text  := Format(' %2d',[Qbase.FieldByName('leng5').AsInteger]);
    leng6.text  := Format(' %2d',[Qbase.FieldByName('leng6').AsInteger]);
    leng7.text  := Format(' %2d',[Qbase.FieldByName('leng7').AsInteger]);
    leng8.text  := Format(' %2d',[Qbase.FieldByName('leng8').AsInteger]);
    leng9.text  := Format(' %2d',[Qbase.FieldByName('leng9').AsInteger]);
    value1.text  := Qbase.FieldByName('value1').AsString;
    value2.text  := Qbase.FieldByName('value2').AsString;
    value3.text  := Qbase.FieldByName('value3').AsString;
    value4.text  := Qbase.FieldByName('value4').AsString;
    value5.text  := Qbase.FieldByName('value5').AsString;
    value6.text  := Qbase.FieldByName('value6').AsString;
    value7.text  := Qbase.FieldByName('value7').AsString;
    value8.text  := Qbase.FieldByName('value8').AsString;
    value9.text  := Qbase.FieldByName('value9').AsString;
end;


procedure Tpic4012aForm.QbaseCalcFields(DataSet: TDataSet);
begin
  // 직급명
        Qcd.close;
        Qcd.sql.clear;
        Qcd.sql.add(' select codename from pyccode ');
        Qcd.sql.add(' where codeid =''I112'' and codeno = '''+Qbase.fieldbyname('paycl').Asstring+''' ');
        Qcd.open;
        if Qcd.recordcount > 0 then
           Qbase.FieldByName('PAYCLNAME').ASstring := Qbase.fieldbyname('paycl').Asstring+
                                 '('+ Qcd.fieldbyName('codename').ASstring+ ')'
        else
           Qbase.FieldByName('PAYCLNAME').ASstring := Qbase.fieldbyname('paycl').Asstring +'()';

  // 직군명
      Qcd.close;
      Qcd.sql.clear;
      Qcd.sql.add(' select codename from pyccode ');
      Qcd.sql.add(' where codeid =''I115'' and codeno = '''+Qbase.fieldbyname('jobgun').Asstring +''' ');
      Qcd.open;
      if Qcd.recordcount > 0 then
         Qbase.FieldByName('JOBGUNNAME').ASstring := Qbase.fieldbyname('jobgun').Asstring +
                                          '('+ Qcd.fieldbyName('codename').ASstring+')'
      else
         Qbase.FieldByName('JOBGUNNAME').ASstring := Qbase.fieldbyname('jobgun').Asstring +'()';

  //직렬명
     Qcd.close;
     Qcd.sql.clear;
     Qcd.sql.add(' select codename from pyccode ');
     Qcd.sql.add(' where codeid =''I115'' and codeno = '''+Qbase.fieldbyname('jobline').Asstring +''' ');
     Qcd.open;
     if Qcd.recordcount > 0 then
         Qbase.FieldByName('JOBLINENAME').ASstring := Qbase.fieldbyname('jobline').Asstring +
                                     '('+ Qcd.fieldbyName('codename').ASstring+')'
     else
         Qbase.FieldByName('JOBLINENAME').ASstring := Qbase.fieldbyname('jobline').Asstring +'()';
end;


procedure Tpic4012aForm.BBcloseClick(Sender: TObject);
begin
   Qbase.Close;
   QCd.Close;
     {데이타 변경유무가 있다고 가정 }
   if pic4011aForm.Datachange = 1 then pic4011aForm.Datachange := 1
     else pic4011aForm.Datachange := 0;
     close;
   pic4011aForm.rayear.setfocus;
end;


procedure Tpic4012aForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if Key = chr(vk_return) then
 begin
    Key := chr(0);
    DBgrid1DblClick(DBgrid1);
 end;
end;

procedure Tpic4012aForm.FormActivate(Sender: TObject);
begin
   if start = 0 then begin
      start := 1;
      Application.ProcessMessages;
      lrayear  := trim(Pic4011aForm.rayear.text);
      lgubun   := trim(Pic4011aForm.gubun.text);
      lpaycl   := trim(Pic4011aForm.paycl.text);
      ljobgun  := trim(Pic4011aForm.jobgun.text);
      ljobline := trim(Pic4011aForm.jobline.text);
      lsgubun1 := trim(Pic4011aForm.sgubun1.text);
      lsgubun2 := trim(Pic4011aForm.sgubun2.text);
      lsgubun3 := trim(Pic4011aForm.sgubun3.text);
      serchvariable(lrayear,lgubun,lpaycl,ljobgun,ljobline,lsgubun1,lsgubun2,lsgubun3);
      SelGubun := False;
      save.Caption := '실행';
      save.glyph.loadfromfile(pic4011aForm.HomeDir+'\pic\pbutt014.bmp');
   end;
end;

procedure Tpic4012aForm.mark1Change(Sender: TObject);
begin
   if change = False then begin
      save.Caption := '저장';
      save.glyph.loadfromfile(pic4011aForm.HomeDir+'\pic\pbutt010.bmp');
      change := True;
   end;   
end;

procedure Tpic4012aForm.saveClick(Sender: TObject);
var
   helpme : THintWindow;
begin
   if change = True then begin
      change := False;
      if MessageBox(handle,'변경된 데이타를 저장하시겠습니까 ?..','확  인',MB_YESNO or $0020) = ID_NO then
      begin
        serchdisp ;
        System.Exit;
      end;
      HelpConstruct(Helpme,'변경된 데이타를 저장하고 있습니다!1..',pic4012aForm);

      Qup.Close;       Qup.SQL.Clear;
      Qup.SQL.Add('update pimraba set ');
      Qup.SQL.Add('mark1 = :lmark1,mark2 = :lmark2,mark3 = :lmark3,');
      Qup.SQL.Add('mark4 = :lmark4,mark5 = :lmark5,mark6 = :lmark6,mark7 = :lmark7, ');
      Qup.SQL.Add('mark8 = :lmark8,mark9 = :lmark9, ');
      Qup.SQL.Add('leng1 = :lleng1,leng2 = :lleng2,leng3 = :lleng3,leng4 = :lleng4,');
      Qup.SQL.Add('leng5 = :lleng5,leng6 = :lleng6,leng7 = :lleng7,leng8 = :lleng8,leng9 = :lleng9,');
      Qup.SQL.Add('value1 = :lvalue1, value2 = :lvalue2, value3 = :lvalue3,');
      Qup.SQL.Add('value4 = :lvalue4, value5 = :lvalue5, value6 = :lvalue6, value7 = :lvalue7,');
      Qup.SQL.Add('value8 = :lvalue8, value9 = :lvalue9, ');
      Qup.SQL.Add('writetime = :lwritetime,writeemp = :lwriteemp ');
      Qup.SQL.Add('where (rayear = :lrayear) and (gubun = :lgubun) and ');
      Qup.SQL.Add('      (paycl = :lpaycl) and (jobgun= :ljobgun) and (jobline = :ljobline) and ');
      Qup.SQL.Add('      (sgubun1=:lsgubun1) and (sgubun2 = :lsgubun2) and (sgubun3 = :lsgubun3) ');

      paramData;   Qup.ExecSQL;
      Helpme.Free;
   end;
   serchvariable(lrayear,lgubun,lpaycl,ljobgun,ljobline,lsgubun1,lsgubun2,lsgubun3);
   save.Caption := '실행';
   save.glyph.loadfromfile(pic4011aForm.HomeDir+'\pic\pbutt014.bmp');

end;

procedure Tpic4012aForm.paramData;
begin
    with Qup do  begin
      parambyname('lrayear').Asstring  := Qbase.Fieldbyname('rayear').Asstring;
      parambyname('lgubun').Asstring   := Qbase.FieldByName('gubun').AsString;
      parambyname('lpaycl').Asstring   := Qbase.FieldByName('paycl').AsString;
      parambyname('ljobgun').Asstring  := Qbase.FieldByName('jobgun').AsString;
      parambyname('ljobline').Asstring := Qbase.FieldByName('jobline').AsString;
      parambyname('lsgubun1').Asstring := Qbase.FieldByName('sgubun1').AsString;
      parambyname('lsgubun2').Asstring := Qbase.FieldByName('sgubun2').AsString;
      parambyname('lsgubun3').Asstring := Qbase.FieldByName('sgubun3').AsString;
      ParamByname('lmark1').AsString  := mark1.Text;
      ParamByname('lmark2').AsString  := mark2.Text;
      ParamByname('lmark3').AsString  := mark3.Text;
      ParamByname('lmark4').AsString  := mark4.Text;
      ParamByname('lmark5').AsString  := mark5.Text;
      ParamByname('lmark6').AsString  := mark6.Text;
      ParamByname('lmark7').AsString  := mark7.Text;
      ParamByname('lmark8').AsString  := mark8.Text;
      ParamByname('lmark9').AsString  := mark9.Text;
      if leng1.Text = '' then  ParamByname('lleng1').AsFloat   := 0
      else ParamByname('lleng1').AsFloat   := strToFloat(leng1.Text);
      if leng2.Text = '' then  ParamByname('lleng2').AsFloat   := 0
      else ParamByname('lleng2').AsFloat   := strToFloat(leng2.Text);
      if leng3.Text = '' then  ParamByname('lleng3').AsFloat   := 0
      else ParamByname('lleng3').AsFloat   := strToFloat(leng3.Text);
      if leng4.Text = '' then  ParamByname('lleng4').AsFloat   := 0
      else ParamByname('lleng4').AsFloat   := strToFloat(leng4.Text);
      if leng5.Text = '' then  ParamByname('lleng5').AsFloat   := 0
      else ParamByname('lleng5').AsFloat   := strToFloat(leng5.Text);
      if leng6.Text = '' then  ParamByname('lleng6').AsFloat   := 0
      else ParamByname('lleng6').AsFloat   := strToFloat(leng6.Text);
      if leng7.Text = '' then  ParamByname('lleng7').AsFloat   := 0
      else ParamByname('lleng7').AsFloat   := strToFloat(leng7.Text);
      if leng8.Text = '' then  ParamByname('lleng8').AsFloat   := 0
      else ParamByname('lleng8').AsFloat   := strToFloat(leng8.Text);
      if leng9.Text = '' then  ParamByname('lleng9').AsFloat   := 0
      else ParamByname('lleng9').AsFloat   := strToFloat(leng9.Text);
      ParamByname('lvalue1').AsString := value1.Text;
      ParamByname('lvalue2').AsString := value2.Text;
      ParamByname('lvalue3').AsString := value3.Text;
      ParamByname('lvalue4').AsString := value4.Text;
      ParamByname('lvalue5').AsString := value5.Text;
      ParamByname('lvalue6').AsString := value6.Text;
      ParamByname('lvalue7').AsString := value7.Text;
      ParamByname('lvalue8').AsString := value8.Text;
      ParamByname('lvalue9').AsString := value9.Text;
      ParamByname('lwritetime').AsString := copy(Pic4011aForm.rStr,1,15);
      ParamByname('lwriteemp').AsString  := Pic4011aForm.Pempno;
  end;
end;

end.
