unit PIA1070B_7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Tmax_session, OnInsaCommon, Tmax_DataSetText, OnDBGrid, StdCtrls,
  ExtCtrls, OnLineLabel, OnSkinBtn, OnFocusButton, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo, Grids, Db;

type
  TFM_SubForm6 = class(TForm)
    Shape6: TShape;
    OnSectionLabel2: TOnSectionLabel;
    PA_Work1: TPanel;
    anBasDate: TOnComboEdit;
    OnFocusButton1: TOnFocusButton;
    Shape1: TShape;
    SGrid: TStringGrid;
    TDBSet2: TTMaxDataSet;
    CVARI: TTMaxDataSet;
    Label1: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    procedure JeonShape1Click(Sender: TObject);
//    procedure JeonPanel3Click(Sender: TObject);
    procedure Read_Pimvari(sw: Integer; pstr: OleVariant);
    procedure SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure fzSGInitialRow(mStringGrid: TStringGrid);

  private
    { Private declarations }
    procedure ConstructScore;
    procedure MakeGridComponent(cname,cap,vap : string; npos,ypos : integer);
    function check_data(s1 : string):boolean;
//    procedure clear;
    procedure run_data;

  public
    { Public declarations }
    start : integer;
    flag : boolean;
    aptodate : string;
    appr_boncode : string;
    appr_paycl   : string;
    appr_orgnum  : string;

    Insa_Session : TTMaxSession;
    procedure PL_InitForm;
    procedure PL_Select_Data;
    function  Csel_gfd(p_loc: Integer): String;

  end;

var
  FM_SubForm6: TFM_SubForm6;

const
  conval : array[1..9] of string = ('value1','value2','value3','value4','value5',
                                    'value6','value7','value8','value9');
  conmak : array[1..9] of string = ('mark1','mark2','mark3','mark4','mark5',
                                    'mark6','mark7','mark8','mark9');
  conpos : array[1..9] of string = ('leng1','leng2','leng3','leng4','leng5',
                                    'leng6','leng7','leng8','leng9');
  Apprscr : array[1..21] of string =
               ('pdutyscr' ,'pdiscscr' ,
                'pworkscr' ,'psoluscr' ,
                'pideascr' ,'pabtscr'  ,
                'oleadscr' ,'orearscr' ,
                'oindiscr' ,'ocommscr' ,
                'omanascr' ,'oorgascr' ,
                'oabtscr'  ,'abilscr'  ,
                'mrespscr' ,'mappescr' ,
                'mfairscr' ,'mhelpscr' ,
                'mcustscr' ,'mannscr'  ,
                'apprscore');
  Apprcls : array[1..21] of string =
               ('pdutycls' ,'pdisccls' ,
                'pworkcls' ,'psolucls' ,
                'pideacls' ,'pabtcls'  ,
                'oleadcls' ,'orearcls' ,
                'oindicls' ,'ocommcls' ,
                'omanacls' ,'oorgacls' ,
                'oabtcls'  ,'abilcls'  ,
                'mrespcls' ,'mappecls' ,
                'mfaircls' ,'mhelpcls' ,
                'mcustcls' ,'manncls'  ,
                'apprclass');

implementation
uses PIA1070B_1;
{$R *.DFM}

procedure TFM_SubForm6.fzSGInitialRow(mStringGrid: TStringGrid);
var
  i, j: Integer;
begin
    with mStringGrid do
    begin
        RowCount := FixedRows + 1;
        for i := FixedRows to RowCount -1 do
        begin
            for j := FixedCols to ColCount -1 do
                Cells[j, i] := '';
            RowHeights[i] := DefaultRowHeight;
        end;
    end;
end;

