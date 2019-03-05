unit PEA1060A4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, StdCtrls, DBCtrls, ExtCtrls, DBCGrids, PeJeonLabel, DB,
  pegradpanl, Grids, OnEditBaseCtrl, OnEditStdCtrl, OnEditNumCtl,
  Tmax_DataSetText;

type
  TSub_Form4 = class(TForm)
    P_Title: TPeJeonGrdPanel;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    Bt_Exit: TPeJeonOutLookBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    sGrid1: TStringGrid;
    sGrid2: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Eda_forweight: TOnNumberEdit;
    Eda_propeltask: TOnEdit;
    DB_COM1: TTMaxDataSet;
    BS_COM: TTMaxDataSet;
    Bt_Confirm: TPeJeonOutLookBtn;
    On_SumWeight: TOnNumberEdit;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    procedure Bt_ExitClick(Sender: TObject);
    procedure sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure P_TitleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sGrid1Click(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure Eda_forweightChange(Sender: TObject);
  private
    { Private declarations }
    ls_taskcode, ls_deptcode : string;
    iBf_RowChk : integer;
    function  Csel_gfd1(p_loc: Integer): String;
    function  Csel_gfd2(p_loc: Integer): String;
    procedure pehreaim_com;
    procedure pehreaim_com1;
  public
    { Public declarations }
    Pgubun     : integer;     // 1: 수정 , 2: 추가
    Lrabasdate : string;
    Lempno     : string;
    Lwriteemp  : string;
    LDeptcode  : string;
    iSumWeight, iSSumWeight :integer;

  end;

var
     Sub_Form4: TSub_Form4;

     ACol,ARow: Integer;

implementation
 uses
  PeMainForm, Hinsa_TmaxDM, peDm;//, pea1060a1, pea1060a2, pea1060a3, PEA1060A5;
{$R *.DFM}

procedure DrawCheck(ACanvas: TCanvas; ARect: TRect; AColor: TColor; EditStyle: word; Flag: string);
var  iDR:integer;
begin
     if  Trim(Flag) = '' then     Exit;
     with ACanvas do
     begin
          case EditStyle of
               1: begin //esCheckBox
                       case Flag[1] of
                            '1': iDR:= DFCS_BUTTONCHECK or DFCS_BUTTON3STATE;
                            '2': iDR:= DFCS_BUTTONCHECK or DFCS_CHECKED;
                            '3': iDR:= DFCS_BUTTONCHECK or DFCS_BUTTON3STATE or DFCS_INACTIVE;
                            '4': iDR:= DFCS_BUTTONCHECK or DFCS_BUTTON3STATE or DFCS_INACTIVE or DFCS_CHECKED;
                            else iDR:= DFCS_BUTTONCHECK or DFCS_BUTTON3STATE;
                       end;
                  end;
               2: begin //esRadioButton
                       case Flag[1] of
                            '1': iDR:= DFCS_BUTTONRADIO;
                            '2': iDR:= DFCS_BUTTONRADIO or DFCS_CHECKED;
                            '3': iDR:= DFCS_BUTTONRADIO or DFCS_INACTIVE;
                            '4': iDR:= DFCS_BUTTONRADIO or DFCS_CHECKED or DFCS_INACTIVE;
                            else iDR:= DFCS_BUTTONRADIO;
                       end;
                  end;
               else Exit;
          end;
          ACanvas.Brush.Color:= AColor;
          ACanvas.FillRect(ARect);
          InflateRect(ARect,-((ARect.Right  - ARect.Left -14) shr 1),-((ARect.Bottom - ARect.Top  -14) shr 1)); //DFCS_MONO
          DrawFrameControl(Handle, ARect, DFC_BUTTON, iDR);
     end;
end;

procedure TSub_Form4.Bt_ExitClick(Sender: TObject);
begin
     On_SumWeight.Value := 0;
     close;
end;

procedure TSub_Form4.sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
     if  (ACol = 3) and (ARow > 0) then
          with sGrid1 do DrawCheck(Canvas,Rect, Color,1, Cells[ACol, ARow]);
end;

procedure TSub_Form4.sGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     if  Button = mbLeft Then
     begin
          sGrid1.MouseToCell(X, Y, ACol, ARow);
     end;
end;

procedure TSub_Form4.sGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var  iCol,iRow, i: Integer;
begin
     if  Button = mbLeft Then
          with sGrid1 do
          begin
               MouseToCell(X, Y, iCol, iRow);
               if  (ACol = 3) and (ARow > 0) and (ACol = iCol) and (ARow = iRow) then
                    Cells[ACol, ARow]:= IntToStr(StrToIntDef(Cells[ACol, ARow],0) mod 2 + 1);
               if  (ACol = 4) then
               begin
                    if  (ARow > 0) and (ACol = iCol) and (ARow = iRow) then
                    begin
                         for  i := 1 to RowCount -1 do
                              Cells[4, i] := '1';
                    end;
                    Cells[ACol, ARow]:= IntToStr(StrToIntDef(Cells[ACol, ARow],0) mod 2 + 1);
               end;
          end;
end;

procedure TSub_Form4.FormShow(Sender: TObject);
begin
     with sGrid2 do
     begin
          Cells[1,0]:= '세부추진활동';
          Cells[2,0]:= '비중';
          Cells[3,0]:= '평가지표';
          Cells[4,0]:= '탁월';
          Cells[5,0]:= '우수';
          Cells[6,0]:= '보통';
          Cells[7,0]:= '미흡';
          Cells[8,0]:= '저조';
     end;
     pehreaim_com;
     On_SumWeight.Value := iSumWeight;
end;

procedure TSub_Form4.P_TitleMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
     if  ssleft in shift then
     begin
          Releasecapture;
          Self.Perform(WM_SYSCOMMAND, $F012, 0);
     end;
end;

function TSub_Form4.Csel_gfd1(p_loc: Integer): String;
var
     v_cnt, v_tmp: Integer;
     v_data: String;
begin
     Result := '';
     v_data := BS_COM.FieldByName('SEL_DATA').AsString;
     v_cnt  := 1;
     while v_cnt < p_loc do
     begin
          v_tmp := Pos(';',v_data);
          if  not(v_tmp > 0) then     Exit;
          v_cnt := v_cnt + 1;
          Delete(v_data, 1, v_tmp);
     end;
     v_tmp  := Pos(';',v_data) - 1;
     if  v_tmp < 0 then     v_tmp := Length(v_data);
     Result := Copy(v_data,1,v_tmp);
end;

function TSub_Form4.Csel_gfd2(p_loc: Integer): String;
var
     v_cnt, v_tmp: Integer;
     v_data: String;
begin
     Result := '';
     v_data := DB_COM1.FieldByName('SEL_DATA').AsString;
     v_cnt  := 1;
     while v_cnt < p_loc do
     begin
          v_tmp := Pos(';',v_data);
          if  not(v_tmp > 0) then     Exit;
          v_cnt := v_cnt + 1;
          Delete(v_data, 1, v_tmp);
     end;
     v_tmp  := Pos(';',v_data) - 1;
     if  v_tmp < 0 then     v_tmp := Length(v_data);
     Result := Copy(v_data,1,v_tmp);
end;

procedure TSub_Form4.pehreaim_com;
var  i : integer;
     SqlText : string;
     sDeptcode  : string;
begin
     iBf_RowChk := 0;
     with sGrid1 do
     begin
          RowCount  := 2;
          Cells[1,0]:= '매체명';
          Cells[2,0]:= '비중';
          Cells[3,0]:= '선택';
     end;

     sDeptcode := '';
     SqlText   := ' select substr(deptcode,1,4)            '+
                  '   from PEHREAIM_COMBAS                 '+
                  '  where rabasdate = '''+Lrabasdate+ ''' '+
                  '    and empno     = '''+Lempno+ '''     ';
        //memo1.text := sqltext;

     with BS_COM do
     begin
          Close;
          ServiceName := 'PEA1060A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftString, 300);
          ClearParamInfo;
          SQL.Text := SqlText;
          Open;
          if  RecordCount > 0 then
          begin
               sDeptcode := BS_COM.FieldByName('SEL_DATA').AsString;
          end;
          close;
     end;

     SqlText := ' select a.rabasdate||'';''||a.taskcode||'';''||a.taskname||'';''||nvl(b.mainweight,''0'')||'';''|| '+
                '        decode(b.taskcode,'''',''1'',''2'')||'';''||a.deptcode                                     '+
                '   from pehreaim_bas a,                                                                            '+
                '       (select distinct rabasdate, taskcode, mainweight from pehreaim_comdet                       '+
                '         where rabasdate            = '''+Lrabasdate+ ''' and empno = '''+Lempno+'''               '+
                '           and substr(deptcode,1,4) = '''+sDeptcode+ ''' ) b                                       '+
                '  where SUBSTR(deptcode,1,4) = '''+sDeptcode+ '''                                                  '+
                '    and a.taskcode in (select distinct taskcode from pehaimhis_com                                 '+
                '                        where nvl(econyn,''N'')    = ''Y''                                         '+
                '                          and substr(deptcode,1,4) = '''+sDeptcode+ ''' )                          '+
                '    and a.taskcode  = b.taskcode(+)                                                                '+
                '    and a.Rabasdate = '''+Lrabasdate+ '''                                                          ';      //jissi 추가 20080226

//     memo1.text := sqltext;
      with BS_COM do
      begin
           Close;
           ServiceName := 'PEA1060A_common';
           ClearFieldInfo;
           AddField('SEL_DATA', ftString, 300);
           ClearParamInfo;
           SQL.Text    := SqlText;
           Open;

           if  RecordCount > 0 then
           begin
                sGrid1.RowCount := RecordCount +1;
                for i := 1 to RecordCount do
                begin
                     sGrid1.Cells[1,i]:= Csel_gfd1(3); //매체명
                     sGrid1.Cells[2,i]:= Csel_gfd1(4); //비중
                     sGrid1.Cells[3,i]:= Csel_gfd1(5); //선택여부
                     sGrid1.Cells[4,i]:= Csel_gfd1(1); //평가기준일
                     //key값 저장
                     sGrid1.Cells[5,i]:= Csel_gfd1(2); //매체코드
                     sGrid1.Cells[6,i]:= Csel_gfd1(6); //부서코드
                     //비교값저장
                     sGrid1.Cells[7,i]:= sGrid1.Cells[3,i]; //선택여부
                     sGrid1.Cells[8,i]:= sGrid1.Cells[2,i]; //비중
                     if  i = 1 then
                     begin
                          Eda_propeltask.Text := sGrid1.Cells[1,i];
                          Eda_forweight.Value := strtoint(sGrid1.Cells[2,i]);
                          ls_taskcode         := sGrid1.Cells[5,i];
                          ls_deptcode         := sGrid1.Cells[6,i];
                     end;
                     next;
                end;
                close;
                pehreaim_com1;
                iBf_RowChk := 1;
           end;
      end;
end;

procedure TSub_Form4.pehreaim_com1;
var  sqltext : string;
     i : integer;
begin
     sGrid2.RowCount := 2;
     for  i := 1 to 10 do
     begin
          sGrid2.Cells[i,1] := '';
     end;

     SqlText := 'SELECT NVL(DETAILTASK,'''')||'';''||NVL(TO_CHAR(DETAILWEIGHT),''0'')||'';''||NVL(VALIDX,'''')||'';''|| '+
                '       NVL(SRESULTCLASS,'''')||'';''||NVL(ARESULTCLASS,'''')||'';''||NVL(BRESULTCLASS,'''')||'';''||   '+
                '       NVL(CRESULTCLASS,'''')||'';''||NVL(DRESULTCLASS,'''')||'';''||NVL(VALFUNCTION,'''')             '+
                '  FROM pehaimhis_com                                                                                   '+
                ' WHERE RABASDATE = ''' + Lrabasdate + '''                                                              '+
                '   AND TASKCODE  = ' + ls_taskcode                                                                      +
                '   AND substr(DEPTCODE,1,4)  = ''' + copy(ls_deptcode,1,4) + '''                                       '+   //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
                ' ORDER BY SEQNO                                                                                        ';
     //memo1.Text := sqltext;

     with  DB_COM1 do
     begin
          Close;
          ServiceName := 'PEA1060A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftString, 300);
          ClearParamInfo;
          SQL.Text    := SqlText;
          Open;
          if  RecordCount > 0 then
          begin
               sGrid2.RowCount        := RecordCount +1;
               for  i := 1 to RecordCount do
               begin
                    sGrid2.Cells[1,i] := Csel_gfd2(1); //세부내용
                    sGrid2.Cells[2,i] := Csel_gfd2(2); //세부비중
                    sGrid2.Cells[3,i] := Csel_gfd2(3); //평가지표
                    sGrid2.Cells[4,i] := Csel_gfd2(4); //탁월
                    sGrid2.Cells[5,i] := Csel_gfd2(5); //우수
                    sGrid2.Cells[6,i] := Csel_gfd2(6); //보통
                    sGrid2.Cells[7,i] := Csel_gfd2(7); //보완필요
                    sGrid2.Cells[8,i] := Csel_gfd2(8); //미흡
                    next;
               end;
          end;
          close;
     end;
end;

procedure TSub_Form4.sGrid1Click(Sender: TObject);
var  ichk : integer;
begin
     if  (sGrid1.Row > 0) and (sGrid1.Cells[1,sGrid1.Row] <> '') then
     begin
          ichk                := iBf_RowChk;
          iBf_RowChk          := sGrid1.Row;

          Eda_propeltask.Text := sGrid1.Cells[1,sGrid1.Row];
          Eda_forweight.Value := strtoint(sGrid1.Cells[2,sGrid1.Row]);
          ls_taskcode         := sGrid1.Cells[5,sGrid1.Row];
          ls_deptcode         := sGrid1.Cells[6,sGrid1.Row];
          if  ichk <> sGrid1.Row then
          begin
               iBf_RowChk:= sGrid1.Row;
               pehreaim_com1;
          end;
     end;
end;

procedure TSub_Form4.Bt_ConfirmClick(Sender: TObject);
var  i : integer;
     SqlText : string;
     isum : integer;
begin
     if  sGrid1.Cells[1,1] = '' then
     begin
          showmessage('반영처리할 자료가 없습니다.');
          exit;
     end;

     isum := 0;

     for  i := 1 to sGrid1.RowCount -1 do
     begin
          if  sGrid1.Cells[3,i] = '2' then
               isum := isum + strtoint(sGrid1.Cells[2,i]);
     end;

{ 2011.11.01 이승철매니져 요청(50 >> 30)
   if  isum < 80 then
}
     if  isum < 30 then
     begin
          showmessage('선택후 비중값을 입력하지 않았거나' + #13 +
                      '선택된 공동목표 비중의 합은 최소 50 이상이어야 합니다..');
          Exit;
     end;

     if  isum > 100 then
     begin
          showmessage('선택후 비중값을 입력하지 않았거나' + #13 +
                      '선택된 공동목표 비중과 개별목표 비중의 합이 100 이하이어야 합니다..');
          Exit;
     end;

     for  i := 1 to sGrid1.RowCount -1 do
     begin
          //if (sGrid1.Cells[7,i] <> sGrid1.Cells[3,i] ) or (sGrid1.Cells[8,i] <> sGrid1.Cells[2,i]) then

          if  sGrid1.Cells[3,i] = '2' then   //반영체크되어 있으면
          begin
               if strtoint(sGrid1.Cells[2,i]) <= 0 then
               begin
                  showmessage('체크된 매체 비중을 0으로 넣을수 없습니다.');
                  exit;
               end;

               //원본자료에 반영처리되지 않은 자료면
               if  sGrid1.Cells[7,i] = '1' then
               begin
                    //showmessage('111'+inttostr(i));
                    //ls_taskcode := sGrid1.Cells[5,sGrid1.Row];
                    //ls_deptcode := Copy(sGrid1.Cells[6,sGrid1.Row],1,4);

                     //개인별목표등록테이블(pehreaim_comdet)에 insert처리 시킨다.
                   { SqlText := Format('INSERT INTO PEHREAIM_COMDET '+
                    ' SELECT RABASDATE, ''%s'' EEMPNO, TASKCODE, SEQNO, DEPTCODE, %s MAINWEIGHT, DETAILTASK, DETAILWEIGHT, VALIDX, '+
                    ' VALFUNCTION, SRESULTCLASS, ARESULTCLASS, BRESULTCLASS, CRESULTCLASS, DRESULTCLASS, E1PRJOPINON, RESULT, '+
                    ' RSCORE, DETAILRSCORE, DETAILRCLASS, ESCORE, ROBJYN1, OBJYN, OBJSAYU, OBJOPINION, WRITEEMP, WRITETIME, 0 '+
                    ' FROM PEHREAIM_COM '+
                    ' WHERE RABASDATE = ''%s'' AND TASKCODE = %s AND SUBSTR(DEPTCODE,1,4) = ''%s'' ',
                    [ Lempno, sGrid1.Cells[2,i], Lrabasdate, sGrid1.Cells[5,i], Copy(sGrid1.Cells[6,i],1,4) ]);
                   }
                    SqlText := Format('INSERT INTO PEHREAIM_BASDET                                 '+
                                      '     ( rabasdate,  empno,    deptcode,  taskcode, taskname, '+
                                      '       mainweight, writeemp, writetime                      '+
                                      '     )                                                      '+
                                      'SELECT rabasdate, ''%s'',    deptcode,  taskcode, taskname, '+
                                      '       %s, ''%s'', to_char(sysdate,''YYYYMMDDHH24MISS'')    '+
                                      '  FROM PEHREAIM_BAS                                         '+
                                      ' WHERE rabasdate            = ''%s''                        '+
                                      '   AND taskcode             =   %s                          '+
                                      '   AND substr(deptcode,1,4) = ''%s''                        ',
                               [ Lempno, sGrid1.Cells[2,i], Lempno, Lrabasdate, sGrid1.Cells[5,i], Copy(sGrid1.Cells[6,i],1,4) ]);

                    DataModule_Tmax.Cupd_SQL := Sqltext;
                    DataModule_Tmax.Cupd_Exec;
                    if  not DataModule_Tmax.Cupd_ret then
                    begin
                         Messagedlg('APP-Server Error',mtError,[mbOK],0);
                         Exit;
                    end;


                   //목표등록시 PEHREAIM_COM과 pehaimhis_com맞지 않은건이 발생. 항상 PEHREAIM_COM이 더 작음. 사라짐.
                    SqlText := Format('INSERT INTO PEHREAIM_COMDET                                            '+
                                      '     ( rabasdate,    empno,        taskcode,     seqno,  deptcode,     '+
                                      '       mainweight,   detailtask,   detailweight,                       '+
                                      '       validx,       valfunction,  sresultclass,                       '+
                                      '       aresultclass, bresultclass, cresultclass,                       '+
                                      '       dresultclass, writeemp,     writetime,    detailescore          '+
                                      '     )                                                                 '+
                                      'SELECT rabasdate,    ''%s'',       taskcode,     seqno,  deptcode,     '+
                                      '       %s,           detailtask,   detailweight,                       '+
                                      '       validx,       valfunction,  sresultclass,                       '+
                                      '       aresultclass, bresultclass, cresultclass,                       '+
                                      '       dresultclass, ''%s'', to_char(sysdate,''YYYYMMDDHH24MISS''), 0  '+
                                      '  FROM pehaimhis_com                                                   '+
                                      ' WHERE rabasdate            = ''%s''                                   '+
                                      '   AND taskcode             =   %s                                     '+
                                      '   AND substr(deptcode,1,4) = ''%s''                                   ',
                               [ Lempno, sGrid1.Cells[2,i], Lempno, Lrabasdate, sGrid1.Cells[5,i], Copy(sGrid1.Cells[6,i],1,4) ]);

                    DataModule_Tmax.Cupd_SQL := Sqltext;
                    DataModule_Tmax.Cupd_Exec;
                    if  not DataModule_Tmax.Cupd_ret then
                    begin
                         Messagedlg('APP-Server Error',mtError,[mbOK],0);
                         Exit;
                    end;
               end

               //기존에 이미 반영처리된 자료일 경우 비중이 변경되었는지 여부 확인
               else
               begin
                    if  (sGrid1.Cells[8,i] <> sGrid1.Cells[2,i]) then
                    begin
                        { //비중변경되었으면 pehreaim_comdet에 비중값만 update처리 시킨다.
                         //and empno = '''+Lempno+'''
                         //ls_taskcode := sGrid1.Cells[5,sGrid1.Row];
                         //ls_deptcode := sGrid1.Cells[6,sGrid1.Row];

                         SqlText := Format('UPDATE PEHREAIM_COMDET SET '+
                                              ' MAINWEIGHT   = %s '+
                                              ' WHERE RABASDATE = ''%s'' AND EMPNO = ''%s'' AND TASKCODE = %s ' ,
                         //                    [sGrid1.Cells[2,i],Lrabasdate ,Lempno ,ls_taskcode]);
                                             [sGrid1.Cells[2,i],Lrabasdate ,Lempno ,sGrid1.Cells[5,i]]);
                         DataModule_Tmax.Cupd_SQL := Sqltext;
                         DataModule_Tmax.Cupd_Exec;
                         if not DataModule_Tmax.Cupd_ret then
                         begin
                            Messagedlg('APP-Server Error',mtError,[mbOK],0);
                            Exit;
                         end;}
                         // 반영처리하면 세부내용이 바뀌지 않는 관계로 삭제후 입력한다.
                         SqlText := Format('DELETE FROM PEHREAIM_BASDET  '+
                                           ' WHERE RABASDATE = ''%s''    '+
                                           '   AND EMPNO     = ''%s''    '+
                                           '   AND TASKCODE  =   %s      ',
                                           [Lrabasdate ,Lempno ,sGrid1.Cells[5,i]]);
                         DataModule_Tmax.Cupd_SQL := Sqltext;
                         DataModule_Tmax.Cupd_Exec;
                         if  not DataModule_Tmax.Cupd_ret then
                         begin
                              Messagedlg('APP-Server Error',mtError,[mbOK],0);
                              Exit;
                         end;
                         // 반영처리하면 세부내용이 바뀌지 않는 관계로 삭제후 입력한다.
                         SqlText := Format('DELETE FROM PEHREAIM_COMDET  '+
                                           ' WHERE RABASDATE = ''%s''    '+
                                           '   AND EMPNO     = ''%s''    '+
                                           '   AND TASKCODE  =   %s      ',
                                           [Lrabasdate ,Lempno ,sGrid1.Cells[5,i]]);
                         DataModule_Tmax.Cupd_SQL := Sqltext;
                         DataModule_Tmax.Cupd_Exec;
                         if  not DataModule_Tmax.Cupd_ret then
                         begin
                              Messagedlg('APP-Server Error',mtError,[mbOK],0);
                              Exit;
                         end;

                         SqlText := Format('INSERT INTO PEHREAIM_BASDET                                 '+
                                           '     ( rabasdate,  empno,    deptcode, taskcode, taskname,  '+
                                           '       mainweight, writeemp, writetime                      '+
                                           '     )                                                      '+
                                           'SELECT rabasdate, ''%s'',    deptcode, taskcode, taskname,  '+
                                           '       %s, ''%s'', to_char(sysdate,''YYYYMMDDHH24MISS'')    '+
                                           '  FROM PEHREAIM_BAS                                         '+
                                           ' WHERE rabasdate            = ''%s''                        '+
                                           '   AND taskcode             =   %s                          '+
                                           '   AND substr(deptcode,1,4) = ''%s''                        ',
                                    [ Lempno, sGrid1.Cells[2,i], Lempno, Lrabasdate, sGrid1.Cells[5,i], Copy(sGrid1.Cells[6,i],1,4) ]);

                         DataModule_Tmax.Cupd_SQL := Sqltext;
                         DataModule_Tmax.Cupd_Exec;
                         if not DataModule_Tmax.Cupd_ret then
                         begin
                              Messagedlg('APP-Server Error',mtError,[mbOK],0);
                              Exit;
                         end;

                         SqlText := Format('INSERT INTO PEHREAIM_COMDET                                            '+
                                           '     ( rabasdate,    empno,        taskcode,    seqno, deptcode,       '+
                                           '       mainweight,   detailtask,   detailweight,                       '+
                                           '       validx,       valfunction,  sresultclass,                       '+
                                           '       aresultclass, bresultclass, cresultclass,                       '+
                                           '       dresultclass, writeemp,     writetime,   detailescore           '+
                                           '     )                                                                 '+
                                           'SELECT rabasdate,    ''%s'',       taskcode,    seqno, deptcode,       '+
                                           '       %s,           detailtask,   detailweight,                       '+
                                           '       validx,       valfunction,  sresultclass,                       '+
                                           '       aresultclass, bresultclass, cresultclass,                       '+
                                           '       dresultclass, ''%s'', to_char(sysdate,''YYYYMMDDHH24MISS''), 0  '+
                                           '  FROM pehaimhis_com                                                   '+
                                           ' WHERE rabasdate            = ''%s''                                   '+
                                           '   AND taskcode             =   %s                                     '+
                                           '   AND substr(deptcode,1,4) = ''%s''                                   ',
                                    [ Lempno, sGrid1.Cells[2,i], Lempno, Lrabasdate, sGrid1.Cells[5,i], Copy(sGrid1.Cells[6,i],1,4) ]);

                         DataModule_Tmax.Cupd_SQL := Sqltext;
                         DataModule_Tmax.Cupd_Exec;
                         if  not DataModule_Tmax.Cupd_ret then
                         begin
                              Messagedlg('APP-Server Error',mtError,[mbOK],0);
                              Exit;
                         end;
                    end;
               end;
          end
          //반영체크 되어있지 않으면...
          else
          begin
               //원본자료가 반영처리된 자료일 경우
               if  sGrid1.Cells[7,i] = '2' then
               begin
                     //개인별목표등록테이블(pehreaim_basdet),개인별세부목표등록테이블(pehreaim_comdet)에 delete처리 한다.
                     //ls_taskcode := sGrid1.Cells[5,sGrid1.Row];
                     //ls_deptcode := sGrid1.Cells[6,sGrid1.Row];
                    SqlText := Format('DELETE FROM PEHREAIM_BASDET  '+
                                      ' WHERE RABASDATE = ''%s''    '+
                                      '   AND EMPNO     = ''%s''    '+
                                      '   AND TASKCODE  = %s        ',
                                      [Lrabasdate ,Lempno ,sGrid1.Cells[5,i]]);
                    DataModule_Tmax.Cupd_SQL := Sqltext;
                    DataModule_Tmax.Cupd_Exec;
                    if  not DataModule_Tmax.Cupd_ret then
                    begin
                         Messagedlg('APP-Server Error',mtError,[mbOK],0);
                         Exit;
                    end;

                    SqlText := Format('DELETE FROM PEHREAIM_COMDET  '+
                                      ' WHERE RABASDATE = ''%s''    '+
                                      '   AND EMPNO     = ''%s''    '+
                                      '   AND TASKCODE  = %s        ',
                                      [Lrabasdate ,Lempno ,sGrid1.Cells[5,i]]);
                    DataModule_Tmax.Cupd_SQL := Sqltext;
                    DataModule_Tmax.Cupd_Exec;
                    if  not DataModule_Tmax.Cupd_ret then
                    begin
                         Messagedlg('APP-Server Error',mtError,[mbOK],0);
                         Exit;
                    end;
               end;
          end;
     end;

     showmessage('반영처리되었습니다.');
     pehreaim_com;

     On_SumWeight.Value := iSSumWeight + isum;

     if  On_SumWeight.Value <> 100 then
     begin
          showmessage('(공동목표+개인목표) 비중의 합이 100이 아니면 [결재] 또는 [결재상신]되지 않습니다.'  + #13 +
                      '공동목표 비중이 100미만시에 개인목표 비중을 등록하여 비중의 총합을 100으로 맞추고'  + #13 +
                      '반드시 [결재상신] 처리하세요!');
          Exit;
     end;
end;

procedure TSub_Form4.Eda_forweightChange(Sender: TObject);
var  i, isum : integer;
begin
   if  iBf_RowChk > 0 then
   begin
        sGrid1.Cells[2,iBf_RowChk]:= floattostr(Eda_forweight.value);
{
        isum := iSSumWeight;
        for  i := 1 to sGrid1.RowCount -1 do
        begin
             isum := isum + strtoint(sGrid1.Cells[2,i]);
        end;
        On_SumWeight.Value := isum;
        }
   end;
end;

end.
