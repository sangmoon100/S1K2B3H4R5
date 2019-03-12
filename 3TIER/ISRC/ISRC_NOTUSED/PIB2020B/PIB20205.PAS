unit PIB20205;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, //hjku TXClientDS,
  Tmax_DataSetText, Tmax_session;

type
  TCData = class(TDataModule)
    Cdept: TTMaxDataSet;
    CsDept: TTMaxDataSet;
    Cext: TTMaxDataSet;
    Caddept: TTMaxDataSet;
    TDS1: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    Cphoto: TTMaxDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    SqlCDept  : string;
    SqlCPhoto : string;
    SqlCsDept : string;
    SqlCext   : string;

    function  Get_Pimvari(gubun, sgubun : string) : Variant;
    function  Get_BonCode(deptcode, orgnum : string) : Variant;
    function  Get_EmpCode(empno : string) : Variant;
    function  PasString(const s,delimiters : string ; num : integer) : string;
    function  PasCount(const s,delimiters : string) : integer;
    procedure RunOrgSql(gubun: Integer; pstr: OleVariant); safecall;
    procedure RunPhotoSql(const pstr: WideString); safecall;
    procedure RunSdeptSql(gubun: Integer; pstr: OleVariant); safecall;

  end;

var
  CData: TCData;
const
  sqlSelect =  'SELECT  '+
                 ' nvl(        orgym      ,'' ''), '+
                 ' nvl(        gubun      ,'' ''), '+
                 ' nvl(        orgnum     ,'' ''), '+
                 ' nvl(        deptcode   ,'' ''), '+
                 ' nvl(        empno      ,'' ''), '+
                 ' nvl(        korname    ,'' ''), '+
                 ' nvl(        deptlevel  ,'' ''), '+
                 ' nvl(        deptname   ,'' '')||'' ''||nvl(DEPTABBR   ,'' '') DEPTNAME, '+
                 ' nvl(        deptabbr   ,'' ''), '+
                 ' nvl(        extcode    ,'' ''), '+
                 ' nvl(        boncode    ,'' ''), '+
                 ' nvl(        paycl      ,'' ''), '+
                 ' nvl(        payclnm    ,'' ''), '+
                 ' nvl(        payra      ,'' ''), '+
                 ' nvl(        payranm    ,'' ''), '+
                 ' nvl(        payrayn    ,'' ''), '+
                 ' nvl(        adpayrayn  ,'' ''), '+
                 ' nvl(        pstate     ,'' ''), '+
                 ' nvl(        codename   ,'' '') pstatenm, '+
                 ' nvl(        lineyn     ,'' '')  ';

  Sqlqorg = sqlSelect + ' from pihorga a, pyccode c '+
                          'where c.codeid(+) = ''I114''  '+
                          '  and c.codeno(+) = a.pstate  '+
                          '  and empno    =''2451''   ';

  sdetp  = sqlSelect + '  from pihorga a, pyccode c '+
                         ' where c.codeid(+) = ''I114''  '+
                         '   and c.codeno(+) = a.pstate  ';

  orgsql1 = 'select distinct deptname ||'' ''|| DEPTABBR DEPTNAME from pihorga '+
             ' where (deptcode = ''%s'' and gubun = ''0'' and orgym = ''%s'')';


  orgsql2 = sqlSelect + ' from pihorga a, pyccode c                          '+
             ' where (deptcode = ''%s'' and gubun = ''0'' and orgym = ''%s'') '+
             '   and  c.codeid(+) =''I114''                                      '+
             '   and  c.codeno(+) = a.pstate                                     '+
             // 20050701 추가
             '   and a.DEPTCODE in( select deptcode from pycdept where closedate is null and orgnum in(select max(orgnum) from pycdept))'+
             ' order by deptcode,deptlevel,paycl';

  orgsql3 = sqlSelect + ' from pihorga a, pyccode c'+
             ' where (extcode = ''%s'' and gubun = ''0'' and orgym = ''%s'') '+
             '   and c.codeid(+) =''I114''                                      '+
             '   and c.codeno(+) = a.pstate                                     '+
             // 20050701 추가
             '   and a.DEPTCODE in( select deptcode from pycdept where closedate is null and orgnum in(select max(orgnum) from pycdept))'+
             ' order by lineyn desc,deptcode,deptlevel,paycl';

  orgsql4 = sqlSelect + ' from pihorga a, pyccode c             '+
             ' where (gubun = ''1'' and orgym = ''%s'')          '+
             '   and (empno like ''%s'' or  korname like ''%s'') '+
             '   and c.codeid(+) = ''I114''                         '+
             '   and c.codeno(+) = a.pstate                         '+
             'order by empno,paycl,korname                       ';

  orgsql5 = sqlSelect + ' from pihorga a, pyccode c '+
             ' where (deptcode = ''%s'' and orgym = ''%s'' and gubun = ''1'' and pstate < ''60'') '+
             '   and c.codeid(+) =''I114''                                                           '+
             '   and c.codeno(+) = a.pstate                                                          '+
             ' order by payra,paycl,empno                                                         ';

  phoSql  = 'select empno,photo from Cimphot where empno = ''%s'' ';
