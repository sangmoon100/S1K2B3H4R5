{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE2040C(관리자대비사원 인원현황)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 김영대
Version         : 1.01
Date            : 1998.4.14
Update contents
  버전   수정일   수정자   관련근거         수정내용
 1.00    96.6.8   김영대   처리명세서    신규프로그램 개발
 1.01    98.4.14  김순례   전(98.4.11)   Sectcode별 인원계 추가
30.17  2000.2.18  강기우       -         부문 처리시 소계로 처리...
30.18  2000.3.8   김대훈       -         출력물 소계부분 이사를 상무보로 변경
30.19  2004.07.25 정규용       -         직급 전환쳬계 번경관련 레포트 수정
30.20  2005.06.13 변춘미    임현수       총괄부서코드추가(부서등급 60 추가)에 따라 쿼리수정_하드코딩
                                         (차수 변동시 REMARK 한 쿼리 재사용 예정, 'BZ'추후 삭제)
30.20  2005.06.29 최은아    임현수       실,팀 추가에 따라 쿼리수정_하드코딩
                                 (차수 변동시 REMARK 한 쿼리 재사용 예정, 'BZ','BZD','BZDE','BZDJ' 추후 삭제)
--------------------------------------------------------------------------------
}

unit pie20401;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, StdCtrls, Buttons, Gauges, ExtCtrls, Tabs, TabNotBk,
  Mask, DBTables, Quickrpt, Grids, DBGrids,
  Calen1, pass, Datelib, Timeftp, Fempno,KpayLib;

type
  TMainForm = class(TForm)
    Q_vari: TQuery;
    Database1: TDatabase;
    Query_TotalSum: TQuery;
    Query_SubTotal: TQuery;
    Query_Detail: TQuery;
    Query_comment1: TQuery;
    Query_comment2: TQuery;
    P_helpinfo: TPanel;
    P_Help: TLabel;
    Label1: TLabel;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Screen: TBitBtn;
    BB_Print: TBitBtn;
    Panel5: TPanel;
    G_Progress: TGauge;
    Panel16: TPanel;
    P_Body: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel15: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel14: TPanel;
    Panel1: TPanel;
    L_Name: TLabel;
    L_Date: TLabel;
    Panel3: TPanel;
    Edit1_1: TEdit;
    Edit2_1: TEdit;
    Edit3_1: TEdit;
    Edit4_1: TEdit;
    Edit5_1: TEdit;
    Edit6_1: TEdit;
    Edit7_1: TEdit;
    Edit8_1: TEdit;
    Edit1_2: TEdit;
    Edit2_2: TEdit;
    Edit3_2: TEdit;
    Edit4_2: TEdit;
    Edit5_2: TEdit;
    Edit6_2: TEdit;
    Edit7_2: TEdit;
    Edit8_2: TEdit;
    Edit1_3: TEdit;
    Edit2_3: TEdit;
    Edit3_3: TEdit;
    Edit4_3: TEdit;
    Edit5_3: TEdit;
    Edit6_3: TEdit;
    Edit7_3: TEdit;
    Edit8_3: TEdit;
    Q_Updatevari: TQuery;
    ME_WorkDate: TMaskEdit;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    L_LastDate: TPanel;
    L_CurCreate: TPanel;
    L_PlaneCreate: TPanel;
    Qbondept: TQuery;
    BB_SetUp: TBitBtn;
    PrinterSetup: TPrinterSetupDialog;
    Query_Sectotal: TQuery;
    Q_date: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_ScreenClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Edit1_1Change(Sender: TObject);
    procedure BB_SetUpClick(Sender: TObject);
  private
    pempno, pkorname, password: string;
    start: Integer;
    DeptLevel,pdeptcode,pcount : string;
    Change_PIMVARI: Boolean;
    { Private declarations }
    procedure ShowPreView;
    procedure Executive_Data(Const QTemp : TQuery);
    function  PageCheck(var pageLine : integer; gubun : integer) : Boolean;
  public
    { Public declarations }
    AReport: TQuickRep;
    payrachym : String;
    procedure ClearData;
    function  DeptNameFind : string;
  end;

type
  TDataIn = record
      flag      : string[1];  {C:계속, S:인쇄후 구분선 출력}
      deptname  : string[30];
      ttotal    : string[5];
      ptotal    : string[5];
      insuff    : string[5];
      currate   : string[8];
      mang      : string[5];
      mangrat   : string[8];
      four      : string[5];
      fourrat   : string[8];
      pemp      : string[5];
      pextrsum  : string[5];
      pbumn     : string[1];
      // =================================================
      // 계약직 관련 수정
      // =================================================
      pcontsum  : string[5];
      psum      : string[5];
      plevel    : boolean;
  end;

var
  MainForm: TMainForm;
  Fout : file of TDataIn;
  FCom : Textfile;
  DataIn: TDataIn;
  ErrorHelp : array[0..255] of char;
  HomeDir : string;
  sqlstr  : AnsiString;

implementation
{$R *.DFM}
uses
  pie20402;
const
  sPrn  = '#####';
  spPrn = '##0.00';
  dPrn  = '(####)';
  dpPrn = '(##0.00)';
procedure TMainForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  pempno   := PassEmp(cmdline, 1);
  pkorname := PassEmp(cmdline, 2);
  password := PassEmp(cmdline, 3);

  if Database1.Connected then Database1.Connected := False; 
  DataBase1.Params[0]  := 'SERVER NAME=' + PassEmp(cmdline, 13);
  DataBase1.Params[1]  := 'USER NAME=' + PassEmp(cmdline, 5);
  DataBase1.Params[19] := 'PASSWORD='  + PassEmp(cmdline, 6);
  
  HomeDir := HomeDirOpen;

  AReport := PrintForm.InReport;
end;

procedure TMainForm.Edit1_1Change(Sender: TObject);
begin
  Change_PIMVARI := True;
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
  i ,j : integer;
  rStr: string;
  EditCom: TEdit;
begin
  if start = 0 then begin
    start := 1;
    Application.ProcessMessages;
    if not DataBase1.Connected then DataBase1.Connected := True;
    rStr := Timeftp.TimeDate(Q_date);
    L_Date.Caption := Copy(rStr, 1, 4)+'/'+
                      Copy(rStr, 5, 2)+'/'+
                      Copy(rStr, 7, 2);


//    if not pass.PassDialog(Self, pempno, pkorname, password) then
//      System.Halt(0);
      L_Name.Caption := pkorname+'('+pempno+')';

    with Q_vari do begin
      
      Close;
      ParamByName('P_gubun').AsString  := '00';
      ParamByName('P_sgubun').AsString := '0001';
      Open; {최종작업년월}
      payrachym := FieldByName('VALUE4').AsString;

      Close;
      ParamByName('P_gubun').AsString  := '50';
      ParamByName('P_sgubun').AsString := '0001';
      Open; {최종작업년월}
      L_LastDate.Caption := Copy(FieldByName('VALUE2').AsString,1,4)+'.'+
                            Copy(FieldByName('VALUE2').AsString,5,2);
      ME_WorkDate.Text := Copy(FieldByName('VALUE2').AsString,1,6);
      Close;
      //===
      ParamByName('P_gubun').AsString  := '50';
      ParamByName('P_sgubun').AsString := '1001';
      Open;
      pdeptcode := FieldByName('VALUE1').AsString;
      pcount    := FieldByName('VALUE2').AsString;
      close;
      //===
      ParamByName('P_gubun').AsString  := '50';
      ParamByName('P_sgubun').AsString := '0002';
      Open; {계획인원생성일자, 현원생성일자}
      L_PlaneCreate.Caption := Copy(FieldByName('VALUE1').AsString,1,4)+'.'+
                               Copy(FieldByName('VALUE1').AsString,5,2)+'.'+
                               Copy(FieldByName('VALUE1').AsString,7,2);
      L_CurCreate.Caption   := Copy(FieldByName('VALUE2').AsString,1,4)+'.'+
                               Copy(FieldByName('VALUE2').AsString,5,2)+'.'+
                               Copy(FieldByName('VALUE2').AsString,7,2);
      Close;

      ParamByName('P_gubun').AsString  := 'E2';
      for i := 1 to 8 do begin
        ParamByName('P_sgubun').AsString := 'CM0'+IntToStr(i);
        Open;
        for j := 1 to 3 do begin
          EditCom := Self.FindComponent('Edit'+IntToStr(i)+'_'+inttostr(j)) as TEdit;
          if EditCom <> nil then
            EditCom.Text := FieldByName('VALUE'+IntToStr(j)).AsString;
        end;
        Close;
      end;
    end;
    Change_PIMVARI := False;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
  EditCom: TEdit;
begin
  if Change_PIMVARI = True then begin
    if MessageBox(handle,'변경된 Comment를 저장하시겠습니까 ?..','확  인',MB_YESNO or $0020)
       = ID_YES then begin
      for i := 1 to 8 do begin
        Q_Updatevari.Close;
        Q_Updatevari.SQL.Clear;
        Q_Updatevari.SQL.Add('UPDATE PIMVARI SET ');
        Q_Updatevari.SQL.Add('VALUE1 = :P_value1, ');
        Q_Updatevari.SQL.Add('VALUE2 = :P_value2, ');
        Q_Updatevari.SQL.Add('VALUE3 = :P_value3  ');

        EditCom := Self.FindComponent('Edit'+IntToStr(i)+'_1') as TEdit;
        if EditCom <> nil then
          Q_Updatevari.ParamByName('P_value1').AsString := EditCom.Text;

        EditCom := Self.FindComponent('Edit'+IntToStr(i)+'_2') as TEdit;
        if EditCom <> nil then
          Q_Updatevari.ParamByName('P_value2').AsString := EditCom.Text;

        EditCom := Self.FindComponent('Edit'+IntToStr(i)+'_3') as TEdit;
        if EditCom <> nil then
          Q_Updatevari.ParamByName('P_value3').AsString := EditCom.Text;

        Q_Updatevari.SQL.Add('WHERE (GUBUN  = :P_gubun ) AND ');
        Q_Updatevari.SQL.Add('      (SGUBUN = :P_sgubun) ');
        Q_Updatevari.ParamByName('P_gubun').AsString  := 'E2';
        Q_Updatevari.ParamByName('P_sgubun').AsString := 'CM0'+IntToStr(i);
        Q_Updatevari.ExecSQL;
        Q_Updatevari.Close;
      end;
    end;
  end;

  for i := 0 to Self.ComponentCount - 1 do
    if (Self.Components[i] is TQuery) then
      TQuery(Self.Components[i]).Close;
  Action := caFree;
  SysUtils.DeleteFile(HomeDir+'\list\pie2040c.tmp');
  SysUtils.DeleteFile(HomeDir+'\list\pie2040c.dat');
