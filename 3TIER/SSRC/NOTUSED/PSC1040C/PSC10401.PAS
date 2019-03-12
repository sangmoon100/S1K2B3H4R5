unit PSC10401;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  OnLineLabel, OnInsaCommon, OnEditBtnCtrl, OnTmaxPersonEdit, OnDBGrid, OnEditMemo,
  OnScheme, OnShapeLabel, OnFocusButton, Tmax_session,
  OnPopupEdit, TmaxFunc, Func;

type
  TFpsc10401 = class(TForm)
    Panel_Body: TPanel;
    SF_Main: TOnSchemeForm;
    OnShapeLabel2: TOnShapeLabel;
    StatusBar1: TStatusBar;
    Panel_Button: TPanel;
    BB_Close: TOnFocusButton;
    Edit1: TEdit;
    TMaxDataSet1: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    ED_EmpNo: TTMaxPersonPopupEdit;
    P_payra: TOnEdit;
    P_pstate: TOnEdit;
    P_telno: TOnEdit;
    P_RETCONT: TOnEdit;
    P_email: TOnEdit;
    P_addr: TOnEdit;
    BB_Save: TOnFocusButton;
    TDS_dml1: TTMaxDataSet;
    DbGrid1: TOnGrDbGrid;
    OnShapeLabel1: TOnShapeLabel;
    TMaxDataSet2: TTMaxDataSet;
    DataSource1: TDataSource;
    Edit2: TEdit;
    Edit3: TEdit;
    OnShapeLabel3: TOnShapeLabel;
    TMaxDataSet3: TTMaxDataSet;
    DataSource2: TDataSource;
    DbGrid2: TOnGrDbGrid;
    P_empdate: TOnMaskEdit;
    P_retdate: TOnMaskEdit;
    ED_zipno_old: TOnWinPopupEdit;
    OnEdit6: TOnEdit;
    ED_zipno: TOnEdit;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure DbGrid1DataChange(Sender: TObject; Field: TField);
    procedure ED_zipno_oldCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_zipno_oldInitPopup(Sender: TObject);
    procedure P_addrClick(Sender: TObject);
    procedure P_addrExit(Sender: TObject);
    procedure ED_EmpNoKeyPress(Sender: TObject; var Key: Char);
    procedure ED_zipnoExit(Sender: TObject);
  private
    { Private declarations }
    SqlStr    : String;
    ParamSQL  : String;

  public
    { Public declarations }
    Tmpaddr, Tmpfulladdr      : string;
    Tmpaddrlen   : integer;
    Empno         : String[04];   { 사번                          }
    KorName       : String[12];   { 성명                          }
    PassWord      : String[10];   { 패스워드                      }
    Grade         : String[10];   { 사용등급                      }
    procedure PL_Select_Data;
    procedure RetrieveData;


  end;

var
  Fpsc10401: TFpsc10401;

implementation

uses PSC10402;

{$R *.DFM}

procedure TFpsc10401.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

procedure TFpsc10401.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  StatusBar1.Panels[1].Text := '종합인사 시스템에 접속 중입니다...';

  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
end;

procedure TFpsc10401.FormShow(Sender: TObject);
begin
//--> Start
  Empno          := HInsa_Param(cmdline,1);
  Korname        := HInsa_Param(cmdline,2);
  Password       := HInsa_Param(cmdline,3);

  StatusBar1.Panels[1].Text := '초기자료를 설정하고 있습니다. 잠시만 기다려 주십시요..';

  ED_empno.Text  := Empno;
  ED_EmpNo.PL_get_singledata;

  PL_Select_Data;

  ED_empno.Text  := Empno + ' - ' + korname;

  RetrieveData;

  StatusBar1.Panels[1].Text := korname + '님의 자료가 출력되었습니다.';
end;

