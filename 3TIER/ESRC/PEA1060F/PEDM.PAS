unit peDm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBClient, Db, MIDASCon, MConnect, Tmax_DataSetText;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBSet1: TTMaxDataSet;
    DBSet3: TTMaxDataSet;
    DBSet5: TTMaxDataSet;
    QHis: TTMaxDataSet;
    QDev: TTMaxDataSet;
    Qmas: TTMaxDataSet;
    DataSource6: TDataSource;
    DBSet6: TTMaxDataSet;
    DBSet7: TTMaxDataSet;
    DataSource7: TDataSource;
  private
    { Private declarations }
  public
    //  Tuxedo Component BeforeCall Event 처리변수
    DBSet1_Pmax : String;
    DBSet1_Prfd : String;
    DBSet1_Psfd : array of String;
    DBSet3_Pmax : String;
    DBSet3_Prfd : String;
    DBSet3_Psfd : array of String;

//====================================================================================//
//   30.39      2001.07.24         손종운 추가                 자기계발목표 추가
//====================================================================================//
    DBSet5_Pmax : String;
    DBSet5_Prfd : String;
    DBSet5_Psfd : array of String;
//====================================================================================//

    gsLastConEv : String;  //업무목표최종결재자 (1차 or 2차)

    { Public declarations }
    function  GetOracleTime : string;
    function  GetSeqno(tablename,rabasdate,empno : string) : real;
    function  GetSeqno1(tablename,rabasdate,empno : string) : real;
    function GetSeqno2(tablename,rabasdate,deptcode : string) : real;

    procedure Fsvr_UpdateSql(pwork, pgubun: Integer; Param: OleVariant); safecall;
    procedure Save_Pehremas(Param : OleVariant; Pwork,Pgubun : integer);
    procedure Save_Pehreaim_A(Param : OleVariant; Pgubun : integer);
    procedure Save_Pehreaim_B(Param : OleVariant; Pgubun : integer);
//====================================================================================//
//   30.39      2001.07.24         손종운 추가                 자기계발목표 추가
//====================================================================================//
    procedure Save_Pehdevdet(Param : OleVariant; Pgubun : integer);

    procedure Fsvr_ConfirmSql(pwork, pgubun, SaveOk: Integer; Param: OleVariant); safecall;
    function  GetPehremasSqlText(Pgubun : integer; rabasdate,empno,Ltime : string) : string;
    procedure Save_Pehreaimhis_A(Param : OleVariant; Pgubun, SaveOk : integer);
    procedure Save_Pehreaimhis_B(Param : OleVariant; Pgubun, SaveOk : integer);

    procedure Fsvr_DeleteSql(pwork, pgubun: Integer; Param: OleVariant); safecall;
    procedure Delete_Pehreaim_A(Param : OleVariant; Pgubun : integer);
    procedure Delete_Pehreaim_B(Param : OleVariant; Pgubun : integer);
//====================================================================================//
//   30.39      2001.07.24         손종운 추가                 자기계발목표 추가
//====================================================================================//
    procedure Delete_Pehdevdet(Param : OleVariant; Pgubun : integer);
//====================================================================================//
    procedure Save_Pehremas_Init(rabasdate, empno: String);
    procedure Save_Pehreaim_COM(Param : OleVariant; Pgubun : integer);
    procedure Save_Pehreaim_BAS(Param : OleVariant; Pgubun : integer);

    //2000.11.08
    function  Gethalf(rabasdate: string) : String;
    function  Getpyccode(id,no:string):string;
    function  Getpycdept(org,dept:string):string;
  end;

var
  DM: TDM;

implementation

uses
  Hinsa_TmaxDM, PeMainForm;

{$R *.DFM}

function TDM.GetOracleTime : string;
var
  Sqltext   : string;
begin
  Result := '';
  Sqltext := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'')  '+
             '  FROM DUAL ';
//
  DataModule_Tmax.Csel_SQL := Sqltext;
  DataModule_Tmax.Csel_Open4;
  Result := DataModule_Tmax.Csel_gfd4(1);
end;

function TDM.GetSeqno(tablename,rabasdate,empno : string) : real;
var
  Sqltext   : string;
begin
  Result := 0;
  Sqltext := Format('SELECT to_char(NVL(MAX(seqno),0)+1)  '+
                    ' FROM '+tablename+
                    ' WHERE rabasdate = ''%s'' AND empno = ''%s'' ',
             [rabasdate,empno] );
//
  DataModule_Tmax.Csel_SQL := Sqltext;
  DataModule_Tmax.Csel_Open4;
  Result := StrToFloat(DataModule_Tmax.Csel_gfd4(1));
end;

function TDM.GetSeqno1(tablename,rabasdate,empno : string) : real;
var
  Sqltext   : string;
begin
  Result := 0;
  Sqltext := Format('SELECT to_char(NVL(MAX(seqno),0)+1)  '+
                    ' FROM '+tablename+
                    ' WHERE rabasdate = ''%s'' AND propeltask = ''%s'' ',
             [rabasdate,empno] );
//
  DataModule_Tmax.Csel_SQL := Sqltext;
  DataModule_Tmax.Csel_Open4;
  Result := StrToFloat(DataModule_Tmax.Csel_gfd4(1));
end;
            
function TDM.GetSeqno2(tablename,rabasdate,deptcode : string) : real;
var
  Sqltext   : string;
begin
  Result := 0;
  Sqltext := Format('SELECT to_char(NVL(MAX(taskcode),0)+1)  '+
                    ' FROM '+tablename+
                    ' WHERE rabasdate = ''%s'' AND deptcode = ''%s'' ',
             [rabasdate,deptcode] );
  DataModule_Tmax.Csel_SQL := Sqltext;
  DataModule_Tmax.Csel_Open4;
  Result := StrToFloat(DataModule_Tmax.Csel_gfd4(1));
end;          

//2000.11.08
function TDM.GetHalf(rabasdate : string) : string;
begin
  Result := '';
  if Copy(rabasdate,5,4) <= '0630' then
    Result := '0'
  else Result := '1';
end;

procedure TDM.Fsvr_UpdateSql(pwork, pgubun: Integer; Param: OleVariant);
begin
    if pwork = 1 then  // 관리직
      Save_Pehreaim_A(Param,Pgubun);        //pwork = 1, 2, 5 인경우 pgubun = 1 : 수정
    if pwork = 2 then  // 영업직            //                       pgubun = 2 : 추가
      Save_Pehreaim_B(Param,Pgubun);        //pwork = 3, 4 인 경우   pgubun = 1 : 1차
    if pwork = 3 then  // 의견등록          //                       pgubun = 2 : 2차
      Save_Pehremas(Param,Pwork,Pgubun);
    if pwork = 4 then  // 반려
      Save_Pehremas(Param,Pwork,Pgubun);
//====================================================================================//
//   30.39      2001.07.24         손종운 추가                 자기계발목표 추가
//====================================================================================//
    if pwork = 5 then  // 자기계발
      Save_Pehdevdet(Param,Pgubun);