end;

{-----------------------------------------------------------}
procedure TMainForm.ShowPreView;
begin
//  Try
//  PreViewForm := TPreViewForm.Create(self);
//  PreViewForm.ShowModal;
//  Finally
//  PreViewForm.Free;
//  End;
end;

procedure TMainForm.ClearData;
begin
  with DataIn do begin
    deptname  := '';    ttotal    := '';
    ptotal    := '';    insuff    := '';
    currate   := '';    mang      := '';
    mangrat   := '';    four      := '';
    fourrat   := '';    pemp      := '';
    pextrsum  := '';    psum      := '';

    // 계약직 관련 추가
    pcontsum  := '';
    // 부문처리 관련 추가.
    plevel    := false;
  end;
end;

{-----------------------------------------------------------}
procedure TMainForm.BB_CloseClick(Sender: TObject);
begin
    Close;
end;

function TMainForm.PageCheck(var pageLine : integer; gubun : integer) : Boolean;
begin
  PageCheck := False;
  if pageLine > 39 then begin
     if gubun = 1 then begin
        ClearData; DataIn.flag := 'S'; System.Write(Fout, DataIn);
        ClearData; DataIn.flag := 'P'; System.Write(Fout, DataIn);
     end;
     if gubun = 2 then begin
        System.WriteLn(FCom, 'PAGESKIP');
     end;
     pageLine := 1;  PageCheck := True;
  end;
end;

procedure TMainForm.Executive_Data(Const QTemp : TQuery);
begin
   with DataIn do begin
        ttotal   := FormatFloat(dPrn, 0);
        ptotal   := FormatFloat(dPrn, QTemp.FieldByName('PSPE2').AsInteger);
        insuff   := FormatFloat(dPrn, 0);
        currate  := FormatFloat(dpPrn, 0);

        mang  := FormatFloat(dPrn, QTemp.FieldByName('PS_MANG').AsInteger);
        if QTemp.FieldByName('PSPE2').AsInteger <> 0 then
          mangrat:= FormatFloat(dpPrn, ( QTemp.FieldByName('PS_MANG').AsFloat /
                                         QTemp.FieldByName('PSPE2').AsFloat )*100.0)
        else mangrat := FormatFloat(dpPrn, 0);

        four  := FormatFloat(dPrn, QTemp.FieldByName('PS_FOUR').AsInteger);
        if QTemp.FieldByName('PSPE2').AsInteger <> 0 then
          fourrat:= FormatFloat(dpPrn, ( QTemp.FieldByName('PS_FOUR').AsFloat /
                                      QTemp.FieldByName('PSPE2').AsFloat )*100.0)
        else fourrat := FormatFloat(dpPrn, 0);
        pemp     := FormatFloat(dPrn, QTemp.FieldByName('PSPE2').AsInteger);
        pextrsum := FormatFloat(dPrn, 0);

        // 계약직 관련 추가
        pcontsum := FormatFloat(dPrn, 0);
        psum     := FormatFloat(dPrn, QTemp.FieldByName('PSPE2').AsInteger);
   end;
end;

procedure TMainForm.BB_ScreenClick(Sender: TObject);
var
  rStr: string[8];
  LineCnt, cnt, ProgressCnt: Integer;
  Buff,Buff1,Buff2,Buff3,Buff4,Fmt,pFmt: string;
