unit SubForm6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, pebtnedit, pevaluebtnedit, Db, DbTables,
  pedeptbtnedit, peextcombo, peoutlookbtn, ComCtrls, Grids,
  DBGrids, pedbgrid, pedballutil, peempnobtnedit, petxtwzd, PeJeonBtnDateEdit,
  pepaser, PeJeonMemo, pecheckbox;

type
  TFm_SubForm6 = class(TForm)
    TotalGrid: TPeJeonDbGrid;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Bt_new: TPeJeonOutLookBtn;
    E_Memo: TPeJeonMemo;
    RG_Sort: TRadioGroup;
    Timer1: TTimer;
    Panel2: TPanel;
    P_name: TPanel;
    L_count: TLabel;
    Panel1: TPanel;
    RG_Gubun2: TRadioGroup;
    Bt_allmail: TPeJeonOutLookBtn;
    Bt_Mail: TPeJeonOutLookBtn;
    RG_Gubun1: TRadioGroup;
    Bt_Text: TPeJeonOutLookBtn;
    Txt: TPeJeonTxtConvert;
    E_base_yy: TPeJeonPanelComboBox;
    DataSource1: TDataSource;
    Panel3: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Bt_newClick(Sender: TObject);
    procedure RG_Gubun2Click(Sender: TObject);
    procedure RG_SortClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Bt_MailClick(Sender: TObject);
    procedure Bt_TextClick(Sender: TObject);
    procedure RG_Gubun1Click(Sender: TObject);
  private
    { Private declarations }
    Start     : Boolean;
    SelForm   : TForm;
    gsRabasdate : String;
    Lbase_yy  : String;

    payrafr   : String;
    payrato   : String;
    pstate    : String;
    objdept1, objdept2, objdept3, objdept4, objdept5   : String;
    objdept6, objdept7, objdept8, objdept9, objdept10  : String;
    objemp1,  objemp2,  objemp3,  objemp4,  objemp5    : String;
    objemp6,  objemp7,  objemp8,  objemp9,  objemp10   : String;

    procedure SelectSql;
    procedure Display;
    procedure Count;
    procedure CountDisplay;

    procedure IDPbas_DataRead;

    procedure MailSend(FEmpno, FKorname: String; FWhoPerson: TStringList; FTitle, Fbody: String; FDetailBody: TStringList);
  public
    { Public declarations }
  end;

var
  Fm_SubForm6: TFm_SubForm6;

implementation

uses PMainForm, DmForm, HanaroMailForm;

{$R *.DFM}

procedure TFm_SubForm6.FormShow(Sender: TObject);
begin
  Start   := True;
  SelForm := nil;

  if Start then Start := not Start;

  IDPbas_DataRead;
  Lbase_yy := E_base_yy.Text;

  Bt_newClick(Bt_new);
end;

procedure TFm_SubForm6.IDPbas_DataRead;
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

       E_base_yy.Text := fields[0].AsString;
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

