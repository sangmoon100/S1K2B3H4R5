{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE2280C(하나로 입사지원서 출력)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 이민용
Version         : 1.00
Date            : 2003.12.22
Update contents
  버전     수정일     수정자   관련근거        수정내용
  1.00   2003.12.22   이민용  전산처리 요청서  신규프로그램 개발
  1.01   2003.12.23   이민용  자체 개선        성명, 지원부서, 대학교, 대학원가 미존재면 메세지 출력
  1.02   2004.10.20   정규용  전산처리 요청서   하반기채용관련 수정 ㅋ
--------------------------------------------------------------------------------
}

unit pir20501;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, Tabs, TabNotBk,
  Mask, DBTables, Quickrpt,  DBGrids, pass, Datelib, Timeftp,
  Db , ComObj, OleCtrls,Grids, OnFocusButton, ComCtrls, OnShapeLabel,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo,PePrnview,
  OnLineLabel, OnDBGrid, OnGrDBGrid, Tmax_session, pebtnedit, peNumedit,OnInternetFTP,FileCtrl;

type
  TMainForm = class(TForm)

    Database1: TDatabase;
    Q_date: TQuery;
    PrinterSetup: TPrinterSetupDialog;
    SaveDialog1: TSaveDialog;
    SF_Main: TOnSchemeForm;
    Shape2: TShape;
    Label9: TLabel;
    BB_Screen: TOnFocusButton;
    BB_Print: TOnFocusButton;
    OnFocusButton2: TOnFocusButton;
    OnFocusButton3: TOnFocusButton;
    SB_Help: TStatusBar;
    E_FullName: TOnEdit;
    E_UnivName: TOnEdit;
    E_GRD1NAME: TOnEdit;
    E_rank2: TOnEdit;
    DataSource1: TDataSource;
    btn_Select: TOnFocusButton;
    CB_GUBUN: TOnComboEdit;
    CB_Bumun: TOnComboEdit;
    CB_JOBKIND: TOnComboEdit;
    CB_AREA: TOnComboEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    OnEdit2: TOnEdit;
    Shape1: TShape;
    Label1: TLabel;
    OnEdit3: TOnEdit;
    DbGrid1: TOnGrDbGrid;
    OnEdit5: TOnEdit;
    Eda_toeic: TPeJeonNumEdit;
    CB_BOHUN: TOnComboEdit;
    E_FileName: TOnEdit;
    filesel: TSpeedButton;
    FileOpen: TOpenDialog;
    Query1: TQuery;
    OnMaskEdit1: TOnMaskEdit;
    qry_Cnt: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure OnFocusButton2Click(Sender: TObject);
    procedure OnFocusButton3Click(Sender: TObject);
    procedure DataSelect;
    procedure btn_SelectClick(Sender: TObject);
//    procedure CB_BumunChange(Sender: TObject);
    procedure CB_GUBUNChange(Sender: TObject);
    procedure fileselClick(Sender: TObject);
    procedure E_FileNameChange(Sender: TObject);
    procedure Eda_toeicKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BB_ScreenClick(Sender: TObject);
    procedure BB_PrintClick(Sender: TObject);

  private
    pempno, pkorname, password: string;
    start: Integer;
    v_FullName      : string;
    v_Dept          : string;
    v_DeptName      : string;
    v_UnivName      : string;
    v_GRD1NAME      : string;
    v_rank1         : integer;
    v_rank2         : integer;
    eFile           : TextFile;
    v_toeic         : real;
    strSQl_Select : String;
    { Private declarations }

  public
    { Public declarations }
    procedure PicDownLoad(FileName : String);
  end;

  const RabasDate = '20080501';
var
  MainForm        : TMainForm;
  FReport         : TQuickRep;
  ErrorHelp       : array[0..255] of char;
  HomeDir,rStr,strInSQL     : string;
  pageCnt : integer; {출력장수}

implementation

uses pir20502, pir20503;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
     start := 0;
end;

procedure TMainForm.FormActivate(Sender: TObject);
var
     i: integer;