procedure TFM_SubForm6.SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
  with (Sender as TStringGrid).Canvas do
  begin
    if (Sender as TStringGrid).DefaultDrawing = True then
    begin
      if (ARow = 0) then
      begin
        Brush.Color := $00C1EBEF;
        Font.Color  := clBlack;
      end
      else
      begin
        Brush.Color := clNavy;
        Font.Color  := clWhite;
      end;
    end
    else
    begin
      if (ARow = 0) then
       //if gdSelected in State then
      begin
        Brush.Color := $00C1EBEF;
        Font.Color  := clBlack;
      end
      else
      begin
        Brush.Color := clWhite;
        Font.Color  := clBlack;
      end;
    end;

    if (ARow = 0) then
    begin
      Loc := DT_CENTER or DT_WORDBREAK;
      Font.Style := [fsBold];
    end
    else
    begin
      Loc := DT_LEFT or DT_WORDBREAK;
      Font.Style := [];
    end;

     FillRect(Rect);
     Rect.Top   := Rect.Top + 2;
     Rect.Left  := Rect.Left + 2;

     DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, Loc);
  end;
end;

procedure TFM_SubForm6.PL_InitForm;
begin
  TDBset2.Session := Insa_Session;
  CVARI.Session := Insa_Session;
end;

procedure TFM_SubForm6.PL_Select_Data;
var
  SqlText : String;
begin
  SGrid.visible := True;
  fzSGInitialRow(SGrid);
  SGrid.DefaultRowHeight := 22;
  with SGrid do
  begin
      Cols[0].Text := '평가항목'; ColWidths[0] := 150;
      Cols[1].Text := '배점';     ColWidths[1] := 90;
      Cols[2].Text := '전사평균'; ColWidths[2] := 90;
      Cols[3].Text := '부서평균'; ColWidths[3] := 90;
      Cols[4].Text := '직급평균'; ColWidths[4] := 90;
      Cols[5].Text := '본인점수'; ColWidths[5] := 90;
      Cols[6].Text := '평가점수'; ColWidths[6] := 90;
      Cols[7].Text := '평가등급'; ColWidths[7] := 90;
  end;

  SqlText := 'select RPAD(NVL(value1,'' ''),20) ||'';''|| RPAD(NVL(value2,'' ''),20) from ' +
             'pimvari where gubun=''D2'' and sgubun=''0001'' ';
  try
    TDBSet2.Close;
    TDBSet2.ClearFieldInfo;
    TDBSet2.AddField('sel_data', ftString, 2100);
    TDBSet2.Sql.Clear;
    TDBSet2.Sql.Text := SqlText;
    TDBSet2.ServiceName := 'PIA1070B_sel11';
    TDBSet2.Open;
    //Tfunc_TTable(TDBSet2, 'SHR1SSELA', '0001', SqlText);

    aptodate := Csel_gfd(1);
    if trim(aptodate) = '' then begin
       MessageBox(0,'평가대상기간이 존재하지 않습니다 !!.','알 림',MB_OK or $0030);
       System.Exit;
    end;
    TDBSet2.Close;
  except
    System.Exit;
  end;

  //
  anBasDate.Items.Clear;
  SqlText := 'select distinct NVL(aptodate,'' '') from pihappr ' +
             'order by 1 desc ';
  try
    TDBSet2.Close;
    TDBSet2.ClearFieldInfo;
    TDBSet2.AddField('sel_data', ftString, 2100);
    TDBSet2.Sql.Clear;
    TDBSet2.Sql.Text := SqlText;
    TDBSet2.ServiceName := 'PIA1070B_sel11';
    TDBSet2.Open;

//    Tfunc_TTable(TDBSet2, 'SHR1SSELA', '0050', SqlText);
    while not TDBSet2.Eof do begin
      anBasDate.Items.Add(Copy(Csel_gfd(1),1,4)+'/'+
                          Copy(Csel_gfd(1),5,2)+'/'+
                          Copy(Csel_gfd(1),7,2));
      TDBSet2.Next;
    end;
    TDBSet2.Close;
  except
    System.Exit;
  end;
  anBasDate.ItemIndex := 0;
  // kcj
  aptodate := Copy(anBasDate.Text,1,4)+
              Copy(anBasDate.Text,6,2)+
              Copy(anBasDate.Text,9,2);

  if check_data(aptodate) then begin
     Run_data;     // 최근 기준년도의 상향평가점수를 디스플레이한다.
     flag := True;
  end
  else anbasdate.SetFocus;
  anbasdate.text :=Copy(aptodate,1,4)+'/'+
                   Copy(aptodate,5,2)+'/'+
                   Copy(aptodate,7,2);
  Application.ProcessMessages;
