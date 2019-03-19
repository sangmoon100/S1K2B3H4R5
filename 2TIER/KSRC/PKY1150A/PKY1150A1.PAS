{===================== Program Header ==========================================
 PROGRAM-NAME      : pkw1015a
 SYSTEM-NAME       : 급여
 SUBSYSTEM-NAME    : 단기계약직
 Programmer        : 이랑교
 Version           : 30.00
 Date              : 1999.09.27

Update Contents
 Version  date(yy.mm.dd)  programmer  description               relevant doc.no
 30.00     1999.09.27     이랑교      최초개발본                설계명세서
================================================================================}
unit PKY1150A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, Grids, DBGrids, ComCtrls, Func, Ora,
  Comobj;

type
  TFM_Main = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BT_excel: TBitBtn;
    BT_exit: TBitBtn;
    E_frPAYDATE: TMaskEdit;
    SP_frPayDate: TSpeedButton;
    Panel4: TPanel;
    Panel1: TPanel;
    L_UserName: TLabel;
    L_Date: TLabel;
    Panel2: TPanel;
    PCNT_1: TPanel;
    PCNT_2: TPanel;
    PCNT_4: TPanel;
    P_1: TPanel;
    P_3: TPanel;
    StatusBar1: TStatusBar;
    Pcnt_3: TPanel;
    p_2: TPanel;
    BitBtn4: TBitBtn;
    PCNT_5: TPanel;
    P_4: TPanel;
    BitBtn9: TBitBtn;
    P_9: TPanel;
    PCNT_9: TPanel;
    BitBtn6: TBitBtn;
    pcnt_6: TPanel;
    P_6: TPanel;
    BitBtn8: TBitBtn;
    pcnt_8: TPanel;
    P_8: TPanel;
    BitBtn5: TBitBtn;
    P_5: TPanel;
    pcnt_7: TPanel;
    BitBtn7: TBitBtn;
    P_7: TPanel;
    PCNT_11: TPanel;
    PCNT_12: TPanel;
    BitBtn10: TBitBtn;
    P_11: TPanel;
    BitBtn11: TBitBtn;
    P_12: TPanel;
    PCNT_10: TPanel;
    BitBtn12: TBitBtn;
    P_10: TPanel;
    PCNT_13: TPanel;
    P_13: TPanel;
    BitBtn13: TBitBtn;
    SP_toPayDate: TSpeedButton;
    E_toPAYDATE: TMaskEdit;
    Label1: TLabel;
    BitBtn14: TBitBtn;
    PCNT_14: TPanel;
    Panel5: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BT_excelClick(Sender: TObject);
    procedure BT_exitClick(Sender: TObject);
    procedure SP_frPayDateClick(Sender: TObject);
    procedure E_frPAYDATEChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure SP_toPayDateClick(Sender: TObject);
    procedure E_toPAYDATEChange(Sender: TObject);

  private
    { Private declarations }
    ActiveFlag     : Boolean;
    gSaveTitle     : String;
    vYearpaynum    : String;

  public
    Procedure Setup;
    procedure GetCalendar(Arg_Me: TMaskEdit);
    { Public declarations }
  end;

var
  FM_Main: TFM_Main;

implementation

uses PKY1150A2,pass,db,Formmon1;

{$R *.DFM}

{==============================================================================
         초기화를 수행하는 Procedure.
 ==============================================================================}
Procedure TFM_Main.SetUp;
var
     CurDate        : String;