procedure TFpsc10401.PL_Select_Data;
begin
  with TMaxDataSet1 do
  begin
       Close;
       Sql.Clear;
       Sql.Text := Format( 'select empno,         '+
                           '       korname,       '+
                           '       payra,         '+
                           '       pstate,        '+
                           '       telno,         '+
                           '       retcont,       '+
                           '       e_mail,        '+
                           '       empdate,       '+
                           '       retdate,       '+
                           '       curaddr,       '+
                           '       zipno,         '+
                           '       deptname,      '+
                           '       juminid        '+
                           '  from v_pstockinsa   '+
                           ' where empno = ''%s'' ',[Copy(ED_EmpNo.text,1,4)]);
                                          //서비스사용 프로그램 : PSC1040C PSC1060A PSC1070A
       ServiceName := 'PSC1040C_sel1';    //server Name : htmax_ps11.
       ClearFieldInfo;
       AddField('EMPNO'  , ftString,  4);
       AddField('KORNAME', ftString, 12);
       AddField('PAYRA'  , ftString, 20);
       AddField('PSTATE' , ftString, 20);
       AddField('TELNO'  , ftString, 15);
       AddField('RETCONT', ftString, 40);
       AddField('E_MAIL' , ftString, 60);
       AddField('EMPDATE', ftString,  8);
       AddField('RETDATE', ftString,  8);
       AddField('CURADDR', ftString, 80);
       AddField('ZIPNO'  , ftString,  7);
       AddField('DEPTNAME',ftString, 60);
       AddField('JUMINID', ftString, 14);   edit1.text := sql.text;
       open;

       if TMaxDataSet1.RecordCount <= 0 then
       begin
            if Copy(Empno,1,1) <> 'D' then
            begin
                 MessageDlg('귀하는 조회권한이 없습니다. 확인바랍니다.', mtInformation, [mbok], 0) ;
                 PostMessage(Handle, WM_CLOSE, 0, 0);
                 System.Exit;
            end
            else
            begin
                 ED_EmpNo.Enabled := True;
            end;
       end;

       Hinsa_FieldDisplay(Self,TMaxDataSet1,4,11);
       ED_EmpNo.Text          := FieldByName('empno').AsString + ' - '+
                                 FieldByName('korname').AsString;
       P_payra.Text           := FieldByName('PAYRA').AsString;
       P_pstate.Text          := FieldByName('PSTATE').AsString;
       P_telno.Text           := FieldByName('telno').AsString;
       P_RETCONT.Text         := FieldByName('RETCONT').AsString;
       P_email.Text           := FieldByName('e_mail').AsString;
       P_addr.Text            := FieldByName('curaddr').AsString;
       ED_zipno.Text          := FieldByName('zipno').AsString;
       P_empdate.Text         := Hinsa_DisplayDate(FieldByName('empdate').AsString,'-');
       P_retdate.Text         := Hinsa_DisplayDate(FieldByName('retdate').AsString,'-');
       Close;

       Tmpfulladdr    := P_addr.Text;

       StatusBar1.Panels[1].Text := ED_empno.korname + '님의 자료가 출력되었습니다.';
  end;
end;

procedure TFpsc10401.BB_SaveClick(Sender: TObject);
begin
     StatusBar1.Panels[1].Text := '';
     if Application.MessageBox('현재자료를 저장하시겠습니까?','작업안내',mb_yesno) = id_no then
        system.exit;

     sqlstr := 'update pimpmas                       ' + #13 +
     format(' set   telno    = ''%s'',               ',[P_telno.text]) + #13 +
     format('       retcont  = ''%s'',               ',[P_RETCONT.text])+ #13 +
     format('       e_mail   = ''%s'',               ',[P_email.text]) + #13 +
     format('       curaddr  = ''%s'',               ',[P_addr.text]) + #13 +
     format('       zipno    = ''%s''                ',[ED_zipno.text]) + #13 +
     Format(' where empno    = ''%s''                ',[Empno]) ;


     with TDS_dml1 do
     begin
          ServiceName := 'PSC1040C_dml';
          Close;
          Sql.Clear;
          Sql.Add(sqlstr);

//          edit1.Text := sql.Text;

          if not TDS_dml1.Execute then
          begin
               ShowMessage('저장중 에러가 발생했습니다.');
               System.Exit;
          end
          else
          begin
               ShowMessage('정상적으로 완료되었습니다.');
          end;
     end;

     Application.ProcessMessages;

end;

procedure TFpsc10401.RetrieveData;
var
     ParamVariant1 : String;
     i : integer;