end;
///////////////////////////////////////////////////////////////////////////////
function TFM_SubForm6.check_data(s1 : String) : Boolean;
var
  SqlText : String;
begin
  appr_boncode := '';
  appr_paycl := '';
  appr_orgnum := '';
  check_data := True;

  Cvari.close;

  SqlText := Format('select RPAD(NVL(boncode,'' ''),6) ||'';''|| RPAD(NVL(paycl,'' ''),3) ||'';''|| RPAD(NVL(orgnum,'' ''),3) from pihappr '+
             'where empno = ''%s'' and aptodate = ''%s'' and pappryn in (''Y'',''y'') ',
             [FM_Main.FG_CurEmpno, aptodate]);
  try
    TDBSet2.Close;
    TDBSet2.ClearFieldInfo;
    TDBSet2.AddField('sel_data', ftString, 2100);
    TDBSet2.Sql.Clear;
    TDBSet2.Sql.Text := SqlText;
    TDBSet2.ServiceName := 'PIA1070B_sel11';
    TDBSet2.Open;

    if (TDBSet2.RecordCount <= 0) OR ( Csel_gfd(1) = '' ) then
    begin
       if flag then begin
          flag := False;
//          Clear;
       end;
       SGrid.visible := false;
//       pia1070bForm.ErrHelp.Visible := True;
       check_data := false;
    end
    else SGrid.visible := True;
    appr_boncode := Csel_gfd(1);
    appr_paycl   := Csel_gfd(2);
    appr_orgnum  := Csel_gfd(3);
    TDBSet2.Close;
  except
    System.Exit;
  end;
end;


// 상향평가화일에서 해당년도에 맞는 데이타를 읽어온다...........................
procedure TFM_SubForm6.Run_data;
var
  Imsi : array[1..6] of TStringList;
  i,j,nCnt : integer;
  divcount : real;
  SqlStr3,SqlStr4,SqlStr5,SqlStr6,SqlStr7,SqlStr8,sql : string;
  helpme : THintWindow;