implementation

{$R *.DFM}


procedure TCData.RunOrgSql(gubun: Integer; pstr: OleVariant);
begin
  case gubun of
    1 : sqlCext  := Format(orgsql1,[pstr[0],pstr[1]]);
    2 : sqlCdept := Format(orgsql2,[pstr[0],pstr[1]]);
    3 : sqlCdept := Format(orgsql3,[pstr[0],pstr[1]]);
    4 : sqlCdept := Format(orgsql4,[pstr[0],pstr[1],pstr[2]]);
    5 : sqlCdept := Format(orgsql5,[pstr[0],pstr[1]]);
  end;

  if gubun = 1 then
    begin
      with Cext do
        begin
          ServiceName :='PIB2020B_sel2';
          Close;
          Sql.Clear;
          Sql.Add(SqlCext);

          ClearFieldInfo;
          AddField('DEPTNAME'          , ftString  ,  60  );
          Open;
        end;
    end
  else
    begin
      With Cdept do
        begin
          ServiceName := 'PIB2020B_sel1';
          Close;
          Sql.Clear;
          Sql.Add(SqlCdept);

          ClearFieldInfo;
          AddField('ORGYM'    , ftString, 6);
          AddField('GUBUN'    , ftString, 1);
          AddField('ORGNUM'   , ftString, 3);
          AddField('DEPTCODE' , ftString, 6);
          AddField('EMPNO'    , ftString, 4);
          AddField('KORNAME'  , ftString, 12);
          AddField('DEPTLEVEL', ftString, 2);
          AddField('DEPTNAME' , ftString, 60);
          AddField('DEPTABBR' , ftString, 30);
          AddField('EXTCODE'  , ftString, 6);
          AddField('BONCODE'  , ftString, 6);
          AddField('PAYCL'    , ftString, 3);
          AddField('PAYCLNM'  , ftString, 20);
          AddField('PAYRA'    , ftString, 3);
          AddField('PAYRANM'  , ftString, 20);
          AddField('PAYRAYN'  , ftString, 1);
          AddField('ADPAYRAYN', ftString, 1);
          AddField('PSTATE'   , ftString, 2);
          AddField('PSTATENM' , ftString, 20);
          AddField('LINEYN'   , ftString, 1);
          Open;
        end;
    end;
end;

procedure TCData.RunPhotoSql(const pstr: WideString);
begin
{
  Qphoto.close; Qphoto.Sql.clear;
  Qphoto.sql.add(Format(phoSql,[pstr]));
}
end;