begin
     ActiveFlag := False;
     StatusBar1.Panels[0].Text := '   급여시스템에 접속 중입니다...';

     Application.ProcessMessages;
     OraConnect;

     CurDate             := fn_GetDateTimeStr;
     L_Date.Caption      := fn_GetDateStr;
     L_UserName.Caption  := PKorName+ '(' + Pempno + ')';
     StatusBar1.Panels[0].Text := '   ';
     Application.ProcessMessages;

     if (Copy(Pempno,1,1) = 'D') or ((Copy(Pgrade,3,1) <= 'C') and (fn_YmanagerCheck))  then  //fn_YmanagerCheck -> Func.Pas Library에 선언.
     else
     begin
          MessageBox(handle,'파견직 관리자 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;

     with dm1.Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select yearpaynum from pkcpbas             ');
          Open;
          vYearpaynum := FieldbyName('yearpaynum').AsString;
          Close;
     end;
     E_frPAYDATE.Text   := Copy(CurDate,1,6);
     E_toPAYDATE.Text := Copy(CurDate,1,6);
end;

procedure TFM_Main.GetCalendar(Arg_Me: TMaskEdit);
begin
     MonthForm := TMonthForm.Create(Self);
     Try
          MonthForm.ShowModal;
          if MonthForm.DayCaption <> '' then
          begin
               Arg_Me.Text := MonthForm.DayCaption;
          end;
     Finally
          MonthForm.Free;
     end;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
     ActiveFlag := True;
end;

procedure TFM_Main.FormActivate(Sender: TObject);
begin
     Setup;
     DBGrid1.datasource := dm1.ds1;
end;

procedure TFM_Main.BT_excelClick(Sender: TObject);
var  XL, XArr   : Variant;
     i, j, k    : integer;
     SavePlace  : TBookmark;
begin
     if Dm1.Query1.Active = False then
     begin
          Application.MessageBox('Excel 파일로 추출할 자료를 먼저 조회하세요.','작업안내',mb_ok);
          Exit;
     end;

     if Dm1.Query1.recordcount = 0 then
     begin
          Application.MessageBox('Excel 파일로 추출할 자료가 없습니다.','작업안내',mb_ok);
          Exit;
     end;

     StatusBar1.Panels[0].Text := 'Excel이 설치되어 있는지 검색하고 있습니다.';

     XArr := VarArrayCreate([1, DBGrid1.Columns.Count], VarVariant); //Gird 출력시
     try
          XL := CreateOLEObject('Excel.Application');
     except
          MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
          StatusBar1.Panels[0].Text := '';
          system.Exit;
     end;

     StatusBar1.Panels[0].Text := gSaveTitle + '자료를 Excel 파일로 변환하고 있습니다.';
     XL.WorkBooks.Add;                                 //새로운 페이지 생성
     XL.Visible := false;

     //시트명 부여
     XL.WorkSheets[1].Name := gSaveTitle;

     //TITLE NAME 설정
     //XL.Range['A1'].value := '';
     //XL.Range['A1'].font.Size := 16;

     //컬럼명 지정_서브타이블 지정
     for i := 1 to DBGrid1.Columns.Count do
     begin
          XArr[i]  := DBGrid1.Fields[i-1].DisplayName;
     end;

     if DBGrid1.Columns.Count >= 53 then  //BA ~
     begin
          XL.Range['A1' , CHR(66) + CHR(64 + DBGrid1.Columns.Count-52)+'1'].Value := XArr;  //Gird 출력시
     end
     else if DBGrid1.Columns.Count >= 27 then  //AA ~
     begin
          XL.Range['A1' , CHR(65) + CHR(64 + DBGrid1.Columns.Count-26)+'1'].Value := XArr;  //Gird 출력시
     end
     else                                       //A  ~
     begin
          XL.Range['A1' , CHR(64 + DBGrid1.Columns.Count)+'1'].Value := XArr;  //Gird 출력시
     end;

     k := 1;
     for i := 1 to DBGrid1.Columns.Count do     //Gird 출력시
     begin
          if i >= 53 then       //BA ~
          begin
               XL.Range[CHR(66) + CHR(64 + i-52) + '1'].HorizontalAlignment := 3;
               XL.Range[CHR(66) + CHR(64 + i-52) + '1'].Interior.Color      := $00CBF0B3;
               XL.Range[CHR(66) + CHR(64 + i-52) + '1'].font.Size           := 10;
               XL.Range[CHR(66) + CHR(64 + i-52) + '1'].font.Bold           := True;
          end
          else if i >= 27 then  //AA ~
          begin //Showmessage(CHR(65) + CHR(64 + i-26) + '3');
               XL.Range[CHR(65) + CHR(64 + i-26) + '1'].HorizontalAlignment := 3;
               XL.Range[CHR(65) + CHR(64 + i-26) + '1'].Interior.Color      := $00CBF0B3;
               XL.Range[CHR(65) + CHR(64 + i-26) + '1'].font.Size           := 10;
               XL.Range[CHR(65) + CHR(64 + i-26) + '1'].font.Bold           := True;
          end
          else
          begin                 //A  ~
               XL.Range[CHR(64 + i)              + '1'].HorizontalAlignment := 3;
               XL.Range[CHR(64 + i)              + '1'].Interior.Color      := $00CBF0B3;
               XL.Range[CHR(64 + i)              + '1'].font.Size           := 10;
               XL.Range[CHR(64 + i)              + '1'].font.Bold           := True;
          end;
     end;

     //검색된 자료를 excel에 export처리 시킨다.
     SavePlace := Dm1.Query1.GetBookmark;
     Dm1.Query1.DisableControls;
     Dm1.Query1.First;

     for i := 1 to Dm1.Query1.RecordCount do
     begin
          for j := 1 to DBGrid1.Columns.Count do
          begin
               if (Copy(DBGrid1.Fields[j-1].AsString,1,1) =  '0') and
                  (     DBGrid1.Fields[j-1].AsString      <> '0') then
                    XArr[j]  := ''''+DBGrid1.Fields[j-1].AsString
               else
                    XArr[j]  := DBGrid1.Fields[j-1].AsString;
          end;

          if DBGrid1.Columns.Count >= 53 then  //BA ~
          begin
               XL.Range['A' + IntToStr(k+1), CHR(66) + CHR(64 + DBGrid1.Columns.Count-52)+ IntToStr(k+1)].Value := XArr;
          end
          else if DBGrid1.Columns.Count >= 27 then  //AA ~
          begin
               XL.Range['A' + IntToStr(k+1), CHR(65) + CHR(64 + DBGrid1.Columns.Count-26)+ IntToStr(k+1)].Value := XArr;
          end
          else
          begin                 //A  ~
               XL.Range['A' + IntToStr(k+1), CHR(64 + DBGrid1.Columns.Count) + IntToStr(k+1)].Value := XArr;
          end;

          inc(k);
          Dm1.Query1.Next;
     end;

     if DBGrid1.Columns.Count >= 53 then  //BA ~
     begin
          //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
          XL.Range['A1', CHR(66) + CHR(64 + DBGrid1.Columns.Count-52) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
          XL.Range['A1', CHR(66) + CHR(64 + DBGrid1.Columns.Count-52) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
          XL.Range['A1', CHR(66) + CHR(64 + DBGrid1.Columns.Count-52) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
          XL.Range['A1', CHR(66) + CHR(64 + DBGrid1.Columns.Count-52) + IntToStr(k)].font.name := '굴림체';
          XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
          XL.Range['A2', CHR(66) + CHR(64 + DBGrid1.Columns.Count-52) + IntToStr(k)].font.Size := 9;
          XL.Range['A2', CHR(66) + CHR(64 + DBGrid1.Columns.Count-52) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
          XL.Range['A1', CHR(66) + CHR(64 + DBGrid1.Columns.Count-52) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
     end
     else if DBGrid1.Columns.Count >= 27 then  //AA ~
     begin
          //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
          XL.Range['A1', CHR(65) + CHR(64 + DBGrid1.Columns.Count-26) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
          XL.Range['A1', CHR(65) + CHR(64 + DBGrid1.Columns.Count-26) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
          XL.Range['A1', CHR(65) + CHR(64 + DBGrid1.Columns.Count-26) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
          XL.Range['A1', CHR(65) + CHR(64 + DBGrid1.Columns.Count-26) + IntToStr(k)].font.name := '굴림체';
          XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
          XL.Range['A2', CHR(65) + CHR(64 + DBGrid1.Columns.Count-26) + IntToStr(k)].font.Size := 9;
          XL.Range['A2', CHR(65) + CHR(64 + DBGrid1.Columns.Count-26) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
          XL.Range['A1', CHR(65) + CHR(64 + DBGrid1.Columns.Count-26) + IntToStr(k)].Select;
     end
     else                                       //A  ~
     begin
          //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
          XL.Range['A1', CHR(64 + DBGrid1.Columns.Count) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
          XL.Range['A1', CHR(64 + DBGrid1.Columns.Count) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
          XL.Range['A1', CHR(64 + DBGrid1.Columns.Count) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
          XL.Range['A1', CHR(64 + DBGrid1.Columns.Count) + IntToStr(k)].font.name := '굴림체';
          XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
          XL.Range['A2', CHR(64 + DBGrid1.Columns.Count) + IntToStr(k)].font.Size := 9;
          XL.Range['A2', CHR(64 + DBGrid1.Columns.Count) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
          XL.Range['A1', CHR(64 + DBGrid1.Columns.Count) + IntToStr(k)].Select;
     end;
     XL.Selection.Columns.AutoFit;                                                             //자동정렬
     XL.Range['A2', 'A2'].Select;                                                              //A2열에 커서 위치시킴
     XL.Visible := true;                                                                       //엑셀자료 보여줌
     Screen.Cursor := crDefault;
     Dm1.Query1.GotoBookmark(SavePlace);
     Dm1.Query1.FreeBookmark(SavePlace);
     Dm1.Query1.EnableControls;
     Dm1.Query1.First;
     StatusBar1.Panels[0].Text :=  gSaveTitle +' Excel 추출 완료했습니다.';
end;

procedure TFM_Main.BT_exitClick(Sender: TObject);
begin
     close;
end;

procedure TFM_Main.SP_frPayDateClick(Sender: TObject);
begin
     GetCalendar(E_frPAYDate);
end;

procedure TFM_Main.E_frPAYDATEChange(Sender: TObject);
begin
     PCNT_1.Caption            := '';
     PCNT_2.Caption            := '';
     PCNT_3.Caption            := '';
     PCNT_4.Caption            := '';
     PCNT_5.Caption            := '';
     PCNT_6.Caption            := '';
     PCNT_7.Caption            := '';
     PCNT_8.Caption            := '';
     PCNT_9.Caption            := '';
     PCNT_10.Caption           := '';
     PCNT_11.Caption           := '';
     PCNT_12.Caption           := '';
     PCNT_13.Caption           := '';
     PCNT_14.Caption           := '';
     StatusBar1.Panels[0].Text := '';
     Dm1.Query1.Close;
     E_toPAYDATE.Text          := E_frPAYDATE.Text;
end;

procedure TFM_Main.BitBtn1Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select M.empno 사번, M.korname 성명,                            ');
          SQL.Add('       M.empdate 입사일, M.retdate 퇴사일,                      ');
          SQL.Add('       CASE WHEN M.PSTATE > ''80'' THEN ''퇴사''                ');
          SQL.Add('       ELSE ''재직'' END 상태,                                  ');
          SQL.Add(' 	  M.deptcode 부서코드,                                     ');
          SQL.Add('  	  (select deptname from pycdept                            ');
          SQL.Add('  	    where orgnum   = M.orgnum                              ');
          SQL.Add('  	      and deptcode = M.deptcode) 부서명,                   ');
          SQL.Add('  	  --M.TJOBDUTY 직무코드,                                   ');
          SQL.Add('       (SELECT CODENAME FROM PYCCODE                            ');
          SQL.Add('         WHERE CODEID = ''I702''                                ');
          SQL.Add('           AND CODENO = M.TJOBDUTY) 담당직무명,                 ');
          SQL.Add('       NVL(Y.TOTPAY,0) 총연봉, NVL(Y.SI_TOTPAY,0) 총수수료,     ');
          SQL.Add('       ceil(nvl(Y.TOTPAY,0)/12) 기본급,                         ');
          SQL.Add('       Trunc(NVL(Y.SI_TOTPAY,0)/12) 수수료,                     ');
          SQL.Add('       M.TCOMPANY 회사코드,                                     ');
          SQL.Add('       (SELECT CODENAME FROM PYCCODE                            ');
          SQL.Add('         WHERE CODEID = ''I902''                                ');
          SQL.Add('           AND CODENO = M.TCOMPANY) 소속회사                    ');
          SQL.Add('  FROM PIMPMAS M, pkmpmas a, PKHYPHIS Y                         ');
          SQL.Add(' WHERE M.EMPNO    = A.EMPNO                                     ');
          SQL.Add('   AND M.EMPNO    = Y.EMPNO(+)                                  ');
          SQL.Add('   AND Y.YEARPAYNUM(+) = :pyearpaynum                           ');
          SQL.Add('   AND A.PAYYN    =    ''Y''                                    ');
          SQL.Add('   and A.EMPNO    like ''Y%''                                   ');
          SQL.Add(' order by 5, M.empno                                            ');
          Parambyname('pyearpaynum').AsString := vYearpaynum;
          Open;
          PCNT_1.Caption := formatFloat('#,##0',Dm1.Query1.RecordCount * 1.0 ) +'건 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end;
end;

procedure TFM_Main.BitBtn2Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select M.empno 사번, M.korname 성명,                            ');
          SQL.Add('       M.empdate 입사일, M.retdate 퇴사일,                      ');
          SQL.Add('       CASE WHEN M.PSTATE > ''80'' THEN ''퇴사''                ');
          SQL.Add('       ELSE ''재직'' END 상태,                                  ');
          SQL.Add(' 	  M.deptcode 부서코드,                                     ');
          SQL.Add('  	  (select deptname from pycdept                            ');
          SQL.Add('  	    where orgnum   = M.orgnum                              ');
          SQL.Add('  	      and deptcode = M.deptcode) 부서명,                   ');
          SQL.Add('       (SELECT CODEFNAME FROM PYCCODE                           ');
          SQL.Add('         WHERE CODENO = M.TCOMPANY                              ');
          SQL.Add('           AND CODEID =''I902'') 소속회사                       ');
          SQL.Add('  from PIMPMAS M, pkhyphis b, pkmpmas a                         ');
          SQL.Add(' where M.EMPNO    = A.EMPNO                                     ');
          SQL.Add('   AND a.payyn    =    ''Y''                                    ');
          SQL.Add('   and a.empno    like ''Y%''                                   ');
          SQL.Add('   and b.yearpaynum(+) = :pyearpaynum                           ');
          SQL.Add('   and a.empno         = b.empno(+)                             ');
          SQL.Add('   and b.empno         is null                                  ');
          SQL.Add(' order by 5, M.empno                                            ');
          Parambyname('pyearpaynum').AsString := vYearpaynum;
          Open;
          PCNT_2.Caption := formatFloat('#,##0',Dm1.Query1.RecordCount * 1.0 )+'건 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end;
end;

procedure TFM_Main.BitBtn3Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          close;
          Sql.Clear;
          SQL.Add('select M.empno 사번, M.korname 성명,                                                              ');
          SQL.Add('       M.empdate 입사일, M.retdate 퇴사일,                                                        ');
          SQL.Add('       CASE WHEN M.PSTATE > ''80'' THEN ''퇴사''                                                  ');
          SQL.Add('       ELSE ''재직'' END 상태,                                                                    ');
          SQL.Add(' 	  M.deptcode 부서코드,                                                                       ');
          SQL.Add('  	  (select deptname from pycdept                                                              ');
          SQL.Add('  	    where orgnum   = M.orgnum                                                                ');
          SQL.Add('  	      and deptcode = M.deptcode) 부서명,                                                     ');
          SQL.Add('       NVL(b.CONYN,''N'')  결재여부, b.DUYYMM 근태월,                                             ');
          {
          SQL.Add('       DD1  "1일 근태",   DD2  "2일 근태",   DD3 "3일 근태",    DD4 "4일 근태",                   ');
          SQL.Add('       DD5  "5일 근태",   DD6  "6일 근태",   DD7 "7일 근태",    DD8 "8일 근태",                   ');
          SQL.Add('       DD9  "9일 근태",   DD10 "10일 근태",  DD11 "11일 근태",  DD12 "12일 근태",                 ');
          SQL.Add('       DD13 "13일 근태",  DD14 "14일 근태",  DD15 "15일 근태",  DD16 "16일 근태",                 ');
          SQL.Add('       DD17 "17일 근태",  DD18 "18일 근태",  DD19 "19일 근태",  DD20 "20일 근태",                 ');
          SQL.Add('       DD21 "21일 근태",  DD22 "22일 근태",  DD23 "23일 근태",  DD24 "24일 근태",                 ');
          SQL.Add('       DD25 "25일 근태",  DD26 "26일 근태",  DD27 "27일 근태",  DD28 "28일 근태",                 ');
          SQL.Add('       DD29 "29일 근태",  DD30 "30일 근태",  DD31 "31일 근태"                                     ');
          }
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD1 )  "1일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD2 )  "2일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD3 )  "3일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD4 )  "4일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD5 )  "5일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD6 )  "6일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD7 )  "7일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD8 )  "8일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD9 )  "9일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD10) "10일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD11) "11일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD12) "12일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD13) "13일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD14) "14일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD15) "15일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD16) "16일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD17) "17일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD18) "18일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD19) "19일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD20) "20일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD21) "21일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD22) "22일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD23) "23일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD24) "24일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD25) "25일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD26) "26일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD27) "27일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD28) "28일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD29) "29일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD30) "30일 근태",                              ');
          SQL.Add('       (Select Duname From Pkcducod Where Dukind= DD31) "31일 근태",                              ');
          SQL.Add('       (SELECT CODEFNAME FROM PYCCODE WHERE CODENO = M.TCOMPANY AND  CODEID =''I902'') "소속회사" ');
          SQL.Add('  from PIMPMAS M, pkhduty b                                                                       ');
          SQL.Add(' where M.EMPNO      = B.EMPNO                                                                     ');
          SQL.Add('   and M.empno      like ''Y%''                                                                   ');
          SQL.Add('   and b.DUYYMM(+)  between to_char(ADD_MONTHS(to_date(:frduyymm,''YYYYMM''),-1),''YYYYMM'')      ');
          SQL.Add('                    and     to_char(ADD_MONTHS(to_date(:toduyymm,''YYYYMM''),-1),''YYYYMM'')      ');
          SQL.Add(' order by b.DUYYMM, 5, M.empno                                                                    ');
          ParamByName('frduyymm').AsString := E_frPAYDATE.Text;
          ParamByName('toduyymm').AsString := E_toPAYDATE.Text;
          Open;
          PCNT_3.Caption := formatFloat('#,##0',Dm1.Query1.RecordCount* 1.0 )+'건 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end;
end;

procedure TFM_Main.BitBtn4Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          close;
          Sql.Clear;
          SQL.Add('select M.empno 사번, M.korname 성명,                                                             ');
          SQL.Add('       M.empdate 입사일, M.retdate 퇴사일,                                                       ');
          SQL.Add('       CASE WHEN M.PSTATE > ''80'' THEN ''퇴사''                                                 ');
          SQL.Add('       ELSE ''재직'' END 상태,                                                                   ');
          SQL.Add(' 	  M.deptcode 부서코드,                                                                      ');
          SQL.Add('  	  (select deptname from pycdept                                                             ');
          SQL.Add('  	    where orgnum   = M.orgnum                                                               ');
          SQL.Add('  	      and deptcode = M.deptcode) 부서명,                                                    ');
          SQL.Add('  	  b.CONYN 결재여부, b.DUYYMM 근태월,                                                        ');
          SQL.Add('  	  b.NORMAL  "정상", b.SPECIAL  "특휴",  b.HEALTH  "보건",  b.BIRTH "생일",                  ');
          SQL.Add('       b.CELEB   "경조", b.YEARHALF "반연차",b.YEAR    "연차",  b.SICK  "병가",                  ');
          SQL.Add('  	  b.ABSENCE "결근", b.NOINPUT  "미입",  b.BEFORE  "불입",                                   ');
          SQL.Add('       (SELECT CODEFNAME FROM PYCCODE WHERE CODENO = M.TCOMPANY AND  CODEID =''I902'') 소속회사  ');
          SQL.Add('  from PIMPMAS M, pkhduty b                                                                      ');
          SQL.Add(' where M.EMPNO    = b.EMPNO                                                                      ');
          SQL.Add('   and M.empno    like ''Y%''                                                                    ');
          SQL.Add('   and b.DUYYMM   between to_char(ADD_MONTHS(to_date(:frduyymm,''YYYYMM''),-1),''YYYYMM'')       ');
          SQL.Add('                  and     to_char(ADD_MONTHS(to_date(:toduyymm,''YYYYMM''),-1),''YYYYMM'')       ');
          SQL.Add('   and nvl(b.conyn,''N'') =''Y''                                                                 ');
          SQL.Add(' order by b.DUYYMM, 5, M.empno                                                                   ');
          ParamByName('frduyymm').AsString := E_frPAYDATE.Text;
          ParamByName('toduyymm').AsString := E_toPAYDATE.Text;
          Open;
          PCNT_4.Caption := formatFloat('#,##0',Dm1.Query1.RecordCount* 1.0 )+'건 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end;
end;

//근태기본급수정대상자
procedure TFM_Main.BitBtn5Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          close;
          Sql.Clear;
          SQL.Add('select Y_KNTEYYMM 최종근태마감월  from pkcpbas                    ');
          Open;
          PCNT_5.Caption := Dm1.Query1.Fields[0].AsString+'월 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end;
end;

procedure TFM_Main.BitBtn6Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          CLOSE;
          SQL.Clear;
          SQL.Add('select M.empno 사번, M.korname 성명,                                                                         ');
          SQL.Add('       M.empdate 입사일, M.retdate 퇴사일,                                                                   ');
          SQL.Add('       CASE WHEN M.PSTATE > ''80'' THEN ''퇴사''                                                             ');
          SQL.Add('       ELSE ''재직'' END 상태,                                                                               ');
          SQL.Add(' 	  M.deptcode 부서코드,                                                                                  ');
          SQL.Add('  	  (select deptname from pycdept                                                                         ');
          SQL.Add('  	    where orgnum   = M.orgnum                                                                           ');
          SQL.Add('  	      and deptcode = M.deptcode) 부서명,                                                                ');
          SQL.Add('        decode(substr(b.ovtmdate,7,2),                                                                       ');
          SQL.Add('        ''01'',DD1 ,''02'',DD2 ,''03'',DD3 ,''04'',DD4 ,''05'',DD5 ,''06'',DD6 ,''07'',DD7 ,                 ');
          SQL.Add('        ''08'',DD8 ,''09'',DD9 ,''10'',DD10,''11'',DD11,''12'',DD12,''13'',DD13,''14'',DD14,                 ');
          SQL.Add('        ''15'',DD15,''16'',DD16,''17'',DD17,''18'',DD18,''19'',DD19,''20'',DD20,''21'',DD21,                 ');
          SQL.Add('        ''22'',DD22,''23'',DD23,''24'',DD24,''25'',DD25,''26'',DD26,''27'',DD27,''28'',DD28,                 ');
          SQL.Add('        ''29'',DD29,''30'',DD30,''31'',DD31,null) 근무일근태코드,                                            ');
          SQL.Add('        (Select Duname From Pkcducod                                                                         ');
          SQL.Add('          Where Dukind=decode(substr(b.ovtmdate,7,2),                                                        ');
          SQL.Add('                       ''01'',DD1 ,''02'',DD2 ,''03'',DD3 ,''04'',DD4 ,''05'',DD5 ,''06'',DD6 ,''07'',DD7 ,  ');
          SQL.Add('                       ''08'',DD8 ,''09'',DD9 ,''10'',DD10,''11'',DD11,''12'',DD12,''13'',DD13,''14'',DD14,  ');
          SQL.Add('                       ''15'',DD15,''16'',DD16,''17'',DD17,''18'',DD18,''19'',DD19,''20'',DD20,''21'',DD21,  ');
          SQL.Add('                       ''22'',DD22,''23'',DD23,''24'',DD24,''25'',DD25,''26'',DD26,''27'',DD27,''28'',DD28,  ');
          SQL.Add('                       ''29'',DD29,''30'',DD30,''31'',DD31,null)) 근무일근태,                                ');
          SQL.Add('       b.FRREALTIME 근무시작일시,                                                                            ');
          SQL.Add('       b.TOREALTIME 근무종료일시, b.OVTMDESC 근무내역, b.CONYN 결재여부,                                     ');
          SQL.Add('       (SELECT CODEFNAME FROM PYCCODE P WHERE P.CODENO = M.TCOMPANY AND  CODEID =''I902'') "소속회사"        ');
          SQL.Add('  from PIMPMAS M, pkhothis b, pkhduty a                                                                      ');
          SQL.Add(' where M.EMPNO    =    B.EMPNO                                                                               ');
          SQL.Add('   and A.EMPNO    =    B.EMPNO                                                                               ');
          SQL.Add('   and A.duyymm   =    substr(b.ovtmdate,1,6)                                                                ');
          SQL.Add('   and M.empno    like ''Y%''                                                                                ');
          SQL.Add('   and b.ovtmdate between to_char(ADD_MONTHS(to_date(:frduyymm,''YYYYMM''),-1),''YYYYMM'')||''01''           ');
          SQL.Add('                      and to_char(LAST_DAY(ADD_MONTHS(to_date(:toduyymm,''YYYYMM''),-1)),''YYYYMMDD'')       ');
          SQL.Add('   order by 5, M.empno, b.ovtmdate                                                                           ');
          ParamByName('frduyymm').AsString := E_frPAYDATE.Text;
          ParamByName('toduyymm').AsString := E_toPAYDATE.Text;
          OPEN;
          PCNT_6.Caption := formatFloat('#,##0',Dm1.Query1.RecordCount* 1.0 )+'건 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end;
end;

procedure TFM_Main.BitBtn7Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          CLOSE;
          SQL.Clear;
          SQL.Add('select M.empno 사번, M.korname 성명,                                                             ');
          SQL.Add('       M.empdate 입사일, M.retdate 퇴사일,                                                       ');
          SQL.Add('       CASE WHEN M.PSTATE > ''80'' THEN ''퇴사''                                                 ');
          SQL.Add('       ELSE ''재직'' END 상태,                                                                   ');
          SQL.Add(' 	  M.deptcode 부서코드,                                                                      ');
          SQL.Add('  	  (select deptname from pycdept                                                             ');
          SQL.Add('  	    where orgnum   = M.orgnum                                                               ');
          SQL.Add('  	      and deptcode = M.deptcode) 부서명,                                                    ');
          SQL.Add('       b.ovtmyymm 근무월,         b.Genext  일반연장시간,  b.Holiext 휴일연장시간,               ');
          SQL.Add('       b.Nighthh  야간근로시간,   b.Holihh  휴일근로시간,                                        ');
          SQL.Add('       b.Ovtmamt  초과근무수당계, b.Ovmcamt 야근식대,                                            ');
          SQL.Add('       (SELECT CODEFNAME FROM PYCCODE WHERE CODENO = M.TCOMPANY AND  CODEID =''I902'') 소속회사  ');
          SQL.Add('  from PIMPMAS M, Pkhotsum b                                                                     ');
          SQL.Add(' where M.EMPNO    =    B.EMPNO                                                                   ');
          SQL.Add('   and M.empno    like ''Y%''                                                                    ');
          SQL.Add('   and b.ovtmyymm between to_char(ADD_MONTHS(to_date(:frduyymm,''YYYYMM''),-1),''YYYYMM'')       ');
          SQL.Add('                  and     to_char(ADD_MONTHS(to_date(:toduyymm,''YYYYMM''),-1),''YYYYMM'')       ');
          SQL.Add(' order by b.ovtmyymm, 5, M.empno                                                                 ');
          ParamByName('frduyymm').AsString := E_frPAYDATE.Text;
          ParamByName('toduyymm').AsString := E_toPAYDATE.Text;
          OPEN;
          PCNT_7.Caption := formatFloat('#,##0',Dm1.Query1.RecordCount* 1.0 )+'건 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end ;
end;

procedure TFM_Main.BitBtn8Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          CLOSE;
          SQL.Clear;
          SQL.Add('select M.empno 사번, M.korname 성명,                                                                         ');
          SQL.Add('       M.empdate 입사일, M.retdate 퇴사일,                                                                   ');
          SQL.Add('       CASE WHEN M.PSTATE > ''80'' THEN ''퇴사''                                                             ');
          SQL.Add('       ELSE ''재직'' END 상태,                                                                               ');
          SQL.Add(' 	  M.deptcode 부서코드,                                                                                  ');
          SQL.Add('  	  (select deptname from pycdept                                                                         ');
          SQL.Add('  	    where orgnum   = M.orgnum                                                                           ');
          SQL.Add('  	      and deptcode = M.deptcode) 부서명,                                                                ');
          SQL.Add('       b.workdate 근무일,                                                                                    ');
          SQL.Add('       decode(substr(b.WORKDATE,7,2),                                                                        ');
          SQL.Add('       ''01'',DD1 ,''02'',DD2 ,''03'',DD3 ,''04'',DD4 ,''05'',DD5 ,''06'',DD6 ,''07'',DD7 ,                  ');
          SQL.Add('       ''08'',DD8 ,''09'',DD9 ,''10'',DD10,''11'',DD11,''12'',DD12,''13'',DD13,''14'',DD14,                  ');
          SQL.Add('       ''15'',DD15,''16'',DD16,''17'',DD17,''18'',DD18,''19'',DD19,''20'',DD20,''21'',DD21,                  ');
          SQL.Add('       ''22'',DD22,''23'',DD23,''24'',DD24,''25'',DD25,''26'',DD26,''27'',DD27,''28'',DD28,                  ');
          SQL.Add('       ''29'',DD29,''30'',DD30,''31'',DD31,null) 근무일근태코드,                                             ');
          SQL.Add('       (Select Duname From Pkcducod                                                                          ');
          SQL.Add('         Where Dukind=decode(substr(b.WORKDATE,7,2),                                                         ');
          SQL.Add('                      ''01'',DD1 ,''02'',DD2 ,''03'',DD3 ,''04'',DD4 ,''05'',DD5 ,''06'',DD6 ,''07'',DD7 ,   ');
          SQL.Add('                      ''08'',DD8 ,''09'',DD9 ,''10'',DD10,''11'',DD11,''12'',DD12,''13'',DD13,''14'',DD14,   ');
          SQL.Add('                      ''15'',DD15,''16'',DD16,''17'',DD17,''18'',DD18,''19'',DD19,''20'',DD20,''21'',DD21,   ');
          SQL.Add('                      ''22'',DD22,''23'',DD23,''24'',DD24,''25'',DD25,''26'',DD26,''27'',DD27,''28'',DD28,   ');
          SQL.Add('                      ''29'',DD29,''30'',DD30,''31'',DD31,null)) 근무일근태,                                 ');
          SQL.Add('       b.TIMEFROM 근무시작시간, b.TIMETO 근무종료시간,                                                       ');
          SQL.Add('       b.OTDESC   근무내역, b.CALCTIME 근무시간, b.Calcpay 비서수당,                                         ');
          SQL.Add('       NVL(b.CONYN,''N'') 결재여부, b.CONEMPNO 결재자사번, b.CONTIME 결재일시,                               ');
          SQL.Add('       (SELECT CODEFNAME FROM PYCCODE P WHERE P.CODENO = M.TCOMPANY AND  CODEID =''I902'') "소속회사"        ');
          SQL.Add('  from PIMPMAS M, pkbothis b, pkhduty a                                                                      ');
          SQL.Add(' where M.EMPNO    =    B.EMPNO                                                                               ');
          SQL.Add('   and A.EMPNO    =    B.EMPNO                                                                               ');
          SQL.Add('   and A.duyymm   =    substr(b.WORKDATE,1,6)                                                                ');
          SQL.Add('   and M.empno    like ''Y%''                                                                                ');
          SQL.Add('   and b.workdate between to_char(ADD_MONTHS(to_date(:frduyymm,''YYYYMM''),-1),''YYYYMM'')||''01''           ');
          SQL.Add('                      and to_char(LAST_DAY(ADD_MONTHS(to_date(:toduyymm,''YYYYMM''),-1)),''YYYYMMDD'')       ');
          SQL.Add('   order by 5, M.empno, b.workdate                                                                           ');
          ParamByName('frduyymm').AsString := E_frPAYDATE.Text;
          ParamByName('toduyymm').AsString := E_toPAYDATE.Text;
          OPEN;
          PCNT_8.Caption := formatFloat('#,##0',Dm1.Query1.RecordCount* 1.0 )+'건 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end;
end;

procedure TFM_Main.BitBtn9Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select M.empno 사번, M.korname 성명,                                                                         ');
          SQL.Add('       M.empdate 입사일, M.retdate 퇴사일,                                                                   ');
          SQL.Add('       CASE WHEN M.PSTATE > ''80'' THEN ''퇴사''                                                             ');
          SQL.Add('       ELSE ''재직'' END 상태,                                                                               ');
          SQL.Add(' 	  M.deptcode 부서코드,                                                                                  ');
          SQL.Add('  	  (select deptname from pycdept                                                                         ');
          SQL.Add('  	    where orgnum   = M.orgnum                                                                           ');
          SQL.Add('  	      and deptcode = M.deptcode) 부서명,                                                                ');
          SQL.Add('       substr(b.workdate,1,6) 근무월,  sum(b.CALCTIME) 총근무시간, sum(b.CALCPAY) 비서수당총액,              ');
          SQL.Add('       (SELECT CODEFNAME FROM PYCCODE P WHERE P.CODENO = M.TCOMPANY AND  CODEID =''I902'') "소속회사"        ');
          SQL.Add('  from PIMPMAS M, pkbothis b                                                                                 ');
          SQL.Add(' where M.EMPNO    =    B.EMPNO                                                                               ');
          SQL.Add('   and M.empno    like ''Y%''                                                                                ');
          SQL.Add('   and b.workdate  between to_char(ADD_MONTHS(to_date(:frduyymm,''YYYYMM''),-1),''YYYYMM'')||''01''          ');
          SQL.Add('                       and to_char(LAST_DAY(ADD_MONTHS(to_date(:toduyymm,''YYYYMM''),-1)),''YYYYMMDD'')      ');
          SQL.Add('   and NVL(b.conyn,''N'')=''Y''                                                                              ');
          SQL.Add(' group by M.empno, M.korname, M.empdate, M.retdate, M.PSTATE,                                                ');
          SQL.Add('          M.orgnum, M.deptcode, substr(b.workdate,1,6),  M.TCOMPANY                                          ');
          SQL.Add(' order by substr(b.workdate,1,6), 5, M.empno                                                                 ');
          ParamByName('frduyymm').AsString := E_frPAYDATE.Text;
          ParamByName('toduyymm').AsString := E_toPAYDATE.Text;
          Open;
          PCNT_9.Caption := formatFloat('#,##0',Dm1.Query1.RecordCount* 1.0 )+'건 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end;
end;

procedure TFM_Main.BitBtn10Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          CLOSE;
          SQL.Clear;
          SQL.Add('Select A.DATANO 항목번호, A.DATAFLD 급여항목, A.DATANAME 급여항목명, a.CLEARTIME CLEAR일시, a.MOVETIME 갱신일시, --a.MOVECNT,          ');
          SQL.Add('       a.MOVEAMT 갱신금액,                                                                                                             ');
          SQL.Add('       B.Column_Name 급여마스터항목, B.Comments 급여마스터항목명,                                                                      ');
          SQL.Add('       Decode(B.Column_Name,                                                                                                           ');
          SQL.Add('              ''TAXPAY1'',     (Select Sum(TAXPAY1   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''TAXPAY2'',     (Select Sum(TAXPAY2   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''TAXPAY3'',     (Select Sum(TAXPAY3   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''TAXPAY4'',     (Select Sum(TAXPAY4   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''NOTAXPAY'',    (Select Sum(NOTAXPAY  )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''NOTAXPAY1'',   (Select Sum(NOTAXPAY1 )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''NOTAXPAY2'',   (Select Sum(NOTAXPAY2 )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''NOTAXPAY3'',   (Select Sum(NOTAXPAY3 )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''NOTAXPAY4'',   (Select Sum(NOTAXPAY4 )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''HOMESUPAMT'',  (Select Sum(HOMESUPAMT)  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''MCARAMT'',     (Select Sum(MCARAMT   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''MCARTAXAMT'',  (Select Sum(MCARTAXAMT)  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''OVMCAMT'',     (Select Sum(OVMCAMT   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''YBONAMT'',     (Select Sum(YBONAMT   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''AIDAMT3'',     (Select Sum(AIDAMT3   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''OVTMAMT'',     (Select Sum(OVTMAMT   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''MEDDAMT'',     (Select Sum(MEDDAMT   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''ANUDAMT'',     (Select Sum(ANUDAMT   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''SOGUPPAY'',    (Select Sum(SOGUPPAY  )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''DEDAMT2'',     (Select Sum(DEDAMT2   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''DEDAMT3'',     (Select Sum(DEDAMT3   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''EMPLDAMT'',    (Select Sum(EMPLDAMT  )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''DEDAMT1'',     (Select Sum(DEDAMT1   )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''AIDAMT11'',    (Select Sum(AIDAMT11  )  from pkmpmas where payyn = ''Y'' and empno like ''Y%''),                       ');
          SQL.Add('              ''AIDAMT12'',    (Select Sum(AIDAMT12  )  from pkmpmas where payyn = ''Y'' and empno like ''Y%'')) 급여마스터총금액      ');
          SQL.Add('      ,''=IF(F''||TO_CHAR(RANK() OVER (ORDER BY DATANO)+1)||''=I''||TO_CHAR(RANK() OVER (ORDER BY DATANO)+1)||'',"","check")'' 금액비교');
          SQL.Add('  From pkmpfld A,  Dba_Col_Comments B                                                                                                  ');
          SQL.Add(' Where B.Table_Name        =''PKMPMAS''                                                                                                ');
          SQL.Add('   And datakind            = 3                                                                                                         ');
          SQL.Add('   And upper(A.DATAFLD(+)) = B.Column_Name                                                                                             ');
          SQL.Add(' Order by 1                                                                                                                            ');
          Open;

          PCNT_10.Caption := formatFloat('#,##0',Dm1.Query1.RecordCount* 1.0 )+'건 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end;
end;

procedure TFM_Main.BitBtn11Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          CLOSE;
          SQL.Clear;
          SQL.Add('select M.empno 사번, M.korname 성명,                                                                       ');
          SQL.Add('       M.empdate 입사일, M.retdate 퇴사일,                                                                 ');
          SQL.Add('       CASE WHEN M.PSTATE > ''80'' THEN ''퇴사''                                                           ');
          SQL.Add('       ELSE ''재직'' END 상태,                                                                             ');
          SQL.Add(' 	  M.deptcode 부서코드,                                                                                ');
          SQL.Add('  	  (select deptname from pycdept                                                                       ');
          SQL.Add('  	    where orgnum   = M.orgnum                                                                         ');
          SQL.Add('  	      and deptcode = M.deptcode) 부서명,                      a.paydate               "지급월",       ');
          //SQL.Add('       TO_CHAR(LAST_DAY(TO_DATE(A.PAYDATE,''YYYYMM'')),''YYYYMMDD'')                       "근속_기준일",  ');
          //SQL.Add('       (LAST_DAY(TO_DATE(A.PAYDATE,''YYYYMM''))-TO_DATE(M.EMPDATE,''YYYYMMDD'')+1)         "근속_근무일",  ');
          SQL.Add('       Case when TO_CHAR(LAST_DAY(TO_DATE(A.PAYDATE,''YYYYMM'')),''YYYYMMDD'') <                           ');
          SQL.Add('       nvl(M.retdate,TO_CHAR(LAST_DAY(TO_DATE(A.PAYDATE,''YYYYMM'')),''YYYYMMDD'')) then                   ');
          SQL.Add('       TO_CHAR(LAST_DAY(TO_DATE(A.PAYDATE,''YYYYMM'')),''YYYYMMDD'')                else                   ');
          SQL.Add('       nvl(M.retdate,TO_CHAR(LAST_DAY(TO_DATE(A.PAYDATE,''YYYYMM'')),''YYYYMMDD'')) end    "근속_기준일",  ');
          SQL.Add('       Case when TO_CHAR(LAST_DAY(TO_DATE(A.PAYDATE,''YYYYMM'')),''YYYYMMDD'') <                           ');
          SQL.Add('       nvl(M.retdate,TO_CHAR(LAST_DAY(TO_DATE(A.PAYDATE,''YYYYMM'')),''YYYYMMDD'')) then                   ');
          SQL.Add('       (LAST_DAY(TO_DATE(A.PAYDATE,''YYYYMM''))-TO_DATE(M.EMPDATE,''YYYYMMDD'')+1)  else                   ');
          SQL.Add('       (TO_DATE(nvl(M.retdate,TO_CHAR(LAST_DAY(TO_DATE(A.PAYDATE,''YYYYMM'')),''YYYYMMDD'')),''YYYYMMDD'') ');
          SQL.Add('        -TO_DATE(M.EMPDATE,''YYYYMMDD'')+1)                                         end    "근속_근무일",  ');
          SQL.Add('       C.TOTPAY                                                                            "연봉",         ');
          SQL.Add('       A.FIXPAY                                                                            "월정연봉",     ');
          SQL.Add('       A.DEDAMT1                                                                           "관리수수료",   ');
          SQL.Add('       A.OVTMAMT                                                                           "초과근무수당", ');
          SQL.Add('       A.AIDAMT11                                                                          "비서수당",     ');
          SQL.Add('       A.MCARAMT                                                                           "식대교통비",   ');
          SQL.Add('       (SELECT CODEFNAME FROM PYCCODE P WHERE P.CODENO = M.TCOMPANY AND  CODEID =''I902'') "소속회사"      ');
          SQL.Add('  FROM PKMPYCALC A, PKHYPHIS C, PIMPMAS M                                                                  ');
          SQL.Add(' WHERE C.YEARPAYNUM(+) = :pyearpaynum                                                                      ');
          SQL.Add('   AND A.EMPNO      = M.EMPNO                                                                              ');
          SQL.Add('   AND A.EMPNO      = C.EMPNO(+)                                                                           ');
          SQL.Add('   and A.PAYDATE  between :frpaydate and :topaydate                                                        ');
          SQL.Add('   AND A.EMPNO      LIKE ''Y%''                                                                            ');
          SQL.Add(' Order By A.PAYDATE, 5, c.Empno                                                                            ');
          Parambyname('pyearpaynum').AsString := vYearpaynum;
          ParamByName('frpaydate').AsString   := E_frPAYDATE.Text;
          ParamByName('topaydate').AsString   := E_toPAYDATE.Text;
          Open;
          PCNT_11.Caption := formatFloat('#,##0',Dm1.Query1.RecordCount* 1.0 )+'건 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end;
end;

procedure TFM_Main.BitBtn12Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          CLOSE;
          SQL.Clear;
          SQL.Add('SELECT c.paydate "지급월",c.empno "사번", M.korname "성명",  ');
          SQL.Add('      (SELECT FINCODE  FROM PYCDEPT D                        ');
          SQL.Add('        WHERE D.DEPTCODE = C.DEPTCODE                        ');
          SQL.Add('          AND D.ORGNUM   = C.ORGNUM) "재무부서코드",         ');
          SQL.Add('      (SELECT CODENAME FROM PYCCODE                          ');
          SQL.Add('        WHERE CODEID     = ''I160''                          ');
          SQL.Add('          AND CODENO     = C.BLDCODE) "근무지명",            ');
          SQL.Add('       NVL(FIXPAY     ,0) "월정급여",                        ');
          SQL.Add('       NVL(NOTAXPAY1,  0) "수수료",                          ');
          SQL.Add('       NVL(OVTMAMT    ,0) "초과근무수당",                    ');
          SQL.Add('       NVL(AIDAMT1    ,0) "기타 수당1",                      ');
          SQL.Add('       NVL(AIDAMT2    ,0) "기타 수당2",                      ');
          SQL.Add('       NVL(AIDAMT3    ,0) "유치수수료",                      ');
          SQL.Add('	  NVL(BONUSAMT   ,0) "정기상여금",                      ');
          SQL.Add('       NVL(SBONAMT    ,0) "특상",                            ');
          SQL.Add('       NVL(MBONAMT    ,0) "월차수당",                        ');
          SQL.Add('       NVL(YBONAMT    ,0) "연차",                            ');
          SQL.Add('       NVL(MCARAMT    ,0) "식대교통비",                      ');
          SQL.Add('       NVL(LECTSUPAMT ,0) "사내강사료",                      ');
          SQL.Add('       NVL(HOMESUPAMT ,0) "선복비",                          ');
          SQL.Add('       NVL(SOPAYSUM   ,0) "소급급여",                        ');
          SQL.Add('       NVL(OVMCAMT    ,0) "야근식대",                        ');
          SQL.Add('       NVL(TICKETAMT  ,0) "사용식권금액",                    ');
          SQL.Add('       NVL(MEDDAMT    ,0) "건강보험료",                      ');
          SQL.Add('       NVL(EMPLDAMT   ,0) "고용보험료",                      ');
          SQL.Add('       NVL(ANUDAMT    ,0) "국민연금",                        ');
          SQL.Add('       NVL(DEDAMT1    ,0) "산재보험료",                      ');
          SQL.Add('       NVL(TAXPAY1    ,0) "과세급여1",                       ');
          SQL.Add('       NVL(TAXPAY2    ,0) "과세급여2",                       ');
          SQL.Add('       NVL(TAXPAY3    ,0) "과세급여3",                       ');
          SQL.Add('	  NVL(TAXPAY4    ,0) "과세급여4",                       ');
          SQL.Add('       NVL(NOTAXPAY2  ,0) "기타비과세2",                     ');
          SQL.Add('       NVL(NOTAXPAY3  ,0) "기타비과세3",                     ');
          SQL.Add('       NVL(NOTAXPAY4  ,0) "기타비과세4",                     ');
          SQL.Add('       NVL(DEDAMT2    ,0) "기타공제2",                       ');
          SQL.Add('       NVL(DEDAMT3    ,0) "기타공제3",                       ');
          SQL.Add('       NVL(DEDAMT4    ,0) "기타공제4",                       ');
          SQL.Add('       NVL(DEDAMT5    ,0) "기타공제5",                       ');
          SQL.Add('       NVL(DEDSUM     ,0) "공제총액",                        ');
          SQL.Add('       PAYSUM             "지급총액",                        ');
          SQL.Add('       REALPAY            "실지급액",                        ');
          SQL.Add('      (SELECT CODENAME FROM PYCCODE                          ');
          SQL.Add('        WHERE CODEID = ''I902''                              ');
          SQL.Add('          AND CODENO =M.TCOMPANY) 소속회사                   ');
          SQL.Add('  FROM PKMPYCALC C, PIMPMAS M                                ');
          SQL.Add(' WHERE c.PAYDATE  between :frpaydate and :topaydate          ');
          SQL.Add('   AND c.empno    = m.empno                                  ');
          SQL.Add(' Order By c.PAYDATE, c.Empno                                 ');
          ParamByName('frpaydate').AsString := E_frPAYDATE.Text;
          ParamByName('topaydate').AsString := E_toPAYDATE.Text;
          Open;
          PCNT_12.Caption := formatFloat('#,##0',Dm1.Query1.RecordCount* 1.0 )+'건 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end;
end;

procedure TFM_Main.BitBtn13Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          CLOSE;
          SQL.Clear;
          SQL.Add('Select Header_Name "계정과목", Fincode   "재무용부서코드", Deptcode "부서코드",                                         ');
          SQL.Add('       Tcompany    "회사코드", Codefname "소속회사",       Accno    "계정코드", S_Amt "지급액"                          ');
          SQL.Add('  From                                                                                                                  ');
          SQL.Add('      (Select ''파견직사무용역비''       Header_Name,                                                                   ');
          SQL.Add('              Nvl(C.Fincode, ''00000'')  Fincode,                                                                       ');
          SQL.Add('              Nvl(C.Deptcode,''-----'')  Deptcode,                                                                      ');
          SQL.Add('              M.Tcompany,                                                                                               ');
          SQL.Add('              (Select Codefname From Pyccode P Where P.Codeno = M.Tcompany And  Codeid =''I902'') Codefname,            ');
          SQL.Add('              ''61351310''               Accno,                                                                         ');
          SQL.Add('              Sum(Realpay)               S_Amt                                                                          ');
          SQL.Add('         From Pycdept C, Pkmpycalc A, Pimpmas M                                                                         ');
          SQL.Add('        Where A.PAYDATE  between :frpaydate and :topaydate                                                              ');
          SQL.Add('          And A.Empno   = M.Empno                                                                                       ');
          SQL.Add('          And Decode(Substr(A.Pstate,1,1),''7'',(Select Value1 From Pimvari                                             ');
          SQL.Add('                                                  Where Gubun = ''00'' And Sgubun = ''0001'' ), A.Orgnum) = C.Orgnum    ');
          SQL.Add('          And Decode(Substr(A.Pstate,1,1),''7'',(Select Deptcode From Pycdept                                           ');
          SQL.Add('                                                  Where (Orgnum, fincode)=(select Orgnum, EMPTY_FINCODE from PSAPFINCODE');
          SQL.Add('                                                                            where orgnum =(Select Value1 From Pimvari   ');
          SQL.Add('                                                                                            Where Gubun  = ''00''       ');
          SQL.Add('                                                                                              And Sgubun = ''0001'' ))) ');
          SQL.Add('                                               , A.Deptcode) = C.Deptcode                                               ');
          SQL.Add('        Group By Nvl(C.Fincode,''00000''), Nvl(C.Deptcode,''-----''), M.Tcompany                                        ');
          SQL.Add('        Union                                                                                                           ');
          SQL.Add('       Select ''파견직사무용역비''       Header_Name,                                                                   ');
          SQL.Add('              Nvl(C.Fincode, ''00000'')  Fincode,                                                                       ');
          SQL.Add('              Nvl(C.Deptcode,''-----'')  Deptcode,                                                                      ');
          SQL.Add('              '''',                                                                                                     ');
          SQL.Add('              '''',                                                                                                     ');
          SQL.Add('              ''21123210''               Accno,                                                                         ');
          SQL.Add('              Sum(Realpay )              S_Amt                                                                          ');
          SQL.Add('         From Pkmpycalc A, Pycdept C                                                                                    ');
          SQL.Add('        Where A.PAYDATE  between :frpaydate and :topaydate                                                              ');
          SQL.Add('          And (C.Orgnum , C.fincode) = (select Orgnum, EMPTY_FINCODE from PSAPFINCODE                                   ');
          SQL.Add('                                         where orgnum =(Select Value1 From Pimvari                                      ');
          SQL.Add('                                                         Where Gubun = ''00'' And Sgubun = ''0001'' ))                  ');
          SQL.Add('        Group By  Nvl(C.Fincode,''00000''), Nvl(C.Deptcode,''-----'')                                                   ');
          SQL.Add('       )                                                                                                                ');
          ParamByName('frpaydate').AsString := E_frPAYDATE.Text;
          ParamByName('topaydate').AsString := E_toPAYDATE.Text;
          Open;
          PCNT_13.Caption := formatFloat('#,##0',Dm1.Query1.RecordCount* 1.0 )+'건 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end;
end;

procedure TFM_Main.BitBtn14Click(Sender: TObject);
begin
     with dm1.Query1 do
     begin
          CLOSE;
          SQL.Clear;
          SQL.Add('SELECT c.paydate "지급월",c.empno "사번", M.korname "성명",  ');
          SQL.Add('      (SELECT FINCODE  FROM PYCDEPT D                        ');
          SQL.Add('        WHERE D.DEPTCODE = C.DEPTCODE                        ');
          SQL.Add('          AND D.ORGNUM   = C.ORGNUM) "재무부서코드",         ');
          SQL.Add('      (SELECT CODENAME FROM PYCCODE                          ');
          SQL.Add('        WHERE CODEID     = ''I160''                          ');
          SQL.Add('          AND CODENO     = C.BLDCODE) "근무지명",            ');
          SQL.Add('       NVL(FIXPAY     ,0) "월정급여",                        ');
          SQL.Add('       NVL(NOTAXPAY1,  0) "수수료",                          ');
          SQL.Add('       NVL(OVTMAMT    ,0) "초과근무수당",                    ');
          SQL.Add('       NVL(AIDAMT1    ,0) "기타 수당1",                      ');
          SQL.Add('       NVL(AIDAMT2    ,0) "기타 수당2",                      ');
          SQL.Add('       NVL(AIDAMT3    ,0) "유치수수료",                      ');
          SQL.Add('       NVL(BONUSAMT   ,0) "정기상여금",                      ');
          SQL.Add('       NVL(SBONAMT    ,0) "특상",                            ');
          SQL.Add('       NVL(MBONAMT    ,0) "월차수당",                        ');
          SQL.Add('       NVL(YBONAMT    ,0) "연차",                            ');
          SQL.Add('       NVL(MCARAMT    ,0) "식대교통비",                      ');
          SQL.Add('       NVL(LECTSUPAMT ,0) "사내강사료",                      ');
          SQL.Add('       NVL(HOMESUPAMT ,0) "선복비",                          ');
          SQL.Add('       NVL(SOPAYSUM   ,0) "소급급여",                        ');
          SQL.Add('       NVL(OVMCAMT    ,0) "야근식대",                        ');
          SQL.Add('       NVL(TICKETAMT  ,0) "사용식권금액",                    ');
          SQL.Add('       NVL(MEDDAMT    ,0) "건강보험료",                      ');
          SQL.Add('       NVL(EMPLDAMT   ,0) "고용보험료",                      ');
          SQL.Add('       NVL(ANUDAMT    ,0) "국민연금",                        ');
          SQL.Add('       NVL(DEDAMT1    ,0) "산재보험료",                      ');
          SQL.Add('       NVL(TAXPAY1    ,0) "과세급여1",                       ');
          SQL.Add('       NVL(TAXPAY2    ,0) "과세급여2",                       ');
          SQL.Add('       NVL(TAXPAY3    ,0) "과세급여3",                       ');
          SQL.Add('       NVL(TAXPAY4    ,0) "과세급여4",                       ');
          SQL.Add('       NVL(NOTAXPAY2  ,0) "기타비과세2",                     ');
          SQL.Add('       NVL(NOTAXPAY3  ,0) "기타비과세3",                     ');
          SQL.Add('       NVL(NOTAXPAY4  ,0) "기타비과세4",                     ');
          SQL.Add('       NVL(DEDAMT2    ,0) "기타공제2",                       ');
          SQL.Add('       NVL(DEDAMT3    ,0) "기타공제3",                       ');
          SQL.Add('       NVL(DEDAMT4    ,0) "기타공제4",                       ');
          SQL.Add('       NVL(DEDAMT5    ,0) "기타공제5",                       ');
          SQL.Add('       NVL(DEDSUM     ,0) "공제총액",                        ');
          SQL.Add('       PAYSUM             "지급총액",                        ');
          SQL.Add('       REALPAY            "실지급액",                        ');
          SQL.Add('      (SELECT CODENAME FROM PYCCODE                          ');
          SQL.Add('        WHERE CODEID = ''I902''                              ');
          SQL.Add('          AND CODENO =M.TCOMPANY) 소속회사                   ');
          SQL.Add('  FROM PKHPYHIS C, PIMPMAS M                                 ');
          SQL.Add(' WHERE c.PAYDATE  Between :frpaydate AND :topaydate          ');
          SQL.Add('   AND c.empno    = m.empno                                  ');
          SQL.Add(' Order By c.PAYDATE, c.empno                                 ');
          ParamByName('frpaydate').AsString := E_frPAYDATE.Text;
          ParamByName('topaydate').AsString := E_toPAYDATE.Text;
          Open;
          PCNT_14.Caption := formatFloat('#,##0',Dm1.Query1.RecordCount* 1.0 )+'건 ';
          gSaveTitle := (sender as TBitBtn).caption;
          StatusBar1.Panels[0].Text := ' ' + gSaveTitle +' 조회를 완료했습니다.';
     end;
end;

procedure TFM_Main.SP_toPayDateClick(Sender: TObject);
begin
     GetCalendar(E_TOPAYDate);
end;

procedure TFM_Main.E_toPAYDATEChange(Sender: TObject);
begin
     PCNT_1.Caption            := '';
     PCNT_2.Caption            := '';
     PCNT_3.Caption            := '';
     PCNT_4.Caption            := '';
     PCNT_5.Caption            := '';
     PCNT_6.Caption            := '';
     PCNT_7.Caption            := '';
     PCNT_8.Caption            := '';
     PCNT_9.Caption            := '';
     PCNT_10.Caption           := '';
     PCNT_11.Caption           := '';
     PCNT_12.Caption           := '';
     PCNT_13.Caption           := '';
     PCNT_14.Caption           := '';
     StatusBar1.Panels[0].Text := '';
     Dm1.Query1.Close;
end;

end.