begin
   FM_Main.LA_Help.Caption   := '상향평가점수를 읽고 있습니다 !!.';
   Application.Processmessages;

   ConstructScore;
   // 임시변수를 생성한다.
   for i := 1 to 6 do
       Imsi[i] := TStringList.Create;
   for i := 1 to 6 do
     for j := 1 to SGrid.RowCount do
        Imsi[i].Add('');

   // 전사평균 Select Sentence.
   SqlStr3 := '';
   for i := 1 to SGrid.RowCount  do begin
     if i <> (SGrid.RowCount ) then
          SqlStr3 := SqlStr3+('rpad(to_char(Avg( '+ SGrid.Cells[2,i] +' )),20) ||'';''|| ')
     else
          SqlStr3 := SqlStr3+('rpad(to_char(Avg('+SGrid.Cells[2,i]+')),20)');
   end;
   SqlStr3 := Format('Select '+SqlStr3+' From pihsapp '+
                     'Where aptodate = ''%s'' and apgubun=''Y''',[aptodate]);

   // 부서평균 Select Sentence.
   SqlStr4 := '';
   for i := 1 to SGrid.RowCount  do begin
       if i <> (SGrid.RowCount ) then
             SqlStr4 := SqlStr4+('rpad(to_char(Sum(s.'+SGrid.Cells[3,i]+')),20) ||'';''|| ')
       else
             SqlStr4 := SqlStr4+('rpad(to_char(Sum(s.'+SGrid.Cells[3,i]+')),20)');
   end;
   SqlStr4 := Format('Select '+Sqlstr4+' From pihappr p, pihsapp s ' +
                     'where  p.empno = s.empno and p.aptodate = s.aptodate and '+
                     '       p.aptodate = ''%s'' and p.pappryn=''Y'' and '+
                     '       p.boncode = trim(''%s'')  and p.orgnum=''%s'' and s.apgubun = ''Y'' ',
                      [aptodate,Appr_boncode,Appr_orgnum]);

   // 직급평균 Select Sentence.
   SqlStr5 := '';
   for i := 1 to SGrid.RowCount  do begin
       if i <> (SGrid.RowCount ) then
           SqlStr5 := SqlStr5+('rpad(to_char(Sum(s.'+SGrid.Cells[4,i]+')),20) ||'';''|| ')
       else
           SqlStr5 := SqlStr5+('rpad(to_char(Sum(s.'+SGrid.Cells[4,i]+')),20)');
   end;
   SqlStr5 := Format('Select '+Sqlstr5+' From pihappr p, pihsapp s ' +
                     'where  p.empno = s.empno and p.aptodate = s.aptodate and '+
                     '       p.aptodate = ''%s'' and p.pappryn=''Y'' and '+
                     '       p.paycl = ''%s''  and s.apgubun = ''Y'' '+
                     'group by p.paycl ' ,[aptodate,Appr_paycl]);

   // 본인점수 Select Sentence.
   SqlStr6 := '';
   for i := 1 to SGrid.RowCount  do begin
        if i <> (SGrid.RowCount ) then
           SqlStr6 := SqlStr6+('rpad(to_char('+SGrid.Cells[5,i]+'),20) ||'';''|| ')
        else
           SqlStr6 := SqlStr6+('rpad(to_char('+SGrid.Cells[5,i]+'),20)');
   end;
   SqlStr6 := Format('Select '+SqlStr6+' From t_pitsapp '+
                     'Where aptodate = ''%s'' and empno = ''%s'''+
                     '  and apempno  = ''%s''',[aptodate,FM_Main.FG_CurEmpno,FM_Main.FG_CurEmpno]);

   // 평가점수 Select Sentence.
   SqlStr7 := '';
   for i := 1 to SGrid.RowCount  do begin
        if i <> (SGrid.RowCount ) then
           SqlStr7 := SqlStr7+('rpad(to_char('+SGrid.Cells[6,i]+'),20) ||'';''|| ')
        else
           SqlStr7 := SqlStr7+('rpad(to_char('+SGrid.Cells[6,i]+'),20)');
   end;
   SqlStr7 := Format('Select '+SqlStr7+' From pihappr '+
                     'Where aptodate = ''%s'' and empno = ''%s''',[aptodate,FM_Main.FG_CurEmpno]);

   // 등급 Select Sentence.
   SqlStr8 := '';
   for i := 1 to SGrid.RowCount  do begin
        if i <> (SGrid.RowCount ) then
           SqlStr8 := SqlStr8+('rpad( ('+SGrid.Cells[7,i]+'),20) ||'';''|| ')
        else
           SqlStr8 := SqlStr8+('rpad( ('+SGrid.Cells[7,i]+'),20)');
   end;
   SqlStr8 := Format('Select '+SqlStr8+' From pihappr '+
                     'Where aptodate = ''%s'' and empno = ''%s'' ',[aptodate,FM_Main.FG_CurEmpno]);


  // 전사평균 Select를 서버에 날리고 변수에 할당한다.
  try
    TDBSet2.Close;
    TDBSet2.ClearFieldInfo;
    TDBSet2.AddField('sel_data', ftString, 2100);
    TDBSet2.Sql.Clear;
    TDBSet2.Sql.Text := SqlStr3;
    TDBSet2.ServiceName := 'PIA1070B_sel11';
    TDBSet2.Open;

    for i := 0 to SGrid.RowCount -1 do
      if StrToFloat(Csel_gfd(i)) > 0 then
        Imsi[1][i] := FormatFloat('##0.00',StrToFloat(Csel_gfd(i)))
      else Imsi[1][i] := '0';
    TDBSet2.Close;
  except
  TDBSet2.Close;
  end;
  // 부서평균 Select를 서버에 날리고 변수에 할당한다.
    sql := Format('select sum(realcount) cnt from pihappr where aptodate = ''%s'' '+
                  'and pappryn=''Y'' and orgnum = ''%s'' and boncode = trim(''%s'') '+
                  'group by orgnum,boncode ', [aptodate,Appr_orgnum,appr_boncode]);
  divcount := 0;
  try
    TDBSet2.Close;
    TDBSet2.ClearFieldInfo;
    TDBSet2.AddField('sel_data', ftString, 2100);
    TDBSet2.Sql.Clear;
    TDBSet2.Sql.Text := Sql;
    TDBSet2.ServiceName := 'PIA1070B_sel11';
    TDBSet2.Open;

    divCount := StrToInt(Csel_gfd(1));
    TDBSet2.Close;
  except
  TDBSet2.Close;
  end;
  try
    TDBSet2.Close;
    TDBSet2.ClearFieldInfo;
    TDBSet2.AddField('sel_data', ftString, 2100);
    TDBSet2.Sql.Clear;
    TDBSet2.Sql.Text := SqlStr4;
    TDBSet2.ServiceName := 'PIA1070B_sel11';
    TDBSet2.Open;
    for i := 0 to SGrid.RowCount -1 do
       if Divcount <> 0 then
           Imsi[2][i] := FormatFloat('##0.00',StrToFloat(Csel_gfd(i))/DivCount)
       else Imsi[2][i] := '0';
    TDBSet2.Close;
  except
  TDBSet2.Close;
  end;
  sql := Format('select sum(realcount) cnt from pihappr where aptodate = ''%s'' '+
                'and pappryn=''Y'' and paycl = ''%s'' '+
                'group by paycl ', [aptodate,Appr_paycl]);
  divcount := 0;
  try
    TDBSet2.Close;
    TDBSet2.ClearFieldInfo;
    TDBSet2.AddField('sel_data', ftString, 2100);
    TDBSet2.Sql.Clear;
    TDBSet2.Sql.Text := Sql;
    TDBSet2.ServiceName := 'PIA1070B_sel11';
    TDBSet2.Open;
    divCount := StrToInt(Csel_gfd(1));
    TDBSet2.Close;
  except
  TDBSet2.Close;
  end;

  // 직급평균 Select를 서버에 날리고 변수에 할당한다.
  try
    TDBSet2.Close;
    TDBSet2.ClearFieldInfo;
    TDBSet2.AddField('sel_data', ftString, 2100);
    TDBSet2.Sql.Clear;
    TDBSet2.Sql.Text := SqlStr5;
    TDBSet2.ServiceName := 'PIA1070B_sel11';
    TDBSet2.Open;
    for i := 0 to SGrid.RowCount -1  do
    begin
      if DivCount <> 0 then
           Imsi[3][i] := FormatFloat('##0.00',StrToFloat(Csel_gfd(i))/DivCount)
      else Imsi[3][i] := '0';
    end;
    TDBSet2.Close;
  except
  TDBSet2.Close;
  end;
  // 본인점수 Select를 서버에 날리고 변수에 할당한다.
  try
    TDBSet2.Close;
    TDBSet2.ClearFieldInfo;
    TDBSet2.AddField('sel_data', ftString, 2100);
    TDBSet2.Sql.Clear;
    TDBSet2.Sql.Text := SqlStr6;
    TDBSet2.ServiceName := 'PIA1070B_sel11';
    TDBSet2.Open;
    for i := 0 to SGrid.RowCount-1  do
    begin
      Imsi[4][i] := FormatFloat('##0.00',StrToFloat(Csel_gfd(i)))
    end;
    TDBSet2.Close;
  except
    TDBSet2.Close;
  end;

  // 평가점수 Select를 서버에 날리고 변수에 할당한다.
  try
    TDBSet2.Close;
    TDBSet2.ClearFieldInfo;
    TDBSet2.AddField('sel_data', ftString, 2100);
    TDBSet2.Sql.Clear;
    TDBSet2.Sql.Text := SqlStr7;
    TDBSet2.ServiceName := 'PIA1070B_sel11';
    TDBSet2.Open;
    for i := 0 to SGrid.RowCount-1  do begin
      Imsi[5][i] := FormatFloat('##0.00',StrToFloat(Csel_gfd(i)))
    end;
    TDBSet2.Close;
  except
    TDBSet2.Close;
  end;

  // 등급 Select를 서버에 날리고 변수에 할당한다.
  try
    TDBSet2.Close;
    TDBSet2.ClearFieldInfo;
    TDBSet2.AddField('sel_data', ftString, 2100);
    TDBSet2.Sql.Clear;
    TDBSet2.Sql.Text := SqlStr8;
    TDBSet2.ServiceName := 'PIA1070B_sel11';
    TDBSet2.Open;
    nCnt := TDBSet2.Recordcount;
    for i := 0 to SGrid.RowCount -1  do begin
      if Trim(Csel_gfd(i)) = 'A' then
        Imsi[6][i] := '우수'
      else if Trim(Csel_gfd(i)) = 'B' then
        Imsi[6][i] := '보통'
      else if Trim(Csel_gfd(i)) = 'C' then
        Imsi[6][i] := '미흡';
    end;
    TDBSet2.Close;
  except
    TDBSet2.Close;
  end;

  // 변수에 할당된 값을 생성한 해당 필드에 출력한다.
  for i := 0 to SGrid.RowCount -1   do
  begin
    Sgrid.cells[2,i+1] := Imsi[1][i];
    Sgrid.cells[3,i+1] := Imsi[2][i];
    Sgrid.cells[4,i+1] := Imsi[3][i];
    Sgrid.cells[5,i+1] := Imsi[4][i];
    Sgrid.cells[6,i+1] := Imsi[5][i];
    Sgrid.cells[7,i+1] := Imsi[6][i];
  end;

  for i := 1 to 6 do
      Imsi[i].Destroy;
  if nCnt = 0 then begin