begin
     Application.ProcessMessages;
     ParamSQL := Format( 'select distinct a.stocknum      ,'+
                         '       a.subnum                 ,'+
                         '       a.givedate               ,'+
                         '       sum(b.stcnt) stcnt       ,'+
                         '       a.saveamt                ,'+
                         '       a.savedate               ,'+
                         '       a.savemark               ,'+
                         '       a.saveterm                '+
                         '  from pstockmas a, pstockdet b  '+
                         ' where a.stocknum = b.stocknum   '+
                         '   and a.subnum   = b.subnum     '+
                         '   and b.empno    = ''%s''       '+
                         ' group by a.stocknum, a.subnum,  '+
                         '          a.givedate,            '+
                         '          a.saveamt,  a.savedate,'+
                         '          a.savemark, a.saveterm '+
                         ' order by a.stocknum             ',[Copy(ED_EmpNo.Text,1,4)]);

     with TMaxDataSet2 do
     begin
          ServiceName :='PSC1040C_sel2';  //server Name : htmax_ps11.
          Close;
          Sql.Clear;
          Sql.Add(ParamSQL);

          ClearFieldInfo;
          AddField('STOCKNUM', ftString, 2);
          AddField('SUBNUM'  , ftString, 2);
          AddField('GIVEDATE', ftString, 10);
          AddField('STCNT'   , ftFloat,  15);
          AddField('SAVEAMT' , ftFloat,  15);
          AddField('SAVEDATE', ftString, 25);
          AddField('SAVEMARK', ftString, 50);
          AddField('SAVETERM', ftString, 100);      edit1.Text := sql.Text;
          Open;

          FieldByName('STOCKNUM').Alignment := taCenter;
          FieldByName('GIVEDATE').Alignment := taCenter;
          FieldByName('SAVEDATE').Alignment := taCenter;
          TFloatField(FieldByName('STCNT')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('SAVEAMT')).DisplayFormat := '#,##0';

          OnEdit6.Text := '';
          i := 1;
          while not TMaxDataSet2.EOF do
          begin
            if i = 1 then
              OnEdit6.Text := FieldByName('STOCKNUM').Asstring
            else
              OnEdit6.Text := OnEdit6.Text +  ', ' + FieldByName('STOCKNUM').Asstring ;

            inc(i);
            TMaxDataSet2.Next;
          end;
          TMaxDataSet2.First;
     end;
end;

procedure TFpsc10401.DbGrid1DataChange(Sender: TObject; Field: TField);
var
     ParamVariant2 : String;
begin
     Application.ProcessMessages;
     TMaxDataSet3.Close;

     ParamVariant2 := format( 'select  b.stocknum, b.detdate, b.gubun, b.stcnt, b.saveamt, b.owstcnt, b.basis, b.remark   '+
                              '  from  pstockmas a, pstockdet b                                                           '+
                              ' where  a.stocknum = b.stocknum                                                            '+
                              '   and  a.subnum = b.subnum                                                                '+
                              '   and  b.empno = ''%s''                                                                   '+
                              '   and  a.stocknum in ''%s''                                                               '+
                              ' order by a.stocknum, b.seqno ',[Copy(ED_EmpNo.Text,1,4), TMaxDataSet2.FieldByName('STOCKNUM').AsString]);


     with TMaxDataSet3 do
     begin
          ServiceName :='PSC1040C_sel3';
          Close;
          Sql.Clear;
          Sql.Add(ParamVariant2);

    //      edit3.Text := sql.Text;

          ClearFieldInfo;
          AddField('STOCKNUM', ftString, 2);
          AddField('DETDATE' , ftString, 10);
          AddField('GUBUN'   , ftString, 4);
          AddField('STCNT'   , ftFloat, 15);
          AddField('SAVEAMT' , ftFloat, 15);
          AddField('OWSTCNT' , ftFloat, 15);
          AddField('BASIS'   , ftString, 20);
          AddField('REMARK'  , ftString, 50);
          Open;

          FieldByName('STOCKNUM').Alignment := taCenter;
          FieldByName('DETDATE').Alignment := taCenter;
          FieldByName('GUBUN').Alignment := taCenter;
          TFloatField(FieldByName('STCNT')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('SAVEAMT')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('OWSTCNT')).DisplayFormat := '#,##0';
     end;
