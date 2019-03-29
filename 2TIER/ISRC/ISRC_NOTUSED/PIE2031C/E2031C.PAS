{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE2031C(기능별 인력현황)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 서혜미
Version         : 30.00
Date            : 2001.10.15
Update contents
   버전     수정일       수정자   수정내용                        관련근거
   30.01    2001.11.12   서혜미   소계 -> 기능코드 sum으로        이석희씨 요청.
   30.02    2002.08.01   서혜미   전문계약직 관련 PCONTSUM + PSCONSUM = 계약(QUERY 속 SQL 수정)
                                  전2002-3380     단기적으로 계약직+전문계약직 향후 바뀔수 있음.
   30.03    2002.08.29   서혜미   전문계약직 분리(전2002-3380)
   30.28    2003.07.18   이민용   Fpie2031c.Cur_pemptot, Fpie2031c.Cur_ptotal에 값을 넣어줌(기존엔 '0'값이 들어갔음)
   30.29    2003.08.06   정규용   널체크시 에러 StrToInt -> StrToIntDef 변경
   30.30    2003.09.16   정규용   래포트 소계 및  총계에 음영 추가  최상용(1421) 요청
   30.31    2003.12.04   정규용   조직개편으로 인한 기능별 대상부서 변경  최상용(1421) 요청
   30.32    2004.07.13   정규용   1)직급체계 변경으로 인한 레포트 신규 개발
                                  2)조직차수를 현재 뿐만 아니라 과거월의 조직차수로 가져오게 변경
--------------------------------------------------------------------------------
}

unit E2031C;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, Gauges, DB,
  DBTables, QuickRpt,  Pass, TimeFtp,DateLib;  //TimeFtp,