begin
  if Trim(ME_WorkDate.Text) <= '199812' then
    begin
      Query_Sectotal.Close;
      Query_Sectotal.Sql.Clear;
      Query_Sectotal.Sql.Add('SELECT  PIHTOPO."ORGNUM",'+
                             '        PIHTOPO."SECTCODE",'+
                             '        ( sum( PIHTOPO."TTOTAL" ) ) TTOTAL,'+
                             '        ( sum( PIHTOPO."PPOSSUM" +'+
                             '               PIHTOPO."PSPE1" +'+
                             '               PIHTOPO."PSPE3" +'+
                             '               PIHTOPO."PSPE4" +'+
                             '               PIHTOPO."PSPE5"  ) ) PTOTAL,'+
                             '        ( sum( PIHTOPO."PPOS1" +'+
                             '               PIHTOPO."PPOS2" +'+
                             '               PIHTOPO."PPOS3"  ) ) MANG,'+
                             '        ( sum( PIHTOPO."PPOS4" +'+
                             '               PIHTOPO."PPOS5" +'+
                             '               PIHTOPO."PPOS6" +'+
                             '               PIHTOPO."PPOS7" +'+
                             '               PIHTOPO."PSPE1" +'+
                             '               PIHTOPO."PSPE3" +'+
                             '               PIHTOPO."PSPE4" +'+
                             '               PIHTOPO."PSPE5"  ) ) FOUR,'+
                             '        ( sum( PIHTOPO."PEXTRSUM" + PIHTOPO."PTEMPSUM" ) ) PEXTRSUM,'+
                             '        ( sum( PIHTOPO."PSPE21" +'+
                             '               PIHTOPO."PSPE22" +'+
                             '               PIHTOPO."PSPE23"  ) ) PS_MANG,'+
                             '        ( sum( PIHTOPO."PSPE24" +'+
                             '               PIHTOPO."PSPE25" +'+
                             '               PIHTOPO."PSPE26" +'+
                             '               PIHTOPO."PSPE27"  ) ) PS_FOUR,'+
                             '        ( sum( PIHTOPO."PSPE2"  ) ) PSPE2'+
                             '   FROM PIHTOPO'+
                             '  WHERE PIHTOPO."TOPOYM" = :P_topoym AND'+
                             '        PIHTOPO."TPGUBUN" = ''10'''+
                             '  GROUP BY'+
                             '        PIHTOPO."ORGNUM",PIHTOPO."SECTCODE"'+
                             '  ORDER BY'+
                             '        PIHTOPO."ORGNUM",PIHTOPO."SECTCODE"');
      Query_Detail.Close;
      Query_Detail.Sql.Clear;
      Query_Detail.Sql.Add('SELECT  (PIHTOPO."TPGUBUN") TPGUBUN_1, '+
                           '        PIHTOPO."BONCODE",'+
                           '        ( sum( PIHTOPO."TTOTAL" ) ) TTOTAL,'+
                           '        ( sum( PIHTOPO."PPOSSUM" +'+
                           '               PIHTOPO."PSPE1" +'+
                           '               PIHTOPO."PSPE3" +'+
                           '               PIHTOPO."PSPE4" +'+
                           '               PIHTOPO."PSPE5"  ) ) PTOTAL,'+
                           '        ( sum( PIHTOPO."PPOS1" +'+
                           '               PIHTOPO."PPOS2" +'+
                           '               PIHTOPO."PPOS3"  ) ) MANG,'+
                           '        ( sum( PIHTOPO."PPOS4" +'+
                           '               PIHTOPO."PPOS5" +'+
                           '               PIHTOPO."PPOS6" +'+
                           '               PIHTOPO."PPOS7" +'+
                           '               PIHTOPO."PSPE1" +'+
                           '               PIHTOPO."PSPE3" +'+
                           '               PIHTOPO."PSPE4" +'+
                           '               PIHTOPO."PSPE5"  ) ) FOUR,'+
                           '        ( sum( PIHTOPO."PEXTRSUM" + PIHTOPO."PTEMPSUM" ) ) PEXTRSUM,'+
                           '        ( sum( PIHTOPO."PSPE21" +'+
                           '               PIHTOPO."PSPE22" +'+
                           '               PIHTOPO."PSPE23"  ) ) PS_MANG,'+
                           '        ( sum( PIHTOPO."PSPE24" +'+
                           '               PIHTOPO."PSPE25" +'+
                           '               PIHTOPO."PSPE26" +'+
                           '               PIHTOPO."PSPE27"  ) ) PS_FOUR,'+
                           '        ( sum( PIHTOPO."PSPE2"  ) ) PSPE2'+
                           '   FROM PIHTOPO'+
                           '  WHERE   ( PIHTOPO."TOPOYM"     = :P_topoym ) AND'+
                           '          ( PIHTOPO."ORGNUM"     = :P_orgnum ) AND'+
                           '          ( PIHTOPO."SECTCODE"  = :P_sectcode ) AND'+
                           '          ( PIHTOPO."FIELDCODE"  = :P_fieldcode ) AND'+
                           '          ( PIHTOPO."TPGUBUN"    < ''30'')'+
                           ' GROUP BY  PIHTOPO."BONCODE",PIHTOPO."TPGUBUN" '+
                           ' ORDER BY  PIHTOPO."BONCODE",PIHTOPO."TPGUBUN"');
      Query_SubTotal.Close;
      Query_SubTotal.Sql.Clear;
      Query_SubTotal.Sql.Add('SELECT  PIHTOPO."ORGNUM",'+
                             '        PIHTOPO."FIELDCODE",'+
                             '        ( sum( PIHTOPO."TTOTAL" ) ) TTOTAL,'+
                             '        ( sum( PIHTOPO."PPOSSUM" +'+
                             '               PIHTOPO."PSPE1" +'+
                             '               PIHTOPO."PSPE3" +'+
                             '               PIHTOPO."PSPE4" +'+
                             '               PIHTOPO."PSPE5"  ) ) PTOTAL,'+
                             '        ( sum( PIHTOPO."PPOS1" +'+
                             '               PIHTOPO."PPOS2" +'+
                             '               PIHTOPO."PPOS3"  ) ) MANG,'+
                             '        ( sum( PIHTOPO."PPOS4" +'+
                             '               PIHTOPO."PPOS5" +'+
                             '               PIHTOPO."PPOS6" +'+
                             '               PIHTOPO."PPOS7" +'+
                             '               PIHTOPO."PSPE1" +'+
                             '               PIHTOPO."PSPE3" +'+
                             '               PIHTOPO."PSPE4" +'+
                             '               PIHTOPO."PSPE5"  ) ) FOUR,'+
                             '        ( sum( PIHTOPO."PEXTRSUM" + PIHTOPO."PTEMPSUM" ) ) PEXTRSUM,'+
                             '        ( sum( PIHTOPO."PSPE21" +'+
                             '               PIHTOPO."PSPE22" +'+
                             '               PIHTOPO."PSPE23"  ) ) PS_MANG,'+
                             '        ( sum( PIHTOPO."PSPE24" +'+
                             '               PIHTOPO."PSPE25" +'+
                             '               PIHTOPO."PSPE26" +'+
                             '               PIHTOPO."PSPE27"  ) ) PS_FOUR,'+
                             '        ( sum( PIHTOPO."PSPE2"  ) ) PSPE2'+
                             '   FROM PIHTOPO'+
                             '  WHERE PIHTOPO."TOPOYM" = :P_topoym AND'+
                             '        PIHTOPO."SECTCODE" = :P_sectcode AND'+
                             '        PIHTOPO."TPGUBUN" = ''10'''+
                             ' GROUP BY PIHTOPO."ORGNUM", PIHTOPO."FIELDCODE"'+
                             ' ORDER BY PIHTOPO."ORGNUM", PIHTOPO."FIELDCODE"');
      Query_TotalSum.Close;
      Query_TotalSum.Sql.Clear;
      Query_TotalSum.Sql.Add('SELECT '+
                             '        ( sum( PIHTOPO."TTOTAL" ) ) TTOTAL,'+
                             '        ( sum( PIHTOPO."PPOSSUM" +'+
                             '               PIHTOPO."PSPE1" +'+
                             '               PIHTOPO."PSPE3" +'+
                             '               PIHTOPO."PSPE4" +'+
                             '               PIHTOPO."PSPE5"  ) ) PTOTAL,'+
                             '        ( sum( PIHTOPO."PPOS1" +'+
                             '               PIHTOPO."PPOS2" +'+
                             '               PIHTOPO."PPOS3"  ) ) MANG,'+
                             '        ( sum( PIHTOPO."PPOS4" +'+
                             '               PIHTOPO."PPOS5" +'+
                             '               PIHTOPO."PPOS6" +'+
                             '               PIHTOPO."PPOS7" +'+
                             '               PIHTOPO."PSPE1" +'+
                             '               PIHTOPO."PSPE3" +'+
                             '               PIHTOPO."PSPE4" +'+
                             '               PIHTOPO."PSPE5"  ) ) FOUR,'+
                             '        ( sum( PIHTOPO."PEXTRSUM" + PIHTOPO."PTEMPSUM" ) ) PEXTRSUM,'+
                             '        ( sum( PIHTOPO."PSPE21" +'+
                             '               PIHTOPO."PSPE22" +'+
                             '               PIHTOPO."PSPE23"  ) ) PS_MANG,'+
                             '        ( sum( PIHTOPO."PSPE24" +'+
                             '               PIHTOPO."PSPE25" +'+
                             '               PIHTOPO."PSPE26" +'+
                             '               PIHTOPO."PSPE27"  ) ) PS_FOUR,'+
                             '        ( sum( PIHTOPO."PSPE2"  ) ) PSPE2'+
                             '   FROM PIHTOPO'+
                             '  WHERE ( PIHTOPO."TOPOYM"   = :P_topoym) AND '+
                             '        ( PIHTOPO."TPGUBUN"  = ''10'')');
    end
  else  if Trim(ME_WorkDate.Text) < '200404' then
    begin
      sqlstr :=
      'select  orgnum, sectcode, sum(ttotal) ttotal,                           ' + #13 +
      '        sum(ppossum+pspe1+pspe3+pspe4+pspe5) ptotal,                    ' + #13 +
      '        sum(ppos1+ppos2+ppos3+ppos4) mang,                              ' + #13 +
      '        sum(ppos5+ppos6+ppos7+ppos8+ppos9+pspe1+pspe3+pspe4+pspe5) four,' + #13 +
      '        sum(pextrsum+ptempsum) pextrsum,                                ' + #13 +
      '        sum(pcontsum) pcontsum,                                         ' + #13 +
      '        sum(pspe21+pspe22+pspe23) ps_mang,                              ' + #13 +
      '        sum(pspe24+pspe25+pspe26+pspe27) ps_four,                       ' + #13 +
      '        sum(pspe2) pspe2                                                ' + #13 +
      'from    pihtopo                                                         ' + #13 +
      'where   topoym = :p_topoym                                              ' + #13 +
      'and     tpgubun = ''10''                                                ' + #13 +
      'group by orgnum, sectcode';

      Query_Sectotal.Close;
      Query_Sectotal.Sql.Clear;
      Query_Sectotal.Sql.Add(sqlstr);

      sqlstr :=
      'select tpgubun tpgubun_1, boncode,                                      ' + #13 +
      '       sum(ttotal) ttotal,                                              ' + #13 +
      '       sum(ppossum+pspe1+pspe3+pspe4+pspe5) ptotal,                     ' + #13 +
      '       sum(ppos1+ppos2+ppos3+ppos4) mang,                               ' + #13 +
      '       sum(ppos5+ppos6+ppos7+ppos8+ppos9+pspe1+pspe3+pspe4+pspe5) four, ' + #13 +
      '       sum(pextrsum+ptempsum) pextrsum,                                 ' + #13 +
      '       sum(pcontsum) pcontsum,                                          ' + #13 +
      '       sum(pspe21+pspe22+pspe23) ps_mang,                               ' + #13 +
      '       sum(pspe24+pspe25+pspe26+pspe27) ps_four,                        ' + #13 +
      '       sum(pspe2) pspe2                                                 ' + #13 +
      'from   pihtopo                                                          ' + #13 +
      'where  topoym = :p_topoym                                               ' + #13 +
      'and    orgnum = :p_orgnum                                               ' + #13 +
      'and    sectcode = :p_sectcode                                           ' + #13 +
      'and    fieldcode = :p_fieldcode                                         ' + #13 +
      'and    tpgubun < ''30''                                                 ' + #13 +
      'group by  boncode, tpgubun                                              ';

      Query_Detail.Close;
      Query_Detail.Sql.Clear;
      Query_Detail.Sql.Add(sqlstr);

      sqlstr :=
      'select orgnum, fieldcode, sum(ttotal) ttotal,                          ' + #13 +
      '       sum(ppossum+pspe1+pspe3+pspe4+pspe5) ptotal,                    ' + #13 +
      '       sum(ppos1+ppos2+ppos3+ppos4) mang,                              ' + #13 +
      '       sum(ppos5+ppos6+ppos7+ppos8+ppos9+pspe1+pspe3+pspe4+pspe5) four,' + #13 +
      '       sum(pextrsum+ptempsum) pextrsum,                                ' + #13 +
      '       sum(pcontsum) pcontsum,                                         ' + #13 +
      '       sum(pspe21+pspe22+pspe23) ps_mang,                              ' + #13 +
      '       sum(pspe24+pspe25+pspe26+pspe27) ps_four,                       ' + #13 +
      '       sum(pspe2) pspe2                                                ' + #13 +
      'from   pihtopo                                                         ' + #13 +
      'where  topoym = :p_topoym                                              ' + #13 +
      'and    sectcode = :p_sectcode                                          ' + #13 +
      'and    tpgubun = ''10''                                                ' + #13 +
      'group by orgnum, fieldcode                                             ';

      Query_SubTotal.Close;
      Query_SubTotal.Sql.Clear;
      Query_SubTotal.Sql.Add(sqlstr);

      sqlstr :=
      'select  sum(ttotal) ttotal,                                             ' + #13 +
      '        sum(ppossum+pspe1+pspe3+pspe4+pspe5) ptotal,                    ' + #13 +
      '        sum(ppos1+ppos2+ppos3+ppos4) mang,                              ' + #13 +
      '        sum(ppos5+ppos6+ppos7+ppos8+ppos9+pspe1+pspe3+pspe4+pspe5) four,' + #13 +
      '        sum(pextrsum+ptempsum) pextrsum,                                ' + #13 +
      '        sum(pcontsum) pcontsum,                                         ' + #13 +
      '        sum(pspe21+pspe22+pspe23) ps_mang,                              ' + #13 +
      '        sum(pspe24+pspe25+pspe26+pspe27) ps_four,                       ' + #13 +
      '        sum(pspe2) pspe2                                                ' + #13 +
      'from    pihtopo                                                         ' + #13 +
      'where   topoym = :p_topoym                                              ' + #13 +
      'and     tpgubun = ''10''                                                ';

      Query_TotalSum.Close;
      Query_TotalSum.Sql.Clear;
      Query_TotalSum.Sql.Add(sqlstr);
      end

