unit pea1060b2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  pegradpanl, ExtCtrls, StdCtrls, Mask, pebtnedit, PeJeonLabel, DbTables, Db,
  peoutlookbtn, peNumedit, pedbutil, PeJeonMemo, Inifiles, kpaylib, Buttons,
  OnSkinBtn, OnEditBaseCtrl, OnEditStdCtrl, OnEditNumCtl, Grids, DBGrids,
  Tmax_DataSetText;

type
  TFm_sub_Form2 = class(TForm)
    sGrid1: TStringGrid;
    Bt_Save: TPeJeonOutLookBtn;
    Bt_del: TPeJeonOutLookBtn;
    PeJeonOutLookBtn3: TPeJeonOutLookBtn;
    Pa_Title: TPeJeonGrdPanel;
    ed_PROPELTASK: TEdit;
    DBSet1: TTMaxDataSet;
    Bt_Add: TPeJeonOutLookBtn;
    DBSet2: TTMaxDataSet;
    procedure PeJeonOutLookBtn3Click(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_AddClick(Sender: TObject);
    procedure sGrid1Click(Sender: TObject);
    procedure Bt_delClick(Sender: TObject);
  private
    { Private declarations }
    l_rabasdtate, l_deptcode, l_taskcode : string;
    procedure Rscore;
    function  Csel_gfd(p_loc: Integer): String;

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
    vDeptcode : String;

    gbChanged  : Boolean; // 데이터변경유무
    //LSeqNo_Chk : String;

  end;

var
  Fm_sub_Form2: TFm_sub_Form2;

implementation
{$R *.DFM}
 uses Hinsa_TmaxDM, peDm, pea1060b1;

procedure TFm_sub_Form2.PeJeonOutLookBtn3Click(Sender: TObject);
begin
   close;
end;

procedure TFm_sub_Form2.Bt_SaveClick(Sender: TObject);
var SqlText : string;
    Param   : OleVariant;
    iSeqno  : real;
begin
   iSeqno := DM.GetSeqno2(' pehreaim_bas ',Lrabasdate,vDeptcode);
   //Edit1.Text := FloatToStr(iSeqno);

   if Trim(ed_PROPELTASK.Text) = '' then
   begin
      showmessage('매체코드등록명을 입력하세요!');
      ed_PROPELTASK.SetFocus;
      Exit;
   end;

   if Bt_Save.Caption = '등록' then
   begin
      //showmessage(vDeptcode);
      //기존 등록된 내용이 있는지 여부를 체크한다.
      //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
     SqlText := 'SELECT TASKNAME '+
              ' FROM PEHREAIM_BAS '+
             ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND TASKNAME = ''' + trim(ed_PROPELTASK.Text) + ''' AND substr(DEPTCODE,1,4) = ''' + copy(vDeptcode,1,4) + ''' ';
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
          showmessage('동일 매체명이 존재하여 등록할수 없습니다.');
          exit;
        end;
     end;

     //SeqNo를 생성해야 한다.
     Param := VarArrayOf([Lrabasdate,            //기준일
                          vDeptcode,             //부서코드
                          FloatToStr(iSeqno),    //SeqNO
                          trim(ed_PROPELTASK.Text),
                          '0',
                          Lwriteemp
                         ]);
     DM.FSvr_UpdateSql(7,2,Param);
   end
   else if Bt_Save.Caption = '수정' then
   begin
     //수정할 매체와 동일한 명칭이 있는지 여부를 체크한 후 수정처리 한다.
     //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
     SqlText := 'SELECT TASKNAME '+
              ' FROM PEHREAIM_BAS '+
             ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND TASKNAME = ''' + trim(ed_PROPELTASK.Text) + ''' AND subtr(DEPTCODE,1,4) = ''' + copy(vDeptcode,1,4) + ''' ';
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
          showmessage('동일 매체명이 존재하여 수정할수 없습니다.');
          exit;
        end;
     end;      

     Param := VarArrayOf([Lrabasdate,            //기준일
                          l_deptcode,            //부서코드
                          l_taskcode,            //SeqNO
                          trim(ed_PROPELTASK.Text),
                          '0',
                          Lwriteemp
                          ]);
     DM.FSvr_UpdateSql(7,1,Param);
   end;

   Rscore;
   ed_PROPELTASK.SetFocus;
   ed_PROPELTASK.SelectAll;
end;

procedure TFm_sub_Form2.FormShow(Sender: TObject);
begin
  sGrid1.Cells[1,0] := ' 매체코드명';
  Rscore;
  ed_PROPELTASK.SetFocus;
end;

procedure TFm_sub_Form2.Rscore;
var
  SqlText       : string;
  i : integer;
begin
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
       sGrid1.RowCount := RecordCount +1;

       for i := 1 to RecordCount do
       begin
          sGrid1.Cells[2,i] :=  Csel_gfd(1);  //RABASDATE
          sGrid1.Cells[3,i] :=  Csel_gfd(2);  //DEPTCODE
          sGrid1.Cells[4,i] :=  Csel_gfd(3);  //TASKCODE
          sGrid1.Cells[1,i] :=  Csel_gfd(4);  //TASKNAME
          {
          if i = 1 then
          begin
             ed_PROPELTASK.Text := sGrid1.Cells[1,i];
             l_rabasdtate := sGrid1.Cells[2,i];
             l_deptcode  := sGrid1.Cells[3,i];
             l_taskcode :=  sGrid1.Cells[4,i];
          end;
          }
          next;
       end;

       with sGrid1 do
       begin
          if (Row > 0) and (Cells[1,Row] <> '') then
          begin
             ed_PROPELTASK.Text:= trim(Cells[1,Row]);
             l_rabasdtate := Cells[2,Row];
             l_deptcode  := Cells[3,Row];
             l_taskcode :=  Cells[4,Row];
             Bt_Save.Caption := '등록';
          end;
   end;
    end else
    begin if RecordCount = 0 then
       sGrid1.Cells[1,1] := '';
       sGrid1.Cells[2,1] := '';
       sGrid1.Cells[3,1] := '';
       sGrid1.Cells[4,1] := '';
    end;
  end;

  sGrid1.Row := 1;

end;

function TFm_sub_Form2.Csel_gfd(p_loc: Integer): String;
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

procedure TFm_sub_Form2.Bt_AddClick(Sender: TObject);
begin
   ed_PROPELTASK.Text := '';
   Bt_Save.Caption := '등록';
   ed_PROPELTASK.SetFocus;
end;

procedure TFm_sub_Form2.sGrid1Click(Sender: TObject);
begin
   with sGrid1 do
   begin
      if (Row > 0) and (Cells[1,Row] <> '') then
      begin
         ed_PROPELTASK.Text:= trim(Cells[1,Row]);
         l_rabasdtate := Cells[2,Row];
         l_deptcode  := Cells[3,Row];
         l_taskcode :=  Cells[4,Row];
         Bt_Save.Caption := '수정';
      end;
   end;
end;

procedure TFm_sub_Form2.Bt_delClick(Sender: TObject);
var SqlText : string;
    Param   : OleVariant;
    Msg     : string;
begin
   if Trim(ed_PROPELTASK.Text) = '' then
   begin
      MessageDlg('먼저 매체코드명을 선택후 삭제 버튼을 누르세요.', mtError, [mbOK], 0);
      System.Exit;
   end;

   if sGrid1.RowCount > 1 then
   begin
      //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
      //삭제할 매체애 대한 세부항목이 존재하는지 여부를 체크한 후 삭제처리 한다.
      SqlText := 'SELECT TASKCODE '+
                  ' FROM PEHREAIM_COM '+
                 ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND substr(DEPTCODE,1,4) = ''' + copy(l_deptcode,1,4) + ''' AND TASKCODE = ''' + l_taskcode + ''' ';

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
            showmessage('삭제할 매체에 대한 상세 세부추진활동 내역이 존재하여 삭제처리 할 수 없습니다. ');
            exit;
         end;
      end;

      //최종삭제 할 지 여부를  물어본 후 삭제처리 한다.
      Msg := '[삭제 작업을 하시겠습니까 ?';
      if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) <> IDYES then
          System.Exit;

      Param := VarArrayOf([Lrabasdate,   //key1
                          l_deptcode,    //key2
                          l_taskcode
                          ]);
      DM.FSvr_UpdateSql(7,3,Param);

      showmessage('삭제처리 되었습니다.');

      Rscore;
      ed_PROPELTASK.Text := '';
   end;

   FormShow(Sender);
   ed_PROPELTASK.SetFocus;

   with sGrid1 do
   begin
      if (Row > 0) and (Cells[1,Row] <> '') then
      begin
         ed_PROPELTASK.Text:= trim(Cells[1,Row]);
         l_rabasdtate := Cells[2,Row];
         l_deptcode  := Cells[3,Row];
         l_taskcode :=  Cells[4,Row];
         Bt_Save.Caption := '등록';
      end;
   end;
end;

end.