type
  TFpie2031c = class(TForm)
    Panel1: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel3: TPanel;
    Mrunyymm: TMaskEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Lastyymm: TLabel;
    LastDate: TLabel;
    G_Progress: TGauge;
    P_helpinfo: TPanel;
    P_Help: TLabel;
    BBscreen: TBitBtn;
    BBprint: TBitBtn;
    BBsetup: TBitBtn;
    BBhelp: TBitBtn;
    BBclose: TBitBtn;
    Database1: TDatabase;
    Q_First: TQuery;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel9: TPanel;
    Panel8: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label1: TLabel;
    Panel11: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Q_Total_Sum: TQuery;
    Query1: TQuery;
    Q_First_Sum: TQuery;
    Q_TechName: TQuery;
    Query2: TQuery;
    Q_DetTechName: TQuery;
    procedure FormShow(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure BBscreenClick(Sender: TObject);
    procedure BBprintClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MrunyymmKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    AReport     : TQuickRep;
    DataCount   : integer;
    Last_Day    : String;
    Cur_orgnum  : String;
    StartYN     : Boolean;  //2004.07.13 정규용 추가
    Max_techniq : Integer;
    Cur_techniq : Integer;
    procedure Data_Display(Sender: TObject);
    procedure Tech_Display(Sender: TObject);
    procedure Data_TotalSum(Sender: TObject);
    procedure DataExist;   {자료존재여부 확인}

  public
    { Public declarations }
    {QuickReport1 : TQuickReport;}
    PaintCount   : integer;
    YearCheck    : String;
    Cur_Pemptot  : integer;
    Cur_Ptotal   : integer;
    Pempno, Pkorname, Password : string;
    payrachym    : String;
    procedure ClearData;
    function  TechNameFind : string;
    function  DetTechNameFind : string;
  end;

type
  TDataIn = record
      flag      : string[1];  {C:계속, S:인쇄후 구분선 출력}
      techname  : string[30];
      ppos1     : string[4];
      ppos2     : string[4];
      ppos3     : string[4];
      ppos4     : string[4];
      ppos5     : string[4];
      ppos6     : string[4];
      ppos7     : string[4];
      ppos8     : string[4];
      ppos9     : string[4];
      pspe      : string[4];
      pemp      : string[4];
      pcontsum  : string[4];
      psconsum  : string[4];  //2002.08.29 shm 추가
      pextrsum  : string[4];
      ptot      : string[4];

      Plevel    : boolean;
      Italicline: boolean;
      Boldline  : boolean;
  end;


var
  Fpie2031c : TFpie2031c;
  ErrorHelp : array[0..255] of char;
  Mrunym    : String[20];
  Fout      : file of TDataIn;
  FCom      : Textfile;
  DataIn    : TDataIn;
  HomeDir   : string;

  Boldline  : Boolean;
  Italicline: boolean;
  app       : Variant;
implementation

uses pie20311, pie20312;

{$R *.DFM}

const
  sFORMAT = '#####';
  dFORMAT = '(###)';

procedure TFpie2031c.FormShow(Sender: TObject);
begin
  if StartYN then
  begin
    Database1.Connected := False;
    DataBase1.Params[0]  := 'SERVER NAME=' + PassEmp(cmdline, 13);
    DataBase1.Params[1]  := 'USER NAME='   + PassEmp(cmdline, 5);
    DataBase1.Params[16] := 'PASSWORD='    + PassEmp(cmdline, 6);

    Try
       Database1.Connected := True;
    EXCEPT ON E : EDataBaseError Do
       MessageBox(handle,StrPcopy(ErrorHelp,E.Message+'DB 접속 실패'),'에 러',MB_OK or $0010);
    END;
    PaintCount := 0;
    G_Progress.Progress := 0;
    Pempno   := PassEmp(CmdLine, 1);
    Pkorname := PassEmp(CmdLine, 2);
    Password := PassEmp(CmdLine, 3);

    HomeDir  := HomeDirOpen;

    AReport  := Fpie20311.InReport;

   //  Fpie20311.LineCheck.Pen.Width  := 1;
    P_help.Caption := '작업조건을 확인후 실행하십시요.';
//    Mrunyymm.SetFocus;
//    Mrunyymm.SelectAll;

    //최종 현원생성 일자
    begin
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.ADD(' SELECT  VALUE2 FROM  PIMVARI                    ');
      Query1.SQL.ADD('  WHERE ((GUBUN =:lgubun) AND (SGUBUN =:lsgubun))');
      Query1.ParamByName('lgubun').AsString  := '50';
      Query1.ParamByName('lsgubun').AsString := '0002';
      Query1.Open;
    end;

    Last_day := Query1.Fields[0].AsString;
    Lastyymm.Caption  := Copy(Last_day,1,4) +'/'+Copy(Last_day,5,2);
    Lastdate.Caption  := Copy(Last_day,1,4) +'/'+Copy(Last_day,5,2)+'/'+Copy(Last_day,7,2);
    Mrunyymm.text     := Copy(Last_day,1,6);
    Query1.Close;

    //현 조직차수
    begin
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.ADD(' SELECT  VALUE1  FROM  PIMVARI                   ');
      Query1.SQL.ADD('  WHERE ((GUBUN =:lgubun) AND (SGUBUN =:lsgubun))');
      Query1.ParamByName('lgubun').AsString  := '00';
      Query1.ParamByName('lsgubun').AsString := '0001';
      Query1.Open;
    end;
    Cur_orgnum := Query1.Fields[0].AsString;

    //직위체계변경일
    begin
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.ADD(' SELECT  VALUE3, VALUE4  FROM  PIMVARI           ');
      Query1.SQL.ADD('  WHERE ((GUBUN =:lgubun) AND (SGUBUN =:lsgubun))');
      Query1.ParamByName('lgubun').AsString  := '00';
      Query1.ParamByName('lsgubun').AsString := '0001';
      Query1.Open;
    end;
    payrachym := Query1.Fields[1].AsString;


    Mrunyymm.SetFocus;
    Mrunyymm.SelectAll;


    {//소계의 계,총계
    begin
         Query1.Close;
         Query1.SQL.Clear;
         Query1.SQL.ADD('SELECT SUM(PPOSSUM + PSPE1 +PSPE3 + PSPE4 +PSPE5)  PEMP,          ');
         Query1.SQL.ADD('       SUM(PEMPTOT + PCONTSUM + PTEMPSUM)  PTOTAL  FROM PIHTOPO   ');
         Query1.SQL.ADD(' WHERE TOPOYM = :P_Topoym                                         ');
         Query1.ParamByName('P_topoym').AsString  := Mrunyymm.text;
         Query1.Open;
    end;
    Cur_Pemptot := StrtoInt(Query1.Fields[0].AsString);
    Cur_Ptotal  := StrtoInt(Query1.Fields[1].AsString);
    Query1.Close;

    //기능코드 max 구함
    begin
         Query1.Close;
         Query1.SQL.Clear;
         Query1.SQL.ADD(' SELECT MAX(CODENO) FROM PYCCODE WHERE CODEID = ''I801''   ');
         Query1.Open;
    end;
    Max_techniq := StrtoInt(Query1.Fields[0].AsString);
    Query1.Close;}
  end;
  StartYN := False;
end;

procedure TFpie2031c.FormPaint(Sender: TObject);
var
CurDate:string;
begin
     CurDate := TimeDate(Query2);
     L_CurDate.Caption  := copy(CurDate,1,4)+'/'+copy(CurDate,5,2)+'/'+copy(CurDate,7,2);

     if PaintCount = 0 then
     begin
//          if PassDialog(Fpie20311, Pempno, Pkorname, Password) = False then halt(0);

          L_UserName.Caption := pkorname + '(' + pempno + ')';
     end;
     PaintCount := 1;

end;

procedure TFpie2031c.ClearData;
begin
  with DataIn do begin
    ppos1     := '';    ppos2     := '';
    ppos3     := '';    ppos4     := '';
    ppos5     := '';    ppos6     := '';
    ppos7     := '';    ppos7     := '';
    ppos8     := '';    ppos9     := '';
    pspe      := '';    pemp      := '';
    pcontsum  := '';    psconsum  := '';  pextrsum  := '';
    techname  := '';
  end;
end;

procedure TFpie2031c.BBscreenClick(Sender: TObject);
var
 i : integer;
begin
    if  Mrunyymm.text < '200404' then
    begin
       DataExist;
       if DataCount < 1 then ShowMessage('해당자료가 없습니다.')
       else
       begin
          //소계의 계,총계
          begin
            Query1.Close;
            Query1.SQL.Clear;
            Query1.SQL.ADD('SELECT ORGNUM,SUM(PPOSSUM + PSPE1 +PSPE3 + PSPE4 +PSPE5)  PEMP,              ');
            Query1.SQL.ADD('       SUM(PEMPTOT + PCONTSUM + PTEMPSUM + psconsum)  PTOTAL  FROM PIHTOPO   '); //전문계약직 임시 psconsum 2002.08.01 shm
            Query1.SQL.ADD(' WHERE TOPOYM = :P_Topoym                                                    ');
            Query1.SQL.ADD('GROUP BY ORGNUM                                                              ');
            Query1.ParamByName('P_topoym').AsString  := Mrunyymm.text;
            Query1.Open;
          end;

          if Query1.Fields[1].AsString = '' then
          begin
             showmessage('작업년월의 해당사항이 없습니다. 현원생성을 먼저 하시고 작업하십시요!');
             Query1.Close;
             System.Exit;
          end;
          Cur_Orgnum  := Query1.Fields[0].AsString;
          Cur_Pemptot := StrtoInt(Query1.Fields[1].AsString);
          Cur_Ptotal  := StrtoInt(Query1.Fields[2].AsString);
          Query1.Close;

          //기능코드 max 구함
          begin
             Query1.Close;
             Query1.SQL.Clear;
             Query1.SQL.ADD(' SELECT MAX(CODENO) FROM PYCCODE WHERE CODEID = ''I801''   ');
             Query1.Open;
          end;
          Max_techniq := StrtoInt(Query1.Fields[0].AsString);
          Query1.Close;

          P_help.Caption := '작업중입니다.';
          Application.Processmessages;
          G_Progress.Progress := 20;

          AReport := Fpie20311.InReport;

          AssignFile(Fout, HomeDir+'\list\pie2031c.tmp');
          System.ReWrite(Fout);

          G_Progress.Progress := 30;

          for  i := 1 to Max_techniq do
          begin
            Cur_techniq := i;
            Tech_Display(Sender);
            G_Progress.Progress := G_Progress.Progress + 10;
            Data_Display(Sender);
          end;

          G_Progress.Progress := 80;
          Data_TotalSum(Sender);
          G_Progress.Progress := 90;
          AReport.PreView;

          P_help.Caption := '작업이 완료되었습니다.';
          G_Progress.Progress := 0;
       end
    end
    else
    begin
       DataExist;
       if (DataCount < 1) then ShowMessage('해당자료가 없습니다.')
       else
          Fpie20312.Inreport.Preview;
    end;
end;

procedure TFpie2031c.Tech_Display(Sender: TObject);
begin
     Q_First_Sum.Close;
     Q_First_Sum.ParamByName('P_topoym').AsString    := Mrunyymm.Text;
     Q_First_Sum.ParamByName('P_orgnum').AsString    := Cur_orgnum;
     Q_First_Sum.ParamByName('P_technique').AsString := InttoStr(Cur_techniq);
     Q_First_Sum.Open;

     with DataIn do
     begin
//          techname := '[소  계]';
          ClearData;
          Q_Techname.ParamByName('P_Techcode').AsString := InttoStr(Cur_techniq);
          techname := '[' + TechNameFind + ']';
          BoldLine := True;
          ppos1    := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PPOS1').AsInteger);
          ppos2    := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PPOS2').AsInteger);
          ppos3    := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PPOS3').AsInteger);
          ppos4    := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PPOS4').AsInteger);
          ppos5    := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PPOS5').AsInteger);
          ppos6    := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PPOS6').AsInteger);
          ppos7    := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PPOS7').AsInteger);
          ppos8    := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PPOS8').AsInteger);
          ppos9    := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PPOS9').AsInteger);
          pspe     := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PSPESUM').AsInteger);
          pemp     := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PEMPTOT').AsInteger);  //소계
          pcontsum := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PCONTSUM').AsInteger); //계약
          psconsum := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PSCONSUM').AsInteger); //전문계약 2002.08.29 shm 추가
          pextrsum := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PTEMPSUM').AsInteger); //일반
          ptot     := FormatFloat(sFORMAT, Q_First_Sum.FieldByName('PEMPTOT').AsInteger  + //총계
                                           Q_First_Sum.FieldByName('PCONTSUM').AsInteger +
                                           Q_First_Sum.FieldByName('PSCONSUM').AsInteger + //전문계약 2002.08.29 shm 추가
                                           Q_First_Sum.FieldByName('PTEMPSUM').AsInteger);

          System.Write(Fout, DataIn);
         Q_First.Close;
     end;
end;

procedure TFpie2031c.Data_Display(Sender: TObject);
begin
  Q_First.Close;
  Q_First.ParamByName('P_topoym').AsString    := Mrunyymm.Text;
  Q_First.ParamByName('P_orgnum').AsString    := Cur_orgnum;
  Q_First.ParamByName('P_technique').AsString := InttoStr(Cur_techniq);
  Q_First.Open;
  if Q_First.RecordCount = 0 then
  begin
    MessageBox(handle,'작업조건에 맞는 자료가 없습니다.','알  림',MB_OK or $0030);
    Q_First.Close;
    System.Exit;
  end;

//  AssignFile(Fout, HomeDir+'\list\pie2250c.tmp');
//  System.ReWrite(Fout);

  while not Q_First.Eof do
  begin
     ClearData;

     with DataIn do
     begin
          Q_DetTechname.ParamByName('P_DetTechcode').AsString := Q_First.FieldByName('DetailsTech').AsString;
          techname   := '   '+ DetTechNameFind;
          BoldLine   := False;
//          techname := FormatFloat(sFORMAT, Q_First.FieldByName('detailstech').AsInteger);

          ppos1    := FormatFloat(sFORMAT, Q_First.FieldByName('PPOS1').AsInteger);
          ppos2    := FormatFloat(sFORMAT, Q_First.FieldByName('PPOS2').AsInteger);
          ppos3    := FormatFloat(sFORMAT, Q_First.FieldByName('PPOS3').AsInteger);
          ppos4    := FormatFloat(sFORMAT, Q_First.FieldByName('PPOS4').AsInteger);
          ppos5    := FormatFloat(sFORMAT, Q_First.FieldByName('PPOS5').AsInteger);
          ppos6    := FormatFloat(sFORMAT, Q_First.FieldByName('PPOS6').AsInteger);
          ppos7    := FormatFloat(sFORMAT, Q_First.FieldByName('PPOS7').AsInteger);
          ppos8    := FormatFloat(sFORMAT, Q_First.FieldByName('PPOS8').AsInteger);
          ppos9    := FormatFloat(sFORMAT, Q_First.FieldByName('PPOS9').AsInteger);
          pspe     := FormatFloat(sFORMAT, Q_First.FieldByName('PSPESUM').AsInteger);
          pemp     := FormatFloat(sFORMAT, Q_First.FieldByName('PEMPTOT').AsInteger);  //소계
          pcontsum := FormatFloat(sFORMAT, Q_First.FieldByName('PCONTSUM').AsInteger); //계약
          psconsum := FormatFloat(sFORMAT, Q_First.FieldByName('PSCONSUM').AsInteger); //전문계약 2002.08.29 shm 추가
          pextrsum := FormatFloat(sFORMAT, Q_First.FieldByName('PTEMPSUM').AsInteger); //일반
          ptot     := FormatFloat(sFORMAT, Q_First.FieldByName('PEMPTOT').AsInteger  + //총계
                                           Q_First.FieldByName('PCONTSUM').AsInteger +
                                           Q_First.FieldByName('PSCONSUM').AsInteger + //전문계약 2002.08.29 shm 추가
                                           Q_First.FieldByName('PTEMPSUM').AsInteger);

          System.Write(Fout, DataIn);
     end;
          Q_First.Next;
  end;
  Q_First.Close;
end;



procedure TFpie2031c.Data_TotalSum(Sender: TObject);
begin
     Q_Total_Sum.Close;
     Q_Total_Sum.ParamByName('P_topoym').AsString  := Mrunyymm.text;
     Q_Total_Sum.Open;

     ClearData;
     with DataIn do
     begin
          techname := '    [ 총  계 ]';
          Boldline := True;
          ppos1    := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PPOS1').AsInteger);
          ppos2    := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PPOS2').AsInteger);
          ppos3    := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PPOS3').AsInteger);
          ppos4    := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PPOS4').AsInteger);
          ppos5    := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PPOS5').AsInteger);
          ppos6    := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PPOS6').AsInteger);
          ppos7    := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PPOS7').AsInteger);
          ppos8    := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PPOS8').AsInteger);
          ppos9    := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PPOS9').AsInteger);
          pspe     := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PSPESUM').AsInteger);
          pemp     := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PEMPTOT').AsInteger);  //소계
          pcontsum := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PCONTSUM').AsInteger); //계약
          psconsum := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PSCONSUM').AsInteger); //전문계약 2002.08.29 shm 추가
          pextrsum := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PTEMPSUM').AsInteger); //일반
          ptot     := FormatFloat(sFORMAT, Q_Total_Sum.FieldByName('PTOTAL').AsInteger);   //총계

          System.Write(Fout, DataIn);
         Q_First.Close;
     end;
     Q_Total_Sum.Close;
end;

function TFpie2031c.TechNameFind : string;
begin
  Q_Techname.close;
  Q_Techname.Open;
  if Q_Techname.RecordCount < 1 then
    TechnameFind := Q_Techname.ParamByName('P_techcode').AsString
  else
  begin
      TechnameFind := Q_Techname.FieldByName('Codename').AsString;
  end;

  Q_Techname.Close;

end;

function TFpie2031c.DetTechNameFind : string;
begin
  Q_DetTechname.close;
  Q_DetTechname.Open;
  if Q_DetTechname.RecordCount < 1 then
    DetTechnameFind := Q_DetTechname.ParamByName('P_techcode').AsString
  else
  begin
      DetTechnameFind := Q_DetTechname.FieldByName('Codename').AsString;
  end;

  Q_DetTechname.Close;
end;



procedure TFpie2031c.BBprintClick(Sender: TObject);
begin
  P_help.Caption := '작업중입니다.';
  Application.Processmessages;

  if Mrunyymm.Text < '200404' Then
  begin
     DataExist;
     if DataCount < 1 then ShowMessage('해당자료가 없습니다.')
     else
        AReport.Print;
  end
  else
  begin
     DataExist;
     if DataCount < 1 then ShowMessage('해당자료가 없습니다.')
     else
        Fpie20312.Inreport.Print;
  end;

  P_help.Caption := '작업이 완료되었습니다.';
  Mrunyymm.SetFocus;
end;

procedure TFpie2031c.BBcloseClick(Sender: TObject);
begin
   close;
end;

procedure TFpie2031c.FormCreate(Sender: TObject);
begin
  StartYN := True;
end;

procedure TFpie2031c.MrunyymmKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      BBscreen.SetFocus;
end;


Procedure TFpie2031c.DataExist;
begin
   DataCount := 0;
   begin
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.ADD('SELECT COUNT(*) CNT FROM PIHTOPO ');
      Query1.SQL.ADD(' WHERE TOPOYM = ''' + Mrunyymm.Text + ''' ');
      Query1.Open;
      DataCount := Query1.FieldByName('CNT').AsInteger; // := RecordCount;
      Query1.Close;
   end;
end;


end.