// 30.20     총괄부서코드추가(부서등급 60 추가)에 따라 쿼리수정_하드코딩
//           (차수 변동시 REMARK 한 쿼리 재사용 예정)

      else begin  //2004.04월 이후의 자료
        sqlstr :=
          'select  orgnum, sectcode, sum(ttotal) ttotal,        ' + #13 +
          '        sum(ppossum+pspe1+pspe3+pspe4+pspe5) ptotal, ' + #13 +
          '        sum(p10+p20) mang,                           ' + #13 +
          '        sum(p22+p32+p40+p42+p44+PSPESUM) four,       ' + #13 +
          '        sum(pextrsum+ptempsum) pextrsum,             ' + #13 +
          '        sum(pcontsum+PSCONSUM) pcontsum,             ' + #13 +
          '        sum(pspe21+pspe22+pspe23) ps_mang,           ' + #13 +
          '        sum(pspe24+pspe25+pspe26+pspe27) ps_four,    ' + #13 +
          '        sum(pspe2) pspe2                             ' + #13 +
          'from    pihtopo                                      ' + #13 +
          'where   topoym = :p_topoym                           ' + #13 +
          'and     tpgubun = ''10''                             ' + #13 +
          'and     Substr(deptcode,1,1) <> ''Z''                ' + #13 +
          'and     Substr(deptcode,1,1) <> ''D''                ' + #13 +     //경영총괄
          'and     Substr(deptcode,1,1) <> ''K''                ' + #13 +     //사업총괄
          'group by orgnum, sectcode                            ' + #13 +
          'UNION                                                ' + #13 +
          'select  A.orgnum, CASE WHEN SUBSTR(B.DEPTCODE,1,1) < ''K'' THEN ''BZ'' ELSE ''K'' END sectcode,  ' + #13 +
          '        sum(ttotal) ttotal,                          ' + #13 +
          '        sum(ppossum+pspe1+pspe3+pspe4+pspe5) ptotal, ' + #13 +
          '        sum(p10+p20) mang,                           ' + #13 +
          '        sum(p22+p32+p40+p42+p44+PSPESUM) four,       ' + #13 +
          '        sum(pextrsum+ptempsum) pextrsum,             ' + #13 +
          '        sum(pcontsum+PSCONSUM) pcontsum,             ' + #13 +
          '        sum(pspe21+pspe22+pspe23) ps_mang,           ' + #13 +
          '        sum(pspe24+pspe25+pspe26+pspe27) ps_four,    ' + #13 +
          '        sum(pspe2) pspe2                             ' + #13 +
          'from    pihtopo A, pycdept B                         ' + #13 +
          'where   topoym = :p_topoym                           ' + #13 +
          'and     A.ORGNUM = B.ORGNUM                          ' + #13 +
          'and     A.DEPTCODE = B.DEPTCODE                      ' + #13 +
          'and     tpgubun = ''10''                             ' + #13 +
          'and     A.DEPTCODE>=''C0000''                        ' + #13 +
          'and     A.DEPTCODE <''Y0000''                        ' + #13 +
          'group by A.orgnum,                                   ' + #13 +
          '  CASE WHEN SUBSTR(B.DEPTCODE,1,1) < ''K'' THEN ''BZ'' ELSE ''K'' END ';

          Query_Sectotal.Close;
          Query_Sectotal.Sql.Clear;
          Query_Sectotal.Sql.Add(sqlstr);

          sqlstr :=  { // 조직개편 후 주석쿼리 사용
          'select tpgubun tpgubun_1, boncode,                   ' + #13 +
          '       sum(ttotal) ttotal,                           ' + #13 +
          '       sum(ppossum+pspe1+pspe3+pspe4+pspe5) ptotal,  ' + #13 +
          '       sum(p10+p20) mang,                            ' + #13 +
          '       sum(p22+p32+p40+p42+p44+PSPESUM) four,        ' + #13 +
          '       sum(pextrsum+ptempsum) pextrsum,              ' + #13 +
          '       sum(pcontsum) pcontsum,                       ' + #13 +
          '       sum(pspe21+pspe22+pspe23) ps_mang,            ' + #13 +
          '       sum(pspe24+pspe25+pspe26+pspe27) ps_four,     ' + #13 +
          '       sum(pspe2) pspe2                              ' + #13 +
          'from   pihtopo                                       ' + #13 +
          'where  topoym = :p_topoym                            ' + #13 +
          'and    orgnum = :p_orgnum                            ' + #13 +
          'and    sectcode = :p_sectcode                        ' + #13 +
          'and    fieldcode = :p_fieldcode                      ' + #13 +
          'and    tpgubun < ''30''                              ' + #13 +
          'and    Substr(deptcode,1,1) <> ''Z''                 ' + #13 +
          'group by  boncode, tpgubun                           '  }
          'select tpgubun tpgubun_1, boncode,                   ' + #13 +
          '       sum(ttotal) ttotal,                           ' + #13 +
          '       sum(ppossum+pspe1+pspe3+pspe4+pspe5) ptotal,  ' + #13 +
          '       sum(p10+p20) mang,                            ' + #13 +
          '       sum(p22+p32+p40+p42+p44+PSPESUM) four,        ' + #13 +
          '       sum(pextrsum+ptempsum) pextrsum,              ' + #13 +
          '        sum(pcontsum+PSCONSUM) pcontsum,             ' + #13 +
          '       sum(pspe21+pspe22+pspe23) ps_mang,            ' + #13 +
          '       sum(pspe24+pspe25+pspe26+pspe27) ps_four,     ' + #13 +
          '       sum(pspe2) pspe2                              ' + #13 +
          'from   pihtopo                                       ' + #13 +
          'where  topoym = :p_topoym                            ' + #13 +
          'and    orgnum = :p_orgnum                            ' + #13 +
          'and    sectcode = :p_sectcode                        ' + #13 +
          'and    fieldcode = :p_fieldcode                      ' + #13 +
          'and    tpgubun < ''30''                              ' + #13 +
          'and    Substr(deptcode,1,1) <> ''Z''                 ' + #13 +
          'group by  boncode, tpgubun                           ';
          ;
          Query_Detail.Close;
          Query_Detail.Sql.Clear;
          Query_Detail.Sql.Add(sqlstr);

          sqlstr :=
          'select orgnum, fieldcode, sum(ttotal) ttotal,       ' + #13 +
          '       sum(ppossum+pspe1+pspe3+pspe4+pspe5) ptotal, ' + #13 +
          '        sum(p10+p20) mang,                          ' + #13 +
          '        sum(p22+p32+p40+p42+p44+PSPESUM) four,      ' + #13 +
          '       sum(pextrsum+ptempsum) pextrsum,             ' + #13 +
          '        sum(pcontsum+PSCONSUM) pcontsum,             ' + #13 +
          '       sum(pspe21+pspe22+pspe23) ps_mang,           ' + #13 +
          '       sum(pspe24+pspe25+pspe26+pspe27) ps_four,    ' + #13 +
          '       sum(pspe2) pspe2                             ' + #13 +
          'from   pihtopo                                      ' + #13 +
          'where  topoym = :p_topoym                           ' + #13 +
          'and    sectcode = :p_sectcode                       ' + #13 +
          'and    tpgubun = ''10''                             ' + #13 +
          'and    Substr(deptcode,1,1) <> ''Z''                ' + #13 +
          'group by orgnum, fieldcode                          ';

          Query_SubTotal.Close;
          Query_SubTotal.Sql.Clear;
          Query_SubTotal.Sql.Add(sqlstr);

          sqlstr :=
          'select  sum(ttotal) ttotal,                          ' + #13 +
          '        sum(ppossum+pspe1+pspe3+pspe4+pspe5) ptotal, ' + #13 +
          '        sum(p10+p20) mang,                           ' + #13 +
          '        sum(p22+p32+p40+p42+p44+PSPESUM) four,       ' + #13 +
          '        sum(pextrsum+ptempsum) pextrsum,             ' + #13 +
          '        sum(pcontsum+PSCONSUM) pcontsum,             ' + #13 +
          '        sum(pspe21+pspe22+pspe23) ps_mang,           ' + #13 +
          '        sum(pspe24+pspe25+pspe26+pspe27) ps_four,    ' + #13 +
          '        sum(pspe2) pspe2                             ' + #13 +
          'from    pihtopo                                      ' + #13 +
          'where   topoym = :p_topoym                           ' + #13 +
          'and     Substr(deptcode,1,1) <> ''Z''                ' + #13 +
          'and     tpgubun = ''10''                             ';

          Query_TotalSum.Close;
          Query_TotalSum.Sql.Clear;
          Query_TotalSum.Sql.Add(sqlstr);
      end;

      {
      Query_Sectotal.Close;
      Query_Sectotal.Sql.Clear;
      Query_Sectotal.Sql.Add('SELECT  ORGNUM' +
                             '        SECTCODE' +
                             '        sum(TTOTAL) TTOTAL,' +
                             '        sum(PPOSSUM +' +
                             '            PSPE1   +' +
                             '            PSPE3   +' +
                             '            PSPE4   +' +
                             '            PSPE5) PTOTAL,' +
                             '        sum(PPOS1   +'+
                             '               PIHTOPO."PPOS2" +'+
                             '               PIHTOPO."PPOS3" +'+
                             '               PIHTOPO."PPOS4" ) ) MANG,'+
                             '        ( sum( PIHTOPO."PPOS5" +'+
                             '               PIHTOPO."PPOS6" +'+
                             '               PIHTOPO."PPOS7" +'+
                             '               PIHTOPO."PPOS8" +'+
                             '               PIHTOPO."PPOS9" +'+
                             '               PIHTOPO."PSPE1" +'+
                             '               PIHTOPO."PSPE3" +'+
                             '               PIHTOPO."PSPE4" +'+
                             '               PIHTOPO."PSPE5"  ) ) FOUR,'+
                             '        ( sum( PIHTOPO."PEXTRSUM" + PIHTOPO."PTEMPSUM" ) ) PEXTRSUM,'+
                             '        ( sum( PIHTOPO."PSPE21" +'+
                             '               PIHTOPO."PSPE22" +'+
                             '               PIHTOPO."PSPE23"  ) ) PS_MANG,'+
                             '        ( sum( PIHTOPO."PSPE24" +'+
                             '               PIHTOPO."PSPE25" +'+
                             '               PIHTOPO."PSPE26" +'+
                             '               PIHTOPO."PSPE27"  ) ) PS_FOUR,'+
                             '        ( sum( PIHTOPO."PSPE2"  ) ) PSPE2'+
                             '   FROM PIHTOPO'+
                             '  WHERE PIHTOPO."TOPOYM" = :P_topoym AND'+
                             '        PIHTOPO."TPGUBUN" = ''10'''+
                             '  GROUP BY'+
                             '        PIHTOPO."ORGNUM",PIHTOPO."SECTCODE"'+
                             '  ORDER BY'+
                             '        PIHTOPO."ORGNUM",PIHTOPO."SECTCODE"');

      Query_Detail.Close;
      Query_Detail.Sql.Clear;
      Query_Detail.Sql.Add('SELECT  (PIHTOPO."TPGUBUN") TPGUBUN_1,'+
                           '        PIHTOPO."BONCODE",'+
                           '        ( sum( PIHTOPO."TTOTAL" ) ) TTOTAL,'+
                           '        ( sum( PIHTOPO."PPOSSUM" +'+
                           '               PIHTOPO."PSPE1" +'+
                           '               PIHTOPO."PSPE3" +'+
                           '               PIHTOPO."PSPE4" +'+
                           '               PIHTOPO."PSPE5"  ) ) PTOTAL,'+
                           '        ( sum( PIHTOPO."PPOS1" +'+
                           '               PIHTOPO."PPOS2" +'+
                           '               PIHTOPO."PPOS3" +'+
                           '               PIHTOPO."PPOS4" ) ) MANG,'+
                           '        ( sum( PIHTOPO."PPOS5" +'+
                           '               PIHTOPO."PPOS6" +'+
                           '               PIHTOPO."PPOS7" +'+
                           '               PIHTOPO."PPOS8" +'+
                           '               PIHTOPO."PPOS9" +'+
                           '               PIHTOPO."PSPE1" +'+
                           '               PIHTOPO."PSPE3" +'+
                           '               PIHTOPO."PSPE4" +'+
                           '               PIHTOPO."PSPE5"  ) ) FOUR,'+
                           '        ( sum( PIHTOPO."PEXTRSUM" + PIHTOPO."PTEMPSUM" ) ) PEXTRSUM,'+
                           '        ( sum( PIHTOPO."PSPE21" +'+
                           '               PIHTOPO."PSPE22" +'+
                           '               PIHTOPO."PSPE23"  ) ) PS_MANG,'+
                           '        ( sum( PIHTOPO."PSPE24" +'+
                           '               PIHTOPO."PSPE25" +'+
                           '               PIHTOPO."PSPE26" +'+
                           '               PIHTOPO."PSPE27"  ) ) PS_FOUR,'+
                           '        ( sum( PIHTOPO."PSPE2"  ) ) PSPE2'+
                           '   FROM PIHTOPO'+
                           '  WHERE   ( PIHTOPO."TOPOYM"     = :P_topoym ) AND'+
                           '          ( PIHTOPO."ORGNUM"     = :P_orgnum ) AND'+
                           '          ( PIHTOPO."SECTCODE"  = :P_sectcode ) AND'+
                           '          ( PIHTOPO."FIELDCODE"  = :P_fieldcode ) AND'+
                           '          ( PIHTOPO."TPGUBUN"    < ''30'')'+
                           ' GROUP BY  PIHTOPO."BONCODE",PIHTOPO."TPGUBUN" '+
                           ' ORDER BY  PIHTOPO."BONCODE",PIHTOPO."TPGUBUN"');


      Query_SubTotal.Close;
      Query_SubTotal.Sql.Clear;
      Query_SubTotal.Sql.Add('SELECT  PIHTOPO."ORGNUM",'+
                             '        PIHTOPO."FIELDCODE",'+
                             '        ( sum( PIHTOPO."TTOTAL" ) ) TTOTAL,'+
                             '        ( sum( PIHTOPO."PPOSSUM" +'+
                             '               PIHTOPO."PSPE1" +'+
                             '               PIHTOPO."PSPE3" +'+
                             '               PIHTOPO."PSPE4" +'+
                             '               PIHTOPO."PSPE5"  ) ) PTOTAL,'+
                             '        ( sum( PIHTOPO."PPOS1" +'+
                             '               PIHTOPO."PPOS2" +'+
                             '               PIHTOPO."PPOS3" +'+
                             '               PIHTOPO."PPOS4" ) ) MANG,'+
                             '        ( sum( PIHTOPO."PPOS5" +'+
                             '               PIHTOPO."PPOS6" +'+
                             '               PIHTOPO."PPOS7" +'+
                             '               PIHTOPO."PPOS8" +'+
                             '               PIHTOPO."PPOS9" +'+
                             '               PIHTOPO."PSPE1" +'+
                             '               PIHTOPO."PSPE3" +'+
                             '               PIHTOPO."PSPE4" +'+
                             '               PIHTOPO."PSPE5"  ) ) FOUR,'+
                             '        ( sum( PIHTOPO."PEXTRSUM" + PIHTOPO."PTEMPSUM" ) ) PEXTRSUM,'+
                             '        ( sum( PIHTOPO."PSPE21" +'+
                             '               PIHTOPO."PSPE22" +'+
                             '               PIHTOPO."PSPE23"  ) ) PS_MANG,'+
                             '        ( sum( PIHTOPO."PSPE24" +'+
                             '               PIHTOPO."PSPE25" +'+
                             '               PIHTOPO."PSPE26" +'+
                             '               PIHTOPO."PSPE27"  ) ) PS_FOUR,'+
                             '        ( sum( PIHTOPO."PSPE2"  ) ) PSPE2'+
                             '   FROM PIHTOPO'+
                             '  WHERE PIHTOPO."TOPOYM" = :P_topoym AND'+
                             '        PIHTOPO."SECTCODE" = :P_sectcode AND'+
                             '        PIHTOPO."TPGUBUN" = ''10'''+
                             ' GROUP BY PIHTOPO."ORGNUM", PIHTOPO."FIELDCODE"'+
                             ' ORDER BY PIHTOPO."ORGNUM", PIHTOPO."FIELDCODE"');

      Query_TotalSum.Close;
      Query_TotalSum.Sql.Clear;
      Query_TotalSum.Sql.Add('SELECT  '+
                             '        ( sum( PIHTOPO."TTOTAL" ) ) TTOTAL,'+
                             '        ( sum( PIHTOPO."PPOSSUM" +'+
                             '               PIHTOPO."PSPE1" +'+
                             '               PIHTOPO."PSPE3" +'+
                             '               PIHTOPO."PSPE4" +'+
                             '               PIHTOPO."PSPE5"  ) ) PTOTAL,'+
                             '        ( sum( PIHTOPO."PPOS1" +'+
                             '               PIHTOPO."PPOS2" +'+
                             '               PIHTOPO."PPOS3" +'+
                             '               PIHTOPO."PPOS4" ) ) MANG,'+
                             '        ( sum( PIHTOPO."PPOS5" +'+
                             '               PIHTOPO."PPOS6" +'+
                             '               PIHTOPO."PPOS7" +'+
                             '               PIHTOPO."PPOS8" +'+
                             '               PIHTOPO."PPOS9" +'+
                             '               PIHTOPO."PSPE1" +'+
                             '               PIHTOPO."PSPE3" +'+
                             '               PIHTOPO."PSPE4" +'+
                             '               PIHTOPO."PSPE5"  ) ) FOUR,'+
                             '        ( sum( PIHTOPO."PEXTRSUM" + PIHTOPO."PTEMPSUM" ) ) PEXTRSUM,'+
                             '        ( sum( PIHTOPO."PSPE21" +'+
                             '               PIHTOPO."PSPE22" +'+
                             '               PIHTOPO."PSPE23"  ) ) PS_MANG,'+
                             '        ( sum( PIHTOPO."PSPE24" +'+
                             '               PIHTOPO."PSPE25" +'+
                             '               PIHTOPO."PSPE26" +'+
                             '               PIHTOPO."PSPE27"  ) ) PS_FOUR,'+
                             '        ( sum( PIHTOPO."PSPE2"  ) ) PSPE2'+
                             '   FROM PIHTOPO'+
                             '  WHERE ( PIHTOPO."TOPOYM"   = :P_topoym) AND '+
                             '        ( PIHTOPO."TPGUBUN"  = ''10'')');
      }



  P_Help.Caption := '부서/BAND별 [인원 총계]를 추출합니다 !!.';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
  if length(trim(ME_WorkDate.Text)) < 6  then begin
    MessageBox(handle,'작업년월 오류입니다.','에  러',MB_OK or $0020);
    ME_WorkDate.SetFocus;  System.Exit;
  end;

  G_Progress.Progress := 0;
  Query_TotalSum.ParamByName('P_topoym').AsString := ME_WorkDate.Text;
  Query_TotalSum.Open;
  if Query_TotalSum.RecordCount = 0 then  begin
    MessageBox(handle,'작업조건에 맞는 자료가 없습니다.','알  림',MB_OK or $0030);
    Query_TotalSum.Close;
    System.Exit;
  end;

  LineCnt := 1;
  AssignFile(Fout, HomeDir+'\list\pie2040c.tmp'); System.ReWrite(Fout);
  with DataIn do  begin
    ClearData;
    deptname := '      총     계';
    plevel   := false;
    ttotal   := FormatFloat(sPrn, Query_TotalSum.FieldByName('TTOTAL').AsInteger);
    ptotal   := FormatFloat(sPrn, Query_TotalSum.FieldByName('PTOTAL').AsInteger+
                                  Query_TotalSum.FieldByName('PSPE2').AsInteger);
    insuff   := FormatFloat(sPrn, (Query_TotalSum.FieldByName('PTOTAL').AsInteger +
                                   Query_TotalSum.FieldByName('PSPE2').AsInteger) -
                                   Query_TotalSum.FieldByName('TTOTAL').AsInteger);
    if Query_TotalSum.FieldByName('TTOTAL').AsInteger <> 0 then
       currate := FormatFloat(spPrn, ( (Query_TotalSum.FieldByName('PTOTAL').AsInteger+
                                        Query_TotalSum.FieldByName('PSPE2').AsInteger) /
                                        Query_TotalSum.FieldByName('TTOTAL').AsInteger )*100)
    else currate := FormatFloat(spPrn, 0);

    mang     := FormatFloat(sPrn, Query_TotalSum.FieldByName('MANG').AsInteger+
                                  Query_TotalSum.FieldByName('PS_MANG').AsInteger);
    if (Query_TotalSum.FieldByName('PTOTAL').AsInteger+
        Query_TotalSum.FieldByName('PSPE2').AsInteger) <> 0 then
       mangrat:= FormatFloat(spPrn, ( ( (Query_TotalSum.FieldByName('MANG').AsInteger +
                                         Query_TotalSum.FieldByName('PS_MANG').AsInteger) /
                                        (Query_TotalSum.FieldByName('PTOTAL').AsInteger+
                                         Query_TotalSum.FieldByName('PSPE2').AsInteger) )*100))
    else mangrat := FormatFloat(spPrn, 0);

    four     := FormatFloat(sPrn, Query_TotalSum.FieldByName('FOUR').AsInteger+
                                  Query_TotalSum.FieldByName('PS_FOUR').AsInteger);
    if (Query_TotalSum.FieldByName('PTOTAL').AsInteger+
        Query_TotalSum.FieldByName('PSPE2').AsInteger) <> 0 then
       fourrat:= FormatFloat(spPrn, ( ( (Query_TotalSum.FieldByName('FOUR').AsInteger +
                                         Query_TotalSum.FieldByName('PS_FOUR').AsInteger) /
                                        (Query_TotalSum.FieldByName('PTOTAL').AsInteger+
                                         Query_TotalSum.FieldByName('PSPE2').AsInteger) )*100))
    else fourrat := FormatFloat(spPrn, 0);

    pemp     := FormatFloat(sPrn, Query_TotalSum.FieldByName('PTOTAL').AsInteger+
                                  Query_TotalSum.FieldByName('PSPE2').AsInteger);
    pextrsum := FormatFloat(sPrn, Query_TotalSum.FieldByName('PEXTRSUM').AsInteger);

    // 계약직 관련 추가
    pcontsum := FormatFloat(sPrn, Query_TotalSum.FieldByName('pcontsum').AsInteger);

    psum     := FormatFloat(sPrn, Query_TotalSum.FieldByName('PTOTAL').AsInteger +
                                  Query_TotalSum.FieldByName('PEXTRSUM').AsInteger+
                                  Query_TotalSum.FieldByName('PSPE2').AsInteger   +
                                  Query_TotalSum.FieldByName('pcontsum').AsInteger);
    {
    psum     := FormatFloat(sPrn, Query_TotalSum.FieldByName('PTOTAL').AsInteger +
                                  Query_TotalSum.FieldByName('PEXTRSUM').AsInteger+
                                  Query_TotalSum.FieldByName('PSPE2').AsInteger);
    }
    flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
    ClearData;
    flag := 'S'; System.Write(Fout, DataIn);

    if Query_TotalSum.FieldByName('PSPE2').AsInteger > 0 then begin
      ClearData;
      deptname := '   (전임행정총계)';
      plevel   := false;
      Executive_Data(Query_TotalSum);
      flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
      flag := 'S'; System.Write(Fout, DataIn);
    end;
    Query_TotalSum.Close;
{-------------------------------------------------------------------------------
  버전   수정일   수정자   관련근거         수정내용
  1.01   98.4.14  김순례   전(98.4.11)   Sectcode별 인원계 추가
 -------------------------------------------------------------------------------}
    {부문별(sectcode) 소계}
    Query_SecTotal.ParamByName('P_topoym').AsString   := ME_WorkDate.Text;
    Query_SecTotal.Open;
    ProgressCnt := 0;
    while not Query_SecTotal.Eof do begin
      inc(ProgressCnt);
      G_Progress.Progress := (ProgressCnt*100) div Query_SecTotal.RecordCount;
      SendMessage(Panel5.handle,WM_PAINT,0,0);
      ClearData;
      Qbondept.ParamByName('P_orgnum').AsString   := Query_SecTotal.FieldByName('orgnum').AsString;
      if Query_SecTotal.FieldByName('sectcode').AsString = 'BZ' then
         Qbondept.ParamByName('P_deptcode').AsString := 'D0000'
      else
         Qbondept.ParamByName('P_deptcode').AsString := RPAD(Query_SecTotal.FieldByName('sectcode').AsString,5,'0');
      deptname := DeptNameFind;  //sectcode 부문명
      plevel   := true;

      P_Help.Caption := '['+deptname+'] 부서의 데이타를 추출합니다 !!.';
      SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
      ttotal   := FormatFloat(sPrn, Query_SecTotal.FieldByName('TTOTAL').AsInteger);
      ptotal   := FormatFloat(sPrn, Query_SecTotal.FieldByName('PTOTAL').AsInteger+
                                    Query_SecTotal.FieldByName('PSPE2').AsInteger);
      insuff   := FormatFloat(sPrn, ((Query_SecTotal.FieldByName('PTOTAL').AsInteger+
                                      Query_SecTotal.FieldByName('PSPE2').AsInteger) -
                                      Query_SecTotal.FieldByName('TTOTAL').AsInteger));
      if Query_SecTotal.FieldByName('TTOTAL').AsInteger <> 0 then
         currate := FormatFloat(spPrn, ( (Query_SecTotal.FieldByName('PTOTAL').AsInteger+
                                          Query_SecTotal.FieldByName('PSPE2').AsInteger) /
                                          Query_SecTotal.FieldByName('TTOTAL').AsInteger)*100)
      else currate := FormatFloat(spPrn, 0);

      mang     := FormatFloat(sPrn, Query_SecTotal.FieldByName('MANG').AsInteger+
                                    Query_SecTotal.FieldByName('PS_MANG').AsInteger);
      if (Query_SecTotal.FieldByName('PTOTAL').AsInteger+
          Query_SecTotal.FieldByName('PSPE2').AsInteger) <> 0 then
         mangrat:= FormatFloat(spPrn, ( ((Query_SecTotal.FieldByName('MANG').AsInteger +
                                          Query_SecTotal.FieldByName('PS_MANG').AsInteger) /
                                         (Query_SecTotal.FieldByName('PTOTAL').AsInteger+
                                          Query_SecTotal.FieldByName('PSPE2').AsInteger))*100))
      else mangrat := FormatFloat(spPrn, 0);

      four     := FormatFloat(sPrn, Query_SecTotal.FieldByName('FOUR').AsInteger+
                                    Query_SecTotal.FieldByName('PS_FOUR').AsInteger);
      if (Query_SecTotal.FieldByName('PTOTAL').AsInteger+
          Query_SecTotal.FieldByName('PSPE2').AsInteger) <> 0 then
         fourrat:= FormatFloat(spPrn, ( ((Query_SecTotal.FieldByName('FOUR').AsInteger +
                                          Query_SecTotal.FieldByName('PS_FOUR').AsInteger) /
                                         (Query_SecTotal.FieldByName('PTOTAL').AsInteger +
                                          Query_SecTotal.FieldByName('PSPE2').AsInteger))*100))
      else fourrat := FormatFloat(spPrn, 0);

      pemp     := FormatFloat(sPrn, Query_SecTotal.FieldByName('PTOTAL').AsInteger+
                                    Query_SecTotal.FieldByName('PSPE2').AsInteger);
      pextrsum := FormatFloat(sPrn, Query_SecTotal.FieldByName('PEXTRSUM').AsInteger);
      // 계약직 관련 추가
      pcontsum := FormatFloat(sPrn, Query_SecTotal.FieldByName('pcontsum').AsInteger);

      psum     := FormatFloat(sPrn, Query_SecTotal.FieldByName('PTOTAL').AsInteger +
                                    Query_SecTotal.FieldByName('PEXTRSUM').AsInteger+
                                    Query_SecTotal.FieldByName('PSPE2').AsInteger +
                                    Query_SecTotal.FieldByName('pcontsum').AsInteger);
      {
      psum     := FormatFloat(sPrn, Query_SecTotal.FieldByName('PTOTAL').AsInteger +
                                    Query_SecTotal.FieldByName('PEXTRSUM').AsInteger+
                                    Query_SecTotal.FieldByName('PSPE2').AsInteger);
      }
      flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
      if PageCheck(LineCnt,1) = False then begin
         ClearData; flag := 'S'; System.Write(Fout, DataIn);
      end;

      if Query_SecTotal.FieldByName('PSPE2').AsInteger > 0 then begin
        ClearData;
        deptname := '   (전임행정소계)';
        plevel   := false;
        Executive_Data(Query_SecTotal);

        flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt); Inc(Cnt);
        if PageCheck(LineCnt,1) = False then begin
            ClearData; flag := 'S'; System.Write(Fout, DataIn);
        end;
      end;

    //=====================
    {부문별 소계}
    Query_SubTotal.ParamByName('P_topoym').AsString := ME_WorkDate.Text;
    Query_SubTotal.ParamByName('P_sectcode').AsString := Query_SecTotal.FieldByName('sectcode').AsString;
    Query_SubTotal.Open;