//====================================================================================//
    //공동목표 추가

    if pwork = 6 then
    begin
       Save_Pehreaim_COM(Param, pgubun);
    end;

    if pwork = 7 then
    begin
       Save_Pehreaim_BAS(Param, pgubun);
    end;

end;

procedure TDM.Save_Pehremas(Param : OleVariant; Pwork,Pgubun : integer);
var
  SqlText : string;
begin
  SqlText := '';
  if Pwork = 3 then // 의견등록
  begin

    if Pgubun = 1 then // 1차 의견등록
    begin
      SqlText := Format('UPDATE pehremas SET '+
                        '  e1prjview = ''%s'' '+
                        ' WHERE rabasdate = ''%s'' AND empno = ''%s'' ',
                 [Param[0], Param[1], Param[2] ]);
    end;

    if Pgubun = 2 then // 2차 의견등록
    begin
      SqlText := Format('UPDATE pehremas SET '+
                        '  e2prjview = ''%s'' '+
                        ' WHERE rabasdate = ''%s'' AND empno = ''%s'' ',
                 [Param[0], Param[1], Param[2] ]);
    end;

  end;

  // 1.09      2004.11.11          이민용         by 손필영 요청   평가 등록 종료로 메세지 수정
  // 반려인 경우  rprjconyn = ''N'' --> rprjconyn = ''X''로 수정
  if Pwork = 4 then // 반려
  begin
    if Pgubun = 1 then // 1차 반려
    begin
      {SqlText := Format('UPDATE pehremas SET '+
                        '  e1prjobjyn = ''Y'', rprjconyn = ''N'', rprjcondate = '''' '+
                        ' WHERE rabasdate = ''%s'' AND empno   = ''%s'' '+
                        '   AND e1empno   = ''%s'' AND reconyn = ''Y'' ',
                 [Param[0], Param[1], Param[2] ]);}
      SqlText := Format('UPDATE pehremas SET '+
                        '  e1prjobjyn = ''Y'', rprjconyn = ''X'', rprjcondate = '''' '+
                        ' WHERE rabasdate = ''%s'' AND empno   = ''%s'' '+
                        '   AND e1empno   = ''%s'' AND reconyn = ''Y'' ',
                 [Param[0], Param[1], Param[2] ]);
    end;
    if Pgubun = 2 then // 2차 반려
    begin
      {SqlText := Format('UPDATE pehremas SET '+
                        '  e2prjobjyn = ''Y'', e1prjconyn  = ''N'', e1prjcondate = '''', '+
                        '  rprjconyn  = ''N'', rprjcondate = '''' '+
                        ' WHERE rabasdate = ''%s'' AND empno   = ''%s'' '+
                        '   AND e2empno   = ''%s'' AND reconyn = ''Y'' ',
                 [Param[0], Param[1], Param[2] ]);}

      SqlText := Format('UPDATE pehremas SET '+
                        '  e2prjobjyn = ''Y'', e1prjconyn  = ''N'', e1prjcondate = '''', '+
                        '  rprjconyn  = ''X'', rprjcondate = '''' '+
                        ' WHERE rabasdate = ''%s'' AND empno   = ''%s'' '+
                        '   AND e2empno   = ''%s'' AND reconyn = ''Y'' ',
                 [Param[0], Param[1], Param[2] ]);
    end;
  end;

  if SqlText = '' then
    System.Exit;
//
  DataModule_Tmax.Cupd_SQL := Sqltext;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;
end;

procedure TDM.Save_Pehreaim_A(Param : OleVariant; Pgubun : integer);
var
  SqlText : string;
  lSeqno, MainWeight : real;
  Ltime   : string;
  Hgubun  : string;
begin
  SqlText := '';
  LSeqno  := 0;
  Ltime   := GetOracleTime;


  if Pgubun = 1 then  // 수정
  begin
    //Hgubun := GetHalf(Format('%s',[param[14]]));

    //SqlText := Format('UPDATE pehreaim_DET SET '+
    SqlText := Format('UPDATE pehreaim_com SET '+
                    '  propeltask    = ''%s'', '+
                    '  mainweight    = ''%f'', '+
                    '  detailtask1   = ''%s'', '+
                    '  detailtask2   = ''%s'', '+
                    '  detailtask3   = ''%s'', '+
                    '  detailtask4   = ''%s'', '+
                    '  detailtask5   = ''%s'', '+
                    '  detailweight1 = ''%f'', '+
                    '  detailweight2 = ''%f'', '+
                    '  detailweight3 = ''%f'', '+
                    '  detailweight4 = ''%f'', '+
                    '  detailweight5 = ''%f'', '+
                    '  validx1       = ''%s'', '+
                    '  validx2       = ''%s'', '+
                    '  validx3       = ''%s'', '+
                    '  validx4       = ''%s'', '+
                    '  validx5       = ''%s'', '+
                    '  valfunction1  = ''%s'', '+
                    '  valfunction2  = ''%s'', '+
                    '  valfunction3  = ''%s'', '+
                    '  valfunction4  = ''%s'', '+
                    '  valfunction5  = ''%s'', '+
                    '  sresultclass1  = ''%s'', '+
                    '  aresultclass1  = ''%s'', '+
                    '  bresultclass1  = ''%s'', '+
                    '  cresultclass1  = ''%s'', '+
                    '  dresultclass1  = ''%s'', '+
                    '  sresultclass2  = ''%s'', '+
                    '  aresultclass2  = ''%s'', '+
                    '  bresultclass2  = ''%s'', '+
                    '  cresultclass2  = ''%s'', '+
                    '  dresultclass2  = ''%s'', '+
                    '  sresultclass3  = ''%s'', '+
                    '  aresultclass3  = ''%s'', '+
                    '  bresultclass3  = ''%s'', '+
                    '  cresultclass3  = ''%s'', '+
                    '  dresultclass3  = ''%s'', '+
                    '  sresultclass4  = ''%s'', '+
                    '  aresultclass4  = ''%s'', '+
                    '  bresultclass4  = ''%s'', '+
                    '  cresultclass4  = ''%s'', '+
                    '  dresultclass4  = ''%s'', '+
                    '  sresultclass5  = ''%s'', '+
                    '  aresultclass5  = ''%s'', '+
                    '  bresultclass5  = ''%s'', '+
                    '  cresultclass5  = ''%s'', '+
                    '  dresultclass5  = ''%s'', '+
                    '  e1prjopinon    = ''%s'', '+
                    '  writeemp   = ''%s'', '+
                    '  writetime  = ''%s''  '+ // 0..20
                    ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND seqno = ''%f'' ',
             [Param[0], (StrToFloat(Param[6])+StrToFloat(Param[7])+StrToFloat(Param[8])+StrToFloat(Param[9])+StrToFloat(Param[10])),Param[1],Param[2], Param[3],Param[4], Param[5],
              StrToFloat(Param[6]),StrToFloat(Param[7]),StrToFloat(Param[8]),StrToFloat(Param[9]),StrToFloat(Param[10]),
              Param[11],Param[12], Param[13],Param[14],Param[15],
              Param[16],Param[17], Param[18],Param[19],Param[20],
              Param[21],Param[22], Param[23],Param[24],Param[25],
              Param[26],Param[27],Param[28], Param[29],Param[30],
              Param[31],Param[32],Param[33],Param[34], Param[35],
              Param[36],Param[37],Param[38],Param[39],Param[40],
              Param[41],Param[42],Param[43],Param[44],Param[45],
              Param[46],Param[47],Ltime,
              // 키부분
              Param[48],Param[49],
              StrToFloat(Param[50]) ]);
//====================================================================================//
  end
  else                // 추가
  begin
    //lSeqno := GetSeqno(' pehreaim_DET ',Param[0],Param[1]);       //순번구하기
    lSeqno := GetSeqno(' pehreaim_COM ',Param[0],Param[1]);       //순번구하기
    //Hgubun := GetHalf(Format('%s',[param[0]]));               //상하반기 ( 0:상반기, 1:하반기 )
    Mainweight := Param[8]+Param[9]+Param[10]+Param[11]+Param[12];

    //SqlText := Format('INSERT INTO pehreaim_DET        '+
    SqlText := Format('INSERT INTO pehreaim_COM        '+
                      ' (rabasdate  , empno      ,     '+
                      '  seqno      , propeltask ,     '+
                      '  mainweight , detailtask1,     '+
                      '  detailtask2, detailtask3,     '+
                      '  detailtask4, detailtask5,     '+
                      '  detailweight1, detailweight2, '+
                      '  detailweight3, detailweight4, '+
                      '  detailweight5, validx1,       '+
                      '  validx2    , validx3,         '+
                      '  validx4    , validx5  ,       '+
                      '  valfunction1, valfunction2,   '+
                      '  valfunction3, valfunction4,   '+
                      '  valfunction5, sresultclass1,   '+
                      '  aresultclass1,bresultclass1,   '+
                      '  cresultclass1,dresultclass1,   '+
                      '  sresultclass2,                 '+
                      '  aresultclass2,bresultclass2,   '+
                      '  cresultclass2,dresultclass2,   '+
                      '  sresultclass3,                 '+
                      '  aresultclass3,bresultclass3,   '+
                      '  cresultclass3,dresultclass3,   '+
                      '  sresultclass4,                 '+
                      '  aresultclass4,bresultclass4,   '+
                      '  cresultclass4,dresultclass4,   '+
                      '  sresultclass5,                 '+
                      '  aresultclass5,bresultclass5,   '+
                      '  cresultclass5,dresultclass5,   '+
                      '  e1prjopinon,                   '+
                      '  writeemp , writetime)         '+
                      'VALUES  '+
                      ' (''%s'' , ''%s'' , '+
                      '  %f , ''%s'' , '+
                      '  %f , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  %f , %f , '+
                      '  %f , %f , '+
                      '  %f , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'',           '+
                      '  ''%s'' , ''%s'' ) ',
                [Param[0], Param[1],
                LSeqno, Param[2],
                Mainweight,Param[3],
                Param[4], Param[5],
                Param[6], Param[7],
                StrToFloat(Param[8]),StrToFloat(Param[9]),
                StrToFloat(Param[10]),StrToFloat(Param[11]),
                StrToFloat(Param[12]), Param[13],
                Param[14],Param[15],
                Param[16],Param[17],
                Param[18],Param[19],
                Param[20],Param[21],
                Param[22],Param[23],
                Param[24],Param[25],
                Param[26],Param[27],
                Param[28],Param[29],
                Param[30],Param[31],
                Param[32],Param[33],
                Param[34],Param[35],
                Param[36],Param[37],
                Param[38],Param[39],
                Param[40],Param[41],
                Param[42],Param[43],
                Param[44],Param[45],
                Param[46],Param[47],
                Param[48],
                Param[49],Ltime ]);
  end;

  DataModule_Tmax.Cupd_SQL := Sqltext;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;

  if Pgubun = 1 then
    //Save_Pehremas_Init(Param[20],Param[21])
//====================================================================================//
//   30.39      2001.07.24         손종운 수정             자기계발목표 추가
//====================================================================================//
//    Save_Pehremas_Init(Param[14],Param[15])
    Save_Pehremas_Init(Param[18],Param[19])
//====================================================================================//
  else
    Save_Pehremas_Init(Param[0], Param[1]);
end;

procedure TDM.Save_Pehreaim_B(Param : OleVariant; Pgubun : integer);
var
  SqlText : string;
  LSeqno  : real;
  Ltime   : string;
  Hgubun  : string;
begin
  SqlText := '';
  LSeqno  := 0;
  Ltime   := GetOracleTime;
  Hgubun  := GetHalf(Format('%s',[param[6]]));
  if Pgubun = 1 then  // 수정
  begin
    Hgubun  := GetHalf(Format('%s',[param[6]]));
{===============================================================================
 Version    date(yy.mm.dd)     programmer      relevant doc.no  description
 30.13      2001.04.14         윤형식          by 하병수        업무목표 상하반기 자료를 상반기필드 자료에만 씀.
===============================================================================}
    //if Hgubun = '0' then //상반기
    //  SqlText := Format('UPDATE pehreaim_B SET '+
    //                  '  propeltask = ''%s'', '+
    //                  '  validx     = ''%s'', '+
    //                  '  valfunction= ''%s'', '+
    //                  '  forweight  = ''%f'', '+
    //                  '  foraim     = ''%s'', '+
    //                  '  writeemp   = ''%s'', '+
    //                  '  writetime  = ''%s''  '+ // 0..8
    //                  ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND seqno = ''%f'' ',
    //           [Param[0], Param[1],
    //            Param[2], StrToFloat(Param[3]),
    //            Param[4], Param[5],
    //            Ltime,
    //            // 키부분
    //            Param[6],Param[7],
    //            StrToFloat(Param[8]) ])
    //else
    //  SqlText := Format('UPDATE pehreaim_B SET '+
    //                  '  propeltask = ''%s'', '+
    //                  '  validx     = ''%s'', '+
    //                  '  valfunction= ''%s'', '+
    //                  '  latweight  = ''%f'', '+
    //                  '  lataim     = ''%s'', '+
    //                  '  writeemp   = ''%s'', '+
    //                  '  writetime  = ''%s''  '+ // 0..8
    //                  ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND seqno = ''%f'' ',
    //           [Param[0], Param[1],
    //            Param[2], StrToFloat(Param[3]),
    //            Param[4], Param[5],
    //            Ltime,
    //            // 키부분
    //            Param[6],Param[7],
    //            StrToFloat(Param[8]) ]);
    SqlText := Format('UPDATE pehreaim_B SET '+
                    '  propeltask = ''%s'', '+
                    '  validx     = ''%s'', '+
                    '  valfunction= ''%s'', '+
                    '  forweight  = ''%f'', '+
                    '  foraim     = ''%s'', '+
                    '  writeemp   = ''%s'', '+
                    '  writetime  = ''%s''  '+ // 0..8
                    ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND seqno = ''%f'' ',
             [Param[0], Param[1],
              Param[2], StrToFloat(Param[3]),
              Param[4], Param[5],
              Ltime,
              // 키부분
              Param[6],Param[7],
              StrToFloat(Param[8]) ])
  end
  else                // 추가
  begin
    lSeqno := GetSeqno(' pehreaim_B ',Param[0],Param[1]);
    Hgubun  := GetHalf(Format('%s',[param[0]]));
{===============================================================================
 Version    date(yy.mm.dd)     programmer      relevant doc.no  description
 30.13      2001.04.14         윤형식          by 하병수        업무목표 상하반기 자료를 상반기필드 자료에만 씀.
===============================================================================}
    //if Hgubun = '0' then //상반기
    //  SqlText := Format('INSERT INTO pehreaim_B '+
    //                  ' (rabasdate  , empno      , '+
    //                  '  seqno      ,              '+
    //                  '  propeltask , validx     , '+
    //                  '  valfunction, forweight  , '+
    //                  '  foraim     , writeemp   , '+
    //                  '  writetime )               '+
    //                  'VALUES  '+
    //                  ' (''%s'' , ''%s'' , '+
    //                  '  ''%f'' ,          '+
    //                  '  ''%s'' , ''%s'' , '+
    //                  '  ''%s'' , ''%f'' , '+
    //                  '  ''%s'' , ''%s'' , '+
    //                  '  ''%s'')           ',
    //           [Param[0], Param[1],
    //            LSeqno,
    //            Param[2], Param[3],
    //            Param[4], StrToFloat(Param[5]),
    //            Param[6], Param[7],
    //            Ltime ])
    //else
    //  SqlText := Format('INSERT INTO pehreaim_B '+
    //                  ' (rabasdate  , empno      , '+
    //                  '  seqno      ,              '+
    //                  '  propeltask , validx     , '+
    //                  '  valfunction, latweight  , '+
    //                  '  lataim     , writeemp   , '+
    //                  '  writetime )               '+
    //                  'VALUES  '+
    //                  ' (''%s'' , ''%s'' , '+
    //                  '  ''%f'' ,          '+
    //                  '  ''%s'' , ''%s'' , '+
    //                  '  ''%s'' , ''%f'' , '+
    //                  '  ''%s'' , ''%s'' , '+
    //                  '  ''%s'')           ',
    //           [Param[0], Param[1],
    //            LSeqno,
    //            Param[2], Param[3],
    //            Param[4], StrToFloat(Param[5]),
    //            Param[6], Param[7],
    //            Ltime ]);
    SqlText := Format('INSERT INTO pehreaim_B '+
                    ' (rabasdate  , empno      , '+
                    '  seqno      ,              '+
                    '  propeltask , validx     , '+
                    '  valfunction, forweight  , '+
                    '  foraim     , writeemp   , '+
                    '  writetime )               '+
                    'VALUES  '+
                    ' (''%s'' , ''%s'' , '+
                    '  ''%f'' ,          '+
                    '  ''%s'' , ''%s'' , '+
                    '  ''%s'' , ''%f'' , '+
                    '  ''%s'' , ''%s'' , '+
                    '  ''%s'')           ',
             [Param[0], Param[1],
              LSeqno,
              Param[2], Param[3],
              Param[4], StrToFloat(Param[5]),
              Param[6], Param[7],
              Ltime ])
  end;
//
  DataModule_Tmax.Cupd_SQL := Sqltext;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;

  if Pgubun = 1 then
    Save_Pehremas_Init(Param[6],Param[7])
  else
    Save_Pehremas_Init(Param[0], Param[1]);
end;

//====================================================================================//
//   30.39      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
procedure TDM.Save_Pehdevdet(Param : OleVariant; Pgubun : integer);
var
  SqlText : string;
  LSeqno  : real;
  Ltime   : string;
//  Hgubun  : string;
begin
  SqlText := '';
  LSeqno  := 0;
  Ltime   := GetOracleTime;
  if Pgubun = 1 then  // 수정
  begin
//      Hgubun  := GetHalf(Format('%s',[param[6]]));
    SqlText := Format('UPDATE pehdevdet SET '+
                      '       devitem    = ''%s'', '+
                      '       devmethod  = ''%s'', '+
                      '       devaim     = ''%s'', '+
                      '       demand     = ''%s'', '+
                      '       writeemp   = ''%s'', '+
                      '       writetime  = ''%s''  '+ // 0..4
                      'WHERE rabasdate = ''%s'' AND empno = ''%s'' AND seqno = ''%f'' ',
             [Param[0], Param[1],
              Param[2], Param[3],
              Param[4],
              Ltime,
              // 키부분
              Param[5],Param[6],
              StrToFloat(Param[7]) ])
  end
  else                // 추가
  begin
    Lseqno := GetSeqno(' pehdevdet ',Param[0],Param[1]);
    if Lseqno > 3 then
    begin
      Showmessage('자기계발은 3개까지만 등록 가능 합니다.'+#13#13+
                  '다른 항목을 삭제 후 등록하십시요!');
      system.Exit;
    end;
//      Hgubun  := GetHalf(Format('%s',[param[0]]));
    SqlText := Format('INSERT INTO pehdevdet     '+
                    ' (rabasdate  , empno      , '+
                    '  seqno      ,              '+
                    '  devitem    , devmethod  , '+
                    '  devaim     , demand     , '+
//                  '  rvalview   , e1valview  , '+        //평가에서 사용
                    '  writeemp   , writetime )  '+
                    'VALUES                      '+
                    ' (''%s'' , ''%s'' ,         '+
                    '  ''%f'' ,                  '+
                    '  ''%s'' , ''%s'' ,         '+
                    '  ''%s'' , ''%s'' ,         '+
//                      '  ''''   , '''' ,   '+                //평가에서 사용
                    '  ''%s'' , ''%s'' ) ',
             [Param[0], Param[1],
              LSeqno,
              Param[2], Param[3],
              Param[4], Param[5],

              Param[6], Ltime ])
  end;
//
  DataModule_Tmax.Cupd_SQL := Sqltext;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;

//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
  if Pgubun = 1 then        //수정
    Save_Pehremas_Init(Param[5], Param[6])
  else                      //추가
    Save_Pehremas_Init(Param[0], Param[1]);
//====================================================================================//

end;

procedure TDM.Fsvr_ConfirmSql(pwork, pgubun, SaveOk: Integer; Param: OleVariant);
begin

  if pwork = 1 then  // 관리직
    Save_Pehreaimhis_A(Param,Pgubun,SaveOk);
  if pwork = 2 then  // 영업직
    Save_Pehreaimhis_B(Param,Pgubun,SaveOk);

  // Save_Pehreaimhis_Com1(Param,Pgubun,SaveOk);

end;

function TDM.GetPehremasSqlText(Pgubun : integer; rabasdate,empno,Ltime : string) : string;
begin
  Result := '';

  if Pgubun = 0 then // 피평가자
  begin

    Result := Format('UPDATE pehremas SET '+
                      '  rprjconyn = ''Y'', rprjcondate = ''%s'',e1prjobjyn = ''N'',  '+
                      '  e2prjobjyn = ''N''  '+
                      ' WHERE rabasdate = ''%s'' AND empno = ''%s'' ',
               [Copy(Ltime,1,8), rabasdate, empno ]);
  end;

  if Pgubun = 1 then // 1차
  begin
    Result := Format('UPDATE pehremas SET '+
                      '  e1prjconyn = ''Y'', e1prjcondate = ''%s'' '+
                      ' WHERE rabasdate = ''%s'' AND empno = ''%s'' ',
               [Copy(Ltime,1,8), rabasdate, empno ]);
  end;

  if Pgubun = 2 then // 2차
  begin
    Result := Format('UPDATE pehremas SET '+
                      '  e2prjconyn = ''Y'', e2prjcondate = ''%s'' '+
                      ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND e2empno IS NOT NULL ',
               [Copy(Ltime,1,8), rabasdate, empno ]);
  end;

end;

procedure TDM.Save_Pehreaimhis_A(Param : OleVariant; Pgubun, SaveOk : integer);
var
  SqlText : string;
  SqlText1: string;
  SqlText2: string;

  SqlText3: String;
  Ltime   : string;
begin
  SqlText := '';
  SqlText1:= '';
  SqlText2:= '';

  Ltime   := GetOracleTime;

  SqlText := GetPehremasSqlText(Pgubun,Param[0],Param[1],Ltime);

  if (pgubun = 1) and (gsLastConEv = '1차') then
    SqlText3:= GetPehremasSqlText(2,Param[0],Param[1],Ltime);

  if (Pgubun in [1,2]) and (SaveOk = 2) then // 1차,2차
  begin
    SqlText1:= Format('INSERT INTO pehaimhis_A      '+
                      ' (rabasdate   , empno      , '+
                      '  seqno       , korname    , '+
                      '  jobgun      , paycl      , '+
                      '  payra       , title      , '+
                      '  orgnum      , deptcode   , '+
                      '  rprjconyn   , rprjcondate, '+
                      '  empdate     , paycldate  , '+
                      '  trdate      , specialyn  , '+

                      '  e1empno     , e1korname  , '+
                      '  e1paycl     , e1payra    , '+
                      '  e1orgnum    , e1deptcode , '+
                      '  e1prjview   , e1prjconyn , '+
                      '  e1prjcondate,              '+
//====================================================================================//
//   30.39      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                      '  ebrempno     , ebrkorname  , '+
                      '  ebrpaycl     , ebrpayra    , '+
                      '  ebrorgnum    , ebrdeptcode , '+
                      '  ebrprjview   , ebrprjconyn , '+
                      '  ebrprjcondate,               '+
//====================================================================================//

                      '  e2empno     , e2korname  , '+
                      '  e2paycl     , e2payra    , '+
                      '  e2orgnum    , e2deptcode , '+
                      '  e2prjview   , e2prjconyn , '+
                      '  e2prjcondate,              '+

                      '  propeltask  , validx     , '+
//====================================================================================//
//   30.39      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                      '  validx2     , validx3    , '+
                      '  validx4     , validx5    , '+
//====================================================================================//
                      '  plan1       , plan2      , '+
                      '  plan3       , plan4      , '+
                      '  plan5       , forweight  , '+
                      '  foraim1     , foraim2    , '+
                      '  foraim3     , foraim4    , '+
                      '  foraim5     , latweight  , '+
                      '  lataim1     , lataim2    , '+
                      '  lataim3     , lataim4    , '+
                      '  lataim5     ,              '+

                      '  begindate   , chancnt    , '+
                      '  enddate     , savedate   , '+
                      '  writeemp    , writetime)   '+
                      'SELECT '+
                      '  a.rabasdate   , a.empno      , '+
                      '  a.seqno       , b.korname    , '+
                      '  b.jobgun      , b.paycl      , '+
                      '  b.payra       , b.title      , '+
                      '  b.orgnum      , b.deptcode   , '+
                      '  b.rprjconyn   , b.rprjcondate, '+
                      '  b.empdate     , b.paycldate  , '+
                      '  b.trdate      , b.specialyn  , '+

                      '  b.e1empno     , b.e1korname  , '+
                      '  b.e1paycl     , b.e1payra    , '+
                      '  b.e1orgnum    , b.e1deptcode , '+
                      '  b.e1prjview   , b.e1prjconyn , '+
                      '  b.e1prjcondate,                '+
//====================================================================================//
//   30.39      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                      '  b.ebrempno     , b.ebrkorname  , '+
                      '  b.ebrpaycl     , b.ebrpayra    , '+
                      '  b.ebrorgnum    , b.ebrdeptcode , '+
                      '  b.ebrprjview   , b.ebrprjconyn , '+
                      '  b.ebrprjcondate,                 '+
//====================================================================================//

                      '  b.e2empno     , b.e2korname  , '+
                      '  b.e2paycl     , b.e2payra    , '+
                      '  b.e2orgnum    , b.e2deptcode , '+
                      '  b.e2prjview   , b.e2prjconyn , '+
                      '  b.e2prjcondate,                '+

                      '  a.propeltask  , a.validx     , '+
//====================================================================================//
//   30.39      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                      '  a.validx2     , a.validx3    , '+
                      '  a.validx4     , a.validx5    , '+
//====================================================================================//
                      '  a.plan1       , a.plan2      , '+
                      '  a.plan3       , a.plan4      , '+
                      '  a.plan5       , a.forweight  , '+
                      '  a.foraim1     , a.foraim2    , '+
                      '  a.foraim3     , a.foraim4    , '+
                      '  a.foraim5     , a.latweight  , '+
                      '  a.lataim1     , a.lataim2    , '+
                      '  a.lataim3     , a.lataim4    , '+
                      '  a.lataim5     ,                '+
{===============================================================================
 Version    date(yy.mm.dd)     programmer      relevant doc.no  description
 30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
===============================================================================}
//                        '  ''%s''        , 0            , '+
                      '  ''%s''        , nvl(a.chancnt,0) + 1  , '+
                      '  ''%s''        , ''%s''       , '+
                      '  ''%s''        , ''%s''         '+
                      '  FROM pehreaim_A a, pehremas b  '+
                      ' WHERE a.rabasdate = ''%s''      AND a.empno = ''%s'' '+
                      '   AND a.rabasdate = b.rabasdate AND a.empno = b.empno ',
               [Copy(Ltime,1,8),Copy(Ltime,1,8),Ltime,Param[2],Ltime,Param[0],Param[1] ]);
  end;

  if (Pgubun in [1,2]) and (SaveOk = 1) then // 1차,2차
  begin
    SqlText2 := Format('UPDATE pehreaim_A SET '+
                      '  begindate = ''%s'', enddate = ''%s'', chancnt = nvl(chancnt,0) + 1 '+
                      ' WHERE rabasdate = ''%s'' AND empno = ''%s'' ',
                [Copy(Ltime,1,8), Copy(Ltime,1,8), Param[0], Param[1] ]);
  end;

  if SqlText <> '' then
  begin
    DataModule_Tmax.Cupd_SQL := Sqltext;
    DataModule_Tmax.Cupd_Exec;
    if not DataModule_Tmax.Cupd_ret then
    begin
      Messagedlg('APP-Server Error',mtError,[mbOK],0);
      Exit;
    end;
  end;

  if SqlText3 <> '' then
  begin
    DataModule_Tmax.Cupd_SQL := Sqltext3;
    DataModule_Tmax.Cupd_Exec;
    if not DataModule_Tmax.Cupd_ret then
    begin
      Messagedlg('APP-Server Error',mtError,[mbOK],0);
      Exit;
    end;
  end;

  if SqlText1 <> '' then
  begin
    DataModule_Tmax.Cupd_SQL := Sqltext1;
    DataModule_Tmax.Cupd_Exec;
    if not DataModule_Tmax.Cupd_ret then
    begin
      Messagedlg('APP-Server Error',mtError,[mbOK],0);
      Exit;
    end;
  end;

  if SqlText2 <> '' then
  begin
    DataModule_Tmax.Cupd_SQL := Sqltext2;
    DataModule_Tmax.Cupd_Exec;
    if not DataModule_Tmax.Cupd_ret then
    begin
      Messagedlg('APP-Server Error',mtError,[mbOK],0);
      Exit;
    end;
  end;

end;

procedure TDM.Save_Pehreaimhis_B(Param : OleVariant; Pgubun, SaveOk : integer);
var
  SqlText : string;
  SqlText1: string;
  SqlText2: string;
  SqlText3: string;
  Ltime   : string;
begin
  SqlText := '';
  SqlText1:= '';
  SqlText2:= '';

  Ltime   := GetOracleTime;

  // 목표수립확인여부 보관.
  SqlText := GetPehremasSqlText(Pgubun,Param[0],Param[1],Ltime);
  if (pgubun = 1) and (gsLastConEv = '1차') then
    SqlText3:= GetPehremasSqlText(2,Param[0],Param[1],Ltime);

  // 내역을 보관한다.
{===============================================================================
   Version    date(yy.mm.dd)     programmer      relevant doc.no  description
   30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
===============================================================================}
//  if (Pgubun in [1,2]) and (SaveOk = 1) then // 1차,2차
   if (Pgubun in [1,2]) and (SaveOk = 2) then // 1차,2차
  begin
    SqlText1:= Format('INSERT INTO pehaimhis_B      '+
                      ' (rabasdate   , empno      , '+
                      '  seqno       , korname    , '+
                      '  jobgun      , paycl      , '+
                      '  payra       , title      , '+
                      '  orgnum      , deptcode   , '+
                      '  rprjconyn   , rprjcondate, '+
                      '  empdate     , paycldate  , '+
                      '  trdate      , specialyn  , '+

                      '  e1empno     , e1korname  , '+
                      '  e1paycl     , e1payra    , '+
                      '  e1orgnum    , e1deptcode , '+
                      '  e1prjview   , e1prjconyn , '+
                      '  e1prjcondate,              '+
//====================================================================================//
//   30.39      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                      '  ebrempno     , ebrkorname  , '+
                      '  ebrpaycl     , ebrpayra    , '+
                      '  ebrorgnum    , ebrdeptcode , '+
                      '  ebrprjview   , ebrprjconyn , '+
                      '  ebrprjcondate,              '+
//====================================================================================//

                      '  e2empno     , e2korname  , '+
                      '  e2paycl     , e2payra    , '+
                      '  e2orgnum    , e2deptcode , '+
                      '  e2prjview   , e2prjconyn , '+
                      '  e2prjcondate,              '+

                      '  propeltask  , validx     , '+
                      '  valfunction , forweight  , '+
                      '  foraim      , latweight  , '+
                      '  lataim      ,              '+

                      '  begindate   , chancnt    , '+
                      '  enddate     , savedate   , '+
                      '  writeemp    , writetime)   '+
                      'SELECT '+
                      '  a.rabasdate   , a.empno      , '+
                      '  a.seqno       , b.korname    , '+
                      '  b.jobgun      , b.paycl      , '+
                      '  b.payra       , b.title      , '+
                      '  b.orgnum      , b.deptcode   , '+
                      '  b.rprjconyn   , b.rprjcondate, '+
                      '  b.empdate     , b.paycldate  , '+
                      '  b.trdate      , b.specialyn  , '+

                      '  b.e1empno     , b.e1korname  , '+
                      '  b.e1paycl     , b.e1payra    , '+
                      '  b.e1orgnum    , b.e1deptcode , '+
                      '  b.e1prjview   , b.e1prjconyn , '+
                      '  b.e1prjcondate,                '+
//====================================================================================//
//   30.39      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                      '  b.ebrempno     , b.ebrkorname  , '+
                      '  b.ebrpaycl     , b.ebrpayra    , '+
                      '  b.ebrorgnum    , b.ebrdeptcode , '+
                      '  b.ebrprjview   , b.ebrprjconyn , '+
                      '  b.ebrprjcondate,                 '+
//====================================================================================//

                      '  b.e2empno     , b.e2korname  , '+
                      '  b.e2paycl     , b.e2payra    , '+
                      '  b.e2orgnum    , b.e2deptcode , '+
                      '  b.e2prjview   , b.e2prjconyn , '+
                      '  b.e2prjcondate,                '+

                      '  a.propeltask  , a.validx     , '+
                      '  a.valfunction , a.forweight  , '+
                      '  a.foraim      , a.latweight  , '+
                      '  a.lataim      ,                '+

{===============================================================================
 Version    date(yy.mm.dd)     programmer      relevant doc.no  description
 30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
===============================================================================}
//                        '  ''%s''        , 0            , '+
                      '  ''%s''        , nvl(a.chancnt,0) + 1  , '+
                      '  ''%s''        , ''%s''       , '+
                      '  ''%s''        , ''%s''         '+
                      '  FROM pehreaim_B a, pehremas b  '+
                      ' WHERE a.rabasdate = ''%s''      AND a.empno = ''%s'' '+
                      '   AND a.rabasdate = b.rabasdate AND a.empno = b.empno ',
               [Copy(Ltime,1,8),Copy(Ltime,1,8),Ltime,Param[2],Ltime,Param[0],Param[1] ]);
  end;

  // 목표관리 최조수립일,변경횟수, 최종변경일 수정.
{===============================================================================
   Version    date(yy.mm.dd)     programmer      relevant doc.no  description
   30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
===============================================================================}
//  if (Pgubun in [1,2]) and (SaveOk = 1) then // 1차,2차
  if (Pgubun in [1,2]) and (SaveOk >= 1) then // 1차,2차
  begin
    SqlText2 := Format('UPDATE pehreaim_B SET '+
{===============================================================================
 Version    date(yy.mm.dd)     programmer      relevant doc.no  description
 30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
===============================================================================}
//                        '  begindate = ''%s'', enddate = ''%s'', chancnt = 0 '+
                      '  begindate = ''%s'', enddate = ''%s'', chancnt = nvl(chancnt,0) + 1 '+
                      ' WHERE rabasdate = ''%s'' AND empno = ''%s'' ',
                [Copy(Ltime,1,8), Copy(Ltime,1,8), Param[0], Param[1] ]);
  end;

  if SqlText <> '' then
  begin
    DataModule_Tmax.Cupd_SQL := Sqltext;
    DataModule_Tmax.Cupd_Exec;
    if not DataModule_Tmax.Cupd_ret then
      begin
        Messagedlg('APP-Server Error',mtError,[mbOK],0);
        Exit;
      end;
  end;

  if SqlText3 <> '' then
  begin
    DataModule_Tmax.Cupd_SQL := Sqltext3;
    DataModule_Tmax.Cupd_Exec;
    if not DataModule_Tmax.Cupd_ret then
    begin
      Messagedlg('APP-Server Error',mtError,[mbOK],0);
      Exit;
    end;
  end;

  if SqlText1 <> '' then
  begin
    DataModule_Tmax.Cupd_SQL := Sqltext1;
    DataModule_Tmax.Cupd_Exec;
    if not DataModule_Tmax.Cupd_ret then
    begin
      Messagedlg('APP-Server Error',mtError,[mbOK],0);
      Exit;
    end;
  end;

  if SqlText2 <> '' then
    begin
      DataModule_Tmax.Cupd_SQL := Sqltext2;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
      begin
        Messagedlg('APP-Server Error',mtError,[mbOK],0);
        Exit;
      end;
    end;

end;

procedure TDM.Fsvr_DeleteSql(pwork, pgubun: Integer; Param: OleVariant);
begin
    if pwork = 1 then  // 관리직
      Delete_Pehreaim_A(Param,Pgubun);
    if pwork = 2 then  // 영업직
      Delete_Pehreaim_B(Param,Pgubun);
//====================================================================================//
//   30.39      2001.07.24         손종운 추가                 자기계발목표 추가
//====================================================================================//
    if pwork = 5 then  // 자기계발
      Delete_Pehdevdet(Param,Pgubun);        // param = [기준일, 사번, 순번] , pgubun = 0
//====================================================================================//
end;

procedure TDM.Delete_Pehreaim_A(Param : OleVariant; Pgubun : integer);
var
  SqlText : string;
begin
  //SqlText := Format('DELETE FROM pehreaim_DET '+
  SqlText := Format('DELETE FROM pehreaim_COM '+
                    ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND seqno = ''%f'' ',
             [Param[0],Param[1],StrToFloat(Param[2]) ]);
//
  DataModule_Tmax.Cupd_SQL := Sqltext;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;

  Save_Pehremas_Init(Param[0], Param[1]);
end;

procedure TDM.Delete_Pehreaim_B(Param : OleVariant; Pgubun : integer);
var
  SqlText : string;
begin
  SqlText := Format('DELETE FROM pehreaim_B '+
                    ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND seqno = ''%f'' ',
             [Param[0],Param[1],StrToFloat(Param[2]) ]);
//
  DataModule_Tmax.Cupd_SQL := Sqltext;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;

  Save_Pehremas_Init(Param[0], Param[1]);
end;

procedure TDM.Save_Pehremas_Init(rabasdate, empno: String);
var
  SqlText : string;
  Ltime   : string;
begin
  SqlText := '';
  SqlText := Format('UPDATE pehremas SET '+
                        '  rprjconyn = ''N'',  rprjcondate = '''', '+
                        '  e1prjconyn = ''N'', e1prjcondate = '''', '+
                        '  e2prjconyn = ''N'', e2prjcondate = ''''  '+
                        ' WHERE rabasdate = ''%s'' AND empno = ''%s''',
                 [rabasdate, empno]);
//
  DataModule_Tmax.Cupd_SQL := Sqltext;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;
end;

//====================================================================================//
//   30.39      2001.07.24         손종운 추가                 자기계발목표 추가
//====================================================================================//
procedure TDM.Delete_Pehdevdet(Param: OleVariant; Pgubun: integer);
var
  SqlText : string;
begin
  SqlText := Format('DELETE FROM pehdevdet '+
                    ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND seqno = ''%f'' ',
             [Param[0],Param[1],StrToFloat(Param[2]) ]);
//
  DataModule_Tmax.Cupd_SQL := Sqltext;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;

  SqlText := '';
  SqlText := Format('UPDATE pehdevdet a SET                             '+
                    '       seqno = ( select nvl(count(b.seqno), 0) + 1 '+
                    '                 from pehdevdet b                  '+
                    '                 where a.rabasdate = b.rabasdate   '+
                    '                   and a.empno = b.empno           '+
                    '                   and a.seqno > b.seqno )         '+
                    'where  a.rabasdate = ''%s'' '+
                    '  and  a.empno     = ''%s'' ',
                    [Param[0], Param[1]]);

  DataModule_Tmax.Cupd_SQL := Sqltext;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;
  Save_Pehremas_Init(Param[0], Param[1]);

end;

function TDM.Getpyccode(id,no:string):string;
var
  Sqltext : string;
begin
  Result := '';
  if trim(id) = '' then Exit;

  Sqltext := format('select codename  from pyccode '+
                    ' where codeid=''%s'' and codeno=''%s'' ',
                    [id,no]);
//
  DataModule_Tmax.Csel_SQL := Sqltext;
  DataModule_Tmax.Csel_Open4;
  if DM.Qmas.RecordCount < 1 then
  begin
    exit;
  end;
  Result := DataModule_Tmax.Csel_gfd4(1);
end;

function TDM.Getpycdept(org,dept:string):string;
var
  Sqltext : string;
begin
  Result := '';
  if (Length(trim(dept))<=0) or (Length(trim(org))<=0) then Exit;

  Sqltext := format('select deptname  from pycdept '+
                    ' where deptcode=''%s'' and orgnum=''%s'' ',
                    [dept,org]);
//
  DataModule_Tmax.Csel_SQL := Sqltext;
  DataModule_Tmax.Csel_Open4;
  if DM.Qmas.RecordCount < 1 then
  begin
      exit;
  end;
  Result := DataModule_Tmax.Csel_gfd4(1);
end;

procedure TDM.Save_Pehreaim_COM(Param : OleVariant; Pgubun : integer);
var
  SqlText : string;
  lSeqno, MainWeight : real;
  Ltime   : string;
  Hgubun  : string;
begin
  SqlText := '';
  LSeqno  := 0;
  Ltime   := GetOracleTime;

  if Pgubun = 1 then  // 수정
  begin
{
    SqlText := Format('UPDATE pehreaim_com SET '+
                    //'  propeltask    = ''%s'', '+
                    '  mainweight    = ''%f'', '+
                    '  detailtask    = ''%s'', '+
                    '  detailweight  = ''%f'', '+
                    '  validx        = ''%s'', '+
                    '  sresultclass  = ''%s'', '+
                    '  aresultclass  = ''%s'', '+
                    '  bresultclass  = ''%s'', '+
                    '  cresultclass  = ''%s'', '+
                    '  dresultclass  = ''%s'', '+
                    '  e1prjopinon    = ''%s'', '+
                    '  writeemp   = ''%s'', '+
                    '  writetime  = ''%s''  '+ // 0..20
                    ' WHERE rabasdate = ''%s'' AND propeltask = ''%s'' AND seqno = ''%f'' ',
             [StrToFloat(Param[3]),
              Param[4],StrToFloat(Param[5]),
              Param[6],Param[7], Param[8],Param[9],Param[10],Param[11],
              Param[12],
              Param[13],Ltime,
              // 키부분
              Param[0],Param[1],
              StrToFloat(Param[2]) ]);
}
    SqlText := Format('UPDATE pehreaim_com SET '+
                           ' detailtask   = ''%s'', '+
                           ' detailweight = ''%f'', '+
                           ' validx       = ''%s'', '+
                           ' sresultclass = ''%s'', '+
                           ' aresultclass = ''%s'', '+
                           ' bresultclass = ''%s'', '+
                           ' cresultclass = ''%s'', '+
                           ' dresultclass = ''%s'', '+
                           ' e1prjopinon  = ''%s'', '+
                           ' writeemp  = ''%s'', '+
                           ' writetime = ''%s''  '+ // 0..20
                    ' WHERE rabasdate = ''%s'' AND taskcode = ''%f'' AND seqno = ''%f'' AND deptcode = ''%s'' ',
             [Param[4],StrToFloat(Param[5]),
              Param[6],Param[7], Param[8],Param[9],Param[10],Param[11],
              Param[12],
              Param[13],Ltime,
              // 키부분
              Param[0],              StrToFloat(Param[1]),
              StrToFloat(Param[2]),  Param[3] ]);

//====================================================================================//
  end
  else  if Pgubun = 2 then               // 추가
  begin
  {
   SqlText := Format('INSERT INTO pehreaim_COM        '+
                      ' (rabasdate  ,                  '+
                      '  propeltask ,  seqno,          '+
                      '  mainweight ,  detailtask,     '+
                      '  detailweight, validx,         '+
                      '  valfunction , sresultclass,   '+
                      '  aresultclass, bresultclass,   '+
                      '  cresultclass, dresultclass,   '+
                      '  e1prjopinon,                  '+
                      '  writeemp , writetime)         '+
                      ' VALUES  '+
                      ' (''%s'' , '+
                      '  ''%s'' ,%f ,  '+
                      '  ''%s'' ,%f ,  '+
                      '  %f , ''%s'' , '+
                      '  %f , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'',           '+
                      '  ''%s'' , ''%s'' ) ',
                [Param[0],
                Param[1], StrToFloat(Param[2]),
                StrToFloat(Param[3]),Param[4],
                StrToFloat(Param[5]),Param[6],
                '',                  Param[7],
                Param[8],Param[9],
                Param[10],Param[11],
                Param[12],
                Param[13],Ltime ]);
                }
   SqlText := Format('INSERT INTO pehreaim_COM        '+
                      ' (rabasdate,                   '+
                      '  deptcode ,    taskcode , seqno, '+
                      '  mainweight ,  detailtask,    '+
                      '  detailweight, validx,        '+
                      '  valfunction , sresultclass,  '+
                      '  aresultclass, bresultclass,  '+
                      '  cresultclass, dresultclass,  '+
                      '  e1prjopinon,                 '+
                      '  writeemp , writetime)        '+
                      ' VALUES  '+
                      ' (''%s'' , '+
                      '  ''%s'' , %f  ,%f , '+
                      '  %f , ''%s'' , '+
                      '  %f , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'',           '+
                      '  ''%s'' , ''%s'' ) ',
                [Param[0],
                Param[1], StrToFloat(Param[2]),StrToFloat(Param[3]),
                StrToFloat(Param[4]),Param[5],
                StrToFloat(Param[6]),Param[7],
                '',                  Param[8],
                Param[9],Param[10],
                Param[11],Param[12],
                Param[13],
                Param[14],Ltime ]);
  end
  else if Pgubun = 3 then               // 삭제
  begin
{
   SqlText := Format('DELETE FROM pehreaim_COM        '+
                            ' WHERE rabasdate = ''%s'' AND propeltask = ''%s'' AND seqno = ''%f'' ',
                [Param[0],
                Param[1], StrToFloat(Param[2]) ]);
}
   SqlText := Format('DELETE FROM pehreaim_COM        '+
                            ' WHERE rabasdate = ''%s'' AND propeltask = ''%f'' AND seqno = ''%f'' ',
                [Param[0], StrToFloat(Param[1]), StrToFloat(Param[2])]);
  end;


  DataModule_Tmax.Cupd_SQL := Sqltext;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;

end;

procedure TDM.Save_Pehreaim_BAS(Param : OleVariant; Pgubun : integer);
var
  SqlText : string;
  lSeqno, MainWeight : real;
  Ltime   : string;
  Hgubun  : string;
begin
  SqlText := '';
  LSeqno  := 0;
  Ltime   := GetOracleTime;

  if Pgubun = 1 then  // 수정
  begin
    SqlText := Format('UPDATE pehreaim_bas SET '+
                    '  taskname   = ''%s'', '+
                    '  writeemp   = ''%s'', '+
                    '  writetime  = ''%s''  '+ // 0..20
                    ' WHERE rabasdate = ''%s'' AND deptcode = ''%s'' AND taskcode = ''%f'' ',
             [Param[3],
              //StrToFloat(Param[4]),
              Param[5],
              Ltime,
              // 키부분
              Param[0],Param[1],
              StrToFloat(Param[2]) ]);

//====================================================================================//
  end
  else  if Pgubun = 2 then               // 추가
  begin
   SqlText := Format('INSERT INTO pehreaim_bas         '+
                      ' (rabasdate  ,                  '+
                      '  deptcode   ,  taskcode,       '+
                      '  taskname   ,  mainweight,     '+
                      '  writeemp , writetime)         '+
                      ' VALUES  '+
                      ' (''%s'' , '+
                      '  ''%s'' ,%f ,  '+
                      '  ''%s'' ,%f ,  '+
                      '  ''%s'' , ''%s'' ) ',
                [Param[0],
                Param[1], StrToFloat(Param[2]),
                Param[3],StrToFloat(Param[4]),
                Param[5],Ltime ]);
  end
  else if Pgubun = 3 then               // 삭제
  begin
   SqlText := Format('DELETE FROM pehreaim_bas        '+
                            ' WHERE rabasdate = ''%s'' AND deptcode = ''%s'' AND taskcode = ''%f'' ',
                [Param[0],
                Param[1], StrToFloat(Param[2]) ]);
  end;


  DataModule_Tmax.Cupd_SQL := Sqltext;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;

end;


end.