procedure TCData.RunSdeptSql(gubun: Integer; pstr: OleVariant);
begin
  sqlCsDept := 'select nvl(deptcode,'' '') ,nvl(deptname,'' '') ||'' ''||nvl(deptabbr,'' '') detpname, '+
               ' nvl(deptlevel,'' '') from pihorga  ';
  case gubun of
    1 : sqlCsDept :=sqlCsDept + 'where orgym = '''+ pstr[0]+''' and  substr(deptlevel,1,1)  <> ''A'' and gubun = ''0''';
    2 : sqlCsDept :=sqlCsDept + 'where orgym = '''+ pstr[0]+''' and  substr(deptlevel,1,1)  = ''A'' and gubun = ''0''';
    3 : sqlCsDept :=sqlCsDept + 'where orgym = '''+ pstr[0]+''' and  substr(deptlevel,1,1)  = ''B'' and gubun = ''0''';
    4 : sqlCsDept :=sqlCsDept + 'where orgym = '''+ pstr[0]+''' and  substr(deptlevel,1,1)  = ''C'' and gubun = ''0''';
    5 : sqlCsDept :=sqlCsDept + 'where orgym = '''+ pstr[0]+''' and  substr(deptlevel,1,1)  = ''D'' and gubun = ''0''';
    6 : sqlCsDept := Format(sqlCsDept + 'where (orgym = '''+ pstr[0]+''' and gubun = ''0'') and deptname like ''%s'' ',
                      ['%'+pstr[1]+'%']);
  end;

  with CsDept do
    begin
      ServiceName := 'PIB2020B_sel3';
      Close;
      Sql.Clear;
      Sql.Add(SqlCsDept);

      ClearFieldInfo;
      AddField('DEPTCODE'          , ftString  ,  6   );
      AddField('DEPTNAME'          , ftString  ,  60  );
      AddField('DEPTLEVEL'         , ftString  ,  2   );
      Open;
    end;
end;

function TCData.Get_Pimvari(gubun, sgubun : string) : Variant;
begin
  with TDS1 do
    begin
      ServiceName := 'PIB2020B_sel4';
      Close;
      Sql.Clear;
      Sql.Add('select NVL(value1,'' '')  value1,   ');
      Sql.Add('       NVL(value2,'' '')  value2,   ');
      Sql.Add('       NVL(value3,'' '')  value3,   ');
      Sql.Add('       NVL(value4,'' ''), value4,   ');
      Sql.Add('       NVL(value5,'' ''), value5,   ');
      Sql.Add('       NVL(value6,'' ''), value6,   ');
      Sql.Add('       NVL(value7,'' ''), value7,   ');
      Sql.Add('       NVL(value8,'' ''), value8,   ');
      Sql.Add('       NVL(value9,'' ''), value9    ');
      Sql.Add('  from pimvari                      ');
      Sql.Add(' where (gubun = ''' + gubun + ''' and sgubun = ''' + sgubun + ''' ) ');


      ClearFieldInfo;
      AddField('VALUE1'       , ftString,  20  );
      AddField('VALUE2'       , ftString,  20  );
      AddField('VALUE3'       , ftString,  20  );
      AddField('VALUE4'       , ftString,  20  );
      AddField('VALUE5'       , ftString,  20  );
      AddField('VALUE6'       , ftString,  20  );
      AddField('VALUE7'       , ftString,  20  );
      AddField('VALUE8'       , ftString,  20  );
      AddField('VALUE9'       , ftString,  20  );
      Open;

      if TDS1.RecordCount > 0 then
        Result := VarArrayof([TDS1.FieldByName('value1').AsString,
                              TDS1.FieldByName('value2').AsString,
                              TDS1.FieldByName('value3').AsString,
                              TDS1.FieldByName('value4').AsString,
                              TDS1.FieldByName('value5').AsString,
                              TDS1.FieldByName('value6').AsString,
                              TDS1.FieldByName('value7').AsString,
                              TDS1.FieldByName('value8').AsString,
                              TDS1.FieldByName('value9').AsString,
                              TDS1.RecordCount] )
      else
        Result := VarArrayof(['에러',
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          0]);
      TDS1.Close;
    end;
end;

function TCData.Get_BonCode(deptcode, orgnum : string) : Variant;
begin 
  with TDS1 do
    begin
      ServiceName := 'PIB2020B_sel5';
      Close;
      Sql.Clear;
      Sql.Add(Format('select NVL(deptcode,'' ''),      '+
                     '       NVL(orgnum,'' ''),        '+
                     '       NVL(deptname,'' ''),      '+
                     '       NVL(fieldcode,'' ''),     '+
                     '       NVL(extcode,'' ''),       '+
                     '       NVL(boncode,'' ''),       '+
                     '       NVL(placecode,'' ''),     '+
                     '       NVL(deptna1,'' ''),       '+
                     '       NVL(deptna2,'' ''),       '+
                     '       NVL(deptna3,'' ''),       '+
                     '       NVL(deptlevel,'' ''),     '+
                     '       NVL(sectcode,'' '')       '+
                     'from pycdept                     '+
                     'where deptcode = ''%s'' and orgnum = ''%s'' ', [deptcode, orgnum]) );

      ClearFieldInfo;
      AddField('DEPTCODE' , ftString, 6);
      AddField('ORGNUM'   , ftString, 3);
      AddField('DEPTNAME' , ftString, 60);
      AddField('FIELDCODE', ftString, 3);
      AddField('EXTCODE'  , ftString, 6);
      AddField('BONCODE'  , ftString, 6);
      AddField('PLACECODE', ftString, 2);
      AddField('DEPTNA1'  , ftString, 30);
      AddField('DEPTNA2'  , ftString, 30);
      AddField('DEPTNA3'  , ftString, 30);
      AddField('DEPTLEVEL', ftString, 2);
      AddField('SECTCODE' , ftString, 3);
      Open;
    end;

  if trim(deptcode) = '' then deptcode := strpas(' ');
  if trim(orgnum)   = '' then orgnum   := strpas(' ');
  if TDS1.RecordCount > 0 then
    Result := VarArrayof([TDS1.FieldByName('deptname').AsString,
                        TDS1.FieldByName('deptcode').AsString,
                        TDS1.FieldByName('orgnum').AsString,
                        TDS1.FieldByName('boncode').AsString,
                        TDS1.FieldByName('extcode').AsString,
                        TDS1.FieldByName('fieldcode').AsString,
                        TDS1.FieldByName('placecode').AsString,
                        TDS1.FieldByName('deptna1').AsString,
                        TDS1.FieldByName('deptna2').AsString,
                        TDS1.FieldByName('deptna3').AsString,
                        TDS1.FieldByName('deptlevel').AsString,
                        TDS1.FieldByName('sectcode').AsString])
  else
    RESULT := VarArrayof(['에러',deptcode,orgnum,
                        strpas(' '),
                        strpas(' '),
                        strpas(' '),
                        strpas(' '),
                        strpas(' '),
                        strpas(' '),
                        strpas(' '),
                        strpas(' '),
                        strpas(' ')]);
  TDS1.Close;
end;

function TCData.Get_EmpCode(empno : string) : Variant;
begin
  with TDS1 do
    begin
      ServiceName := 'PIB2020B_sel6';
      Close;
      Sql.Clear;
      Sql.Add('select NVL(empno,   '' ''),        '+
               '       NVL(korname, '' ''),        '+
               '       NVL(pstate,  '' ''),        '+
               '       NVL(paycl,   '' ''),        '+
               '       NVL(orgnum,  '' ''),        '+
               '       NVL(deptcode,'' ''),        '+
               '       NVL(payra,   '' ''),        '+
               '       NVL(boncode, '' ''),        '+
               '       NVL(jobplace,'' ''),        '+
               '       NVL(jobdept, '' ''),        '+
               '       NVL(payrayn, '' '')         '+
               'from pimpmas                       '+
               'where (empno = ''' + empno + ''') or (korname = ''' + empno + ''') ');

      ClearFieldInfo;
      AddField('EMPNO'   , ftString, 4);
      AddField('KORNAME' , ftString, 12);
      AddField('PSTATE'  , ftString, 2);
      AddField('PAYCL'   , ftString, 3);
      AddField('ORGNUM'  , ftString, 3);
      AddField('DEPTCODE', ftString, 6);
      AddField('PAYRA'   , ftString, 3);
      AddField('BONCODE' , ftString, 6);
      AddField('JOBPLACE', ftString, 2);
      AddField('JOBDEPT' , ftString, 6);
      AddField('PAYRAYN' , ftString, 1);
      Open;
    end;

  if TDS1.RecordCount > 0 then
    Result := VarArrayof([TDS1.FieldByName('empno').AsString,
                          TDS1.FieldByName('korname').AsString,
                          TDS1.FieldByName('pstate').AsString,
                          TDS1.FieldByName('paycl').AsString,
                          TDS1.FieldByName('orgnum').AsString,
                          TDS1.FieldByName('deptcode').AsString,
                          TDS1.FieldByName('payra').AsString,
                          TDS1.FieldByName('boncode').AsString,
                          TDS1.FieldByName('jobplace').AsString,
                          TDS1.FieldByName('jobdept').AsString,
                          TDS1.FieldByName('payrayn').AsString,
                          TDS1.RecordCount] )
  else
    Result := VarArrayof(['에러',
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          strpas(' '),
                          0]);
end;

function TCData.PasString(const s,delimiters : string ; num : integer) : string;
var
   i,j,sLength,sStart,sEnd : integer;
begin
  if s ='' then
    begin
      pasString := '';
      exit;
    end;

{*2015.03.09.hjku..  Pos 오류 수정
  if PasCount(s,delimiters) >= num then
    begin
      sStart := 1;
      while (Pos(s[sStart],delimiters) <> 0) and (sStart <= Length(s)) do
        inc(sStart);
      for j := 1 to num - 1 do
        begin
          while pos(s[sStart],delimiters) =  0 do
            inc(sStart);
          while pos(s[sStart],delimiters) <> 0 do
            inc(sStart);
        end;
      sEnd := sStart;
      for i := sStart to Length(s) do
        begin
          if  s[i] =  delimiters then break;
          if  s[i] <> delimiters then inc(sEnd);
        end;
      sLength := sEnd - sStart;
      pasString := trim(copy(s,sStart,sLength));
    end
  else
    pasString := '';
*}
 if PasCount(s,delimiters) >= num then
 begin
      sStart := 1;
      while (Pos(delimiters,s[sStart]) <> 0) and (sStart <= Length(s)) do inc(sStart);

      for j := 1 to num - 1 do
      begin
           while Pos(delimiters,s[sStart]) =  0 do inc(sStart);
           while Pos(delimiters,s[sStart]) <> 0 do inc(sStart);
      end;

      sEnd := sStart;
      for i := sStart to Length(s) do
      begin
           if s[i] =  delimiters then break;
           if s[i] <> delimiters then inc(sEnd);
      end;
      sLength   := sEnd - sStart;
      pasString := trim(copy(s,sStart,sLength));
  end
  else pasString := '';
end;

function TCData.PasCount(const s,delimiters : string) : integer;
var
  delimiter : Boolean;
  count,i   : integer;
begin
{*2015.03.09.hjku..  Pos 오류 수정
  count := 0;
  delimiter := True;
  if Length(s) > 0 then begin
     i := 1;
     while (pos(s[i],delimiters) <> 0) and (i <= Length(s)) do inc(i);
     for i := i to length(s) do
         if Pos(s[i],delimiters) <> 0 then delimiter := True
         else begin
              if delimiter = True then inc(Count);
              delimiter := False;
         end;
  end;
  PasCount := Count;
*}
  count := 0;
  delimiter := True;
  if Length(s) > 0 then
  begin
       i := 1;
       while (Pos(delimiters,s[i]) <> 0) and (i <= Length(s)) do inc(i);
       for i := i to length(s) do
           if Pos(delimiters,s[i]) <> 0 then delimiter := True
           else
           begin
                if delimiter = True then inc(Count);
                delimiter := False;
           end;
  end;
  PasCount := Count;
end;


end.