procedure TFm_SubForm6.Count;
begin
  with DM.Q_count do
  begin
       Close;
       Sql.Clear;
       Sql.Add('select count(*)                                                    ');
       Sql.Add('  from pimpmas a, peidpmas b                                       ');
       Sql.Add(' WHERE a.pstate     < '''+pstate +'''                              ');
       Sql.Add('   AND a.payra     >= '''+payrafr+'''                              ');
       Sql.Add('   AND a.payra     <= '''+payrato+'''                              ');
       Sql.Add('   AND a.empno    not in ('''+objemp1+''',  '''+objemp2+''',       ');
       Sql.Add('                          '''+objemp3+''',  '''+objemp4+''',       ');
       Sql.Add('                          '''+objemp5+''',  '''+objemp6+''',       ');
       Sql.Add('                          '''+objemp7+''',  '''+objemp8+''',       ');
       Sql.Add('                          '''+objemp9+''',  '''+objemp10+''')      ');
       Sql.Add('   AND a.deptcode not in ('''+objdept1+''', '''+objdept2+''',      ');
       Sql.Add('                          '''+objdept3+''', '''+objdept4+''',      ');
       Sql.Add('                          '''+objdept5+''', '''+objdept6+''',      ');
       Sql.Add('                          '''+objdept7+''', '''+objdept8+''',      ');
       Sql.Add('                          '''+objdept9+''', '''+objdept10+''')     ');
       Sql.Add('   AND a.empno      = b.empno(+)                                   ');
       Sql.Add('   AND b.base_yy    = :p_base_yy                                   ');
       ParamByName('p_base_yy').AsString := Lbase_yy;
  end;
end;

procedure TFm_SubForm6.CountDisplay;
var
  i, j, k, e1j,e1k : Integer;
begin
  Try
       with DM.Q_count do
       begin
            Count;
            Open;
            i := Fields[0].AsInteger;

            Count;
            Sql.Add(' and decode(b.rvalconyn,   ''Y'',''완료'',''미완료'') = ''미완료'' ');
            Open;
            j := Fields[0].AsInteger;

            Count;
            Sql.Add(' and decode(b.rvalconyn,   ''Y'',''완료'',''미완료'') = ''완료''   ');
            Open;
            k := Fields[0].AsInteger;

            Count;
            Sql.Add(' and decode(b.e1valconyn,  ''Y'',''완료'',''미완료'') = ''미완료'' ');
            Open;
            e1j := Fields[0].AsInteger;

            Count;
            Sql.Add(' and decode(b.e1valconyn,  ''Y'',''완료'',''미완료'') = ''완료''   ');
            Open;
            e1k := Fields[0].AsInteger;

            L_count.Caption := '총 ' + IntToStr(i) + '건중 ' +
                               '팀원미완료:' + IntToStr(j) + '건, ' +
                               '팀원완료:' + IntToStr(k) + '건, '+
                               '팀장미완료:' + IntToStr(e1j) + '건, ' +
                               '팀장완료:' + IntToStr(e1k) + '건';
       end;
  EXCEPT ON E : EDBEngineError DO
       begin
            MessageDlg(BDEErrorInfo(E),mtWarning,[mbOK],0);
            System.Exit;
       end;
  End;
end;

procedure TFm_SubForm6.SelectSql;
begin
  with DM.Q_Select do
  begin
       Close;
       Sql.Clear;
       Sql.Add('select a.empno 사번, a.korname 성명,                                                  ');
       Sql.Add('       (select codename from pyccode                                                  ');
       Sql.Add('         where codeid  =''I112''                                                      ');
       Sql.Add('           and codeno  =a.paycl) BAND,                                                ');
       Sql.Add('       decode(b.paycldate, null,a.paycldate, b.paycldate) BAND조정일,                 ');
       Sql.Add('       (select deptName from pycdept                                                  ');
       Sql.Add('         where orgnum  =a.orgnum                                                      ');
       Sql.Add('           and deptcode=a.deptcode) 부서, a.deptcode 부서코드,                        ');
       Sql.Add('       (select Hname from peidpcode where BASE_YY = :p_base_yy                        ');
       Sql.Add('           and classno = ''3'' and codeno = b.jmtrack) 직무TRACK,                     ');
       Sql.Add('       (select Hname from peidpcode where BASE_YY = :p_base_yy                        ');
       Sql.Add('           and classno = ''4'' and codeno = b.jmlevel) 수준,                          ');
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
       Sql.Add('       (select deptcode from pimpmas where empno = b.e1empno) 팀장부서코드            ');
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

procedure TFm_SubForm6.Display;
var
  i : Integer;
  Field : TField;
begin
  Try
      with DM.Q_Select do
      begin
           SelectSql;

           if      RG_Gubun2.ItemIndex = 0 then
           begin
                if Rg_Gubun1.ItemIndex = 0 then
                     SQL.Add(' and decode(b.rvalconyn,  ''Y'',''완료'',''미완료'') = ''미완료'' ')
                else
                     SQL.Add(' and decode(b.E1valconyn, ''Y'',''완료'',''미완료'') = ''미완료'' ');
           end
           else if RG_Gubun2.ItemIndex = 1 then
           begin
                if Rg_Gubun1.ItemIndex = 0 then
                     SQL.Add(' and decode(b.rvalconyn, ''Y'',''완료'',''미완료'')  = ''완료'' ')
                else
                     SQL.Add(' and decode(b.E1valconyn, ''Y'',''완료'',''미완료'') = ''완료'' ');
           end;

           if      Rg_Sort.ItemIndex = 0 then SQL.Add(' ORDER BY a.deptcode, a.empno  ')
           else if Rg_Sort.ItemIndex = 1 then SQL.Add(' ORDER BY a.korname   ')
           else if Rg_Sort.ItemIndex = 2 then SQL.Add(' ORDER BY a.empno     ')
           else if Rg_Sort.ItemIndex = 3 then SQL.Add(' ORDER BY 팀장사번, a.deptcode, a.empno  ');
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
             end
           end;
      end;
  EXCEPT ON E : EDBEngineError DO
    begin
      MessageDlg(BDEErrorInfo(E),mtWarning,[mbOK],0);
      System.Exit;
    end;
  End;
end;

procedure TFm_SubForm6.Bt_newClick(Sender: TObject);
begin
  CountDisplay;
  Display;
  Timer1.Enabled := True;
  MainForm.St_Help.Panels[0].Text := ' 5분에 한번씩 최신자료를 자동으로 조회합니다.';
end;

procedure TFm_SubForm6.RG_Gubun2Click(Sender: TObject);
begin
  if RG_Gubun2.ItemIndex = 0 then
  begin
       Bt_allmail.Visible := true;
       Bt_Mail.Visible    := true;
  end
  else
  begin
       Bt_allmail.Visible := False;
       Bt_Mail.Visible    := False;
  end;
  Bt_newClick(Bt_new);
end;

procedure TFm_SubForm6.RG_SortClick(Sender: TObject);
begin
  Bt_newClick(Bt_new);
end;

procedure TFm_SubForm6.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Bt_newClick(Bt_new);
end;

procedure TFm_SubForm6.MailSend(FEmpno, FKorname: String; FWhoPerson: TStringList; FTitle, Fbody: String;
          FDetailBody: TStringList);
var
  Fm: TFm_MailForm; // HanaroMailForm
begin
  //메일보내기
  Fm := TFm_MailForm.Create(Self);
  Try
       Fm.ProgID   := 'PEK2010A';
       Fm.Pempno   := FEmpno;
       Fm.Pkorname := FKorname;

       //** Debugging example **
       //FWhoPerson.clear;
       //FWhoPerson.Add('Z641/손종운');
       //FDetailBody.Clear;
       //FDetailBody.Add('[피평가자] 홍길동 일지매 시라소니');

       Fm.Ed_List.Items.Assign(FWhoPerson);
       Fm.E_Title.Text := FTitle;
       Fm.E_memo.Lines.Add(FBody);
       Fm.PdetailBody := FDetailBody;
       Fm.ShowModal;
  Finally
       Fm.Destroy;
  End;
end;

procedure TFm_SubForm6.Bt_MailClick(Sender: TObject);
var
  TmpBook : TBookMark;
  TmpList : TBookMarkList;
  Ibook, i, j: integer;
  empno, Selemp, DetailBody: TStringList;
  evaname, TmpTitle,TmpBody : string;
begin
  if MessageDlg('메일을 발송하시겠습니까?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
       System.Exit;

  // 전체메일선택
  if TComponent(Sender).Tag = 1 then
  begin
       with DM.Q_Select do
       begin
            DisableControls;
            try
                 First;
                 while not EOF do
                 begin
                      TotalGrid.SelectedRows.CurrentRowSelected := True;
                      Next;
                 end;
            finally
                 EnableControls;
            end;
       end;
  end;

  TmpList := TotalGrid.SelectedRows;
  Try
       empno      := TStringList.Create;
       Selemp     := TStringList.Create;
       DetailBody := TStringList.Create;


       if  (RG_Gubun1.ItemIndex = 0) And (RG_Gubun2.ItemIndex = 0) then
       begin
            TmpTitle := '"'+E_base_yy.Text+'년 자기계발계획(IDP) 등록" 안내';
            TmpBody  := '안녕하십니까?           '+ #13#10+#13+#10+
                        'HR팀에서 알려드립니다.'+ #13#10+#13+#10+
                        '현재 ['+E_base_yy.Text+'년 자기계발계획(IDP) 등록]이 진행중에 있습니다.'+ #13#10+#13+#10+
                        '이 메일을 받으시는 분들은 아직 등록를 완료하지 않으셨거나, '+ #13#10+#13+#10+
                        '등록 후 [결재상신] 버튼을 클릭하지 않은 분들이십니다.          '+ #13#10+#13+#10+
                        '메일을 받으셨다면 기간내에 등록을 완료하여 주시기 바랍니다. '+ #13#10+#13+#10+
                        '감사합니다.'+ #13#10+#13+#10+
                        ''+ #13#10   +
                        '위치 : 종합인사정보시스템 -> 인사/인력개발 -> Learning Point -> 자기계발계획(IDP) 등록';

            with TotalGrid.Datasource do
            begin
                 DataSet.DisableControls;
                 TmpBook := DM.Q_Select.GetBookMark;

                 for ibook := 0 to TmpList.Count - 1 do
                 begin
                      DataSet.GotoBookmark(TBookMark(TmpList.Items[ibook]));
                      Selemp.Sorted := True;
                      Selemp.Duplicates := dupIgnore;
                      if (Dm.Q_Select.FieldByName('자기완료').AsString  <> 'Y')  then
                         Selemp.Add(Dm.Q_Select.FieldByName('사번').AsString+'/'+Dm.Q_Select.FieldByName('성명').AsString);
                      DetailBody.Add('');
                 end;

                 DataSet.GotoBookMark(TmpBook);
                 DataSet.FreeBookMark(TmpBook);
                 Dataset.EnableControls;
            end;
       end
       else
       if  (RG_Gubun1.ItemIndex = 1) And (RG_Gubun2.ItemIndex = 0) then
       begin
            TmpTitle := '"'+E_base_yy.Text+'년 자기계발계획(IDP) 등록 및 결재" 안내';
            TmpBody  := '안녕하십니까?           '+ #13#10+#13+#10+
                        'HR팀에서 알려드립니다.'+ #13#10+#13+#10+
                        '현재 ['+E_base_yy.Text+'년 자기계발계획(IDP) 등록]이 진행중에 있습니다.'+ #13#10+#13+#10+
                        '귀하께서는 아래의 팀원에 대한 결재자로 지정되어 있사오니,'+ #13#10+#13+#10+
                        '등록내용에 대한 결재를 완료하여 주십시오.'+ #13#10+#13+#10+
                        '감사합니다.'+ #13#10+
                        ''+ #13#10   +
                        '위치 : 종합인사정보시스템 -> 인사/인력개발 -> Learning Point -> 자기계발계획(IDP) 등록';
            with TotalGrid.Datasource do
            begin
                 Dataset.DisableControls;
                 TmpBook := DataSet.GetBookMark;

                 Try
                     for ibook := 0 to TmpList.Count - 1 do
                     begin
                          DataSet.GotoBookmark(TBookMark(TmpList.Items[ibook]));
                          empno.Sorted := True;
                          empno.Duplicates := dupIgnore;
                          empno.Add(Dm.Q_Select.FieldByName('팀장사번').AsString+'/'+Dm.Q_Select.FieldByName('팀장성명').AsString);
                     end;

                     Selemp.Clear;
                     DetailBody.Clear;
                     for j := 0 to empno.Count - 1 do
                     begin
                          Dm.Q_Select.First;
                          evaname := '';
                          for ibook := 0 to Dm.Q_Select.RecordCount - 1 do
                          begin
                              if (Dm.Q_Select.FieldByName('팀장완료').AsString  <> '완료')  then
                              begin
                                  if Copy(empno.Strings[j], 1, 4) = Dm.Q_Select.FieldByName('팀장사번').AsString then
                                      evaname := evaname + DM.Q_Select.FieldByName('성명').AsString + ' ';
                              end;
                              DM.Q_Select.Next;
                          end;

                          Selemp.Add(empno.Strings[j]);
                          if Trim(evaname) = '' then
                              DetailBody.Add('')
                          else
                              DetailBody.Add('[결재대상] '+evaname);
                     end;

                 Finally
                 End;

                 DataSet.GotoBookMark(TmpBook);
                 DataSet.FreeBookMark(TmpBook);
                 Dataset.EnableControls;
            end;
       end;
       MailSend(MainForm.Pempno_ad, MainForm.Pkorname_ad, Selemp, TmpTitle, TmpBody, DetailBody);

  finally
       TotalGrid.SelectedRows.Clear;
       empno.Free;
       Selemp.Free;
       DetailBody.Free;
  end;
  MessageDlg('요청하신 작업을 완료하였습니다.!',mtInformation,[mbOK],0);
end;


procedure TFm_SubForm6.Bt_TextClick(Sender: TObject);
begin
  Txt.Execute;
  Bt_newClick(Sender);
end;

procedure TFm_SubForm6.RG_Gubun1Click(Sender: TObject);
begin
  Bt_newClick(Bt_new);
end;

end.