//      Clear;
//      pia1070bForm.ErrHelp.Visible := True;
      close;
  end;
    FM_Main.LA_Help.Caption   := '';
//    helpme.free;
end;

// 상향평가 함목 및 배점을 구성한다.............................................
procedure TFM_SubForm6.ConstructScore;
var
  cnt,i,j,pcnt ,fpos: integer;
  cstr,vstr : string;
begin
  pcnt := 1;
  with CVARI do
  begin
    // 개인능력.......
    Read_Pimvari(3,vararrayof(['D2','1001']));
    if Recordcount > 0 then
    begin
      cnt := 1;
      for i := 1 to 9 do
      begin
        if trim(fieldbyname(conval[i]).AsString) = '' then continue;
        cstr := fieldbyname(conmak[i]).AsString;
        vstr := fieldbyname(conval[i]).AsString;
        fpos := fieldbyname(conpos[i]).AsInteger;
        for j := 1 to 8 do
          MakeGridComponent('AP'+inttostr(cnt)+inttostr(j),cstr,vstr,j,pcnt);
        inc(cnt);
        inc(pcnt);
      end;
      for j := 1 to 8 do
        MakeGridComponent('APSum'+inttostr(j),'[개인능력소계]','35',j,pcnt);
        inc(pcnt);
      end;

    Read_Pimvari(3,vararrayof(['D2','1002']));
    if Recordcount > 0 then
    begin
      cnt := 1;
      for i := 1 to 9 do
      begin
        if trim(fieldbyname(conval[i]).AsString) = '' then continue;
        cstr := fieldbyname(conmak[i]).AsString;
        vstr := fieldbyname(conval[i]).AsString;
        fpos := fieldbyname(conpos[i]).AsInteger;

        for j := 1 to 8 do
           MakeGridComponent('BP'+inttostr(cnt)+inttostr(j),cstr,vstr,j,pcnt);
        inc(cnt);
        inc(pcnt);
      end;
      for j := 1 to 8 do
        MakeGridComponent('BPSum'+inttostr(j),'[조직능력소계]','40',j,pcnt);
      inc(pcnt);
      for j := 1 to 8 do
        MakeGridComponent('NPSum'+inttostr(j),'[능력소계]','75',j,pcnt);
      inc(pcnt);
    end;

    Read_Pimvari(3,vararrayof(['D2','1003']));
    if Recordcount > 0 then
    begin
      cnt := 1;
      for i := 1 to 9 do
      begin
        if trim(fieldbyname(conval[i]).AsString) = '' then continue;
        cstr := fieldbyname(conmak[i]).AsString;
        vstr := fieldbyname(conval[i]).AsString;
        fpos := fieldbyname(conpos[i]).AsInteger;
        for j := 1 to 8 do
          MakeGridComponent('CP'+inttostr(cnt)+inttostr(j),cstr,vstr,j,pcnt);
        inc(cnt);
        inc(pcnt);
      end;
      for j := 1 to 8 do
        MakeGridComponent('CPSum'+inttostr(j),'[태도소계]','25',j,pcnt);
      inc(pcnt);
    end;
    for j := 1 to 8 do
      MakeGridComponent('TPSum'+inttostr(j),'[상향평가점수]','100',j,pcnt);
  end;
  SGrid.RowCount := pcnt;
