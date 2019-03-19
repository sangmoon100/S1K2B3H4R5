unit PKY1080A2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, DB, DBTables, Buttons,
  MemDS, DBAccess, Ora, OraSmart, Func;

type
  TFM_Sub = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label8: TLabel;
    Panel4: TPanel;
    BBcancel: TBitBtn;
    BBsave: TBitBtn;
    BitBtn1: TBitBtn;
    Panel6: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel15: TPanel;
    Panel23: TPanel;
    OpenDialog1: TOpenDialog;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel5: TPanel;
    Pclearadd: TPanel;
    Edatano: TEdit;
    Qry_tmp: TOraQuery;
    Edataname: TEdit;
    CB_datafld: TComboBox;
    CB_clearadd: TComboBox;
    CB_Cmonthyn: TComboBox;
    CB_Csogubyn: TComboBox;
    Epcfile: TEdit;
    CB_movekind: TComboBox;
    CB_fromtbl: TComboBox;
    CB_fromfld: TComboBox;
    CB_wherefld: TComboBox;
    Ewherevalue: TEdit;
    procedure BBsaveClick(Sender: TObject);
    procedure CBdatafldEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBCmonthynDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CB_datafldEnter(Sender: TObject);
    procedure CB_clearaddClick(Sender: TObject);
    procedure CB_CmonthynDblClick(Sender: TObject);
    procedure CB_CmonthynExit(Sender: TObject);
    procedure CB_CsogubynDblClick(Sender: TObject);
    procedure CB_CsogubynExit(Sender: TObject);
    procedure CB_fromtblEnter(Sender: TObject);
    procedure CB_fromfldEnter(Sender: TObject);
    procedure CB_wherefldEnter(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure CB_movekindEnter(Sender: TObject);
    procedure EdatanoExit(Sender: TObject);
  private
    { Private declarations }
  public
    V_datano, V_dataname,V_datafld, V_clearadd, V_monthyn, V_sogubyn, V_pcfile, V_movekind, V_fromtbl, V_fromfld, V_wherefld, V_wherevalue   : string;
    W_mode : integer; //수정 = 1, 입력 = 0

    function Save_History(progid, modflag, modemp, worktype, empno, dataname : String) : Boolean;

    procedure Get_Data;
    function Save_Data :boolean;

  end;

var
  FM_Sub: TFM_Sub;

implementation
uses PKY1080A1;
{$R *.DFM}

procedure TFM_Sub.BBsaveClick(Sender: TObject);
var
   SavePlace: TBookmark;
   V_modflag : String;
begin
     if W_mode = 0 then
     begin
          if FM_Main.Qry1.Locate('datano', Trim(edatano.Text), []) = True then
          begin
               Application.MessageBox('등록번호가 이미 존재합니다. 확인후 다시 입력하세요.','작업안내',MB_OK+$0030);
               Edatano.SetFocus;
               Edatano.SelectAll;
               System.Exit;
          end;
     end;

     if Edataname.Text = '' then
     begin
          Application.MessageBox('급여 항목명은 반드시 입력되어야합니다','자료오류',MB_OK);
          Edataname.SetFocus;
          System.Exit;
     end;

     if CB_datafld.Text = '' then
     begin
          Application.MessageBox('급여 필드명은 반드시 입력되어야합니다','자료오류',MB_OK);
          CB_datafld.SetFocus;
          System.Exit;
     end;

     if CB_Cmonthyn.Text = 'Y' then
     begin
          if (CB_movekind.Text = '') or (Pos(':',CB_movekind.Text) = 0) then
          begin
               Application.MessageBox('갱신방식은 반드시 선택되어야합니다','자료오류',MB_OK+$0010);
               CB_movekind.SetFocus;
               System.Exit;
          end;

          if Copy(CB_movekind.Text,Pos(':',CB_movekind.Text)+1,Length(CB_movekind.Text)) = 'O' then
          begin
               if CB_fromtbl.Text = '' then
               begin
                    Application.MessageBox('자료화일명은 반드시 입력되어야합니다','자료오류',MB_OK);
                    CB_fromtbl.SetFocus;
                    System.Exit;
               end;
               if CB_fromfld.Text = '' then
               begin
                    Application.MessageBox('자료필드명은 반드시 입력되어야합니다','자료오류',MB_OK);
                    CB_fromfld.SetFocus;
                    System.Exit;
               end;
          end;

          if Copy(CB_movekind.Text,Pos(':',CB_movekind.Text)+1,Length(CB_movekind.Text)) = 'D' then
          begin
               if Epcfile.Text = '' then
               begin
                    Application.MessageBox('PC화일명은 반드시 입력되어야합니다','자료오류',MB_OK);
                    Epcfile.SetFocus;
                    Epcfile.SelectAll;
                    System.Exit;
               end;
          end;
     end;

     //2015.11.17 eyha 작업이력 저장
     if W_mode = 0 then
       V_modflag := '신규'
     else
       V_modflag := '수정';

     if not Save_History('급여항목관리',V_modflag,Pempno,FM_Main.W_worktype,'',Edataname.Text) then
     begin
        MessageDlg('작업이력저장이 실패 하였습니다...',mtError, [mbOk], 0);
        exit;
     end;


     if Save_Data then
     begin
          Application.MessageBox('저장되었습니다.','작업안내',MB_OK+$0040);
          SavePlace := FM_Main.Qry1.GetBookmark;
          FM_Main.Qry1.Refresh;
          FM_Main.Qry1.GotoBookmark(SavePlace);
          FM_Main.Qry1.FreeBookmark(SavePlace);
          Close;
     end;
end;

procedure TFM_Sub.CBdatafldEnter(Sender: TObject);
begin
     with Qry_tmp do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select * from pkmpmas ');
          Open;
          GetFieldNames(CB_datafld.Items);
          Close;
     end;
end;

procedure TFM_Sub.BitBtn1Click(Sender: TObject);
begin
     if OpenDialog1.Execute then
          Epcfile.Text := OpenDialog1.FileName;
end;

procedure TFM_Sub.DBCmonthynDblClick(Sender: TObject);
begin
     if FM_Main.Qry1MONTHYN.value = 'Y' then
          FM_Main.Qry1MONTHYN.value := 'N'
     else
          FM_Main.Qry1MONTHYN.value := 'Y';
end;

procedure TFM_Sub.FormActivate(Sender: TObject);
begin
     Get_Data;
     if CB_clearadd.Text = '0'    then Pclearadd.Caption := 'Rewrite'
     else if CB_clearadd.Text='+' then Pclearadd.Caption := 'Add'
     else                              Pclearadd.Caption := '';
end;

procedure TFM_Sub.Get_Data;
var
     i : integer;
     tmp : TComponent;
begin
     if W_mode = 0 then
     begin
          Edataname.Text   := '';
          CB_datafld.Text  := '';
          CB_clearadd.Text := '0';
          CB_Cmonthyn.Text := 'Y';
          CB_Csogubyn.Text := 'N';
          Epcfile.Text     := '';
          CB_movekind.Text := '';
          CB_fromtbl.Text  := '';
          CB_fromfld.Text  := '';
          CB_wherefld.Text := '';
          Ewherevalue.Text := '';

          {for i:=0 to ComponentCount-1 do
          begin
               tmp := Components[i];
               if tmp.GetParentComponent.Name = 'Panel2' then
               begin
                    if (tmp is TEdit) then TEdit(tmp).Text := '';
                    if (tmp is TComboBox) then TComboBox(tmp).Text := '';
               end;
          end;}
     end
     else if W_mode = 1 then
     begin
          Edataname.Text   := FM_Main.Qry1.FieldByName('dataname').AsString;
          CB_datafld.Text  := FM_Main.Qry1.FieldByName('datafld').AsString;
          CB_clearadd.Text := FM_Main.Qry1.FieldByName('clearadd').AsString;
          CB_Cmonthyn.Text := FM_Main.Qry1.FieldByName('monthyn').AsString;
          CB_Csogubyn.Text := FM_Main.Qry1.FieldByName('sogubyn').AsString;
          Epcfile.Text     := FM_Main.Qry1.FieldByName('pcfile').AsString;
          CB_movekind.Text := GetCodename('K212',FM_Main.Qry1.FieldByName('movekind').AsString)+':'+
                              FM_Main.Qry1.FieldByName('movekind').AsString;
          CB_fromtbl.Text  := FM_Main.Qry1.FieldByName('fromtbl').AsString;
          CB_fromfld.Text  := FM_Main.Qry1.FieldByName('fromfld').AsString;
          CB_wherefld.Text := FM_Main.Qry1.FieldByName('wherefld').AsString;
          Ewherevalue.Text := FM_Main.Qry1.FieldByName('wherevalue').AsString;

     end;


    //2015.11.13 eyha 저장하기전 변경전 값을 저장함
    V_datano        := Edatano.Text      ;
    V_dataname      := Edataname.Text    ;
    V_datafld       := CB_datafld.Text   ;
    V_clearadd      := CB_clearadd.Text  ;
    V_monthyn       := CB_Cmonthyn.Text  ;
    V_sogubyn       := CB_Csogubyn.Text  ;
    V_pcfile        := Epcfile.Text      ;
    V_movekind      := CB_movekind.Text  ;
    V_fromtbl       := CB_fromtbl.Text   ;
    V_fromfld       := CB_fromfld.Text   ;
    V_wherefld      := CB_wherefld.Text  ;
    V_wherevalue    := Ewherevalue.Text  ;
end;

procedure TFM_Sub.CB_datafldEnter(Sender: TObject);
begin
     with Qry_tmp do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select * from pkmpmas ');
          Open;
          GetFieldNames(CB_datafld.Items);
          Close;
     end;
end;

procedure TFM_Sub.CB_clearaddClick(Sender: TObject);
begin
     if CB_clearadd.Text = '0' then
          Pclearadd.Caption := 'Rewrite'
     else
     if CB_clearadd.Text = '+' then
          Pclearadd.Caption := 'Add'
     else
          Pclearadd.Caption := '';
end;

procedure TFM_Sub.CB_CmonthynDblClick(Sender: TObject);
begin
     if CB_Cmonthyn.Text = 'Y' then
          CB_Cmonthyn.Text := 'N'
     else
          CB_Cmonthyn.Text := 'Y';
end;

procedure TFM_Sub.CB_CmonthynExit(Sender: TObject);
begin
     if (CB_Cmonthyn.Text <> 'Y') or (CB_Cmonthyn.Text <> 'y') or (CB_Cmonthyn.Text <> 'N') or (CB_Cmonthyn.Text <> 'n') then
          UpperCase(CB_Cmonthyn.Text);
end;

procedure TFM_Sub.CB_CsogubynDblClick(Sender: TObject);
begin
     if CB_Csogubyn.Text = 'Y' then
          CB_Csogubyn.Text := 'N'
     else
          CB_Csogubyn.Text := 'Y';
end;

procedure TFM_Sub.CB_CsogubynExit(Sender: TObject);
begin
     if (CB_Csogubyn.Text <> 'Y') or (CB_Csogubyn.Text <> 'y') or (CB_Csogubyn.Text <> 'N') or (CB_Csogubyn.Text <> 'n') then
          UpperCase(CB_Csogubyn.Text);
end;

procedure TFM_Sub.CB_fromtblEnter(Sender: TObject);
begin
     CB_fromtbl.Items.Clear;
     with Qry_tmp do
     begin
          Close;
          SQL.Clear;
          {2015.05. 계정권한 분리작업 : dba_objects => all_objects 대체.  강륜종.
          SQL.Add('select object_name a from dba_objects       ' + #13 +         }
          SQL.Add('select object_name a from all_objects       ' + #13 +                   
                  ' where owner = ''HPER''                     ' + #13 +
                  '   and object_type IN (''TABLE'',''VIEW'')  ' + #13 + //20110420 KTH VIEW 조회되게 수정
                  '   and object_name like ''PK%''             ' + #13 +
                  '   and object_name not like ''%#''          ' + #13 + //2015.05. Cubeone 암호화 테이블은 안나오도록 추가. 강륜종.                 
                  ' order by 1                                 ' );
          FetchAll := True;
          Open;

          First;

          while not(Eof) do
          begin
               CB_fromtbl.Items.Add(FieldByName('a').AsString);
               Next;
          end;
          GetFieldNames(CB_fromfld.Items);
     end;
end;

procedure TFM_Sub.CB_fromfldEnter(Sender: TObject);
begin
     if CB_fromtbl.Text = '' then
     begin
          Application.MessageBox('자료화일 항목을 먼저 선택하십시오.','작업안내',MB_OK+$0030);
          System.Exit;
     end;

     with Qry_tmp do
     begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from '+CB_fromtbl.Text;
          FetchAll := False;
          Open;
          Qry_tmp.GetFieldNames(CB_fromfld.Items);
          Close;
     end;
end;

procedure TFM_Sub.CB_wherefldEnter(Sender: TObject);
begin
     if CB_fromtbl.Text = '' then
     begin
          Application.MessageBox('자료화일 항목을 먼저 선택하십시오.','작업안내',MB_OK+$0030);
          System.Exit;
     end;

     with Qry_tmp do
     begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from '+CB_fromtbl.Text;
          Open;
          GetFieldNames(CB_wherefld.Items);
          Close;
     end;
end;

function TFM_Sub.Save_Data: boolean;
var
     tmp_movekind : String;
begin
     Result := False;

     tmp_movekind := Copy(CB_movekind.Text, Pos(':',CB_movekind.Text)+1, Length(CB_movekind.Text));

     if W_mode = 0 then //입력
     begin
          with Qry_tmp do
          begin
               Close;
               SQL.Clear;
               SQL.Add('insert into pkmpfld (datano, dataname, datakind, datafld, clearadd,   ');
               SQL.Add('                     monthyn, sogubyn, movekind, fromtbl,   ');
               SQL.Add('                     fromfld, wherefld, wherevalue, clearyn,');
               SQL.Add('                     moveyn, pcfile, writetime, writeman)   '); //2015.11.19 eyha 갱신일자, 작업자 저장하기
               SQL.Add('       values (''' + Edatano.Text + ''',                    ');
               SQL.Add('               ''' + Edataname.Text + ''',                  ');
               SQL.Add('               ''' + Edatano.Text[1] + ''',                 ');
               SQL.Add('               ''' + CB_datafld.Text + ''',                 ');
               SQL.Add('               ''' + CB_clearadd.Text + ''',                ');
               SQL.Add('               ''' + CB_Cmonthyn.Text + ''',                ');
               SQL.Add('               ''' + CB_Csogubyn.Text + ''',                ');
               SQL.Add('               ''' + tmp_movekind     + ''',                ');
               SQL.Add('               ''' + CB_fromtbl.Text + ''',                 ');
               SQL.Add('               ''' + CB_fromfld.Text + ''',                 ');
               SQL.Add('               ''' + CB_wherefld.Text + ''',                ');
               SQL.Add('               ''' + Ewherevalue.Text + ''',                ');
               SQL.Add('               ''N'',                                       ');
               SQL.Add('               ''Y'',                                       ');
               SQL.Add('               ''' + Epcfile.Text + ''',                    ');
               SQL.Add('               to_char(sysdate, ''YYYYMMDDHH24miss''),      ');
               SQL.Add('               ''' + Pempno + ''')                          ');


               Try
                    ExecSQL;
                    Result := True;
               Except
                    Result := False;
               end;
          end;
     end
     else if W_mode = 1 then //수정
     begin
     with Qry_tmp do
          begin
               Close;
               SQL.Clear;
               SQL.Add('update pkmpfld                                      ');
               SQL.Add('   set dataname = ''' + Edataname.Text + ''',       ');
               SQL.Add('       datakind = ''' + Edatano.Text[1] + ''',      ');
               SQL.Add('       datafld  = ''' + CB_datafld.Text + ''',      ');
               SQL.Add('       clearadd = ''' + CB_clearadd.Text + ''',     ');
               SQL.Add('       monthyn = ''' + CB_Cmonthyn.Text + ''',      ');
               SQL.Add('       sogubyn = ''' + CB_Csogubyn.Text + ''',      ');
               SQL.Add('       movekind = ''' + tmp_movekind     + ''',     ');
               SQL.Add('       fromtbl = ''' + CB_fromtbl.Text + ''',       ');
               SQL.Add('       fromfld = ''' + CB_fromfld.Text + ''',       ');
               SQL.Add('       wherefld = ''' + CB_wherefld.Text + ''',     ');
               SQL.Add('       wherevalue = ''' + Ewherevalue.Text + ''',   ');
               SQL.Add('       pcfile = ''' + Epcfile.Text + ''',           ');
               SQL.Add('       writetime = to_char(sysdate, ''YYYYMMDDHH24miss''),  ');  //2015.11.19 eyha 갱신일자, 작업자 저장하기
               SQL.Add('       writeman = ''' + Pempno + '''                ');

               SQL.Add(' where datano = :p_datano                           ');
               ParamByName('p_datano').AsString := Edatano.Text;
               Try
                    ExecSQL;
                    Result := True;
               Except
                    Result := False;
               end;
          end;
     end;

end;

procedure TFM_Sub.BBcancelClick(Sender: TObject);
begin
     Close;
end;

procedure TFM_Sub.CB_movekindEnter(Sender: TObject);
begin
     CB_movekind.Items.Clear;
     with Qry_tmp do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select codename, codeno from pyccode where codeid = ''K212'' ');
          Open;

          First;

          while not(Eof) do
          begin
               CB_movekind.Items.Add(FieldByName('codename').AsString+':'+FieldByname('codeno').AsString);
               Next;
          end;
     end;
end;

procedure TFM_Sub.EdatanoExit(Sender: TObject);
begin
     if (W_mode = 0) and (FM_Main.Qry1.Locate('datano', Trim(edatano.Text), []) = True) then
     begin
          Application.MessageBox('등록번호가 이미 존재합니다. 확인후 다시 입력하세요.','작업안내',MB_OK+$0030);
          Edatano.SetFocus;
          Edatano.SelectAll;
          System.Exit;
     end;

end;


Function TFM_Sub.Save_History(progid, modflag, modemp, worktype, empno, dataname : String) : Boolean;
var
  qq : TOraQuery;
  V_RECDATA, V_REMARK : string;
begin
  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;

  V_RECDATA := '항목번호:'     +  V_datano    + '||'
             + '항목명:'       + V_dataname   + '||'
             + '필드명:'       + V_datafld    + '||'
             + '작업방식:'     + V_clearadd   + '||'
             + '월변동여부:'   + V_monthyn    + '||'
             + '소급해당여부:' + V_sogubyn    + '||'
             + 'PC화일:'       + V_pcfile     + '||'
             + '갱신방식:'     + V_movekind   + '||'
             + '자료화일:'     + V_fromtbl    + '||'
             + '자료필드명:'   + V_fromfld    + '||'
             + '조건필드:'     + V_wherefld   + '||'
             + '조건값:'       + V_wherevalue
             ;
  V_REMARK  := '급여항목관리에서 자료를 저장';

  with qq do
  begin
       Close;
       SQL.Clear;
       SQL.Add('call HPER.PKHPHIS_LOG (                        ');
       SQL.Add('        '''+ progid     +''',                  ');  //프로그램 ID
       SQL.Add('        '''+ modflag    +''',                  ');  //변경구분
       SQL.Add('        '''+ modemp     +''',                  ');  //작업자
       SQL.Add('        '''+ worktype   +''',                  ');  //작업구분
       SQL.Add('        '''+ empno      +''',                  ');  //대상사번
       SQL.Add('        '''+ dataname   +''',                  ');  //급여항목명
       SQL.Add('        '''+ V_RECDATA  +''',                  ');  //변경전내용
       SQL.Add('        '''+ V_REMARK   +'''                   ');  //작업내용
       SQL.Add('                         )                     ');

       try
            ExecSql;
       except
            Result := false;
            exit;
       end;
       Result := True;
  end;
end;

end.