begin
     Application.ProcessMessages;

     if Start = 0 then
     begin
          pempno   := PassEmp(cmdline, 1);
          pkorname := PassEmp(cmdline, 2);
          password := PassEmp(cmdline, 3);
          Database1.Connected := false;
          for i := 0 to Database1.Params.Count-1 do
          begin
               if System.Pos('SERVER NAME', Database1.Params[i]) > 0 then Database1.Params[i] := 'SERVER NAME='+PassEmp(CmdLine,13);
               if System.Pos('USER NAME', Database1.Params[i])   > 0 then Database1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
               if System.Pos('PASSWORD', Database1.Params[i])    > 0 then Database1.Params[i] := 'PASSWORD='+PassEmp(CmdLine,6);
          end;

          with Q_date do
          begin
               Close;
               SQL.Clear;
               SQL.Text := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') sys_date FROM DUAL';
               Open;
               rStr := FieldByName('sys_date').AsString;
               Close;
          end;

          HomeDir := HomeDirOpen;
     end;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin

  if start = 0 then begin
    start := 1;
    Application.ProcessMessages;
    Try
       Database1.Connected := True;
    EXCEPT ON E : EDataBaseError DO begin
       MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
       halt(1);
    end;
   end;

   CB_GUBUN.ItemIndex := 3;
   CB_GUBUNChange(nil);
   CB_Bumun.ItemIndex := 0;
   CB_AREA.ItemIndex  := 8;
  end;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TMainForm.BB_CloseClick(Sender: TObject);
begin
    Close;
end;

procedure TMainForm.OnFocusButton2Click(Sender: TObject);
begin
     PrinterSetup.Execute;
end;

