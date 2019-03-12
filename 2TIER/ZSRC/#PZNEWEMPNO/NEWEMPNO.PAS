unit NewEmpno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora, StdCtrls, OnFocusButton, Grids, DBGrids,
  OnSkinBtn, ComCtrls, Oninsacommon, OnInsaData, OnEditBaseCtrl,
  OnEditStdCtrl, OnScheme, Registry, Winsock;

type
  TFNewEmp = class(TForm)
    OraSession1: TOraSession;
    OraQuery1: TOraQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    OnSerch: TOnFocusButton;
    OnInsert: TOnFocusButton;
    OnEditYY: TOnEdit;
    OnFileSave: TOnFocusButton;
    SaveDialog1: TSaveDialog;
    SF_Main: TOnSchemeForm;
    SB_help: TStatusBar;
    OnSaveEmp: TOnFocusButton;
    E_Cnt: TOnEdit;
    SB_close: TOnFocusButton;
    procedure OnSerchClick(Sender: TObject);
    procedure OnInsertClick(Sender: TObject);
    procedure SB_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OnFileSaveClick(Sender: TObject);
    procedure OnSaveEmpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNewEmp : TFNewEmp;
  LocalName : String;

implementation

{$R *.DFM}

function GetLocalIP: string;
var
  WSAData : TWSAData; //Winsock
  HostEnt : PHostEnt;
  HostName, IPAddress: String;
begin
  WSAStartup(2, WSAData);
  SetLength(HostName, 255);
  GetHostname(PChar(HostName), 255);
  SetLength(HostName, StrLen(PChar(HostName)));
  HostEnt := GetHostByName(PChar(HostName));

  with HostEnt^ do
    IPAddress := Format('%d.%d.%d.%d',[Byte(h_addr^[0]), Byte(h_addr^[1]),
                        Byte(h_addr^[2]), Byte(h_addr^[3])]);

  WSACleanup;

  LocalName := UpperCase(Trim(HostName));
  Result    := Trim(IPAddress);
end;

procedure TFNewEmp.FormCreate(Sender: TObject);
begin
  if OraSession1.Connected then OraSession1.Connected := False;

  OraSession1.Connected := False;
  OraSession1.Username  := 'hperson';            //Passemp(cmdline,5);
  OraSession1.PassWord  := 'whdekf2#';           //Passemp(cmdline,6);
  OraSession1.Server    := '10.4.4.61:1522:insa';//Passemp(cmdline,7) +':'+Passemp(cmdline,9) +':'+Passemp(cmdline,8);
  OraSession1.Connect;
end;