end;
// 평가점수 항목을 구성한다.....................................................
// cname : Panel Name.
// cap   : Panel Caption.(상향평가 항목이름)
// vap   : 배점점수.
// npos  : 출력필드 항목 좌측위치를 구분하기위한 매개변수.
// ypos  :      "        상위위치를    "
procedure TFM_SubForm6.MakeGridComponent(cname,cap,vap : string; npos,ypos : integer);
begin
  if copy(cname,3,3) <> 'Sum' then
  begin
    if npos = 1 then
      Sgrid.cells[npos-1,ypos] := cap
    else
    if npos = 2 then
      Sgrid.cells[npos-1,ypos] := vap
    else
    if npos = 8 then
      Sgrid.cells[npos-1,ypos] := Apprcls[ypos]
    else Sgrid.cells[npos-1,ypos] := ApprScr[ypos] ;
//      SGrid.Color   :=$00FFEAEA;
  end
  else
  begin
    if npos = 1 then
      Sgrid.cells[npos-1,ypos] := cap
    else
    if npos = 2 then
      Sgrid.cells[npos-1,ypos] := vap
    else
    if npos = 8 then
      Sgrid.cells[npos-1,ypos] := Apprcls[ypos]
    else Sgrid.cells[npos-1,ypos] := ApprScr[ypos] ;
