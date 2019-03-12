unit SubForm7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, pebtnedit, pevaluebtnedit, Db, DbTables,
  pedeptbtnedit, peextcombo, peoutlookbtn, ComCtrls, Grids,  Comobj,
  DBGrids, pedbgrid, pedballutil, peempnobtnedit, petxtwzd, PeJeonBtnDateEdit,
  pepaser, PeJeonMemo, pecheckbox;

type
  TFm_SubForm7 = class(TForm)
    TotalGrid: TPeJeonDbGrid;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Bt_new: TPeJeonOutLookBtn;
    E_Memo: TPeJeonMemo;
    RG_Sort: TRadioGroup;
    Panel2: TPanel;
    Bt_Text: TPeJeonOutLookBtn;
    E_base_yy: TPeJeonPanelComboBox;
    DataSource1: TDataSource;
    Panel3: TPanel;
    RG_Gubun: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure Bt_newClick(Sender: TObject);
    procedure RG_SortClick(Sender: TObject);
    procedure Bt_TextClick(Sender: TObject);
    procedure E_base_yyChange(Sender: TObject);
  private
    { Private declarations }
    Start     : Boolean;
    SelForm   : TForm;
    gsRabasdate : String;

    payrafr   : String;
    payrato   : String;
    pstate    : String;
    objdept1, objdept2, objdept3, objdept4, objdept5   : String;
    objdept6, objdept7, objdept8, objdept9, objdept10  : String;
    objemp1,  objemp2,  objemp3,  objemp4,  objemp5    : String;
    objemp6,  objemp7,  objemp8,  objemp9,  objemp10   : String;

    Lbase_yy  : String;

    procedure M_SelectSql1;
    procedure M_SelectSql2;
    procedure M_Display;

    procedure IDPbas_DataRead;

  public
    { Public declarations }
  end;

var
  Fm_SubForm7: TFm_SubForm7;

implementation

uses PMainForm, DmForm, HanaroMailForm;

{$R *.DFM}

procedure TFm_SubForm7.FormShow(Sender: TObject);
begin
  Start   := True;
  SelForm := nil;

  if Start then Start := not Start;

  IDPbas_DataRead;
  Lbase_yy := E_base_yy.Text;

  Bt_newClick(Bt_new);
end;

