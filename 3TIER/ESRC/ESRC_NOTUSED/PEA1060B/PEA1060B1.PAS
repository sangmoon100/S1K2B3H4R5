unit pea1060b1;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  pegradpanl, ExtCtrls, StdCtrls, Mask, pebtnedit, PeJeonLabel, DbTables, Db,
  peoutlookbtn, peNumedit, pedbutil, PeJeonMemo, Inifiles, kpaylib, Buttons,
  OnSkinBtn, OnEditBaseCtrl, OnEditStdCtrl, OnEditNumCtl, Grids, DBGrids,
  Tmax_DataSetText, OnEditBtnCtrl, OnEditCombo;

type
  TFm_sub_Form1 = class(TForm)
    Pa_Title: TPeJeonGrdPanel;
    Panel1: TPanel;
    oned_DETAILWEIGHT: TOnNumberEdit;
    Panel7: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    oned_SRESULTCLASS: TOnEdit;
    oned_ARESULTCLASS: TOnEdit;
    oned_BRESULTCLASS: TOnEdit;
    oned_CRESULTCLASS: TOnEdit;
    oned_DRESULTCLASS: TOnEdit;
    sGrid1: TStringGrid;
    Label5: TLabel;
    Label11: TLabel;
    PeJeonLabel18: TPeJeonLabel;
    PeJeonLabel19: TPeJeonLabel;
    PeJeonLabel20: TPeJeonLabel;
    PeJeonLabel21: TPeJeonLabel;
    PeJeonLabel22: TPeJeonLabel;
    PeJeonLabel28: TPeJeonLabel;
    ed_seqno: TEdit;
    PeJeonLabel24: TPeJeonLabel;
    PeJeonLabel26: TPeJeonLabel;
    Label16: TLabel;
    PeJeonLabel23: TPeJeonLabel;
    Label18: TLabel;
    PeJeonLabel30: TPeJeonLabel;
    Label20: TLabel;
    PeJeonLabel31: TPeJeonLabel;
    Label23: TLabel;
    PeJeonLabel32: TPeJeonLabel;
    Label24: TLabel;
    PeJeonLabel35: TPeJeonLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    PeJeonLabel34: TPeJeonLabel;
    Label29: TLabel;
    Label30: TLabel;
    PeJeonLabel33: TPeJeonLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    PeJeonLabel29: TPeJeonLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    PeJeonLabel27: TPeJeonLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    PeJeonLabel25: TPeJeonLabel;
    DBSet1: TTMaxDataSet;
    DBSet2: TTMaxDataSet;
    Panel6: TPanel;
    PeJeonOutLookBtn2: TPeJeonOutLookBtn;
    Oned_MAINWEIGHT: TOnNumberEdit;
    cbx_TaskCode: TComboBox;
    Bt_Add: TPeJeonOutLookBtn;
    Bt_Save: TPeJeonOutLookBtn;
    Bt_del: TPeJeonOutLookBtn;
    PeJeonOutLookBtn3: TPeJeonOutLookBtn;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    oned_DETAILTASK: TOnEdit;
    Eda_Bresult: TOnEdit;
    Eda_foraim: TOnEdit;
    oned_VALIDX: TOnEdit;
    cbx_PROPELTASK: TOnComboEdit;
    procedure Bt_AddClick(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sGrid1Click(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);
    procedure sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Bt_delClick(Sender: TObject);
    procedure PeJeonOutLookBtn3Click(Sender: TObject);
    procedure cbx_PROPELTASKChange(Sender: TObject);
    procedure PeJeonOutLookBtn2Click(Sender: TObject);
    procedure Eda_BresultChange(Sender: TObject);
    procedure cbx_PROPELTASKKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Start       : Boolean;
    detailweight: real;
    InUp_Check : String;
    Sql_Exec_Flag : Boolean;

    procedure Read_pehreaim_com;
    procedure Read_pehreaim_bas;
    function  Csel_gfd(p_loc: Integer): String;
    function  Csel_gfd2(p_loc: Integer): String;
  public
    { Public declarations }
    DbSet      : TDataSet;
    Pwork      : string;
    Pgubun     : integer;     // 1: 수정 , 2: 추가
    Pework     : string;
    Lrabasdate : string;
    Lfordate   : string;
    Lempno     : string;
    Lwriteemp  : string;
    LSeqno     : real;
    UpDateOk   : Boolean;
    prjview_UpDate : Boolean;
    gsLastConEv: String; //업무목표최종결재자 (1차 or 2차)
    gbChanged  : Boolean; // 데이터변경유무
    //LSeqNo_Chk : String;
    LPROPELTASK : string;
    vDeptcode : string;
    LvPROPELTASK, LvTaskCode :string;
    //LvChange : Boolean;
  end;

var
  Fm_sub_Form1: TFm_sub_Form1;

implementation
 uses Hinsa_TmaxDM, peDm, PeMainForm, pea1060b2;
{$R *.DFM}

procedure TFm_sub_Form1.Bt_AddClick(Sender: TObject);
var i : integer;
begin
   oned_SRESULTCLASS.Text := '';
   oned_ARESULTCLASS.Text := '';
   oned_BRESULTCLASS.Text := '';
   oned_CRESULTCLASS.Text := '';
   oned_DRESULTCLASS.Text := '';
   oned_DETAILWEIGHT.Value := 0;
   oned_DETAILTASK.Text := '';
   oned_VALIDX.Text := '';
   //oned_BRESULTCLASS1.Text := '';
   InUp_Check := 'I';
   Bt_Save.Caption := '저장';

   oned_DETAILTASK.Text := '';
   oned_DETAILWEIGHT.Value := 0;
   oned_VALIDX.Text := '';
   Eda_Bresult.Text := '';
   Eda_foraim.Text  := '';

   //sGrid1.RowCount := sGrid1.RowCount + 1;
   //for i := 0 to sGrid1.ColCount -1 do
   //begin
   //   sGrid1.Cells[i,sGrid1.RowCount -1] := '';
   //end;
end;

procedure TFm_sub_Form1.Bt_SaveClick(Sender: TObject);
var SqlText : string;
    Param   : OleVariant;
    iSeqno  : real;
    i : integer;
    isum, irow : integer;
begin
   if (Trim(cbx_PROPELTASK.Text) = '') or (Trim(oned_DETAILTASK.Text) = '')
      or (Trim(oned_DETAILWEIGHT.Text) = '') or (Trim(oned_VALIDX.Text) = '')
      or (Trim(Eda_Bresult.Text) = '') or (Trim(Eda_foraim.Text) = '')
      or (Trim(oned_SRESULTCLASS.Text) = '') or (Trim(oned_ARESULTCLASS.Text) = '')
      or (Trim(oned_BRESULTCLASS.Text) = '') or (Trim(oned_CRESULTCLASS.Text) = '')
      or (Trim(oned_DRESULTCLASS.Text) = '')
   then
   begin
      //MessageDlg('매체, 세부추진활동, 상세비중은 필수 입력항목입니다.', mtError, [mbOK], 0);
      MessageDlg('모든 데이터를 빠짐없이 입력하셔야 합니다.', mtError, [mbOK], 0);
      System.Exit;
   end;

   if strtoint(oned_DETAILWEIGHT.Text) = 0 then
   begin
      MessageDlg('상세비중은 0을 입력할 수 없습니다.', mtError, [mbOK], 0);
      System.Exit;
   end;

   { //수정시에 문제가 생김.
   if strtoint(Oned_MAINWEIGHT.Text) + strtoint(oned_DETAILWEIGHT.Text) > 100 then
   begin
      MessageDlg('비중의 합이 100을 넘을 수 없습니다.', mtError, [mbOK], 0);
      System.Exit;
   end;
   }
   if InUp_Check = 'I' then
   begin
      //저장처리를 한다.
      //먼저 key값을 설정한다. 미설정 된것은 seqno뿐이므로 seqno값을 가져온다.
      //가져올때는 key RABASDATE, PROPELTASK로 조회하여 MAX(SEQNO) + 1 값을 가져온다.
       iSeqno := DM.GetSeqno1(' pehreaim_COM ',Lrabasdate,replace(cbx_TaskCode.Text,'''','`'),vDeptcode );

      //값을 저장처리 할 수 있도록 sql문 을 생성한다.
       Param := VarArrayOf([Lrabasdate,                           //key1
                           vDeptcode,
                           trim(cbx_TaskCode.Text),               //key3
                           FloatToStr(iSeqno),                    //key4
                           Oned_MAINWEIGHT.Value,                    //매체_비중
                           replace(oned_DETAILTASK.Text,'''','`'),   //세부추진활동
                           oned_DETAILWEIGHT.value,                  //상세비중
                           replace(oned_VALIDX.Text,'''','`'),       //평가지표
                           //replace(Eda_foraim1.Text,'''','`'),     //평가산식
                           replace(oned_SRESULTCLASS.Text,'''','`'), //탁월
                           replace(oned_ARESULTCLASS.Text,'''','`'),
                           replace(oned_BRESULTCLASS.Text,'''','`'),
                           replace(oned_CRESULTCLASS.Text,'''','`'),
                           replace(oned_DRESULTCLASS.Text,'''','`'),
                           replace(Eda_foraim.Text,'''','`'),
                           //replace(Memo_Prjview.Text,'''','`'),
                           Lwriteemp
                          ]);

      DM.FSvr_UpdateSql(6,2,Param);
      Read_pehreaim_com;

      oned_DETAILTASK.Text := '';
      oned_DETAILWEIGHT.Value := 0;
      oned_VALIDX.Text := '';
      Eda_Bresult.Text := '';
      Eda_foraim.Text  := '';
      oned_SRESULTCLASS.Text := '';
      oned_ARESULTCLASS.text := '';
      oned_BRESULTCLASS.Text := '';
      oned_CRESULTCLASS.Text := '';
      oned_DRESULTCLASS.Text := '';
      
   end
   else if InUp_Check = 'U' then
   begin
      irow := sGrid1.Row;
      //수정처리를 한다.
      //값을 수정처리 할 수 있도록 sql문 을 생성한다.
      Param := VarArrayOf([Lrabasdate,                               //key1
                           cbx_TaskCode.Text,                        //key2
                           trim(ed_seqno.text),                      //key3
                           vDeptcode,                                //key4
                           replace(oned_DETAILTASK.Text,'''','`'),   //세부추진활동
                           oned_DETAILWEIGHT.value,                  //상세비중
                           replace(oned_VALIDX.Text,'''','`'),       //평가지표
                           replace(oned_SRESULTCLASS.Text,'''','`'), //탁월
                           replace(oned_ARESULTCLASS.Text,'''','`'),
                           replace(oned_BRESULTCLASS.Text,'''','`'),
                           replace(oned_CRESULTCLASS.Text,'''','`'),
                           replace(oned_DRESULTCLASS.Text,'''','`'),
                           replace(Eda_foraim.Text,'''','`'),
                           Lwriteemp
                          ]);

      DM.FSvr_UpdateSql(6,1,Param);
      Read_pehreaim_com;
      sGrid1.Row := irow;
   end;

   //JSH 추가 20060113 
   Param := VarArrayOf([Lrabasdate,                     //key1
                        cbx_TaskCode.Text,              //key2
                        vDeptcode                       //key3
                        ]);
   DM.FSvr_UpdateSql(8,1,Param);

   with sGrid1 do
   begin
      for i := 1 to RowCount -1 do
      begin
         if Cells[3,i] <> '' then
            isum := isum + strtoint(Cells[3,i]);
      end;
   end;
   Oned_MAINWEIGHT.Value := isum;

   if isum > 100 then
   begin
      MessageDlg('이 매체의 상세비중의 합이 100이 넘습니다.'
                 + #13 + '100을 맞춘 후 등록/수정 처리하세요.', mtError, [mbOK], 0);
      System.Exit;
   end;

end;

procedure TFm_sub_Form1.FormShow(Sender: TObject);
var i : integer;
begin
   Sql_Exec_Flag := true;
   InUp_Check := 'I';
   sGrid1.Cells[1,0]:= 'No';
   sGrid1.Cells[2,0]:= '세부추진활동';
   sGrid1.Cells[3,0]:= '상세비중';
   sGrid1.Cells[4,0]:= '평가지표';
   sGrid1.Cells[5,0] := '탁월';
   sGrid1.Cells[6,0] := '우수';
   sGrid1.Cells[7,0] := '보통';
   sGrid1.Cells[8,0] := '미흡';
   sGrid1.Cells[9,0] := '저조';

   //cbx_PROPELTASK 에 item값을 설정한다.
   Read_pehreaim_bas;
   cbx_PROPELTASK.Text :=  LvPROPELTASK;
   cbx_TaskCode.Text := LvTaskCode;
   Read_pehreaim_com;

end;

procedure TFm_sub_Form1.sGrid1Click(Sender: TObject);
begin
   with sGrid1 do
   begin
      if (Row > 0) and (Cells[2,Row] <> '') then
      begin
         oned_DETAILTASK.Text := Cells[2,Row];
         oned_DETAILWEIGHT.Value := strtoint(Cells[3,Row]);
         oned_VALIDX.Text := Cells[4,Row];
         oned_SRESULTCLASS.Text := Cells[5,Row];
         oned_ARESULTCLASS.Text := Cells[6,Row];
         oned_BRESULTCLASS.Text := Cells[7,Row];
         oned_CRESULTCLASS.Text := Cells[8,Row];
         oned_DRESULTCLASS.Text := Cells[9,Row];
         Eda_Bresult.Text := Cells[7,Row];
         Eda_foraim.Text := Cells[22,Row];

         InUp_Check := 'U';
         ed_seqno.Text := trim(Cells[20,Row]);
         Bt_Save.Caption := '수정';
      end;
   end;
end;

procedure TFm_sub_Form1.Read_pehreaim_com;
var
  SqlText,sql : string;
  i,j ,isum: integer;
begin
   sGrid1.RowCount := 2;
   for i := 0 to sGrid1.ColCount -1 do
   begin
      sGrid1.Cells[i,1] := '';
   end;

   //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
   SqlText := 'SELECT NVL(TO_CHAR(B.SEQNO),''0'')||'';''||                                                      '+
              '       NVL(B.DETAILTASK,'''')||'';''||NVL(TO_CHAR(B.DETAILWEIGHT),''0'')||'';''||                '+
              '       NVL(B.VALIDX,'''')||'';''||NVL(B.SRESULTCLASS,'''')||'';''||                              '+
              '       NVL(B.ARESULTCLASS,'''')||'';''||NVL(B.BRESULTCLASS,'''')||'';''||                        '+
              '       NVL(B.CRESULTCLASS,'''')||'';''||NVL(B.DRESULTCLASS,'''')||'';''||NVL(B.VALFUNCTION,'''') '+
              'FROM  PEHREAIM_BAS A, PEHREAIM_COM B                                           '+
              'WHERE A.RABASDATE = ''' + Lrabasdate + '''                                                       '+
              'AND   A.TASKCODE  = ' + trim(cbx_TaskCode.text)  +
              'AND   substr(A.DEPTCODE,1,4) = ''' + copy(vDeptcode,1,4) + '''                                   '+
              'AND   A.RABASDATE = B.RABASDATE(+)                                                               '+
              'AND   substr(A.DEPTCODE,1,4) = substr(B.DEPTCODE(+),1,4)                                         '+
              'AND   A.TASKCODE  = B.TASKCODE(+)                                                                '+
              'ORDER BY B.SEQNO                                                                                 ';

   with DBSet2 do
   begin
      Close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;

      if RecordCount > 0 then
      begin
         sGrid1.RowCount := RecordCount +1;
         for i := 1 to RecordCount do
         begin
            sGrid1.Cells[1,i] := inttostr(i);
            sGrid1.Cells[2,i] := Csel_gfd2(2);  //상세내용
            sGrid1.Cells[3,i] := Csel_gfd2(3);  //상세비중
            sGrid1.Cells[4,i] := Csel_gfd2(4);  //평가지표
            sGrid1.Cells[5,i] := Csel_gfd2(5);  //탁월
            sGrid1.Cells[6,i] := Csel_gfd2(6);  //우수
            sGrid1.Cells[7,i] := Csel_gfd2(7);  //보통
            sGrid1.Cells[8,i] := Csel_gfd2(8);  //보완필요
            sGrid1.Cells[9,i] := Csel_gfd2(9);  //미흡
            sGrid1.Cells[20,i] := Csel_gfd2(1); //seqno
            sGrid1.Cells[22,i] := Csel_gfd2(10); //seqno //평가산식
            next;
         end;

         with sGrid1 do
         begin
            isum := 0;
            for i := 1 to RowCount -1 do
            begin
               if Cells[3,i] <> '' then
               begin
                  isum := isum + strtoint(Cells[3,i]);
                  //showmessage(inttostr(isum));       
               end;
            end;
         end;
         //showmessage('최종='+inttostr(isum));
         Oned_MAINWEIGHT.Value := isum;

      end;
   end;
  {
   with DM.DBSet6 do
   begin
         SqlText := 'SELECT NVL(TO_CHAR(A.SEQNO),''0'') SEQNO , NVL(A.PROPELTASK,'''') PROPELTASK, NVL(TO_CHAR(A.MAINWEIGHT),''0'') MAINWEIGHT, '+
                 '       NVL(A.DETAILTASK,'''') DETAILTASK1, '''' DETAILTASK2, '''' DETAILTASK3, '''' DETAILTASK4, '''' DETAILTASK5,             '+
                 '       NVL(TO_CHAR(DETAILWEIGHT),''0'') DETAILWEIGHT1, '''' DETAILWEIGHT2, '''' DETAILWEIGHT3, '''' DETAILWEIGHT4, '''' DETAILWEIGHT5, '+
                 '       NVL(VALIDX,'''') VALIDX1, '''' VALIDX2, '''' VALIDX3, '''' VALIDX4, '''' VALIDX5, '+
                 '       NVL(VALFUNCTION,'''') VALFUNCTION1, '''' VALFUNCTION2, '''' VALFUNCTION3, '''' VALFUNCTION4, '''' VALFUNCTION5, '+
                 '       NVL(SRESULTCLASS,'''') SRESULTCLASS1, NVL(ARESULTCLASS,'''') ARESULTCLASS1, '+
                 '       NVL(BRESULTCLASS,'''') BRESULTCLASS1, NVL(CRESULTCLASS,'''') CRESULTCLASS1, NVL(DRESULTCLASS,'''') DRESULTCLASS1,'+
                 '       '''' SRESULTCLASS2, '''' ARESULTCLASS2, '''' BRESULTCLASS2, '''' CRESULTCLASS2, '''' DRESULTCLASS2, '+
                 '       '''' SRESULTCLASS3, '''' ARESULTCLASS3, '''' BRESULTCLASS3, '''' CRESULTCLASS3, '''' DRESULTCLASS3, '+
                 '       '''' SRESULTCLASS4, '''' ARESULTCLASS4, '''' BRESULTCLASS4, '''' CRESULTCLASS4, '''' DRESULTCLASS4, '+
                 '       '''' SRESULTCLASS5, '''' ARESULTCLASS5, '''' BRESULTCLASS5, '''' CRESULTCLASS5, '''' DRESULTCLASS5, '+
                 '       NVL(E1PRJOPINON  ,''''),         '''' KORNAME,     '''' EMPNO, '''' RPRJCONYN, '+
                 '       '''' RPRJCONDATE,   '''' E1EMPNO,    '''' E1PRJCONYN,  '''' E1PRJCONDATE,        '+
                 '       '''' E1PRJVIEW,     '''' E1PRJOBJYN, '''' EBREMPNO,    '''' EBRPRJCONYN,         '+
                 '       '''' EBRPRJCONDATE, '''' EBRPRJVIEW, '''' EBRVALOBJYN, '''' E2EMPNO,             '+
                 '       '''' E2PRJCONYN,    '''' E2PRJCONDATE, '''' E2PRJVIEW, '''' E2VALOBJYN           '+
                 '  FROM PEHREAIM_COM A,   PEHREAIM_COM B                       '+
                 ' WHERE A.RABASDATE   = ''' + Lrabasdate + '''                 '+
                   ' AND A.PROPELTASK  = ''' + trim(cbx_PROPELTASK.text) + '''  '+
                   ' AND A.WRITEEMP    = ''' + Lwriteemp + '''                 '+
                   ' AND A.RABASDATE   = B.RABASDATE '+
                   ' AND A.DEPTCODE    = B.DEPTCODE  '+
                   //현재 TASKCODE랑 메칭할수 있는건 없다 다만 매체명만 있을뿐..그런데 매체코드관리가 되어야 하므로
                   //임시루 매체명과 매체코드를 조인함. 월욜날 바꿔야 함.
                   ' AND A.TASKCODE    = B.TASKCODE  '+
                 ' ORDER BY A.SEQNO                                             ';

      //DBGrid1.Columns.Items[0].Field.Name := 'SEQNO';

      Close;
      ServiceName := 'PEA1060A_sel2';
      ClearFieldInfo;
      ClearParamInfo;
      AddField('SEQNO'              , ftString, 2  );
      AddField('PROPELTASK'         , ftString, 100 );
      AddField('MAINWEIGHT'         , ftString, 3 );
      AddField('DETAILTASK1'        , ftString, 100);
      AddField('DETAILTASK2'        , ftString, 100 );
      AddField('DETAILTASK3'        , ftString, 100 );
      AddField('DETAILTASK4'        , ftString, 100 );
      AddField('DETAILTASK5'        , ftString, 100 );
      AddField('DETAILWEIGHT1'      , ftString, 3 );
      AddField('DETAILWEIGHT2'      , ftString, 3 );
      AddField('DETAILWEIGHT3'      , ftString, 3 );
      AddField('DETAILWEIGHT4'      , ftString, 3 );
      AddField('DETAILWEIGHT5'      , ftString, 3 );
      AddField('VALIDX1'            , ftString, 100 );
      AddField('VALIDX2'            , ftString, 100 );
      AddField('VALIDX3'            , ftString, 100 );
      AddField('VALIDX4'            , ftString, 100 );
      AddField('VALIDX5'            , ftString, 100 );
      AddField('VALFUNCTION1'       , ftString, 100 );
      AddField('VALFUNCTION2'       , ftString, 100 );
      AddField('VALFUNCTION3'       , ftString, 100 );
      AddField('VALFUNCTION4'       , ftString, 100 );
      AddField('VALFUNCTION5'       , ftString, 100 );
      AddField('SRESULTCLASS1'      , ftString, 100 );
      AddField('ARESULTCLASS1'      , ftString, 100 );
      AddField('BRESULTCLASS1'      , ftString, 100 );
      AddField('CRESULTCLASS1'      , ftString, 100 );
      AddField('DRESULTCLASS1'      , ftString, 100 );
      AddField('SRESULTCLASS2'      , ftString, 100 );
      AddField('ARESULTCLASS2'      , ftString, 100 );
      AddField('BRESULTCLASS2'      , ftString, 100 );
      AddField('CRESULTCLASS2'      , ftString, 100 );
      AddField('DRESULTCLASS2'      , ftString, 100 );
      AddField('SRESULTCLASS3'      , ftString, 100 );
      AddField('ARESULTCLASS3'      , ftString, 100 );
      AddField('BRESULTCLASS3'      , ftString, 100 );
      AddField('CRESULTCLASS3'      , ftString, 100 );
      AddField('DRESULTCLASS3'      , ftString, 100 );
      AddField('SRESULTCLASS4'      , ftString, 100 );
      AddField('ARESULTCLASS4'      , ftString, 100 );
      AddField('BRESULTCLASS4'      , ftString, 100 );
      AddField('CRESULTCLASS4'      , ftString, 100 );
      AddField('DRESULTCLASS4'      , ftString, 100 );
      AddField('SRESULTCLASS5'      , ftString, 100 );
      AddField('ARESULTCLASS5'      , ftString, 100 );
      AddField('BRESULTCLASS5'      , ftString, 100 );
      AddField('CRESULTCLASS5'      , ftString, 100 );
      AddField('DRESULTCLASS5'      , ftString, 100 );
      AddField('E1PRJOPINON'        , ftString, 200 );
      AddField('KORNAME'            , ftString, 12 );
      AddField('EMPNO'              , ftString, 4  );
      AddField('RPRJCONYN'          , ftString, 1  );
      AddField('RPRJCONDATE'        , ftString, 8  );
      AddField('E1EMPNO'            , ftString, 4  );
      AddField('E1PRJCONYN'         , ftString, 1  );
      AddField('E1PRJCONDATE'       , ftString, 8  );
      AddField('E1PRJVIEW'          , ftString, 200);
      AddField('E1VALOBJYN'         , ftString, 1  );
      AddField('EBREMPNO'           , ftString, 4  );
      AddField('EBRPRJCONYN'        , ftString, 1  );
      AddField('EBRPRJCONDATE'      , ftString, 8  );
      AddField('EBRPRJVIEW'         , ftString, 200);
      AddField('EBRVALOBJYN'        , ftString, 1  );
      AddField('E2EMPNO'            , ftString, 4  );
      AddField('E2PRJCONYN'         , ftString, 1  );
      AddField('E2PRJCONDATE'       , ftString, 8  );
      AddField('E2PRJVIEW'          , ftString, 200);
      AddField('E2VALOBJYN'         , ftString, 1  );
      SQL.Text := Sqltext;
      Open;

      if RecordCount = 0 then
        exit;

      cbx_PROPELTASK.Text := DM.DBSet6.Fields[1].AsString;

      sGrid1.RowCount := RecordCount + 1;
       for i := 1 to RecordCount do
       begin
          sGrid1.Cells[1,i] := inttostr(i);
          sGrid1.Cells[2,i] := DM.DBSet6.Fields[3].AsString;
          sGrid1.Cells[3,i] := DM.DBSet6.Fields[8].AsString;
          sGrid1.Cells[4,i] := DM.DBSet6.Fields[13].AsString;
          sGrid1.Cells[5,i] := DM.DBSet6.Fields[23].AsString;
          sGrid1.Cells[6,i] := DM.DBSet6.Fields[24].AsString;
          sGrid1.Cells[7,i] := DM.DBSet6.Fields[25].AsString;
          sGrid1.Cells[8,i] := DM.DBSet6.Fields[26].AsString;
          sGrid1.Cells[9,i] := DM.DBSet6.Fields[27].AsString;
          sGrid1.Cells[20,i] := DM.DBSet6.Fields[0].AsString;
          DM.DBSet6.Next;
       end;

       with sGrid1 do
       begin
          for i := 1 to RowCount -1 do
          begin
             if Cells[3,i] <> '' then
             isum := isum + strtoint(Cells[3,i]);
          end;
      end;
      Oned_MAINWEIGHT.Value := isum;
   end;
   }
end;



procedure TFm_sub_Form1.Bt_ExitClick(Sender: TObject);
begin
   close;
end;

procedure TFm_sub_Form1.sGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Left : integer;
begin
   Left := Rect.Left +3;//Rect.Right - sGrid1.Canvas.TextWidth(sGrid1.Cells[ACol,ARow]) - 3;
   sGrid1.Canvas.TextRect(Rect, Left, Rect.Top+3, sGrid1.Cells[ACol,ARow]);
end;

procedure TFm_sub_Form1.Bt_delClick(Sender: TObject);
var SqlText : string;
    Param   : OleVariant;
    iRow : integer;
begin
   if (Trim(oned_DETAILTASK.Text) = '') or (Trim(oned_DETAILWEIGHT.Text) = '')  then
   begin
      MessageDlg('먼저 세부추진활동을 선택후 삭제 버튼을 누르세요.' + #13#13 +
                 '매체삭제를 원하시면 세부추진활동을 모두 삭제후' + #13 +
                 '매체추가에서 삭제하세요!' , mtError, [mbOK], 0);
      System.Exit;
   end;

   if sGrid1.RowCount > 1 then
      iRow := sGrid1.Row;

   Param := VarArrayOf([Lrabasdate,                               //key1
                       trim(cbx_TaskCode.Text),
                       trim(ed_seqno.text)
                          ]);
   DM.FSvr_UpdateSql(6,3,Param);

   //JSH 추가 20060113 
   Param := VarArrayOf([Lrabasdate,                     //key1
                        cbx_TaskCode.Text,              //key2
                        vDeptcode                       //key3
                        ]);
   DM.FSvr_UpdateSql(8,1,Param);

   Read_pehreaim_com;
   if iRow > 1 then
      sGrid1.Row := iRow -1
   else
   begin
      Bt_AddClick(self);
   end;
end;

procedure TFm_sub_Form1.PeJeonOutLookBtn3Click(Sender: TObject);
begin
   close;
end;

procedure TFm_sub_Form1.cbx_PROPELTASKChange(Sender: TObject);
var i : integer;
begin
   cbx_TaskCode.ItemIndex := cbx_PROPELTASK.ItemIndex;
   Oned_MAINWEIGHT.Value := 0;
   Read_pehreaim_com;
end;

procedure TFm_sub_Form1.PeJeonOutLookBtn2Click(Sender: TObject);
var
  Fm : TFm_sub_Form2;
  i : integer;
begin
   cbx_PROPELTASK.Text := '';
   oned_SRESULTCLASS.Text := '';
   oned_ARESULTCLASS.Text := '';
   oned_BRESULTCLASS.Text := '';
   oned_CRESULTCLASS.Text := '';
   oned_DRESULTCLASS.Text := '';
   oned_DETAILWEIGHT.Value := 0;
   Oned_MAINWEIGHT.Value := 0;
   oned_DETAILTASK.Text := '';
   oned_VALIDX.Text := '';
   //oned_BRESULTCLASS1.Text := '';
   InUp_Check := 'I';
   Bt_Save.Caption := '저장';
   sGrid1.RowCount := 2;
   for i := 0 to sGrid1.ColCount -1 do
   begin
      sGrid1.Cells[i,1] := '';
   end;

  try
    Fm := TFm_sub_Form2.Create(Self);
    Fm.Lrabasdate := Lrabasdate;
    Fm.Lfordate   := Lfordate;
    Fm.gsLastConEv:= gsLastConEv;
    Fm.Lwriteemp  := Lwriteemp;
    Fm.vDeptcode  := vDeptcode;
    Fm.ShowModal;
    //cbx_PROPELTASK.Text :=  Fm.ed_PROPELTASK.Text;
    Read_pehreaim_bas;
    Application.ProcessMessages;
  finally
    Fm.Free;
  end;
end;

procedure TFm_sub_Form1.Read_pehreaim_bas;
var
  SqlText,sql : string;
  i,j ,isum: integer;
begin
  cbx_PROPELTASK.Clear;
  cbx_TaskCode.Clear;

  //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
  SqlText := 'SELECT NVL(RABASDATE,'''') ||'';''|| NVL(DEPTCODE,'''') ||'';''|| '+
                   ' TO_CHAR(TASKCODE) || '';'' || TASKNAME '+
              ' FROM PEHREAIM_BAS '+
             ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND substr(DEPTCODE,1,4) = ''' + copy(vDeptcode,1,4) + ''' ';

  with DBSet1 do
  begin
    Close;
    ServiceName := 'PEA1060A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 300);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;

    if RecordCount > 0 then
    begin
       for i := 0 to RecordCount -1 do
       begin
          //sGrid1.Cells[2,i] :=  Csel_gfd(1);  //RABASDATE
          //sGrid1.Cells[3,i] :=  Csel_gfd(2);  //DEPTCODE
          //sGrid1.Cells[4,i] :=  Csel_gfd(3);  //TASKCODE
          cbx_TaskCode.Items.Add(Csel_gfd(3));
          cbx_PROPELTASK.Items.add(Csel_gfd(4));  //TASKNAME
          next;
       end;
    end;
  end;
end;

function TFm_sub_Form1.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DBSet1.FieldByName('SEL_DATA').AsString;
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

function TFm_sub_Form1.Csel_gfd2(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DBSet2.FieldByName('SEL_DATA').AsString;
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

procedure TFm_sub_Form1.Eda_BresultChange(Sender: TObject);
begin
   oned_BRESULTCLASS.Text := Eda_Bresult.Text;
end;

procedure TFm_sub_Form1.cbx_PROPELTASKKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key <> #8) then    //backspace
   begin
      MessageDlg('매체를 직접입력하지 마시고 +매체추가 버튼을 누르세요.', mtError, [mbOK], 0);
      System.Exit;
   end;
end;

end.