//    ProgressCnt := 0;
    while not Query_SubTotal.Eof do begin
//      inc(ProgressCnt);
      cnt := 0;
//      G_Progress.Progress := (ProgressCnt*100) div Query_SubTotal.RecordCount;
//      SendMessage(Panel5.handle,WM_PAINT,0,0);

      ClearData;
      Qbondept.ParamByName('P_orgnum').AsString   := Query_SubTotal.FieldByName('orgnum').AsString;
      Qbondept.ParamByName('P_deptcode').AsString := RPAD(Query_SubTotal.FieldByName('fieldcode').AsString,5,'0');
      deptname := DeptNameFind; {부문명}
      plevel   := false;
      pbumn    := 'sect';
      P_Help.Caption := '['+deptname+'] 부서/BAND [부문별 소계]를 추출합니다 !!.';
      SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

      ttotal   := FormatFloat(sPrn, Query_SubTotal.FieldByName('TTOTAL').AsInteger);
      ptotal   := FormatFloat(sPrn, Query_SubTotal.FieldByName('PTOTAL').AsInteger+
                                    Query_SubTotal.FieldByName('PSPE2').AsInteger);
      insuff   := FormatFloat(sPrn, ((Query_SubTotal.FieldByName('PTOTAL').AsInteger+
                                      Query_SubTotal.FieldByName('PSPE2').AsInteger) -
                                      Query_SubTotal.FieldByName('TTOTAL').AsInteger));
      if Query_SubTotal.FieldByName('TTOTAL').AsInteger <> 0 then
         currate := FormatFloat(spPrn, ( (Query_SubTotal.FieldByName('PTOTAL').AsInteger+
                                          Query_SubTotal.FieldByName('PSPE2').AsInteger) /
                                          Query_SubTotal.FieldByName('TTOTAL').AsInteger)*100)
      else currate := FormatFloat(spPrn, 0);

      mang     := FormatFloat(sPrn, Query_SubTotal.FieldByName('MANG').AsInteger+
                                    Query_SubTotal.FieldByName('PS_MANG').AsInteger);
      if (Query_SubTotal.FieldByName('PTOTAL').AsInteger+
          Query_SubTotal.FieldByName('PSPE2').AsInteger) <> 0 then
         mangrat:= FormatFloat(spPrn, ( ((Query_SubTotal.FieldByName('MANG').AsInteger +
                                          Query_SubTotal.FieldByName('PS_MANG').AsInteger) /
                                         (Query_SubTotal.FieldByName('PTOTAL').AsInteger+
                                          Query_SubTotal.FieldByName('PSPE2').AsInteger))*100))
      else mangrat := FormatFloat(spPrn, 0);

      four     := FormatFloat(sPrn, Query_SubTotal.FieldByName('FOUR').AsInteger+
                                    Query_SubTotal.FieldByName('PS_FOUR').AsInteger);
      if (Query_SubTotal.FieldByName('PTOTAL').AsInteger+
          Query_SubTotal.FieldByName('PSPE2').AsInteger) <> 0 then
         fourrat:= FormatFloat(spPrn, ( ((Query_SubTotal.FieldByName('FOUR').AsInteger +
                                          Query_SubTotal.FieldByName('PS_FOUR').AsInteger) /
                                         (Query_SubTotal.FieldByName('PTOTAL').AsInteger +
                                          Query_SubTotal.FieldByName('PSPE2').AsInteger))*100))
      else fourrat := FormatFloat(spPrn, 0);

      pemp     := FormatFloat(sPrn, Query_SubTotal.FieldByName('PTOTAL').AsInteger+
                                    Query_SubTotal.FieldByName('PSPE2').AsInteger);
      pextrsum := FormatFloat(sPrn, Query_SubTotal.FieldByName('PEXTRSUM').AsInteger);

      // 계약직 관련 추가
      pcontsum := FormatFloat(sPrn, Query_SubTotal.FieldByName('pcontsum').AsInteger);

      psum     := FormatFloat(sPrn, Query_SubTotal.FieldByName('PTOTAL').AsInteger +
                                    Query_SubTotal.FieldByName('PEXTRSUM').AsInteger+
                                    Query_SubTotal.FieldByName('PSPE2').AsInteger+
                                    Query_SubTotal.FieldByName('pcontsum').AsInteger);

      flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
      if PageCheck(LineCnt,1) = False then begin
         ClearData; flag := 'S'; System.Write(Fout, DataIn);
      end;

      if Query_SubTotal.FieldByName('PSPE2').AsInteger > 0 then begin
        ClearData;
        deptname := '(전임행정 소계)';
        plevel   := false;
        Executive_Data(Query_SubTotal);

        flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
        if PageCheck(LineCnt,1) = False then begin
            ClearData; flag := 'S'; System.Write(Fout, DataIn);
        end;
      end;

      Query_Detail.ParamByName('P_topoym').AsString    := ME_WorkDate.Text;
      Query_Detail.ParamByName('P_orgnum').AsString    := Query_SubTotal.FieldByName('ORGNUM').AsString;
      Query_Detail.ParamByName('P_sectcode').AsString  := Query_SecTotal.FieldByName('SECTCODE').AsString;
      Query_Detail.ParamByName('P_fieldcode').AsString := Query_SubTotal.FieldByName('FIELDCODE').AsString;
      Query_Detail.Open;

      while not Query_Detail.Eof do begin
        ClearData;
        if copy(Query_Detail.FieldByName('TPGUBUN_1').AsString,1,1) = '2' then begin
          deptname := '  (파견/교육)';
          plevel   := false;
          Inc(Cnt);
          Fmt  := dPrn;
          pFmt := dpPrn;
        end else begin
          Qbondept.ParamByName('P_orgnum').AsString   := Query_SubTotal.FieldByName('ORGNUM').AsString;
          Qbondept.ParamByName('P_deptcode').AsString := Query_Detail.FieldByName('BONCODE').AsString;
          deptname := '  '+DeptNameFind;  {본부명 출력}
          plevel   := false;
          // 본부레벨이 바뀔때에는 이곳을 수정하기 바람..(매우중요)
         // if (copy(DeptLevel,1,1) <> 'C') then begin
          if (Query_Detail.FieldByName('TTOTAL').AsInteger = 0) and
             ((Query_Detail.FieldByName('PTOTAL').AsInteger +
               Query_Detail.FieldByName('PEXTRSUM').AsInteger) = 0) then begin
             if Query_Detail.FieldByName('PSPE2').AsInteger > 0 then begin
                ClearData;
                deptname := '  (전임행정직)';
                plevel   := false;
                Executive_Data(Query_Detail); Inc(Cnt);
                flag := 'C'; System.Write(Fout, DataIn);  Inc(LineCnt); PageCheck(LineCnt,1);
             end;
             Query_Detail.Next;
             if (Query_Detail.EOF = True) then begin
                Break;
             end;
             continue
          end;
          Fmt  := sPrn;
          pFmt := spPrn;
        end; // else begin
        P_Help.Caption := '['+deptname+'] 부서/BAND별 [본부인원계]를 추출합니다 !!.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
            // 98.1.21  교육/파견 계획인원 setting
        if  (copy(Query_Detail.FieldByName('TPGUBUN_1').AsString,1,1) = '2')  and
            (Query_Detail.FieldByName('BONCODE').AsString = pdeptcode)  then
             ttotal := '('+pcount+')'
        else
             ttotal   := FormatFloat(Fmt, Query_Detail.FieldByName('TTOTAL').AsInteger);
        ptotal   := FormatFloat(Fmt, Query_Detail.FieldByName('PTOTAL').AsInteger+
                                     Query_Detail.FieldByName('PSPE2').AsInteger);

        if  (copy(Query_Detail.FieldByName('TPGUBUN_1').AsString,1,1) = '2')  and
            (Query_Detail.FieldByName('BONCODE').AsString = pdeptcode)  then
             insuff   := FormatFloat(Fmt, (Query_Detail.FieldByName('PTOTAL').AsInteger+
                                           Query_Detail.FieldByName('PSPE2').AsInteger) -
                                           (StrToInt(pcount)))
        else
             insuff   := FormatFloat(Fmt, (Query_Detail.FieldByName('PTOTAL').AsInteger+
                                           Query_Detail.FieldByName('PSPE2').AsInteger) -
                                           Query_Detail.FieldByName('TTOTAL').AsInteger);
        if Query_Detail.FieldByName('TTOTAL').AsInteger <> 0 then
          currate := FormatFloat(pFmt, ( (Query_Detail.FieldByName('PTOTAL').AsInteger+
                                          Query_Detail.FieldByName('PSPE2').AsInteger) /
                                          Query_Detail.FieldByName('TTOTAL').AsInteger )*100)
        else currate := FormatFloat(pFmt, 0);

        mang     := FormatFloat(Fmt, Query_Detail.FieldByName('MANG').AsInteger+
                                     Query_Detail.FieldByName('PS_MANG').AsInteger);
        if (Query_Detail.FieldByName('PTOTAL').AsInteger +
            Query_Detail.FieldByName('PSPE2').AsInteger) <> 0 then
          mangrat:= FormatFloat(pFmt, ( (Query_Detail.FieldByName('MANG').AsInteger+
                                         Query_Detail.FieldByName('PS_MANG').AsInteger) /
                                        (Query_Detail.FieldByName('PTOTAL').AsInteger+
                                         Query_Detail.FieldByName('PSPE2').AsInteger) )*100)
        else mangrat := FormatFloat(pFmt, 0);

        four     := FormatFloat(Fmt, Query_Detail.FieldByName('FOUR').AsInteger+
                                     Query_Detail.FieldByName('PS_FOUR').AsInteger);
        if (Query_Detail.FieldByName('PTOTAL').AsInteger +
            Query_Detail.FieldByName('PSPE2').AsInteger) <> 0 then
          fourrat:= FormatFloat(pFmt, ( (Query_Detail.FieldByName('FOUR').AsInteger+
                                         Query_Detail.FieldByName('PS_FOUR').AsInteger) /
                                        (Query_Detail.FieldByName('PTOTAL').AsInteger+
                                         Query_Detail.FieldByName('PSPE2').AsInteger) )*100)
        else fourrat := FormatFloat(pFmt, 0);

        pemp     := FormatFloat(Fmt, Query_Detail.FieldByName('PTOTAL').AsInteger+
                                     Query_Detail.FieldByName('PSPE2').AsInteger);
        pextrsum := FormatFloat(Fmt, Query_Detail.FieldByName('PEXTRSUM').AsInteger);
        // 계약직 관련 추가
        pcontsum := FormatFloat(Fmt, Query_Detail.FieldByName('pcontsum').AsInteger);
        psum     := FormatFloat(Fmt, Query_Detail.FieldByName('PTOTAL').AsInteger +
                                     Query_Detail.FieldByName('PSPE2').AsInteger +
                                     Query_Detail.FieldByName('PEXTRSUM').AsInteger +
                                     Query_Detail.FieldByName('pcontsum').AsInteger);

        {
        psum     := FormatFloat(Fmt, Query_Detail.FieldByName('PTOTAL').AsInteger +
                                     Query_Detail.FieldByName('PSPE2').AsInteger +
                                     Query_Detail.FieldByName('PEXTRSUM').AsInteger);
        }
        flag := 'C'; System.Write(Fout, DataIn);
        Inc(Cnt); Inc(LineCnt); PageCheck(LineCnt,1);

        if Query_Detail.FieldByName('PSPE2').AsInteger > 0 then begin
           ClearData;
           deptname := '  (전임행정직)';
           plevel   := false;
           Executive_Data(Query_Detail); Inc(Cnt);
           flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt); PageCheck(LineCnt,1);
        end;
        Query_Detail.Next;
      end;
      Query_Detail.Close;
      if (cnt > 0) and (LineCnt > 1) then begin
          flag := 'S'; System.Write(Fout, DataIn);
      end;
      Query_SubTotal.Next; {다음 부문소계를 읽음}
    end; {while}
    Query_SubTotal.Close;
    Query_SecTotal.Next;
   end;                     //sectcode end
    Query_SecTotal.Close;
  end; {with}
  System.Close(Fout);

  {comment 처리}
  Query_comment1.Close;
  AssignFile(FCom, HomeDir+'\list\pie2040c.dat');
  System.ReWrite(FCom);
  Query_comment1.ParamByName('P_topoym').AsString := ME_WorkDate.Text;
  Query_comment1.Open;
  with Query_comment1 do begin