//      Sgrid.cells.color   :=$00EAFFFF ;
  end;
end;
{
procedure TFM_SubForm6.clear;
var
   i : integer;
begin
  for i := BackScroll.ComponentCount - 1 downto 0 do begin
      if (TObject(BackScroll.components[i]) is TPanel) then
         TPanel(BackScroll.components[i]).Destroy;
  end;
  pPan1.Destroy;
  pPan2.Destroy;
  pPan3.Destroy;
  pPan4.Destroy;
  pPan5.Destroy;
  pPan6.Destroy;
  pPan7.Destroy;
  pPan8.Destroy;
  Application.ProcessMessages;
end;
}
procedure TFM_SubForm6.JeonShape1Click(Sender: TObject);
var
  i : integer;
begin
  if flag = true then
  begin
      flag := False;
      anBasDate.clear;
  end;
  aptodate := Copy(anBasDate.Text,1,4)+
              Copy(anBasDate.Text,6,2)+
              Copy(anBasDate.Text,9,2);
  if  check_data(aptodate) then
  begin
     run_data;
     flag := True;
  end
  else anbasdate.setfocus;
end;

procedure TFM_SubForm6.Read_Pimvari(sw: Integer; pstr: OleVariant);
var
  bCallFlag : Boolean;
  SqlText   : String;