procedure TMainForm.OnFocusButton3Click(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.DataSelect;
var
     strSQl_Select : String;
     strSQl_From   : String;
     strSQl_Where  : String;
begin
     v_FullName := E_FullName.Text;
     v_UnivName := E_UnivName.Text;
     v_GRD1NAME := E_GRD1NAME.Text;
//     v_rank1    := strTointdef(E_rank1.Text,0);
//     v_rank2    := strTointdef(E_rank2.Text,0);
//     v_toeic    := Eda_toeic.value;

     with PrintForm.Qry_recuit  do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select a.*,                                                                                                                        ');
          SQL.Add('       nvl((select majorname from prectmajor where codeid = ''I225'' and majorcode = a.univmajorid),'''')  univmajor,              ');
          SQL.Add('       nvl((select majorname from prectmajor where codeid = ''I225'' and majorcode = a.univminorid),'''')  univminor,              ');
          SQL.Add('       nvl((select majorname from prectmajor where codeid = ''I225'' and majorcode = a.BADUNIVMAJOR),'''') BADUNIVMAJORR,          ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I225'' and codeno = a.grd1majorid),'''') grd1major,                      ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I231'' and codeno = a.licence1   ),'''') licence1name,                   ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I231'' and codeno = a.licence2   ),'''') licence1name2,                  ');
          SQL.Add('       decode(a.armykind,''1'',''군필'',''2'',''면제'',''3'',''미필'') armykindname,                                               ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I034'' and codeno = a.armygrade  ),'''') armygradename,                  ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I037'' and codeno = a.armyexcept ),'''') armyexceptname,                 ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I211'' and codeno = a.f1type     ),'''') f1typename,                     ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I221'' and codeno = a.f1grade    ),'''') f1gradename,                    ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I211'' and codeno = a.f2type     ),'''') f2typename,                     ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I221'' and codeno = a.f2grade    ),'''') f2gradename,                    ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I211'' and codeno = a.f3type     ),'''') f3typename,                     ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I221'' and codeno = a.f3grade    ),'''') f3gradename,                    ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I211'' and codeno = a.f4type     ),'''') f4typename,                     ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I221'' and codeno = a.f4grade    ),'''') f4gradename,                    ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I211'' and codeno = a.f5type     ),'''') f5typename,                     ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I221'' and codeno = a.f5grade    ),'''') f5gradename,                    ');
          SQL.Add('       DECODE(gubun,''1'',(select codefname from pyccode where codeid = ''C051'' and codeno = a.dept),                             ');
          SQL.Add('                    ''2'',(select codefname from pyccode where codeid = ''C052'' and codeno = a.dept),                             ');
          SQL.Add('                    ''3'',(select codefname from pyccode where (codeid = ''C051'' or codeid = ''C052'') and codeno = a.dept)) deptnm,                      ');
          SQL.Add('       decode(a.aparea,''1'',''전국'',''2'',''서울/수도권'',''3'',''충청'',''4'',''경남'',''5'',''경북'',''6'',''전남'',''7'',''전북'') apareanm,           ');
          //SQL.Add('       decode(a.apjobkind,''11'',''회계'',      ''12'',''영업관리'',       ''13'',''영업'',''14'',''기술'',''15'',''통신제도기획'',');
          //SQL.Add('                          ''16'',''정보화추진'',''17'',''국제전화/데이터'',''18'',''통화서비스(상품기획)'',''19'',''TM관리'',      ');
          //SQL.Add('                          ''20'',''지능망관리'') apjobkindnm,                                                                      ');
          SQL.Add('       nvl((select majorname from prectmaj where codeid = ''I225'' and majorcode = a.badunivmajor),'''') badunivmajor,             ');
          SQL.Add('       decode(a.gubun,''1'',''신입'',''2'',''경력'') gubunnm,                                                                      ');
          SQL.Add('       substr(a.regno,1,6)||''-''||substr(a.regno,7,13) regnoNM                                                                    ');
          SQL.Add('from prectmas a                                                                                                                    ');
          SQL.Add('where a.rabasdate = '''+RabasDate+'''                                                                                              ');

          //응시 자격
          if CB_GUBUN.KeyItems[CB_GUBUN.itemindex] <> '3' then
               SQL.Add('and a.gubun ='''+CB_GUBUN.KeyItems[CB_GUBUN.itemindex]+'''');

          //응시부문
          if CB_Bumun.KeyItems[CB_Bumun.ItemIndex] <> '0' then
               SQL.Add('and a.dept = '''+CB_Bumun.KeyItems[CB_Bumun.ItemIndex]+'''');

          //응시직종
          //if (CB_JOBKIND.items.Count > 0) then
          //begin
          //     if (CB_JOBKIND.KeyItems[CB_JOBKIND.ItemIndex] <> '0') then
          //          SQL.Add('and a.apjobkind = '''+CB_JOBKIND.KeyItems[CB_JOBKIND.ItemIndex]+'''');
          //end;

          //응시지역
          if (CB_AREA.Text <> '전체선택') and (CB_AREA.Text <> '') then
               Sql.Add('and A.APAREA = '''+Copy(CB_AREA.Text,1,1)+'''');

          //성명
          if MainForm.v_FullName <> '' then
          begin
               Sql.Add('and a.FULLNAME like :FULLNAME ');
               ParamByName('FULLNAME').AsString := v_FullName+'%';
          end;

          //대학교
          if MainForm.v_UnivName <> '' then
          begin
               Sql.Add('and UNIVNAME like :UNIVNAME ');
               ParamByName('UNIVNAME').AsString := '%'+v_UnivName+'%';
          end;

          //대학원
          if MainForm.v_GRD1NAME <> '' then
          begin
               Sql.Add('and GRD1NAME like :GRD1NAME');
               ParamByName('GRD1NAME').AsString := '%'+v_GRD1NAME+'%';
          end;

          //토익
          if Eda_toeic.Text <> '0' then
          begin
               Sql.Add('and a.ENGSCORE >= :ENGSCORE');
               ParamByName('ENGSCORE').AsString := Eda_toeic.Text;
          end;

          //보훈여부
          if CB_BOHUN.KeyItems[CB_BOHUN.itemindex] <> '3' then
               Sql.Add('and BOHUN ='''+CB_BOHUN.KeyItems[CB_BOHUN.itemindex]+'''');

          //지원일자
          if OnMaskEdit1.Text <> '    -  -  ' then
          begin
               Sql.Add('and a.ymd = :ymd ');
               ParamByName('ymd').AsString := OnMaskEdit1.Text;
          end;

          Sql.Add('order by gubun, deptnm, rid     ');

          Open;
     end;
end;

procedure TMainForm.btn_SelectClick(Sender: TObject);
begin
     DataSelect;
end;
{
procedure TMainForm.CB_BumunChange(Sender: TObject);
begin
     CB_JOBKIND.Items.Clear;
     CB_JOBKIND.KeyItems.Clear;
     CB_JOBKIND.Enabled := True;
     CB_JOBKIND.Text := '전체선택';
     CB_AREA.Items.Clear;
     CB_AREA.KeyItems.Clear;
     CB_AREA.Enabled := True;
     CB_AREA.Text := '전체선택';
     
     case StrToInt(CB_Bumun.KeyItems[CB_Bumun.itemindex]) of
       1: begin
               CB_JOBKIND.Items.Add('11: 회계');
               CB_JOBKIND.KeyItems.Add('11');
               CB_JOBKIND.Items.Add('12: 영업관리');
               CB_JOBKIND.KeyItems.Add('12');
               CB_JOBKIND.Items.Add('전체선택');
               CB_JOBKIND.KeyItems.Add('0');
               CB_AREA.Items.Add('1: 서울');
               CB_AREA.KeyItems.Add('1');
               CB_AREA.Items.Add('전체선택');
               CB_AREA.KeyItems.Add('0');
          end;
       2: begin
               CB_JOBKIND.Items.Add('13: 영업');
               CB_JOBKIND.KeyItems.Add('13');
               CB_JOBKIND.Items.Add('전체선택');
               CB_JOBKIND.KeyItems.Add('0');
               CB_AREA.Items.Add('1: 서울');
               CB_AREA.KeyItems.Add('1');
               CB_AREA.Items.Add('3: 대전');
               CB_AREA.KeyItems.Add('3');
               CB_AREA.Items.Add('전체선택');
               CB_AREA.KeyItems.Add('0');
          end;
       3: begin
               CB_JOBKIND.Items.Add('14: 기술');
               CB_JOBKIND.KeyItems.Add('14');
               CB_JOBKIND.Items.Add('전체선택');
               CB_JOBKIND.KeyItems.Add('0');
               CB_AREA.Items.Add('2: 서울/경기');
               CB_AREA.KeyItems.Add('2');
               CB_AREA.Items.Add('4: 부산');
               CB_AREA.KeyItems.Add('4');
               CB_AREA.Items.Add('전체선택');
               CB_AREA.KeyItems.Add('0');
          end;
       4: begin
               CB_JOBKIND.Items.Add('15: 통신제도기획');
               CB_JOBKIND.KeyItems.Add('15');
               CB_JOBKIND.Items.Add('전체선택');
               CB_JOBKIND.KeyItems.Add('0');
               CB_AREA.Items.Add('1: 서울');
               CB_AREA.KeyItems.Add('1');
               CB_AREA.Items.Add('전체선택');
               CB_AREA.KeyItems.Add('0');
          end;
       5: begin
               CB_JOBKIND.Items.Add('16: 정보화추진');
               CB_JOBKIND.KeyItems.Add('16');
               CB_JOBKIND.Items.Add('전체선택');
               CB_JOBKIND.KeyItems.Add('0');
               CB_AREA.Items.Add('1: 서울');
               CB_AREA.KeyItems.Add('1');
               CB_AREA.Items.Add('전체선택');
               CB_AREA.KeyItems.Add('0');
          end;
       6: begin
               CB_JOBKIND.Items.Add('17: 국제전화/데이터');
               CB_JOBKIND.KeyItems.Add('17');
               CB_JOBKIND.Items.Add('전체선택');
               CB_JOBKIND.KeyItems.Add('0');
               CB_AREA.Items.Add('1: 서울');
               CB_AREA.KeyItems.Add('1');
               CB_AREA.Items.Add('전체선택');
               CB_AREA.KeyItems.Add('0');
          end;
       7: begin
               CB_JOBKIND.Items.Add('18: 통신서비스(상품기획)');
               CB_JOBKIND.KeyItems.Add('18');
               CB_JOBKIND.Items.Add('전체선택');
               CB_JOBKIND.KeyItems.Add('0');
               CB_AREA.Items.Add('1: 서울');
               CB_AREA.KeyItems.Add('1');
               CB_AREA.Items.Add('전체선택');
               CB_AREA.KeyItems.Add('0');
          end;
       8: begin
               CB_JOBKIND.Items.Add('19: TM관리');
               CB_JOBKIND.KeyItems.Add('19');
               CB_JOBKIND.Items.Add('전체선택');
               CB_JOBKIND.KeyItems.Add('0');
               CB_AREA.Items.Add('1: 서울');
               CB_AREA.KeyItems.Add('1');
               CB_AREA.Items.Add('전체선택');
               CB_AREA.KeyItems.Add('0');
          end;
       9: begin
               CB_JOBKIND.Items.Add('20: 지능망개발');
               CB_JOBKIND.KeyItems.Add('20');
               CB_JOBKIND.Items.Add('전체선택');
               CB_JOBKIND.KeyItems.Add('0');
               CB_AREA.Items.Add('1: 서울');
               CB_AREA.KeyItems.Add('1');
               CB_AREA.Items.Add('전체선택');
               CB_AREA.KeyItems.Add('0');
          end;
       0: begin
               CB_JOBKIND.Items.Clear;
               CB_JOBKIND.Text := '';
               CB_JOBKIND.Enabled := False;
               CB_AREA.Items.Clear;
               CB_AREA.Text := '';
               CB_AREA.Enabled := False;
          end;
     end;
end;
}
procedure TMainForm.CB_GUBUNChange(Sender: TObject);
begin
     CB_Bumun.Items.Clear;
     CB_Bumun.KeyItems.Clear;

     case StrToInt(CB_Gubun.KeyItems[CB_Gubun.itemindex]) of
    1: begin
            CB_Bumun.Items.Add('전체선택');
            CB_Bumun.KeyItems.Add('0');

            with qry_Cnt do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add(' SELECT * FROM pyccode WHERE codeid=''C051''  and useyn = ''Y'' order by codeno  ');
                 Open;

                 While Not Eof do
                 begin
                      CB_Bumun.Items.Add(FieldByName('codeno').AsString + ': ' + FieldByName('codefname').AsString);
                      CB_Bumun.KeyItems.Add(FieldByName('codeno').AsString);
                      Next;
                 end;
            end;
       end;
    2: begin
            CB_Bumun.Items.Add('전체선택');
            CB_Bumun.KeyItems.Add('0');

            with qry_Cnt do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add(' SELECT * FROM pyccode WHERE codeid=''C052'' and useyn = ''Y''  order by codeno ');
                 Open;

                 While Not Eof do
                 begin
                      CB_Bumun.Items.Add(FieldByName('codeno').AsString + ': ' + FieldByName('codefname').AsString);
                      CB_Bumun.KeyItems.Add(FieldByName('codeno').AsString);
                      Next;
                 end;
            end;
          end;
       3: begin
            CB_Bumun.Items.Add('전체선택');
            CB_Bumun.KeyItems.Add('0');

            with qry_Cnt do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add(' SELECT * FROM pyccode WHERE (codeid=''C051'' or codeid=''C052'')  and useyn = ''Y'' order by codeid, codeno ');
                 Open;

                 While Not Eof do
                 begin
                      CB_Bumun.Items.Add(FieldByName('codeno').AsString + ': ' + FieldByName('codefname').AsString);
                      CB_Bumun.KeyItems.Add(FieldByName('codeno').AsString);
                      Next;
                 end;
            end;
       end;
     end;
     
     CB_Bumun.Enabled := True;
     CB_Bumun.Text := '전체선택';
end;

procedure TMainForm.fileselClick(Sender: TObject);
begin
     E_FileName.Text := '';
     DataSource1.DataSet.Close;
     FileOpen.Execute;
     E_FileName.Text := FileOpen.FileName;
     E_FileName.SetFocus;
end;

procedure TMainForm.E_FileNameChange(Sender: TObject);
var
     i, k : integer;
     str,empno  : string;
begin
     Application.ProcessMessages;
     if E_FileName.Text = '' then System.Exit;

     if (FileExists(E_FileName.Text) = False) then
     begin
          MessageBox(handle,'화일이 있는지 확인 하십시오..','에  러',MB_OK or $0020);
          E_FileName.SetFocus;
          System.Exit;
     end;

     with Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('delete from prectord');
          ExecSql;
     end;

     AssignFile(eFile,E_FileName.Text); System.ReSet(eFile);
     pagecnt := 0;

     while not EOF(efile) do
     begin
          Readln(eFile,str); inc(pagecnt);
     end; // 총읽은갯수를 파악한다..

     system.Close(efile);
     strInSQL := 'and a.rid in( ';
     i := 1; k := 0;
     AssignFile(eFile,E_FileName.Text); System.ReSet(eFile);

     while not EOF(efile) do
     begin
          Readln(eFile,str);    // 텍스테이타를 읽어온다..
          empno := PasString(str,',',1);

          if k <> 0 then strInSQL := strInSQL + ', ';
          strInSQL := strInSQL + ''''+empno+'''';

          with Query1 do
          begin
               Close;
               SQL.Clear;
               SQL.Add('insert into prectord (SEQ,RID) values('''+IntToStr(k)+''','''+empno+''')');
               ExecSql;
          end;
          inc(k);
     end;

     if k > 254 then
     begin
          MessageDlg('데이터를 254건이하로 입력하세요', mtInformation, [mbOK], 0);
          E_FileName.OnChange := nIL;
          E_FileName.text:='';
          System.exit;
     end
     else  E_FileName.OnChange := E_FileNameChange;

     with PrintForm.Qry_recuit  do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select a.*,                                                                                                                        ');
          SQL.Add('       nvl((select majorname from prectmaj where codeid = ''I225'' and majorcode = a.univmajorid),'''')  univmajorname,            ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I225'' and codeno = a.grd1majorid),'''') grd1majorname,                  ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I231'' and codeno = a.licence1   ),'''') licence1name,                   ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I231'' and codeno = a.licence2   ),'''') licence1name2,                  ');
          SQL.Add('       decode(a.armykind,''1'',''군필'',''2'',''면제'',''3'',''미필'') armykindname,                                               ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I034'' and codeno = a.armygrade  ),'''') armygradename,                  ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I037'' and codeno = a.armyexcept ),'''') armyexceptname,                 ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I211'' and codeno = a.f1type     ),'''') f1typename,                     ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I221'' and codeno = a.f1grade    ),'''') f1gradename,                    ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I211'' and codeno = a.f2type     ),'''') f2typename,                     ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I221'' and codeno = a.f2grade    ),'''') f2gradename,                    ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I211'' and codeno = a.f3type     ),'''') f3typename,                     ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I221'' and codeno = a.f3grade    ),'''') f3gradename,                    ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I211'' and codeno = a.f4type     ),'''') f4typename,                     ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I221'' and codeno = a.f4grade    ),'''') f4gradename,                    ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I211'' and codeno = a.f5type     ),'''') f5typename,                     ');
          SQL.Add('       nvl((select codename from pyccode where codeid = ''I221'' and codeno = a.f5grade    ),'''') f5gradename,                    ');
          SQL.Add('       DECODE(gubun,''1'',(select codefname from pyccode where codeid = ''C051'' and codeno = a.dept),                             ');
          SQL.Add('                    ''2'',(select codefname from pyccode where codeid = ''C052'' and codeno = a.dept),                             ');
          SQL.Add('                    ''3'',(select codefname from pyccode where (codeid = ''C051'' or codeid = ''C052'') and codeno = a.dept)) deptnm,                     ');
          SQL.Add('       decode(a.aparea,''1'',''전국'',''2'',''서울/수도권'',''3'',''충청'',''4'',''경남'',''5'',''경북'',''6'',''전남'',''7'',''전북'') apareanm,          ');
          //SQL.Add('       decode(a.apjobkind,''11'',''회계'',      ''12'',''영업관리'',       ''13'',''영업'',''14'',''기술'',''15'',''통신제도기획'',');
          //SQL.Add('                          ''16'',''정보화추진'',''17'',''국제전화/데이터'',''18'',''통화서비스(상품기획)'',''19'',''TM관리'',      ');
          //SQL.Add('                          ''20'',''지능망관리'') apjobkindnm,                                                                      ');
          SQL.Add('       nvl((select majorname from prectmaj where codeid = ''I225'' and majorcode = a.badunivmajor),'''') badunivmajor,             ');
          SQL.Add('       decode(a.gubun,''1'',''신입'',''2'',''경력'') gubunnm                                                                       ');
          SQL.Add('from prectmas a, prectord b                                                                                                        ');
          SQL.Add('where a.rabasdate = '''+RabasDate+''' and a.rid = b.rid                                                                            ');
          SQL.Add('order by b.seq                                                                                                                     ');

          Open;
     end;

     pageCnt := k;
     if pageCnt = 0 then
     begin
          MessageBox(handle,'해당되는 데이타가 없습니다..(확인요망)','확  인',MB_OK or $0020);
          System.Exit;
     end;
end;

procedure TMainForm.PicDownLoad(FileName : String);
var
     FL_FTP : TOnInterNetDownLoad;
begin
     if Not DirectoryExists('C:\insa\FilePhoto') then forceDirectories( 'C:\insa\FilePhoto');
     FL_FTP := nil;
     FL_FTP := TOnInterNetDownLoad.Create(True);
     FL_FTP.HttpDownLoad := False;
     FL_FTP.HostName     := '10.4.4.72';
     FL_FTP.LoginName    := 'hperson';
     FL_FTP.Password     := 'qjsro12';
     FL_FTP.DestFilename := '/hper/insa/hperson/conbin/Ibin/FilePhoto/'+FileName;
     FL_FTP.LocalFilename := 'C:\Insa\FilePhoto\'+FileName;
     FL_Ftp.DownUpYn     := True;
     try
          FL_FTP.Resume;
     except
          on E: Exception do
               MessageDlg('에러: '+E.Message,mtError,[mbOK],0);
     end;

     if FL_FTP.RetError <> '' then MessageDlg('에러: '+FL_FTP.RetError,mtError,[mbOK],0);
end;

procedure TMainForm.Eda_toeicKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then btn_Select.Click;
end;

procedure TMainForm.BB_ScreenClick(Sender: TObject);
begin
     if not PrintForm.Qry_recuit.Active then DataSelect
     else                                    PrintForm.Qry_recuit.First;

     if PrintForm.Qry_recuit.Eof then
     begin
          MessageDlg('출력할 데이터가 없습니다.', mtWarning, [mbOK], 0);
          System.Exit;
     end;

     Application.ProcessMessages;

          if PrintForm.Qry_recuit.FieldByName('gubun').AsString = '1' then PrintForm.QuickRep1.Preview
     else if PrintForm.Qry_recuit.FieldByName('gubun').AsString = '2' then PrintFormCarr.QuickRep1.Preview;

     Screen.Cursor := crDefault;
end;

procedure TMainForm.BB_PrintClick(Sender: TObject);
begin
     if not PrintForm.Qry_recuit.Active then DataSelect
     else                                    PrintForm.Qry_recuit.First;

     if PrintForm.Qry_recuit.Eof then
     begin
          MessageDlg('출력할 데이터가 없습니다.', mtWarning, [mbOK], 0);
          System.Exit;
     end;

     Application.ProcessMessages;

          if PrintForm.Qry_recuit.FieldByName('gubun').AsString = '1' then PrintForm.QuickRep1.Print
     else if PrintForm.Qry_recuit.FieldByName('gubun').AsString = '2' then PrintFormCarr.QuickRep1.Print;

     Screen.Cursor := crDefault;
end;

end.

