unit PKY1050A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls, pebtnedit,
  Db, DBTables, Animate, Func, KeyEmpno, KeyEmpnoY, Formmon1;

type
  TFM_Sub1 = class(TForm)
    Phelpmsg: TPanel;
    Panel5: TPanel;
    BBinsert: TBitBtn;
    BBdelete: TBitBtn;
    BBsave: TBitBtn;
    BBcancel: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel18: TPanel;
    Eempno: TEdit;
    BitBtn1: TBitBtn;
    Lkorname: TLabel;
    Panel10: TPanel;
    Ldeptname: TLabel;
    Panel7: TPanel;
    MEovtmdesc : TMaskEdit ;
    MEfrdate: TMaskEdit;
    SBfrdate: TSpeedButton;
    BitBtn2: TBitBtn;
    MEovtmdate: TPeJeonEdit;
    MEfrrealtime: TPeJeonEdit;
    MEconyn: TPeJeonEdit;
    MEtorealtime: TPeJeonEdit;
    MErestmm: TPeJeonEdit;
    MEsprestmm: TPeJeonEdit;
    ME_Filter: TMaskEdit;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    procedure FormShow(Sender: TObject);
    procedure BBinsertClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure SBfrdateClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BBdeleteClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure MEconynDblClick(Sender: TObject);
    procedure EempnoChange(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EempnoExit(Sender: TObject);
    procedure MEovtmdateExit(Sender: TObject);

  private
    { Private declarations }
   start : boolean ;
   SelForm   : TForm;
    Function  ValidationChk :Boolean;
    Function  FixmonChk ( Indate:String )  :Boolean;
    Function  DataChk : Boolean ;
    Function  Check_DateValid( InDate : String ) : Boolean;
    Function  Check_Duplicate( var ErrMsg : String) : Boolean;
    Function  Check_Range(TmpFrrealtime, Tmptorealtime : String ;
                            var DateTime1,DateTime2 :String): Boolean;
    Function  To_DateTime(Tmp :String):Extended;

  public
    { Public declarations }
    orgnum        : String;
    deptcode      : String;
    Savemode      : Integer;
    oriovtmdate   : String;    //original ovtmdate
    orifrrealtime : String;    //original frrealtime
    ffrrealtime   : String;
    SMsg          : String;
    procedure Retrieve;
    procedure Initialize;
  end;

var
  FM_Sub1: TFM_Sub1;

implementation

uses PKY1050A0, PKY1050A1;

{$R *.DFM}

Function TFM_Sub1.Check_DateValid( InDate : String ) : Boolean;
var
   Temp : Real;
   Buf  : String;
begin
  Buf := InDate;
  if Length(Buf) <> 8 then
  begin
       Result := False;
       System.Exit;
  end;

  Buf := Copy(Buf,1,4) + DateSeparator + Copy(Buf,5,2) + DateSeparator + Copy(Buf,7,2);

  Try
  Temp := StrToDate( Buf );
  Except on EConvertError do
       begin
            Result := False;
            System.Exit;
       end;
  end;

  Result := True;
end;

Function TFM_Sub1.DataChk : Boolean ;
var tem : String;
begin

  Result := True;

  ffrrealtime := MEovtmdate.text + MEfrrealtime.text;

  with DM.Query1 do
  begin
       // 마감체크
       if not Fixmonchk( copy(MEovtmdate.text,1,6) ) then
       begin
            MessageDlg('이미 마감된 날짜입니다. 저장실패!!', mtInformation, [mbok], 0) ;
            result := False;
            exit;
       end;

       // 시간 중복체크
       if ((MEovtmdate.text <> oriovtmdate) or (ffrrealtime <> oriovtmdate + orifrrealtime)) or
           (SaveMode = 0) then
       begin
            Close;
            Sql.Clear ;
            Sql.Add (' select * from pkhothis                 ');
            Sql.Add ('   where empno = '''+Eempno.text+'''                ');
            Sql.Add ('    and  ovtmdate = '''+MEovtmdate.text+'''         ');
            Sql.Add ('    and  frrealtime = '''+ffrrealtime+'''      ');
            Open;

            if Recordcount >= 1 then
            begin
                 MessageDlg(Copy(MEovtmdate.text,1,4) +'/' + Copy(MEovtmdate.text,5,2) +'/' + Copy(MEovtmdate.text,7,2) +
                            '일자 시작시간이 같은 내역이 이미 존재합니다. 저장실패!!', mtInformation, [mbok], 0) ;
                 result := False;
                 exit;
            end;
       end;//savemode if end

       // 시간간격 체크
       Close;
       Sql.Clear ;
       Sql.Add (' select floor( (TO_DATE('''+MEtorealtime.text+''', ''YYYYMMDDHH24MI'') -   ');
       Sql.Add ('         TO_DATE('''+MEovtmdate.text+'''||'''+MEfrrealtime.text+''', ''YYYYMMDDHH24MI'') ) ');
       Sql.Add ('           * 24 * 60 +1 / (24*60*60)) mm                                          ');
       Sql.Add ('  from dual    ');
       Open;

       if (Fieldbyname('mm').AsInteger ) > 1440 then
       begin
            MessageDlg('시작시간과 종료시간 간격이 24시간을 초과합니다. 저장실패!!', mtInformation, [mbok], 0) ;
            result := False;
            exit;
       end;

       {//2015.06 jissi 평일 초과근무 시작시각 오류 체크
       Tem       := ' select decode((SELECT COUNT(*) cnt FROM PKCHOLI                                       '+
             Format('  WHERE HOLIDATE = ''%s''), 0,                                ',  [MEovtmdate.text])    +
             Format('        case when to_char(to_date(''%s'',''YYYYMMDD''),''D'') ',  [MEovtmdate.text])    +
                    '                         in (2,3,4,5,6)                                                '+
                    '             then 0 else 1 end, 1) chkholi                                             '+
                    '   from dual                                                                           ';
       }
       //2016.04.06 jissi 평일 휴일적용 특이자 해당일 초과근무 등록가능토록 체크 쿼리 수정
       Tem :=   ' select decode((SELECT COUNT(*) cnt             '+
                '    FROM                                        '+
                '   (                                            '+
                '   SELECT   HOLIDATE                            '+
                '      FROM   PKCHOLI                            '+
         Format('     WHERE   HOLIDATE = substr(''%s'',1,8)      ',   [MEovtmdate.text])  +
                '    UNION                                       '+
                '    SELECT   DUTYDATE                           '+
                '      FROM   PKHOLIEMP                          '+
         Format('     WHERE   DUTYDATE = substr(''%s'',1,8)      ',   [MEovtmdate.text])  +
         Format('       AND   empno    = ''%s''                  ',   [Eempno.Text])      +
                '       AND   DUKIND   = ''49''     /*휴일적용*/ '+
                '    MINUS                                       '+
                '    SELECT   DUTYDATE                           '+
                '      FROM   PKHOLIEMP                          '+
         Format('     WHERE   DUTYDATE = substr(''%s'',1,8)      ',   [MEovtmdate.text])  +
         Format('       AND   empno    = ''%s''                  ',   [Eempno.Text])      +
                '       AND   DUKIND   = ''00''     /*평일적용*/ '+
                '   )                                            '+
                '  ), 0,                                         '+
         Format('  case when to_char(to_date(substr(''%s'',1,8), '+
                '                    ''YYYYMMDD''),''D'')        ',   [MEovtmdate.text])  +
                '                in (2,3,4,5,6)                  '+
                '       then 0 else 1 end, 1) chkholi            '+
                ' from dual                                      ';

       Close;
       Sql.Clear;
       Sql.Add(Tem);
       Open;

       if fieldbyname('chkholi').Asinteger = 0 then      //평일일때
       begin
            if  (MEfrrealtime.text >= '0900') and
                (MEfrrealtime.text <  '1800') then
            begin
                 MessageDlg('초과근로시작시각이 평일 09:00에서 18:00사이의 시각입니다. 저장실패!!', mtInformation, [mbok], 0) ;
                 Result := False;
                 Exit;
            end;
       end;
       Close;

  end;//with dm end

  //시간간격 중복 체크
  if not Check_Duplicate(SMsg) then
  begin
       Application.MessageBox(PChar(SMsg),'입력오류',MB_ICONWARNING);
       Result := False;
       Exit;
  end;

  //2015.06 jissi 휴식제외분 1~9분으로 등록 오류 체크
  if   ((strtoint(MErestmm.Text)   >= 1) and (strtoint(MErestmm.Text)   <= 9)) or
       ((strtoint(MEsprestmm.Text) >= 1) and (strtoint(MEsprestmm.Text) <= 9)) then
  begin
       MessageDlg('휴식제외분을 1~9분으로 등록하셨습니다. 저장실패!!', mtInformation, [mbok], 0) ;
       Result := False;
       Exit;
  end;

end;

Function TFM_Sub1.FixmonChk ( Indate:String ) :Boolean;
begin
  result := True;

  with DM.Query1 do
  begin
       Close;
       Sql.Clear ;
       Sql.Add (' select fixmon from pkcotbas                 ');
       Open;

       if StrToInt(Fieldbyname('fixmon').AsString ) >= StrToInt(Indate) then
            result := False;
  end;
end;

Function TFM_Sub1.Check_Duplicate( var ErrMsg : String) : Boolean;
var
   i,j       : Integer;
   DateTime1 : String;
   DateTime2 : String;
   Flag      : Boolean;
   Tem       : String;
begin

  Tem   :=  ' SELECT OVTMDATE, FRREALTIME, TOREALTIME                    '+
            ' FROM   PKHOTHIS                                            '+
            Format(' WHERE  EMPNO = ''%s'' AND LENGTH(TOREALTIME) = 12   ',
                     [EEmpNo.Text]) +
            '        AND    UPPER(CONYN) = ''Y''                         '+
            '        AND    OVTMDATE  BETWEEN  to_char(to_date('''+MEovtmdate.text+''',''YYYYMMDD'') - 1, ''YYYYMMDD'')   '+
            '                           AND    to_char(to_date('''+MEovtmdate.text+''',''YYYYMMDD'') + 1, ''YYYYMMDD'')   ';

  with Dm.Query1 do
  begin
       close;
       sql.Clear;
       Sql.Add(Tem);
       Open;
  end;

  if Dm.Query1.Eof then
  begin
       Dm.Query1.Close;
       Result := True;
       System.Exit;
  end;

  j := Dm.Query1.RecordCount;

  Flag  := True;
  For i := 1 to j do
  begin
       if (MEovtmdate.text   <> Dm.Query1.FieldByName('OvtmDate').AsString) OR    //자기자신을 비교하는 것을 막는다.
          (MEovtmdate.text + MEfrrealtime.text <> Dm.Query1.FieldByName('FrRealTime').AsString) then
       begin
            Flag := Check_Range(Dm.Query1.FieldByName('Frrealtime').AsString,
                                Dm.Query1.FieldByName('torealtime').AsString,
                                DateTime1,DateTime2);

            if not Flag then Break;
       end;
       Dm.Query1.Next;
  end;

  Dm.Query1.Close;

  if not Flag then
  begin
       ME_Filter.EditMask   := '9999-99-99 99:99;0;_';
       ME_Filter.Text       := DateTime1;
       ME_Filter.EditMask   := '9999-99-99 99:99;1;_';
       SMsg                  := ' 현재 자료의 근무시간범위가 [실제근무시간] : ' +
                               ME_Filter.Text + ' ~ ';
       ME_Filter.EditMask   := '9999-99-99 99:99;0;_';
       ME_Filter.Text       := DateTime2;
       ME_Filter.EditMask   := '9999-99-99 99:99;1;_';
       SMsg                 := SMsg + ME_Filter.Text + ' 인 기등록자료와 중복됩니다.';
  end;

  Result := Flag;
end;

{==============================================================================
         이미 신청한 내역과 중복여부를 체크하는 Procedure.
 ==============================================================================}
Function TFM_Sub1.Check_Range(TmpFrrealtime, Tmptorealtime : String ;
                            var DateTime1,DateTime2 :String): Boolean;
var
   Value1       : Extended;
   Value2       : Extended;
   SValue       : Extended;
   EValue       : Extended;
begin
  Value1 := To_DateTime(TmpFrRealTime);
  Value2 := To_DateTime(TmpToRealTime);
  SValue := To_DateTime(MEovtmdate.text + MEfrrealtime.text );
  EValue := To_DateTime(MEtorealtime.text);

  if ((SValue >  Value1)  AND (EValue <  Value2)) OR
     ((SValue >= Value1)  AND (SValue <= Value2)) OR
     ((EValue >= Value1)  AND (EValue <= Value2)) then
  begin
       DateTime1 := TmpFrRealTime;
       DateTime2 := TmpToRealTime;
       Result    := False;
       System.Exit;
  end;
  Result := True;
end;


{==============================================================================
         String을 DateTime로 변환하는 함수.
 ==============================================================================}
Function TFM_Sub1.To_DateTime(Tmp :String):Extended;
var
   A            : Extended;
   B            : Extended;
   Buf          : String;
begin
  Buf    := Copy(Tmp,1,4) + DateSeparator +
            Copy(Tmp,5,2) + DateSeparator +
            Copy(Tmp,7,2);

  A      := StrToDate(Buf);
  Buf    := Copy(Tmp,9,2) + TimeSeparator + Copy(Tmp,11,2);
  B      := StrToTime(Buf);
  Result := A + B;
end;

function TFM_Sub1.ValidationChk : Boolean ;
var
   Temp : Integer;
begin
  Result := True;

  if (length(MEovtmdate.text) < 8)  then
  begin
       MessageBox(handle,'근무일자가 없습니다.','입력오류',MB_ICONWARNING);
       MEovtmdate.SetFocus;
       Result := False ;
       exit;
  end;

  if not ( Check_DateValid( MEovtmdate.text ) ) then
  begin
       MessageBox(handle,'시작일이 유효하지 않습니다.','입력오류',MB_ICONWARNING);
       Result := False;
       Exit;
  end;

  if not ( Check_DateValid( copy(MEtorealtime.text,1,8) ) ) then
  begin
       MessageBox(handle,'종료일이 유효하지 않습니다.','입력오류',MB_ICONWARNING);
       Result := False;
       Exit;
  end;

  if (( MEfrrealtime.text >= '24' ) or (length(MEfrrealtime.text) < 4)) then
  begin
       MessageBox(handle,'시작시간이 유효하지 않습니다.','입력오류',MB_ICONWARNING);
       Result := False;
       Exit;
  end;

  if ((length(MEtorealtime.text) < 12 ) or ( copy(MEtorealtime.text,9,4) >= '24' )) then
  begin
       MessageBox(handle,'종료시간이 유효하지 않습니다.','입력오류',MB_ICONWARNING);
       Result := False;
       Exit;
  end;

  if (MEovtmdate.text + MEfrrealtime.text > MEtorealtime.text) then
  begin
       MessageBox(handle,'시작시간이 종료시간보다 큼니다.','입력오류',MB_ICONWARNING);
       Result := False;
       Exit;
  end;

  Try
       Temp := StrToInt( MErestmm.text );
  Except on EConvertError do
       begin
            MessageBox(handle,'휴식시간이 유효하지 않습니다.','입력오류',MB_ICONWARNING);
            MErestmm.SetFocus;
            Result := False;
            System.Exit;
       end;
  end;

  Try
       Temp := StrToInt( MEsprestmm.text );
  Except on EConvertError do
       begin
            MessageBox(handle,'휴식시간이 유효하지 않습니다.','입력오류',MB_ICONWARNING);
            MEsprestmm.SetFocus;
            Result := False;
            System.Exit;
       end;
  end;

  if length(MEconyn.text) < 1  then
  begin
       MessageBox(handle,'결재여부가 없습니다.','입력오류',MB_ICONWARNING);
       MEconyn.SetFocus;
       Result := False;
       exit;
  end;

  if (MEconyn.text <> 'Y') and (MEconyn.text <> 'N') then
  begin
       MessageBox(handle,'결재여부가 유효하지 않습니다.','입력오류',MB_ICONWARNING);
       MEconyn.SetFocus;
       Result := False;
       exit;
  end;
end;


procedure TFM_Sub1.Initialize;
begin
  MEovtmdate.Text := '';
  MEfrrealtime.Text := '';
  MEtorealtime.Text := '';
  MEovtmdesc.Text := '';
  MErestmm.Text := '0';
  MEsprestmm.Text := '0';
  MEconyn.Text := '';
  Phelpmsg.caption := '' ;
  Savemode := 0 ;
end;

procedure TFM_Sub1.Retrieve;
begin
  with DM.Qry_othis do
  begin
       Close;
       SQL.Clear;
       SQL.Add('SELECT ovtmdate, substr(frrealtime,9,4) frrealtime ,  ')    ;
       SQL.Add('       torealtime,restmm, sprestmm,  ovtmdesc, conyn  ')    ;
       SQL.Add('   FROM PKHOTHIS  ');
       SQL.Add('  WHERE OVTMDATE like :frdate   ');
       SQL.Add('   AND  EMPNO = :empno ');
       SQL.Add('  ORDER BY OVTMDATE  ');
       ParamByName('frdate').AsString :=  MEfrdate.text+'%' ;
       ParamByName('empno').AsString := Eempno.text ;
       open;
  end;

  DBGrid1.Enabled := True;
  Initialize;
end;

procedure TFM_Sub1.FormShow(Sender: TObject);
begin
  Start   := True;
  SelForm := nil;
{ Dsa2000   2003.03.31   강륜종... 디비접속 전에 쿼리 사용으로 인한 디비접속 에러남.  삭제함. )
  if Start then Start := not Start;

     DM.Query1.Close;
     DM.Query1.SQL.Clear;
     DM.Query1.SQL.ADD(' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') a ');
     DM.Query1.SQL.ADD('   FROM DUAL ');
     DM.Query1.Open;
     MainForm.GSsysdate := DM.Query1.FieldByName('a').AsString;
 }
 
  MEfrdate.text :=  copy(FM_Main.GSsysdate,1,6)  ;

  DM.Qry_othis.Close;
  Eempno.SetFocus ;

end;

procedure TFM_Sub1.BBinsertClick(Sender: TObject);
begin
  if ((length(Eempno.text) < 4) or
      (Lkorname.caption = '') or
      (Ldeptname.caption = '' ))  then
  begin
       MessageBox(FM_Main.HANDLE,'사번을 먼저 선택해 주세요','입력오류',MB_ICONWARNING) ;
       Eempno.Setfocus;
       EXIT;
  end;

  Label1.visible := True;
  DBGrid1.Enabled := False;

  Initialize ;
  MEovtmdate.SetFocus;
  BBdelete.Enabled := False;
  BBinsert.Enabled := False;
  phelpmsg.caption := '입력 작업중... ';
end;

procedure TFM_Sub1.BBsaveClick(Sender: TObject);
begin
  if MessageBox(FM_Main.HANDLE,'저장하시겠습니까?','저장확인',MB_YESNO) = IDYES then
  begin

       if not ValidationChk then EXIT ;
       if not DataChk then EXIT ;

       if Savemode = 0 then
       begin
            with DM.Query1 do
            begin
                 Close;
                 Sql.Clear ;
                 Sql.Add ('  insert into pkhothis                   ');
                 Sql.Add ('      (ovtmdate,   empno, korname,       ');
                 Sql.Add ('       orgnum , deptcode, frrealtime,    ');
                 Sql.Add ('       torealtime, ovtmdesc, restmm,     ');
                 Sql.Add ('       sprestmm, conyn, conemp, contime, ');
                 Sql.Add ('       writeman, writetime    )          ');
                 Sql.Add ('   values                                ');
                 Sql.Add ('      ('''+MEovtmdate.text+''', '''+Eempno.text+''', '''+Lkorname.caption+''',     ');
                 Sql.Add ('      '''+orgnum+''','''+deptcode+''','''+MEovtmdate.text+MEfrrealtime.text+''',');
                 Sql.Add ('      '''+MEtorealtime.text+''','''+MEovtmdesc.text+''', '''+MErestmm.Text+''', ');
                 Sql.Add ('      '''+MEsprestmm.text+''','''+MEconyn.text+''', '''+Pempno+''', '''+FM_Main.Gssysdate+''' ,    ');
                 Sql.Add ('      '''+Pempno+''', '''+FM_Main.Gssysdate+''')   ');
                 ExecSql;
            end;
       end
       else if Savemode = 1 then
       begin
            with DM.Query1 do
            begin
                 Close;
                 Sql.Clear ;
                 Sql.Add ('  update pkhothis                  ');
                 Sql.Add ('    set orgnum     = '''+orgnum+''',   ');
                 Sql.Add ('        deptcode   = '''+deptcode+''',  ovtmdate = '''+MEovtmdate.text+''', ');
                 Sql.Add ('        frrealtime = '''+MEovtmdate.text+'''||'''+MEfrrealtime.text+''', ');
                 Sql.Add ('        torealtime = '''+MEtorealtime.text+''', ovtmdesc= '''+MEovtmdesc.text+''', ');
                 Sql.Add ('        restmm     = '''+MErestmm.text+'''  ,    ');
                 Sql.Add ('        sprestmm   = '''+MEsprestmm.text+''' , conyn = '''+MEconyn.text+''',       ');
                 Sql.Add ('        conemp     = '''+Pempno+''' , contime = '''+FM_Main.GSsysdate+''',       ');
                 Sql.Add ('        writeman   = '''+Pempno+''' , writetime = '''+FM_Main.GSsysdate+'''     ');
                 Sql.Add ('   where empno = '''+Eempno.text+'''                ');
                 Sql.Add ('    and  ovtmdate = '''+ oriovtmdate +'''         ');
                 Sql.Add ('    and  frrealtime = '''+ oriovtmdate +'''||'''+orifrrealtime+'''      ');
                 ExecSql;
            end;
       end;

       Retrieve;

       If DM.Qry_othis.Locate('ovtmdate', MEovtmdate.text,[loPartialKey]) then
            DBGrid1.SetFocus;

       Initialize;

       BBinsert.Enabled := True;
       BBdelete.Enabled := True;
       DBGrid1.Enabled := True;
       Label1.visible := False;
       phelpmsg.caption := '저장되었습니다... ';
  end;
end;

procedure TFM_Sub1.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
       key := #0;
       with DM.Query1 do
       begin
            Close;
            SQL.Clear;
            SQL.ADD(' SELECT EMPNO, KORNAME, DEPTNAME, A.ORGNUM ORGNUM, A.DEPTCODE DEPTCODE ');
            SQL.ADD('   FROM PIMPMAS A, PYCDEPT C ');
            SQL.ADD('    WHERE A.ORGNUM = C.ORGNUM ');
            SQL.ADD('    AND A.DEPTCODE = C.DEPTCODE ');
            SQL.ADD('    AND A.EMPNO LIKE ''Y%'' ');
            SQL.ADD('    AND (EMPNO LIKE :empno ');
            SQL.ADD('     OR  KORNAME LIKE :empno) ');
            ParamByName('empno').AsString := Eempno.Text + '%';
            Open;

            If RecordCount < 1 then
            begin
                 MessageBox(FM_Main.HANDLE,'해당사원이 존재하지 않습니다..','조회조건입력오류',MB_ICONWARNING) ;
                 Close;
                 Eempno.text := '' ;
                 Exit;
            end
            else If RecordCount = 1 then
            begin
                 Eempno.Text := FieldByName('empno').AsString;
                 Lkorname.caption := FieldByName('korname').AsString;
                 Ldeptname.caption := FieldByName('deptname').AsString;
                 orgnum := FieldByName('orgnum').AsString;
                 deptcode := FieldByName('deptcode').AsString;
            end
            else If RecordCount > 1 then
            begin
                 FkeyempnoY := TFkeyempnoY.Create(Self);
                 Try
                      FkeyempnoY.Edempno.Text := Eempno.Text;
                      FkeyempnoY.ShowModal;
                      If FkeyempnoY.CloseChk = -1 then Exit;
                      Eempno.Text := FkeyempnoY.v_KeyEmpno;
                      Lkorname.caption := FkeyempnoY.v_KeyKorname;
                      Ldeptname.caption := GetDeptName(FkeyempnoY.v_KeyOrgnum, FkeyempnoY.v_KeyDeptcode);
                      orgnum   := FkeyempnoY.v_KeyOrgnum;
                      deptcode := FkeyempnoY.v_KeyDeptcode;
                 Finally
                      FkeyempnoY.Free;
                 end;
            end;
       end;
       Retrieve;
  end;
end;

procedure TFM_Sub1.SBfrdateClick(Sender: TObject);
begin
  Try
       MonthForm := TMonthForm.Create(Application);
       MonthForm.rDayCaption := MEfrDate.Text;
       MonthForm.ShowModal;
       MEfrdate.Text      := MonthForm.DayCaption;
  Finally
       MonthForm.Free;
  End;
end;


procedure TFM_Sub1.BitBtn1Click(Sender: TObject);
begin
  Try
       FkeyempnoY := TFkeyempnoY.Create(Self);
       FkeyempnoY.ShowModal;

       If FkeyempnoY.CloseChk = -1 then Exit;
       Eempno.Text       := FkeyempnoY.v_KeyEmpno;
       LKorname.caption  := FkeyempnoY.v_KeyKorname;
       Ldeptname.caption := GetDeptName(FkeyempnoY.v_KeyOrgnum, FkeyempnoY.v_KeyDeptcode);
       orgnum   := FkeyempnoY.v_KeyOrgnum;
       deptcode := FkeyempnoY.v_KeyDeptcode;
  Finally
       FkeyempnoY.Free;
  end;
end;

procedure TFM_Sub1.BitBtn2Click(Sender: TObject);
begin
  if length(Eempno.text) < 4 then
  begin
       MessageBox(FM_Main.HANDLE,'조회사번을 먼저 선택해 주세요','입력오류',MB_ICONWARNING) ;
       Eempno.Setfocus;
       EXIT;
  end;

  if (length(MEfrdate.text) < 6) then
  begin
       MessageBox(FM_Main.HANDLE,'조회기간을 먼저 선택해 주세요','입력오류',MB_ICONWARNING) ;
       MEfrdate.Setfocus;
       EXIT;
  end;
  Retrieve;
  Label1.visible := False;
end;

procedure TFM_Sub1.BBdeleteClick(Sender: TObject);
begin
  if Savemode = 1 then
  begin
       if MessageDlg(Copy(MEovtmdate.text,1,4) +'/' + Copy(MEovtmdate.text,5,2) +'/' + Copy(MEovtmdate.text,7,2) +
                        '일자를 삭제하시겠습니까? ', mtInformation, [mbYes, mbNo], 0) = mrYes  then
       begin
            if not Fixmonchk(Copy(MEovtmdate.text,1,6)) then
            begin
                 MessageDlg('이미 마감된 날짜입니다. 삭제실패!!', mtInformation, [mbok], 0) ;
                 exit;
            end;

            with DM.Query1 do
            begin
                 Close;
                 Sql.Clear ;
                 Sql.Add ('  delete  from pkhothis                  ');
                 Sql.Add ('  where  ovtmdate =  '''+MEovtmdate.text+'''                             ');
                 Sql.Add ('    and  empno =  '''+Eempno.text+'''                              ');
                 Sql.Add ('    and  frrealtime =  '''+MEovtmdate.text+'''||'''+MEfrrealtime.text+'''  ');
                 ExecSql;
            end;
            Retrieve;
            Initialize;
            Label1.visible := False;
            phelpmsg.caption := '삭제되었습니다... ';
       end;
  end
  else
       MessageBox(FM_Main.handle,'삭제할 자료를 선택해주세요.','삭제',MB_ICONINFORMATION) ;
end;



procedure TFM_Sub1.BBcancelClick(Sender: TObject);
begin
  Initialize;
  DBGrid1.Enabled := True;
  BBdelete.Enabled := True;
  BBinsert.Enabled := True;
  Label1.visible := False;
end;

procedure TFM_Sub1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  oriovtmdate       := DM.Qry_othis.FieldbyName('ovtmdate').AsString;
  orifrrealtime     := DM.Qry_othis.FieldbyName('frrealtime').AsString;

  MEovtmdate.Text   := DM.Qry_othis.FieldbyName('ovtmdate').AsString;
  MEfrrealtime.Text := DM.Qry_othis.FieldbyName('frrealtime').AsString;
  MEtorealtime.Text := DM.Qry_othis.FieldbyName('torealtime').AsString;
  MEovtmdesc.Text   := DM.Qry_othis.FieldbyName('ovtmdesc').AsString;
  MErestmm.Text     := IntToStr(DM.Qry_othis.FieldbyName('restmm').AsInteger);
  MEsprestmm.Text   := IntToStr(DM.Qry_othis.FieldbyName('sprestmm').AsInteger);
  MEconyn.Text      := DM.Qry_othis.FieldbyName('conyn').AsString;

  Label1.visible := True;
  Savemode := 1;
end;


procedure TFM_Sub1.MEconynDblClick(Sender: TObject);
begin
  if (MEconyn.text ='Y') then
       MEconyn.text :='N'
  else
       MEconyn.text :='Y';
end;

procedure TFM_Sub1.EempnoChange(Sender: TObject);
begin
  Lkorname.caption := '';
  Ldeptname.caption := '';
end;

procedure TFM_Sub1.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  oriovtmdate       := DM.Qry_othis.FieldbyName('ovtmdate').AsString;
  orifrrealtime     := DM.Qry_othis.FieldbyName('frrealtime').AsString;

  MEovtmdate.Text   := DM.Qry_othis.FieldbyName('ovtmdate').AsString;
  MEfrrealtime.Text := DM.Qry_othis.FieldbyName('frrealtime').AsString;
  MEtorealtime.Text := DM.Qry_othis.FieldbyName('torealtime').AsString;
  MEovtmdesc.Text   := DM.Qry_othis.FieldbyName('ovtmdesc').AsString;
  MErestmm.Text     := IntToStr(DM.Qry_othis.FieldbyName('restmm').AsInteger);
  MEsprestmm.Text   := IntToStr(DM.Qry_othis.FieldbyName('sprestmm').AsInteger);
  MEconyn.Text      := DM.Qry_othis.FieldbyName('conyn').AsString;

  Label1.visible := True;
  Savemode := 1;
end;

procedure TFM_Sub1.DBGrid1CellClick(Column: TColumn);
begin
  oriovtmdate       := DM.Qry_othis.FieldbyName('ovtmdate').AsString;
  orifrrealtime     := DM.Qry_othis.FieldbyName('frrealtime').AsString;

  MEovtmdate.Text   := DM.Qry_othis.FieldbyName('ovtmdate').AsString;
  MEfrrealtime.Text := DM.Qry_othis.FieldbyName('frrealtime').AsString;
  MEtorealtime.Text := DM.Qry_othis.FieldbyName('torealtime').AsString;
  MEovtmdesc.Text   := DM.Qry_othis.FieldbyName('ovtmdesc').AsString;
  MErestmm.Text     := IntToStr(DM.Qry_othis.FieldbyName('restmm').AsInteger);
  MEsprestmm.Text   := IntToStr(DM.Qry_othis.FieldbyName('sprestmm').AsInteger);
  MEconyn.Text      := DM.Qry_othis.FieldbyName('conyn').AsString;

  Label1.visible := True;
  Savemode := 1;
end;

procedure TFM_Sub1.EempnoExit(Sender: TObject);
begin
  If Eempno.Modified  then
  begin
       with DM.Query1 do
       begin
            Close;
            SQL.Clear;
            SQL.ADD(' SELECT EMPNO, KORNAME, DEPTNAME, A.ORGNUM ORGNUM, A.DEPTCODE DEPTCODE ');
            SQL.ADD('   FROM PIMPMAS A, PYCDEPT C ');
            SQL.ADD('    WHERE A.ORGNUM = C.ORGNUM ');
            SQL.ADD('    AND A.DEPTCODE = C.DEPTCODE ');
            SQL.ADD('    AND (EMPNO LIKE :empno ');
            SQL.ADD('     OR  KORNAME LIKE :empno) ');
            ParamByName('empno').AsString := Eempno.Text + '%';
            Open;

            If RecordCount < 1 then
            begin
                 MessageBox(FM_Main.HANDLE,'해당사원이 존재하지 않습니다..','조회조건입력오류',MB_ICONWARNING) ;
                 Close;
                 Eempno.text := '' ;
                 Exit;
            end
            else If RecordCount = 1 then
            begin
                 Eempno.Text := FieldByName('empno').AsString;
                 Lkorname.caption := FieldByName('korname').AsString;
                 Ldeptname.caption := FieldByName('deptname').AsString;
                 orgnum := FieldByName('orgnum').AsString;
                 deptcode := FieldByName('deptcode').AsString;
            end
            else If RecordCount > 1 then
            begin
                 Fkeyempno := TFkeyempno.Create(Self);
                 Try
                      Fkeyempno.Edempno.Text := Eempno.Text;
                      Fkeyempno.ShowModal;
                      If Fkeyempno.CloseChk = -1 then Exit;
                      Eempno.Text := Fkeyempno.v_KeyEmpno;
                      Lkorname.caption := Fkeyempno.v_KeyKorname;
                      Ldeptname.caption := GetDeptName(Fkeyempno.v_KeyOrgnum,Fkeyempno.v_KeyDeptcode);
                      orgnum := Fkeyempno.v_KeyOrgnum;
                      deptcode := Fkeyempno.v_KeyDeptcode;

                 Finally
                      Fkeyempno.Free;
                 end;
            end;
       end;
       Retrieve;
  end;
end;

procedure TFM_Sub1.MEovtmdateExit(Sender: TObject);
begin
  if (Savemode = 0) then //insert mode
       MEtorealtime.text := MEovtmdate.text ;
end;

end.