end;

procedure TFpsc10401.ED_zipno_oldCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
{ 2015.02.03 우편번호 도움말 기능 삭제. dsa2000
  Tmpaddr            := '';
  Tmpaddrlen         := 0;

  if ZipForm.Zipno <> '' then
    begin
      Ed_zipno.Text      := Copy(ZipForm.ZipNo,1,3)+'-'+Copy(ZipForm.ZipNo,4,3);
      P_addr.Text        := ZipForm.Addr;
      Tmpaddr            := ZipForm.Addr;
      Tmpaddrlen         := Length(ZipForm.Addr);
      P_addr.SetFocus;
    end
  else
    begin
       MessageDlg('우편번호 검색실패!!!.  검색 재시도 또는 직접입력하시기 바랍니다',mtError, [mbOk],0);
       Ed_zipno.ReadOnly := False;
    end; }
end;

procedure TFpsc10401.ED_zipno_oldInitPopup(Sender: TObject);
begin
{ 2015.02.03 우편번호 도움말 기능 삭제. dsa2000
  ZipForm.Edit         := TOnWinPopupEdit(Sender);
  ZipForm.E_Cond.Text  := Trim(Copy(Ed_zipno.Text,1,3)+Copy(Ed_zipno.Text,5,3));
  TOnWinPopupEdit(Sender).PopupControl := ZipForm ;}
end;

procedure TFpsc10401.P_addrClick(Sender: TObject);
begin
{ 2015.02.03 우편번호 도움말 기능 삭제. dsa2000     CSR요청서  새주소 도입에 따른 프로그램 변경 건
   if (Tmpaddr<>'') and (Copy(P_addr.Text,1,Tmpaddrlen) <> Tmpaddr) then
      begin
         Application.Messagebox('우편번호에 따른 기본주소는 수정할 수 없습니다','작업안내',mb_ok+ mb_IconStop);
         P_addr.Text := Tmpaddr;
         P_addr.SetFocus;
      end
   else if (Tmpaddr='') and (Tmpfulladdr <> P_addr.Text ) then
      begin
         Application.Messagebox('주소 직접수정 불가능합니다. 우편번호 버튼을 이용해 주세요.','작업안내',mb_ok+ mb_IconStop);
         P_addr.Text := Tmpfulladdr;
         ED_zipno.SetFocus;
      end;}
end;

procedure TFpsc10401.P_addrExit(Sender: TObject);
begin
{ 2015.02.03 우편번호 도움말 기능 삭제. dsa2000  CSR요청서  새주소 도입에 따른 프로그램 변경 건
   if (Tmpaddr<>'') and (Copy(P_addr.Text,1,Tmpaddrlen) <> Tmpaddr) then
      begin
         Application.Messagebox('우편번호에 따른 기본주소는 수정할 수 없습니다','작업안내',mb_ok+ mb_IconStop);
         P_addr.Text := Tmpaddr;
         P_addr.SetFocus;
      end
   else if (Tmpaddr='') and (Tmpfulladdr <> P_addr.Text ) then
      begin
         Application.Messagebox('주소 직접수정 불가능합니다. 우편번호 버튼을 이용해 주세요.','작업안내',mb_ok+ mb_IconStop);
         P_addr.Text := Tmpfulladdr;
         ED_zipno.SetFocus;
      end;}
end;

procedure TFpsc10401.ED_EmpNoKeyPress(Sender: TObject; var Key: Char);
begin
   if key =#13 then
   begin
        key := #0;
        PL_Select_Data;
        RetrieveData;
   end;
end;

procedure TFpsc10401.ED_zipnoExit(Sender: TObject);
begin
  //2015.02.03  숫자만 입력토록 반영. dsa2000     CSR요청서  새주소 도입에 따른 프로그램 변경 건
  if not IsNumber(ED_zipno.Text) then
  begin
       ShowMessage('우편번호는 숫자만 입력하세요');
       ED_zipno.Text := ReMoveChar(ED_zipno.Text,'-'); 
  end;
end;

end.