{      Buff:='① 총괄현원 ['+IntToStr(FieldByName('TOTCUR').AsInteger)+
            ' 명] = 정규직 + 협력[임원은 제외]';
      System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
}
      Buff1 := '';  Buff2:='';  Buff3:='';  Buff4:='';
      Buff1:='   ① 임원 ['+IntToStr(FieldByName('PDIRSUM').AsInteger)+' 명] : ';
      if FieldByName('PDIR11').AsInteger <> 0 then
         Buff1:=Buff1+'회장 '+IntToStr(FieldByName('PDIR11').AsInteger)+', ';
      if FieldByName('PDIR12').AsInteger <> 0 then
         Buff1:=Buff1+'부회장 '+IntToStr(FieldByName('PDIR12').AsInteger)+', ';
      if FieldByName('PDIR21').AsInteger <> 0 then
         Buff1:=Buff1+'사장 '+IntToStr(FieldByName('PDIR21').AsInteger)+', ';
      if FieldByName('PDIR31').AsInteger <> 0 then
         Buff1:=Buff1+'감사 '+IntToStr(FieldByName('PDIR31').AsInteger)+', ';
      if FieldByName('PDIR41').AsInteger <> 0 then
         Buff1:=Buff1+'부사장 '+IntToStr(FieldByName('PDIR41').AsInteger)+', ';
      if FieldByName('PDIR51').AsInteger <> 0 then
         Buff1:=Buff1+'전무 '+IntToStr(FieldByName('PDIR51').AsInteger)+', ';
      if FieldByName('PDIR61').AsInteger <> 0 then
         Buff1:=Buff1+'상무 '+IntToStr(FieldByName('PDIR61').AsInteger)+', ';
      if FieldByName('PDIR6A').AsInteger <> 0 then
         Buff1:=Buff1+'선임연구위원1 '+IntToStr(FieldByName('PDIR6A').AsInteger)+', ';
{-----------------------------------------------------------------------
   버전     수정일     수정자   관련근거        수정내용
 30.18   2000.03.08   김대훈       -          출력물 소계부분 이사를 상무보로 변경
-----------------------------------------------------------------------}
//      if FieldByName('PDIR71').AsInteger <> 0 then
//         Buff2:=Buff2+'이사 '+IntToStr(FieldByName('PDIR71').AsInteger)+', ';
      if FieldByName('PDIR71').AsInteger <> 0 then
         Buff2:=Buff2+'상무보 '+IntToStr(FieldByName('PDIR71').AsInteger)+', ';
      if FieldByName('PDIR72').AsInteger <> 0 then
         Buff2:=Buff2+'이사대우 '+IntToStr(FieldByName('PDIR72').AsInteger)+', ';
      if FieldByName('PDIR7A').AsInteger <> 0 then
         Buff2:=Buff2+'선임연구위원2 '+IntToStr(FieldByName('PDIR7A').AsInteger)+', ';
      if FieldByName('PDIRETC').AsInteger <> 0 then
         Buff2:=Buff2+'기타 '+IntToStr(FieldByName('PDIRETC').AsInteger)+', ';
      if (length(Buff1)+length(Buff2)) < 110 then begin
         Buff := Buff1 + Buff2;
         Buff := Copy(Buff, 1, length(Buff)-2);   {끝부분의 ", "제거}
         System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
      end
      else begin
         System.WriteLn(FCom, Buff1); inc(LineCnt); PageCheck(LineCnt,2);
         Buff := '                     ' + Buff2;
         Buff := Copy(Buff, 1, length(Buff)-2);   {끝부분의 ", "제거}
         System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
      end;
{ 30.00   특정,협력직에 대해 comment출력안함.
      if ME_WorkDate.Text <= '199812' then begin
        Buff:='② 특정직현원 ['+IntToStr(FieldByName('PSPE').AsInteger)+' 명] = ';
        if FieldByName('PSPE1').AsInteger <> 0 then
           Buff:=Buff+'특정기술직['+IntToStr(FieldByName('PSPE1').AsInteger)+' 명] + ';
        if FieldByName('PSPE3').AsInteger <> 0 then
           Buff:=Buff+'특수직['+IntToStr(FieldByName('PSPE3').AsInteger)+' 명] + ';
        if FieldByName('PSPE4').AsInteger <> 0 then
           Buff:=Buff+'특정행정직['+IntToStr(FieldByName('PSPE4').AsInteger)+' 명] + ';
        Buff := Copy(Buff, 1, length(Buff)-3);   {끝부분의 " + "제거
        System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);

        Buff:='③ 계약직 ['+IntToStr(FieldByName('PEXTRSUM').AsInteger)+' 명] = ';
        if FieldByName('PEXTR1').AsInteger <> 0 then
           Buff:=Buff+'고문['+IntToStr(FieldByName('PEXTR1').AsInteger)+' 명] + ';
        if FieldByName('PEXTR2').AsInteger <> 0 then
           Buff:=Buff+'촉탁['+IntToStr(FieldByName('PEXTR2').AsInteger)+' 명] + ';
        if FieldByName('PEXTR3').AsInteger <> 0 then
           Buff:=Buff+'용무['+IntToStr(FieldByName('PEXTR3').AsInteger)+' 명] + ';
        if FieldByName('PTEMPSUM').AsInteger <> 0 then
           Buff:=Buff+'협력사원['+IntToStr(FieldByName('PTEMPSUM').AsInteger)+' 명] + ';
        Buff := Copy(Buff, 1, length(Buff)-3);   {끝부분의 " + "제거
        System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
     }
  end; {with}

  {comment 1}
  if Edit1_1.Text+Edit1_2.Text+Edit1_3.Text <> '' then
  begin
    Buff := Edit1_1.Text+Edit1_2.Text+Edit1_3.Text;
    System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
  end;
  {
  Query_comment2.ParamByName('P_topoym').AsString := ME_WorkDate.Text;
  Query_comment2.Open;
  with Query_comment2 do begin
      Buff1 := '';  Buff2:='';  Buff3:='';  Buff4:='';
      Buff:='   ☞ 노조전임간부 ['+IntToStr(FieldByName('PSUM').AsInteger)+' 명] : ';
      if FieldByName('PPOS1').AsInteger <> 0 then
         Buff1:=Buff1+'일반직1급('+IntToStr(FieldByName('PPOS1').AsInteger)+'), ';
      if FieldByName('PPOS2').AsInteger <> 0 then
         Buff1:=Buff1+'일반직2급('+IntToStr(FieldByName('PPOS2').AsInteger)+'), ';
      if FieldByName('PPOS3').AsInteger <> 0 then
         Buff1:=Buff1+'일반직3급('+IntToStr(FieldByName('PPOS3').AsInteger)+'), ';
      if FieldByName('PPOS4').AsInteger <> 0 then
         Buff1:=Buff1+'일반직4급('+IntToStr(FieldByName('PPOS4').AsInteger)+'), ';
      if FieldByName('PPOS5').AsInteger <> 0 then
         Buff1:=Buff1+'일반직5급('+IntToStr(FieldByName('PPOS5').AsInteger)+'), ';

      if FieldByName('PPOS6').AsInteger <> 0 then
         Buff2:=Buff2+'일반직6급('+IntToStr(FieldByName('PPOS6').AsInteger)+'), ';
      if FieldByName('PPOS7').AsInteger <> 0 then
         Buff2:=Buff2+'일반직7급('+IntToStr(FieldByName('PPOS7').AsInteger)+'), ';

      if FieldByName('PSPE21').AsInteger <> 0 then
         Buff3:=Buff3+'전임행정직1급('+IntToStr(FieldByName('PSPE21').AsInteger)+'), ';
      if FieldByName('PSPE22').AsInteger <> 0 then
         Buff3:=Buff3+'전임행정직2급('+IntToStr(FieldByName('PSPE22').AsInteger)+'), ';
      if FieldByName('PSPE23').AsInteger <> 0 then
         Buff3:=Buff3+'전임행정직3급('+IntToStr(FieldByName('PSPE23').AsInteger)+'), ';
      if FieldByName('PSPE24').AsInteger <> 0 then
         Buff3:=Buff3+'전임행정직4급('+IntToStr(FieldByName('PSPE24').AsInteger)+'), ';
      if FieldByName('PSPE25').AsInteger <> 0 then
         Buff3:=Buff3+'전임행정직5급('+IntToStr(FieldByName('PSPE25').AsInteger)+'), ';

      if FieldByName('PSPE26').AsInteger <> 0 then
         Buff4:=Buff4+'전임행정직6급('+IntToStr(FieldByName('PSPE26').AsInteger)+'), ';
      if FieldByName('PSPE27').AsInteger <> 0 then
         Buff4:=Buff4+'전임행정직7급('+IntToStr(FieldByName('PSPE27').AsInteger)+')';

      if length(Buff1) <> 0 then
         Buff := Buff + Buff1;
      if length(Buff2) <> 0 then begin
         if (length(Buff)+length(Buff2)) < 110 then
            Buff := Buff + Buff2
         else begin
            System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
            Buff := '                            '+Buff2;
         end;
      end;
      if length(Buff3) <> 0 then begin
         if (length(Buff)+length(Buff3)) < 110 then
            Buff := Buff + Buff3
         else begin
            System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
            Buff := '                            '+Buff3;
         end;
      end;
      if length(Buff4) <> 0 then begin
         if (length(Buff)+length(Buff4)) < 110 then
            Buff := Buff + Buff4
         else begin
            System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
            Buff := '                            '+Buff4;
         end;
      end;
      Buff := Copy(Buff, 1, length(Buff)-2);   //끝부분의 ", "제거
      System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
  end;
 }
  {comment 2 ~ 8}
  if Edit2_1.Text+Edit2_2.Text+Edit2_3.Text <> '' then
  begin
    Buff := Edit2_1.Text+Edit2_2.Text+Edit2_3.Text;
    System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
  end;
  if Edit3_1.Text+Edit3_2.Text+Edit3_3.Text <> '' then
  begin
    Buff := Edit3_1.Text+Edit3_2.Text+Edit3_3.Text;
    System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
  end;
  if Edit4_1.Text+Edit4_2.Text+Edit4_3.Text <> '' then
  begin
    Buff := Edit4_1.Text+Edit4_2.Text+Edit4_3.Text;
    System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
  end;
  if Edit5_1.Text+Edit5_2.Text+Edit5_3.Text <> '' then
  begin
    Buff := Edit5_1.Text+Edit5_2.Text+Edit5_3.Text;
    System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
  end;
  if Edit6_1.Text+Edit6_2.Text+Edit6_3.Text <> '' then
  begin
    Buff := Edit6_1.Text+Edit6_2.Text+Edit6_3.Text;
    System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
  end;
  if Edit7_1.Text+Edit7_2.Text+Edit7_3.Text <> '' then
  begin
    Buff := Edit7_1.Text+Edit7_2.Text+Edit7_3.Text;
    System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
  end;
  if Edit8_1.Text+Edit8_2.Text+Edit8_3.Text <> '' then
  begin
    Buff := Edit8_1.Text+Edit8_2.Text+Edit8_3.Text;
    System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
  end;

  System.Close(FCom);

  P_Help.Caption := '추출된 자료를 출력합니다.';
  if TBitBtn(Sender).Name = 'BB_Print' then begin
    AReport.Print
  end else begin
    P_Help.Caption := '추출된 자료를 출력합니다.';
   // QRprinter.OnPreView := ShowPreView; {사용자정의 미리보기 화면}
    AReport.PreView;
  end;
  P_Help.Caption := '작업이 완료되었습니다.';
  G_Progress.Progress := 0;
end;

function TMainForm.DeptNameFind : string;
begin
  Qbondept.Open;
  if Qbondept.RecordCount < 1 then
    DeptNameFind := Qbondept.ParamByName('P_deptcode').AsString
  else
  begin
    if Qbondept.FieldByName('DEPTNA3').AsString <> '' then
      DeptNameFind := Qbondept.FieldByName('DEPTNA3').AsString
    else if Qbondept.FieldByName('DEPTNA2').AsString <> '' then
      DeptNameFind := Qbondept.FieldByName('DEPTNA2').AsString
    else if Qbondept.FieldByName('DEPTNA1').AsString <> '' then
      DeptNameFind := Qbondept.FieldByName('DEPTNA1').AsString
    else
      DeptNameFind := Qbondept.FieldByName('DEPTNAME').AsString;
  end;
  DeptLevel := Qbondept.FieldByName('DEPTLEVEL').AsString;
  Qbondept.Close;
end;

procedure TMainForm.BB_SetUpClick(Sender: TObject);
begin
     PrinterSetup.Execute;
end;

end.