procedure TFNewEmp.FormShow(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SB_help.Panels[1].Text := '종합인사 시스템에 접속 중입니다...';

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT TO_CHAR(SYSDATE,''YYYY'') YYYY FROM DUAL');
       Open;
       OnEditYY.Text := FieldByName('YYYY').AsString;
       Close;
  end;

  GetLocalIP; //ShowMessage(LocalName);

  if      LocalName = 'SKCC14D00495' then LocalName := 'D006'
  else if LocalName = 'SKCC14D00543' then LocalName := 'D025'
  else if LocalName = 'SKCC14D00487' then LocalName := 'D028'
  else if LocalName = 'SKCC14D00541' then LocalName := 'D029'
  else if LocalName = 'SKCC14D00488' then LocalName := 'D031';

  //LocalName := Copy(LocalName, Length(LocalName)-4, Length(LocalName));
  //SB_help.Panels[1].Text := ' 연도중 사번 변경자 발생시 조회/등록 하는 프로그램(PZNEWEMPNO)';
end;

procedure TFNewEmp.OnSerchClick(Sender: TObject);
begin
  if Length(OnEditYY.Text) <> 4 then
  begin
       Application.MessageBox('조회기준년도를 정확히 입력하시기 바랍니다.','Open Error', MB_OK);
       Exit;
  end;

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select ROWNUM, A.Korname, Oldemp, Retdate, Newemp, Empdate, Orgempdate');
       Sql.Add('  From                                                        ');
       Sql.Add('   (Select Empno Newemp, Korname, Juminid, Empdate, Orgempdate');
       Sql.Add('      From Pimpmas                                            ');
       Sql.Add('     Where Juminid In (Select Juminid From Pimpmas            ');
       Sql.Add('                        Where Pstate <>''80''                 ');
       Sql.Add('                        Group By Juminid                      ');
       Sql.Add('                       Having Count(*) > 1)                   ');
       Sql.Add('       And Pstate  <  ''80''                                  ');
       Sql.Add('       And Orgempdate >= '''+OnEditYY.Text+''' ) A,           ');//정미정(P741=>J083)때문에 SKB입사일로 변경 --And EMPDATE >= ''ONEDITYY.TEXT''  ) A,      ');
       Sql.Add('   (Select Empno Oldemp, Korname, Juminid, Retdate            ');
       Sql.Add('      From Pimpmas                                            ');
       Sql.Add('     Where Juminid In (Select Juminid From Pimpmas            ');
       Sql.Add('                        Where Pstate <>''80''                 ');
       Sql.Add('                        Group By Juminid                      ');
       Sql.Add('                       Having Count(*) > 1)                   ');
       Sql.Add('       And Pstate > ''80'') B                                 ');
       Sql.Add(' Where A.Juminid = B.Juminid                                  ');
       Sql.Add('   And B.Oldemp Not In(Select Empno From Pznewempno)          ');
       Sql.Add('   And B.Oldemp Not Like ''Y%''                               ');
       Sql.Add('   And B.Oldemp Not Like ''I%''                               ');//--제증명에서 문제되어 인턴은 제외 ADD.2016.03.');
       Sql.Add('   And To_Char(To_Date(Orgempdate,''YYYYMMDD'')-100,''YYYYMMDD'')<Retdate');// --퇴사후 재입사자 제외하기 위해 ADD.2016.03.');
       Sql.Add(' Order By 1                                                   ');
   {
       Sql.Add('SELECT ROWNUM,     B.EMPNO OLDEMPNO,  B.Retdate,    ');
       Sql.Add('       A.KORNAME,  A.EMPNO NEWEMPNO,                ');
       Sql.Add('       A.EMPDATE   NewEMPDATE                       ');
       Sql.Add('  FROM                                              ');
       Sql.Add(' (SELECT EMPNO, KORNAME, EMPDATE, JUMINID           ');
       Sql.Add('    FROM PIMPMAS                                    ');
       Sql.Add('   WHERE JUMINID IN (SELECT JUMINID FROM PIMPMAS    ');
       Sql.Add('                      WHERE PSTATE <>''80''         ');
       Sql.Add('                      GROUP BY JUMINID              ');
       Sql.Add('                     HAVING COUNT(*) >1)            ');
       Sql.Add('     AND PSTATE  <  ''80''                          ');
//       Sql.Add('     AND EMPDATE >= '''+OnEditYY.Text+'''  ) A,     ');
       Sql.Add('     AND ORGEMPDATE >= '''+OnEditYY.Text+'''  ) A,  '); // 정미정(P741=>J083)때문에 SKB입사일로 변경
       Sql.Add(' (SELECT EMPNO, KORNAME, JUMINID, Retdate           ');
       Sql.Add('    FROM PIMPMAS                                    ');
       Sql.Add('   WHERE JUMINID IN (SELECT JUMINID FROM PIMPMAS    ');
       Sql.Add('                      WHERE PSTATE <>''80''         ');
       Sql.Add('                      GROUP BY JUMINID              ');
       Sql.Add('                     HAVING COUNT(*) >1)            ');
       Sql.Add('     AND PSTATE >''80'') B                          ');
       Sql.Add(' WHERE A.JUMINID = B.JUMINID                        ');
       Sql.Add('   AND B.EMPNO NOT IN (SELECT EMPNO FROM PZNEWEMPNO)');
       Sql.Add('   AND B.EMPNO Not Like ''Y%''                      ');
       Sql.Add('   AND B.Empno Not Like ''I%''                      '); //제증명에서 문제되어 인턴은 제외 Add.2016.03.
       Sql.Add('   And To_Char(To_Date(A.Empdate,''YYYYMMDD'')-100,''YYYYMMDD'') < B.Retdate'); //퇴사후 재입사자 제외하기 위해 Add.2016.03.
       Sql.Add(' Order by 1                                         ');      }
       Open;

       E_Cnt.Text := IntToStr(OraQuery1.RecordCount)+'건';
  end;
end;

procedure TFNewEmp.OnSaveEmpClick(Sender: TObject);
begin
  if Length(OnEditYY.Text) <> 4 then
  begin
       Application.MessageBox('조회기준년도를 정확히 입력하시기 바랍니다.','Open Error', MB_OK);
       Exit;
  end;

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add ( 'SELECT ROWNUM, EMPNO OLDEMP, KORNAME, NEWEMPNO,      ');
       Sql.Add ( '       STARTDATE, WRITETIME, WRITEMAN                  ');
       Sql.Add ( '  FROM PZNEWEMPNO                                      ');
       Sql.Add ( ' WHERE STARTDATE LIKE '''+ OnEditYY.Text +''' || ''%'' ');
       Sql.Add ( ' Order by 1, STARTDATE, NEWEMPNO                       ');
       Open;

       E_Cnt.Text := IntToStr(OraQuery1.RecordCount)+'건';
  end;
end;

procedure TFNewEmp.OnInsertClick(Sender: TObject);
var v_Cnt : String;
begin
  if Length(OnEditYY.Text) <> 4 then
  begin
       Application.MessageBox('조회기준년도를 정확히 입력하시기 바랍니다.','Open Error', MB_OK);
       Exit;
  end;

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT B.EMPNO OLDEMPNO, A.KORNAME,                    ');
       Sql.Add('       A.EMPNO NEWEMPNO, A.EMPDATE STARTDATE,          ');
       Sql.Add('       TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') WRITETIME,');
       Sql.Add('       '''+LocalName+''' WRITEMAN                      ');
       Sql.Add('  FROM                                                 ');
       Sql.Add(' (SELECT EMPNO, KORNAME, EMPDATE, JUMINID              ');
       Sql.Add('    FROM PIMPMAS                                       ');
       Sql.Add('   WHERE JUMINID IN (SELECT JUMINID FROM PIMPMAS       ');
       Sql.Add('                      WHERE PSTATE <>''80''            ');
       Sql.Add('                      GROUP BY JUMINID                 ');
       Sql.Add('                     HAVING COUNT(*) >1)               ');
       Sql.Add('     AND PSTATE  <''80''                               ');
       Sql.Add('     AND ORGEMPDATE >= '''+OnEditYY.Text+'''  ) A,     '); // 정미정(P741=>J083)때문에 SKB입사일로 변경
       Sql.Add(' (SELECT EMPNO, KORNAME, JUMINID, Retdate              ');
       Sql.Add('    FROM PIMPMAS                                       ');
       Sql.Add('   WHERE JUMINID IN (SELECT JUMINID FROM PIMPMAS       ');
       Sql.Add('                      WHERE PSTATE <>''80''            ');
       Sql.Add('                      GROUP BY JUMINID                 ');
       Sql.Add('                     HAVING COUNT(*) >1)               ');
       Sql.Add('     AND PSTATE >''80'') B                             ');
       Sql.Add(' WHERE A.JUMINID = B.JUMINID                           ');
       Sql.Add('   AND B.EMPNO NOT IN (SELECT EMPNO FROM PZNEWEMPNO)   ');
       Sql.Add('   AND B.EMPNO Not Like ''Y%''                         ');
       Sql.Add('   AND B.Empno Not Like ''I%''                         '); //제증명에서 문제되어 인턴은 제외.2016.03.
       Sql.Add('   And To_Char(To_Date(A.Empdate,''YYYYMMDD'')-100,''YYYYMMDD'') < B.Retdate'); //퇴사후 재입사자 제외하기 위해 Add.2016.03.
       Open;
       v_Cnt := IntToStr(OraQuery1.RecordCount);

       Close;
       Sql.Clear;
       Sql.Add('Insert into Pznewempno                                 ');
       Sql.Add('SELECT B.EMPNO OLDEMPNO, A.KORNAME,                    ');
//     Sql.Add('       A.EMPNO NEWEMPNO, A.EMPDATE STARTDATE,          ');
       Sql.Add('       A.EMPNO NEWEMPNO, A.ORGEMPDATE STARTDATE,       '); // 정미정(P741=>J083)때문에 SKB입사일로 변경
       Sql.Add('       TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') WRITETIME,');
       Sql.Add('       '''+LocalName+''' WRITEMAN                      ');
       Sql.Add('  FROM                                                 ');
       Sql.Add(' (SELECT EMPNO, KORNAME, EMPDATE, ORGEMPDATE, JUMINID  ');
       Sql.Add('    FROM PIMPMAS                                       ');
       Sql.Add('   WHERE JUMINID IN (SELECT JUMINID FROM PIMPMAS       ');
       Sql.Add('                      WHERE PSTATE <>''80''            ');
       Sql.Add('                      GROUP BY JUMINID                 ');
       Sql.Add('                     HAVING COUNT(*) >1)               ');
       Sql.Add('     AND PSTATE  <''80''                               ');
//       Sql.Add('     AND EMPDATE >= '''+OnEditYY.Text+'''  ) A,     ');
       Sql.Add('     AND ORGEMPDATE >= '''+OnEditYY.Text+'''  ) A,     '); // 정미정(P741=>J083)때문에 SKB입사일로 변경
       Sql.Add(' (SELECT EMPNO, KORNAME, JUMINID, Retdate              ');
       Sql.Add('    FROM PIMPMAS                                       ');
       Sql.Add('   WHERE JUMINID IN (SELECT JUMINID FROM PIMPMAS       ');
       Sql.Add('                      WHERE PSTATE <>''80''            ');
       Sql.Add('                      GROUP BY JUMINID                 ');
       Sql.Add('                     HAVING COUNT(*) >1)               ');
       Sql.Add('     AND PSTATE >''80'') B                             ');
       Sql.Add(' WHERE A.JUMINID = B.JUMINID                           ');
       Sql.Add('   AND B.EMPNO NOT IN (SELECT EMPNO FROM PZNEWEMPNO)   ');
       Sql.Add('   AND B.EMPNO Not Like ''Y%''                         ');
       Sql.Add('   AND B.Empno Not Like ''I%''                         '); //제증명에서 문제되어 인턴은 제외.2016.03.
       Sql.Add('   And To_Char(To_Date(A.Empdate,''YYYYMMDD'')-100,''YYYYMMDD'') < B.Retdate'); //퇴사후 재입사자 제외하기 위해 Add.2016.03.
       Sql.Add(' Order by 1                                            ');
       ExecSQL;
  end;
  E_Cnt.Text := '';
  Application.MessageBox('저장 완료!','OK', MB_OK);
end;

procedure TFNewEmp.SB_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TFNewEmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close;
  Action := Cafree;
end;

procedure TFNewEmp.OnFileSaveClick(Sender: TObject);
var
  i : integer;
begin
  if SaveDialog1.Execute then
  begin
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT A.KORNAME, B.EMPNO OLDEMPNO, B.Retdate,      ');
            Sql.Add('       A.EMPNO NEWEMPNO,                            ');
            Sql.Add('       A.EMPDATE STARTDATE                          ');
            Sql.Add('  FROM                                              ');
            Sql.Add(' (SELECT EMPNO, KORNAME, EMPDATE, JUMINID           ');
            Sql.Add('    FROM PIMPMAS                                    ');
            Sql.Add('   WHERE JUMINID IN (SELECT JUMINID FROM PIMPMAS    ');
            Sql.Add('                      WHERE PSTATE <>''80''         ');
            Sql.Add('                      GROUP BY JUMINID              ');
            Sql.Add('                     HAVING COUNT(*) >1)            ');
            Sql.Add('     AND PSTATE  <''80''                            ');
          //Sql.Add('     AND EMPDATE >= '''+OnEditYY.Text+'''  ) A,     ');
            Sql.Add('     AND ORGEMPDATE >= '''+OnEditYY.Text+'''  ) A,  '); // 정미정(P741=>J083)때문에 SKB입사일로 변경
            Sql.Add(' (SELECT EMPNO, KORNAME, JUMINID, Retdate           ');
            Sql.Add('    FROM PIMPMAS                                    ');
            Sql.Add('   WHERE JUMINID IN (SELECT JUMINID FROM PIMPMAS    ');
            Sql.Add('                      WHERE PSTATE <>''80''         ');
            Sql.Add('                      GROUP BY JUMINID              ');
            Sql.Add('                     HAVING COUNT(*) >1)            ');
            Sql.Add('     AND PSTATE >''80'') B                          ');
            Sql.Add(' WHERE A.JUMINID = B.JUMINID                        ');
          //Sql.Add('   AND B.EMPNO NOT IN (SELECT EMPNO FROM PZNEWEMPNO)');  //저장내역도 추출 가능토록.
            Sql.Add('   AND B.EMPNO Not Like ''Y%''                      ');
            Sql.Add('   AND B.Empno Not Like ''I%''                      '); //제증명에서 문제되어 인턴은 제외.2016.03.
            Sql.Add('   And To_Char(To_Date(A.Empdate,''YYYYMMDD'')-100,''YYYYMMDD'') < B.Retdate'); //퇴사후 재입사자 제외하기 위해 Add.2016.03.            
            Sql.Add(' Order by 1                                         ');
            Open;

            E_Cnt.Text := IntToStr(OraQuery1.RecordCount)+'건';
       end;

  //==========================================================================//
    if  OraQuery1.eof then
    begin
         Application.MessageBox('조건에 맞는 데이터가 존재하지 않습니다','無',MB_OK);
         exit;
    end;

    with TStringList.Create do
        try
             Add(pchar('성명, Old사번, Old퇴사일, New사번, New입사일' ) );

             OraQuery1.First;
             for i := 1 to OraQuery1.Recordcount do
             begin
                  Add(Format('%s,%s,%s,%s,%s,',
                     [OraQuery1.FieldByName('korname').AsString,
                      OraQuery1.FieldByName('oldempno').AsString,
                      OraQuery1.FieldByName('Retdate').AsString,
                      OraQuery1.FieldByName('newempno').AsString,
                      OraQuery1.FieldByName('startdate').AsString
                     ]));
                  OraQuery1.Next;
             end; // end of for
               
             SaveToFile(SaveDialog1.FileName);
             MessageDlg(''''+OnEditYY.Text+'''' + '년 기준 데이터 추출이 완료되었습니다',mtInformation, [mbOk ],0) ;
        finally
             Free;
        end; // end of try
  end; //end of SaveDialog1.Execute
end;


end.