procedure TFm_SubForm7.IDPbas_DataRead;
begin
     with Dm.Qry_work do
     begin
          close;
          Sql.Clear;
          Sql.Add('select Value1                                        ');
          Sql.Add('  from peidpbas a                                    ');
          Sql.Add(' WHERE a.base_yy = ''0000''                          ');
          Sql.Add('   AND a.gubun   = ''00''                            ');
          Sql.Add('   AND a.sgubun  = ''0000''                          ');
          Open;

          Lbase_yy := fields[0].AsString;
     end;

     with Dm.Qry_work do
     begin
          close;
          Sql.Clear;
          Sql.Add('select distinct base_yy                              ');
          Sql.Add('  from peidpbas a                                    ');
          Sql.Add(' WHERE a.base_yy > ''0000''                          ');
          Sql.Add('   And a.base_yy <= '''+Lbase_yy+'''                 ');
          Sql.Add(' ORDER BY base_yy desc                               ');
          Open;

          while not eof do
          begin
               E_base_yy.Items.Add(fields[0].AsString);
               next;
          end;
          E_base_yy.itemindex := 0;
     end;

     with Dm.Qry_work do
  begin
       close;
       Sql.Clear;
       Sql.Add('select Value1,  Value2,  Value3                      ');
       Sql.Add('  from peidpbas a                                    ');
       Sql.Add(' WHERE a.base_yy like '''+E_base_yy.Text+'''||''%''  ');
       Sql.Add('   AND a.gubun  = ''02''                             ');
       Sql.Add('   AND a.sgubun = ''0001''                           ');
       Open;

       payrafr   := fields[0].AsString;
       payrato   := fields[1].AsString;
       pstate    := fields[2].AsString;
  end;

  with Dm.Qry_work do
  begin
       close;
       Sql.Clear;
       Sql.Add('select NVL(Value1,''ZZZZZ''), NVL(Value2,''ZZZZZ''), ');
       Sql.Add('       NVL(Value3,''ZZZZZ''), NVL(Value4,''ZZZZZ''), ');
       Sql.Add('       NVL(Value5,''ZZZZZ''), NVL(Value6,''ZZZZZ''), ');
       Sql.Add('       NVL(Value7,''ZZZZZ''), NVL(Value8,''ZZZZZ''), ');
       Sql.Add('       NVL(Value9,''ZZZZZ''), NVL(Value10,''ZZZZZ'') ');
       Sql.Add('  from peidpbas a                                    ');
       Sql.Add(' WHERE a.base_yy like '''+E_base_yy.Text+'''||''%''  ');
       Sql.Add('   AND a.gubun  = ''02''                             ');
       Sql.Add('   AND a.sgubun = ''0002''                           ');
       Open;

       objdept1  := fields[0].AsString;
       objdept2  := fields[1].AsString;
       objdept3  := fields[2].AsString;
       objdept4  := fields[3].AsString;
       objdept5  := fields[4].AsString;
       objdept6  := fields[5].AsString;
       objdept7  := fields[6].AsString;
       objdept8  := fields[7].AsString;
       objdept9  := fields[8].AsString;
       objdept10 := fields[9].AsString;
  end;

  with Dm.Qry_work do
  begin
       close;
       Sql.Clear;
       Sql.Add('select NVL(Value1,''ZZZZ''), NVL(Value2,''ZZZZ''),   ');
       Sql.Add('       NVL(Value3,''ZZZZ''), NVL(Value4,''ZZZZ''),   ');
       Sql.Add('       NVL(Value5,''ZZZZ''), NVL(Value6,''ZZZZ''),   ');
       Sql.Add('       NVL(Value7,''ZZZZ''), NVL(Value8,''ZZZZ''),   ');
       Sql.Add('       NVL(Value9,''ZZZZ''), NVL(Value10,''ZZZZ'')   ');
       Sql.Add('  from peidpbas a                                    ');
       Sql.Add(' WHERE a.base_yy like '''+E_base_yy.Text+'''||''%''  ');
       Sql.Add('   AND a.gubun  = ''02''                             ');
       Sql.Add('   AND a.sgubun = ''0003''                           ');
       Open;

       objemp1   := fields[0].AsString;
       objemp2   := fields[1].AsString;
       objemp3   := fields[2].AsString;
       objemp4   := fields[3].AsString;
       objemp5   := fields[4].AsString;
       objemp6   := fields[5].AsString;
       objemp7   := fields[6].AsString;
       objemp8   := fields[7].AsString;
       objemp9   := fields[8].AsString;
       objemp10  := fields[9].AsString;
  end;
end;

procedure TFm_SubForm7.M_SelectSql1;
begin
  with DM.Q_Select do
  begin
       Close;
       Sql.Clear;
       Sql.Add('select a.empno 사번,  a.korname 성명,                                                 ');
       Sql.Add('       (select codename from pyccode                                                  ');
       Sql.Add('         where codeid  =''I112''                                                      ');
       Sql.Add('           and codeno  =decode(b.paycl, null,a.paycl, b.paycl)) BAND,                 ');
       Sql.Add('       decode(b.paycldate, null,a.paycldate, b.paycldate) BAND조정일,                 ');
       Sql.Add('       (select deptName from pycdept                                                  ');
       Sql.Add('         where orgnum  =decode(b.orgnum, null,a.orgnum, b.orgnum)                     ');
       Sql.Add('           and deptcode=decode(b.deptcode, null,a.deptcode, b.deptcode)) 부서,        ');
       Sql.Add('       decode(b.deptcode, null,a.deptcode, b.deptcode) 부서코드,                      ');
       Sql.Add('       (select Hname from peidpcode where BASE_YY = :p_base_yy                        ');
       Sql.Add('           and classno = ''3'' and codeno = b.jmtrack)   자기직무TRACK,               ');
       Sql.Add('       (select Hname from peidpcode where BASE_YY = :p_base_yy                        ');
       Sql.Add('           and classno = ''4'' and codeno = b.jmlevel) 자기직무수준,                  ');
       Sql.Add('       decode(b.rvalconyn, ''Y'',''완료'',''미완료'') 자기완료,                       ');
       Sql.Add('       b.e1empno 팀장사번,                                                            ');
       Sql.Add('       (select korname from pimpmas where empno  = b.e1empno)  팀장성명,              ');
       Sql.Add('	   decode(b.E1valconyn,''Y'',''완료'',''미완료'') 팀장완료,                   ');
       Sql.Add('       (select codename from pyccode                                                  ');
       Sql.Add('         where codeid  =''I113''                                                      ');
       Sql.Add('           and codeno  =(select jobpayra from pimpmas                                 ');
       Sql.Add('                          where empno  = b.e1empno    ))  팀장직책,                   ');
       Sql.Add('       (select deptName from pycdept                                                  ');
       Sql.Add('         where (orgnum,deptcode)=(select orgnum,deptcode from pimpmas                 ');
       Sql.Add('                                   where empno  = b.e1empno           )) 팀장부서,    ');
       Sql.Add('       (select deptcode from pimpmas where empno = b.e1empno) 팀장부서코드,           ');
       Sql.Add('       b.WORKTASK "일을 통한 개발", b.AFTPLAN "향후 3년이내 자기계발계획"             ');
       Sql.Add('  from pimpmas a, peidpmas b                                                          ');
       Sql.Add(' WHERE a.pstate     < '''+pstate +'''                                                 ');
       Sql.Add('   AND a.payra     >= '''+payrafr+'''  AND a.payra     <= '''+payrato+'''             ');
       Sql.Add('   AND a.empno    not in ('''+objemp1+''',  '''+objemp2+''',  '''+objemp3+''',        ');
       Sql.Add('                          '''+objemp4+''',  '''+objemp5+''',  '''+objemp6+''',        ');
       Sql.Add('                          '''+objemp7+''',  '''+objemp8+''',  '''+objemp9+''',        ');
       Sql.Add('                          '''+objemp10+'''                                     )      ');
       Sql.Add('   AND a.deptcode not in ('''+objdept1+''', '''+objdept2+''', '''+objdept3+''',       ');
       Sql.Add('                          '''+objdept4+''', '''+objdept5+''', '''+objdept6+''',       ');
       Sql.Add('                          '''+objdept7+''', '''+objdept8+''', '''+objdept9+''',       ');
       Sql.Add('                          '''+objdept10+'''                                    )      ');
       Sql.Add('   AND a.empno      = b.empno                                                         ');
       Sql.Add('   AND b.base_yy    = :p_base_yy                                                      ');
       ParamByName('p_base_yy').AsString := Lbase_yy;
  end;
end;

procedure TFm_SubForm7.M_SelectSql2;
begin
     with DM.Q_Select do
     begin
       Close;
       Sql.Clear;
       Sql.Add('select a.empno 사번,  a.korname 성명,                                                 ');
       Sql.Add('       (select codename from pyccode                                                  ');
       Sql.Add('         where codeid  =''I112''                                                      ');
       Sql.Add('           and codeno  =decode(b.paycl, null,a.paycl, b.paycl)) BAND,                 ');
       Sql.Add('       decode(b.paycldate, null,a.paycldate, b.paycldate) BAND조정일,                 ');
       Sql.Add('       (select deptName from pycdept                                                  ');
       Sql.Add('         where orgnum  =decode(b.orgnum, null,a.orgnum, b.orgnum)                     ');
       Sql.Add('           and deptcode=decode(b.deptcode, null,a.deptcode, b.deptcode)) 부서,        ');
       Sql.Add('       decode(b.deptcode, null,a.deptcode, b.deptcode) 부서코드,                      ');
       Sql.Add('       (select Hname from peidpcode where BASE_YY = :p_base_yy                        ');
       Sql.Add('           and classno = ''3'' and codeno = b.jmtrack) 자기직무TRACK,                 ');
       Sql.Add('       (select Hname from peidpcode where BASE_YY = :p_base_yy                        ');
       Sql.Add('           and classno = ''4'' and codeno = b.jmlevel) 자기직무수준,                  ');
       Sql.Add('       decode(b.rvalconyn, ''Y'',''완료'',''미완료'') 자기완료,                       ');
       Sql.Add('       b.e1empno 팀장사번,                                                            ');
       Sql.Add('       (select korname from pimpmas where empno  = b.e1empno)  팀장성명,              ');
       Sql.Add('	   decode(b.E1valconyn,''Y'',''완료'',''미완료'') 팀장완료,                   ');
       Sql.Add('       (select codename from pyccode                                                  ');
       Sql.Add('         where codeid  =''I113''                                                      ');
       Sql.Add('           and codeno  =(select jobpayra from pimpmas                                 ');
       Sql.Add('                          where empno  = b.e1empno    ))  팀장직책,                   ');
       Sql.Add('       (select deptName from pycdept                                                  ');
       Sql.Add('         where (orgnum,deptcode)=(select orgnum,deptcode from pimpmas                 ');
       Sql.Add('                                   where empno  = b.e1empno           )) 팀장부서,    ');
       Sql.Add('       (select deptcode from pimpmas where empno = b.e1empno) 팀장부서코드,           ');
       Sql.Add('       (select Hname from peidpcode where classno =''1''                              ');
       Sql.Add('           and codeno = substr(e.EDUCODE,1,2)) 역량구분,                              ');
       Sql.Add('       (select Hname from peidpcode where classno =''2''                              ');
       Sql.Add('           and codeno = substr(e.EDUCODE,3,1)) 부문,                                  ');
       Sql.Add('       (select Hname from peidpcode where classno =''3''                              ');
       Sql.Add('           and codeno = substr(e.EDUCODE,4,2)) 직무Track,                             ');
       Sql.Add('       (select Hname from peidpcode where classno =''4''                              ');
       Sql.Add('           and codeno = substr(e.EDUCODE,6,2)) 직무수준,                              ');
       Sql.Add('       e.EDUCODE  "교육과정코드", f.EDUNAME "교육과정명", e.EDUMM 교육월,             ');
       Sql.Add('       e.ENDYN "수료여부", e.EDUSCORE "교육점수", e.GET_LP "취득L/P"                  ');
       Sql.Add('  from pimpmas a, peidpmas b,  peidphis e, peidpcrs f                                 ');
       Sql.Add(' WHERE a.pstate     < '''+pstate +'''                                                 ');
       Sql.Add('   AND a.payra     >= '''+payrafr+'''  AND a.payra     <= '''+payrato+'''             ');
       Sql.Add('   AND a.empno    not in ('''+objemp1+''',  '''+objemp2+''',  '''+objemp3+''',        ');
       Sql.Add('                          '''+objemp4+''',  '''+objemp5+''',  '''+objemp6+''',        ');
       Sql.Add('                          '''+objemp7+''',  '''+objemp8+''',  '''+objemp9+''',        ');
       Sql.Add('                          '''+objemp10+'''                                     )      ');
       Sql.Add('   AND a.deptcode not in ('''+objdept1+''', '''+objdept2+''', '''+objdept3+''',       ');
       Sql.Add('                          '''+objdept4+''', '''+objdept5+''', '''+objdept6+''',       ');
       Sql.Add('                          '''+objdept7+''', '''+objdept8+''', '''+objdept9+''',       ');
       Sql.Add('                          '''+objdept10+'''                                    )      ');
       Sql.Add('   AND a.empno      = b.empno                                                         ');
       Sql.Add('   AND b.base_yy    = :p_base_yy                                                      ');
       Sql.Add('   AND b.base_yy    = e.base_yy                                                       ');
       Sql.Add('   AND b.empno      = e.empno                                                         ');
       Sql.Add('   AND e.base_yy    = f.base_yy(+)                                                    ');
       Sql.Add('   AND e.educode    = f.educode(+)                                                    ');
       ParamByName('p_base_yy').AsString := Lbase_yy;
     end;
end;

procedure TFm_SubForm7.M_Display;
var
  i : Integer;
  Field : TField;
begin
  Try
       with DM.Q_Select do
       begin
            if RG_Gubun.ItemIndex = 0 then
            begin
                 M_SelectSql1;

                 if      Rg_Sort.ItemIndex = 0 then SQL.Add(' ORDER BY a.deptcode, a.payra, a.empno ')
                 else if Rg_Sort.ItemIndex = 1 then SQL.Add(' ORDER BY a.empno     ')
                 else if Rg_Sort.ItemIndex = 2 then SQL.Add(' ORDER BY a.korname   ')
                 else if Rg_Sort.ItemIndex = 3 then SQL.Add(' ORDER BY 팀장사번, a.deptcode, a.payra, a.empno  ');
            end
            else
            if RG_Gubun.ItemIndex = 1 then
            begin
                 M_SelectSql2;

                 if      Rg_Sort.ItemIndex = 0 then SQL.Add(' ORDER BY a.deptcode, a.payra, a.empno, e.EDUMM ')
                 else if Rg_Sort.ItemIndex = 1 then SQL.Add(' ORDER BY a.empno, e.EDUMM     ')
                 else if Rg_Sort.ItemIndex = 2 then SQL.Add(' ORDER BY a.korname, e.EDUMM   ')
                 else if Rg_Sort.ItemIndex = 3 then SQL.Add(' ORDER BY 팀장사번, a.deptcode, a.payra, a.empno, e.EDUMM  ');
            end;
            Open;

            for i := 0 to FieldCount - 1 do
            begin
                 Field := Fields[i];
                 case Field.index of
                       0 : Field.DisplayWidth :=  6;
                       1 : Field.DisplayWidth :=  8;
                       2 : Field.DisplayWidth :=  6;
                       3 : Field.DisplayWidth := 10;
                       4 : Field.DisplayWidth := 19;
                       5 : Field.DisplayWidth :=  8;
                       6 : Field.DisplayWidth := 19;
                       7 : Field.DisplayWidth :=  8;
                       8 : Field.DisplayWidth := 10;
                       9 : Field.DisplayWidth :=  6;
                      10 : Field.DisplayWidth :=  8;
                      11 : Field.DisplayWidth := 10;
                      12 : Field.DisplayWidth :=  8;
                      13 : Field.DisplayWidth := 19;
                      14 : Field.DisplayWidth :=  8;
                      15 : Field.DisplayWidth := 25;
                      16 : Field.DisplayWidth := 25;
                      17 : Field.DisplayWidth := 25;
                      18 : Field.DisplayWidth := 10;
                      19 : Field.DisplayWidth := 12;
                      20 : Field.DisplayWidth := 25;
                      21 : Field.DisplayWidth :=  8;
                      22 : Field.DisplayWidth :=  8;
                      23 : begin
                                Field.DisplayWidth :=  8;
                                Field.Alignment    := taRightJustify;
                           end;
                      24 : begin
                                Field.DisplayWidth :=  8;
                                Field.Alignment    := taRightJustify;
                           end;
                 end;
            end;
       end;
  EXCEPT ON E : EDBEngineError DO
       begin
            MessageDlg(BDEErrorInfo(E),mtWarning,[mbOK],0);
            System.Exit;
       end;
  End;
end;

procedure TFm_SubForm7.Bt_newClick(Sender: TObject);
begin
  M_Display;
end;

procedure TFm_SubForm7.RG_SortClick(Sender: TObject);
begin
  Bt_newClick(Bt_new);
end;

procedure TFm_SubForm7.Bt_TextClick(Sender: TObject);
var XL, XArr  : Variant;
    i,j,k     : integer;
    SavePlace : TBookmark;
begin
  if Dm.Q_select.RecordCount < 1 then
  begin
       MainForm.St_Help.Panels[1].Text :='';
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  MainForm.St_Help.Panels[1].Text := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, Dm.Q_select.Fields.Count], VarVariant); //Gird 출력시
  try
      XL := CreateOLEObject('Excel.Application');
  except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      MainForm.St_Help.Panels[1].Text := '';
      Exit;
  end;

  MainForm.St_Help.Panels[1].Text := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  if RG_Gubun.ItemIndex = 0 then
       XL.WorkSheets[1].Name := '자기계발계획 및 목표'   //시트명 부여
  else
       XL.WorkSheets[1].Name := '교육을 통한 개발';  //시트명 부여
  //TITLE NAME 설정
  //XL.Range['A1'].value := '';
  //XL.Range['A1'].font.Size := 16;

  //컬럼명 지정_서브타이블 지정
  for i := 1 to Dm.Q_select.Fields.Count do
  begin
       XArr[i]  := Dm.Q_select.Fields[i-1].FullName;
  end;

  XL.Range['A1' , CHR(64 + Dm.Q_select.Fields.Count)+'1'].Value := XArr;  //Gird 출력시
  k := 1;
  for i := 1 to Dm.Q_select.Fields.Count do     //Gird 출력시
  begin
       XL.Range[CHR(64 + i) + '1'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + i) + '1'].Interior.Color:= $00CBF0B3;
       XL.Range[CHR(64 + i) + '1'].font.Size := 9;
       XL.Range[CHR(64 + i) + '1'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := Dm.Q_select.GetBookmark;
  Dm.Q_select.DisableControls;
  Dm.Q_select.First;

  for i := 1 to  Dm.Q_select.RecordCount do
  begin
       for j := 1 to Dm.Q_select.Fields.Count do
       begin
            if  (j  = 1) or (j = 10)  then   //사원번호 칼럼에 ' 문자 넣어주기 위해.
                 XArr[j]  := ''''+Dm.Q_select.Fields[j-1].AsString
            else XArr[j]  := Dm.Q_select.Fields[j-1].AsString;
       end;
       XL.Range['A' + IntToStr(k+1), CHR(64 + Dm.Q_select.Fields.Count) + IntToStr(k+1)].Value := XArr;
       inc(k);
       Dm.Q_select.Next;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', CHR(64 + Dm.Q_select.Fields.Count) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['A1', CHR(64 + Dm.Q_select.Fields.Count) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', CHR(64 + Dm.Q_select.Fields.Count) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
  XL.Range['A1', CHR(64 + Dm.Q_select.Fields.Count) + IntToStr(k)].font.name := '굴림체';
  XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
  XL.Range['A2', CHR(64 + Dm.Q_select.Fields.Count) + IntToStr(k)].font.Size := 9;
  XL.Range['A2', CHR(64 + Dm.Q_select.Fields.Count) + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
  if j > 23 then
       XL.Range['X2', CHR(64 + Dm.Q_select.Fields.Count) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
  XL.Range['A1', CHR(64 + Dm.Q_select.Fields.Count) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                //자동정렬
  XL.Range['A2', 'A2'].Select;                                 //A2열에 커서 위치시킴
  XL.Visible := true;                                          //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  Dm.Q_select.GotoBookmark(SavePlace);
  Dm.Q_select.FreeBookmark(SavePlace);
  Dm.Q_select.EnableControls;
  MainForm.St_Help.Panels[1].Text := '';
  Bt_newClick(Sender);
end;

procedure TFm_SubForm7.E_base_yyChange(Sender: TObject);
begin
  Lbase_yy := E_base_yy.Text;
end;

end.