begin
  if sw = 1 then
  showmessage('err1....')
  else if sw = 2 then begin
  showmessage('err2....')
  end else if sw = 3 then begin
  end;
  SqlText := Format('select ' +
                    'nvl(        gubun      ,'' ''), '+
                    'nvl(        sgubun     ,'' ''), '+
                    'nvl(        mark1      ,'' ''), '+
                    'nvl(to_char(leng1     ),''0''), '+
                    'nvl(        value1     ,'' ''), '+
                    'nvl(        mark2      ,'' ''), '+
                    'nvl(to_char(leng2     ),''0''), '+
                    'nvl(        value2     ,'' ''), '+
                    'nvl(        mark3      ,'' ''), '+
                    'nvl(to_char(leng3     ),''0''), '+
                    'nvl(        value3     ,'' ''), '+
                    'nvl(        mark4      ,'' ''), '+
                    'nvl(to_char(leng4     ),''0''), '+
                    'nvl(        value4     ,'' ''), '+
                    'nvl(        mark5      ,'' ''), '+
                    'nvl(to_char(leng5     ),''0''), '+
                    'nvl(        value5     ,'' ''), '+
                    'nvl(        mark6      ,'' ''), '+
                    'nvl(to_char(leng6     ),''0''), '+
                    'nvl(        value6     ,'' ''), '+
                    'nvl(        mark7      ,'' ''), '+
                    'nvl(to_char(leng7     ),''0''), '+
                    'nvl(        value7     ,'' ''), '+
                    'nvl(        mark8      ,'' ''), '+
                    'nvl(to_char(leng8     ),''0''), '+
                    'nvl(        value8     ,'' ''), '+
                    'nvl(        mark9      ,'' ''), '+
                    'nvl(to_char(leng9     ),''0''), '+
                    'nvl(        value9     ,'' ''), '+
                    'nvl(        writetime  ,'' ''), '+
                    'nvl(        writeemp   ,'' '') '+
                    'from pimvari where gubun = ''%s'' '+
                    'and sgubun = ''%s'' ',
                    [pstr[0],pstr[1]]);
  with CVARI do begin
    try
      Close;
      //콤포넌트에 추가하였으면 아래 항목은 제외.
      ClearFieldInfo;
      AddField('GUBUN'        , ftString  ,  2  );
      AddField('SGUBUN'       , ftString  ,  4  );
      AddField('MARK1'        , ftString  ,  20 );
      AddField('LENG1'        , ftInteger ,  2  );
      AddField('VALUE1'       , ftString  ,  20 );
      AddField('MARK2'        , ftString  ,  20 );
      AddField('LENG2'        , ftInteger ,  2  );
      AddField('VALUE2'       , ftString  ,  20 );
      AddField('MARK3'        , ftString  ,  20 );
      AddField('LENG3'        , ftInteger ,  2  );
      AddField('VALUE3'       , ftString  ,  20 );
      AddField('MARK4'        , ftString  ,  20 );
      AddField('LENG4'        , ftInteger ,  2  );
      AddField('VALUE4'       , ftString  ,  20 );
      AddField('MARK5'        , ftString  ,  20 );
      AddField('LENG5'        , ftInteger ,  2  );
      AddField('VALUE5'       , ftString  ,  20 );
      AddField('MARK6'        , ftString  ,  20 );
      AddField('LENG6'        , ftInteger ,  2  );
      AddField('VALUE6'       , ftString  ,  20 );
      AddField('MARK7'        , ftString  ,  20 );
      AddField('LENG7'        , ftInteger ,  2  );
      AddField('VALUE7'       , ftString  ,  20 );
      AddField('MARK8'        , ftString  ,  20 );
      AddField('LENG8'        , ftInteger ,  2  );
      AddField('VALUE8'       , ftString  ,  20 );
      AddField('MARK9'        , ftString  ,  20 );
      AddField('LENG9'        , ftInteger ,  2  );
      AddField('VALUE9'       , ftString  ,  20 );
      AddField('WRITETIME'    , ftString  ,  15 );
      AddField('WRITEEMP'     , ftString  ,  4  );
      Sql.Clear;
      Sql.Text := SqlText;
      ServiceName := 'PIA1070B_sel12';
      Open;
    except
      Close;
    end;
  end;
end;

function TFM_SubForm6.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TDBSet2.FieldByName('sel_data').AsString;
  v_cnt := 1;
  while v_cnt < p_loc do
  begin
    v_tmp := Pos(';',v_data);
    if not(v_tmp > 0) then Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

end.
