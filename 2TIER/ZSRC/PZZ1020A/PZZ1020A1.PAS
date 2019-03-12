unit PZZ1020A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, Db, OnEditBaseCtrl, OnEditStdCtrl, OnEditMemo,
  OnDBGrid, MemDS, DBAccess, Ora, Grids, DBGrids, ComCtrls,
  OnMemDataset, OnCheckBox, OnStringUtils, OnEditBtnCtrl, OnEditCombo,
  ExtCtrls, ImgList, ShellApi, OnGrDBGrid, OnEditNumCtl, WinSock, Func; //OnStringUtils,

type
  TFM_CodeGen = class(TForm)
    DataSource1: TDataSource;
    BT_Close: TOnFocusButton;
    Q_Grid: TOraQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    E_SqlMemo: TOnMemo;
    DBGrid1: TDBGrid;
    E_TmaxCode: TOnMemo;
    E_ServiceName: TOnEdit;
    CB_Check: TOnCheckBox;
    CB_Select: TOnCheckBox;
    TabSheet3: TTabSheet;
    E_DelCode: TOnMemo;
    CB_Nvl: TOnCheckBox;
    Mem_Param: TOnMemData;
    Mem_Data: TOnMemData;
    Mem_DataFieldName: TStringField;
    Mem_DataFieldSize: TIntegerField;
    Mem_DataFieldType: TStringField;
    Mem_ParamFieldName: TStringField;
    Mem_ParamFieldSize: TIntegerField;
    Mem_ParamFieldType: TStringField;
    CB_One: TOnCheckBox;
    BT_SqlExcute1: TOnFocusButton;
    E_Progrmer: TOnComboEdit;
    Label1: TLabel;


    procedure BT_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure E_ServiceNameExit(Sender: TObject);
    procedure BT_SqlExcute1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    function PLS_GetDispType(Fld : TField) : string;
    function PLS_GetDispGenerator(Fld : TField) : string;
    function SelectType(FField : String ) : String;
    function SelectZero(FField : String ) : String;

    procedure Select_Process_Gen(FL_Max : Integer);
    procedure CRUD_DataBase_Process;
    procedure CRUD_Process_Gen(FL_Max : Integer);
    procedure Input_Process_Gen;
    procedure OneData_DataBase_Process;
    procedure DataBase_Process;
    procedure Loading;

  public
    { Public declarations }
    vSqlText  : String;
    vSvcNM    : String;
    vFieldCnt : Integer;
    GL_Comp   : String;
    GL_Param  : String;
    GL_Field  : String;
    GL_Service: String;
    GL_Sql    : String;
    GL_Sqlcmd : String;
    GL_SqlSize: String;
    FL_SLen  : Integer; //서비스명 길이  FL_SLen   := Length(ED_Service.Text);
    FL_FLen  : Integer; //SQL      길이
    FL_PLen  : Integer; //SQL_TEXT 허용 길이

  end;

const
  NAMESIZE = 15;

var
  FM_CodeGen: TFM_CodeGen;


function ShowTmaxEditor(Comp, Service: String; Param : String; Field : String) : Boolean; stdcall;

implementation

{$R *.dfm}

function ShowTmaxEditor(Comp, Service: String; Param : String; Field : String) : Boolean;
var
  Fm : TFM_CodeGen;
begin
  Fm := TFM_CodeGen.Create(Application);
  try
    Fm.GL_Comp    := Comp;  
  //Fm.GL_Service := Service;
    Fm.GL_Param   := Param;
    Fm.GL_Field   := Field;
    Fm.ShowModal;
    Result := True;
  finally
    Fm.Free;
  end;
end;

function TFM_CodeGen.PLS_GetDispType(Fld : TField) : string;
begin
  if not Assigned(Fld) then System.Exit;

  case Fld.DataType of
       ftUnknown                         : Result := 'UnNone';
       ftMemo, ftFmtMemo, ftString       : Result := 'ftString';
       ftSmallint, ftInteger, ftBytes    : Result := 'ftInteger';
       ftVarBytes, ftAutoInc, ftCurrency : Result := 'ftInteger';
       ftWord, ftFloat, ftBCD            : Result := 'ftFloat';
       ftBoolean                         : Result := 'ftBoolean';
  else
       Result := 'no Support';
  end;
end;

function TFM_CodeGen.PLS_GetDispGenerator(Fld : TField) : string;
begin
  if not Assigned(Fld) then System.Exit;

  if   PLS_GetDispType(Fld) = 'ftString' then
       Result := 'varchar ' + FillDataFix(LowerCase(Fld.FieldName)+'['+ IntToStr(Fld.DataSize - 1) +']', 50)
  else Result := 'varchar ' + FillDataFix(LowerCase(Fld.FieldName)+'['+ IntToStr(Fld.DataSize    ) +']', 50)
end;

function TFM_CodeGen.SelectType(FField : String) : String;
var
 m : String;
begin
  if   FField = '숫자형' then m := 'TO_CHAR('
  else                        m := '';
  Result := m;
end;

function TFM_CodeGen.SelectZero(FField : String) : String;
var
 m : String;
begin
  if   FField = '숫자형' then  m := '),''0'')'
  else                         m := '),'' '')';
  Result := m;
end;

procedure TFM_CodeGen.E_ServiceNameExit(Sender: TObject);
begin
  vSvcNM := Trim(E_ServiceName.Text);
end;

procedure TFM_CodeGen.Loading;
var
  i : Integer;
begin
  FL_FLen := Length(GL_Sql);

  Q_Grid.First;        //showmessage('필드갯수 : ' + IntToStr(Q_Grid.Fields.Count));
  Mem_Data.Open;
  for i := 0 to Q_Grid.Fields.Count - 1 do
  begin
       Mem_Data.Append;
       Mem_Data.FieldByName('Fieldname').AsString  := Q_Grid.Fields[i].DisplayName;
       if  (PLS_GetDispType(Q_Grid.Fields[i]) = 'ftInteger') or (PLS_GetDispType(Q_Grid.Fields[i]) = 'ftFloat') then
            Mem_Data.FieldByName('FieldSize').AsInteger := Q_Grid.Fields[i].DisplayWidth //숫자형은 DataSize가 없어서 DisplayWidth로 임의대체...
       else Mem_Data.FieldByName('FieldSize').AsInteger := Q_Grid.Fields[i].DataSize;

       Mem_Data.FieldByName('FieldType').AsString       := PLS_GetDispType(Q_Grid.Fields[i]);
       Mem_Data.Post;

       if Length(Q_Grid.Fields[i].DisplayName) > FL_FLen then FL_FLen := Length(Q_Grid.Fields[i].DisplayName);
  end;

      
  //////////////////////////////////////////////////////////////////////////////
  FL_PLen := Length(GL_Sql);
  Q_Grid.First;
  Mem_Param.Open;
  for i := 0 to Q_Grid.Fields.Count - 1 do
  begin
       Mem_Param.Append;
       Mem_Param.FieldByName('Fieldname').AsString  := Q_Grid.Fields[i].DisplayName;
       if   (PLS_GetDispType(Q_Grid.Fields[i]) = 'ftInteger') or (PLS_GetDispType(Q_Grid.Fields[i]) = 'ftFloat') then
            Mem_Param.FieldByName('FieldSize').AsInteger := Q_Grid.Fields[i].DisplayWidth //숫자형은 DataSize가 없어서 DisplayWidth로 임의대체...
       else Mem_Param.FieldByName('FieldSize').AsInteger := Q_Grid.Fields[i].DataSize;

       Mem_Param.FieldByName('FieldType').AsString       := PLS_GetDispType(Q_Grid.Fields[i]);       
       Mem_Param.Post;

       if Length(Q_Grid.Fields[i].DisplayName) > FL_PLen then FL_PLen := Length(Q_Grid.Fields[i].DisplayName);
  end;

  vFieldCnt := Q_Grid.Fields.Count;
end;


function GetLocalIP: string;
var
  WSAData: TWSAData;
  HostName, IPAddress: String;
  HostEnt: PHostEnt;
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

  Result := Trim(HostName);   // Result := Trim(IPAddress);
end;

procedure TFM_CodeGen.BT_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_CodeGen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFM_CodeGen.FormCreate(Sender: TObject);
begin
  OraConnect;
end;

procedure TFM_CodeGen.FormShow(Sender: TObject);
begin
  GL_Sql     := 'sql_text';
  GL_SqlSize := '5000';
  FL_FLen    := Length(GL_Sql);
  PageControl1.ActivePage := TabSheet1;

  if      UpperCase(GetLocalIP) = 'SKCC14D00495' then E_Progrmer.Text := '강륜종'
  else if UpperCase(GetLocalIP) = 'SKCC14D00543' then E_Progrmer.Text := '지순미'
  else if UpperCase(GetLocalIP) = 'SKCC14D00487' then E_Progrmer.Text := '이희용'  
  else if UpperCase(GetLocalIP) = 'SKCC14D00541' then E_Progrmer.Text := '구해자'
  else if UpperCase(GetLocalIP) = 'SKCC14D00488' then E_Progrmer.Text := '하은영';
end;

procedure TFM_CodeGen.BT_SqlExcute1Click(Sender: TObject);
var
  FL_Max : Integer;
begin
  vSqlText := E_SqlMemo.Text;

  with Q_Grid do
  begin
       Close;
       Sql.Clear;
       Sql.Add ( vSqlText );
       Open;
  end;

  vSvcNM  := E_ServiceName.Text;
  FL_SLen := Length(E_ServiceName.Text);

  Loading;

  //////////////////////////////////////////////////////////////////////////////
  // Tmax 서비스 Coding Start...................................................
  //////////////////////////////////////////////////////////////////////////////
  with E_TmaxCode.Lines do
  begin
       Clear;
       if   FL_PLen < FL_FLen then FL_Max := FL_FLen
       else                        FL_Max := FL_PLen;
       
       if   FL_Max < 10 then       FL_Max := 10;

       Add( Format('/*******************************************************************************',[''] ));
       Add( Format(' 화   일   명 : %S                                                              ',[UpperCase(vSvcNM+'.pc') ] ));
       Add( Format(' 작   성   일 : %S                                                              ',[FormatDateTime('YYYY-MM-DD',Date)] ));
       Add( Format(' 최종  수정일 :                                                                 ',[''] ));
       Add( Format(' PGM변경 이력 :                                                                 ',[''] ));
       Add( Format(' 작   성   자 : %S                                                              ',[E_Progrmer.Text] ));
       Add( Format('*******************************************************************************/',[''] ));
       Add( Format('',[''] ));
       Add( Format('',[''] ));       
       Add( Format('/******************************************************************************/',[''] ));
       Add( Format('/*   해더 선언부                                                              */',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add( Format('#include <stdio.h>                                                              ',[''] ));
       Add( Format('#include "usrinc/atmi.h"                                                        ',[''] ));
       Add( Format('#include "usrinc/tmaxapi.h"                                                     ',[''] ));
       Add( Format('#include "hinsa_common.h"                                                       ',[''] ));
       Add( Format('#include "hinsa_macro.h"                                                        ',[''] ));
       Add( Format('#include "hinsa_string.h"                                                       ',[''] ));
       Add( Format('#include "hinsa_log.h"                                                          ',[''] ));
       Add( Format('#include "hinsa_oracle.h"                                                       ',[''] ));
       Add( Format('#include "hinsa_tmax.h"                                                         ',[''] ));
       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add( Format('/*   매크로 선언부                                                            */',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add(             FillDataFix('#define',10) + 'LINE_MAX_LENGTH   100');
       
       if   FL_Max >= 7 then
            Add( Format(FillDataFix('#define',10) + FillDataFix('SVCNAME',FL_Max) + '  "%S"',[vSvcNM] ))
       else Add( Format(FillDataFix('#define',10) + 'SVCNAME                           "%S"',[UpperCase(vSvcNM)] ));

       if   CB_Select.Checked then CRUD_Process_Gen(FL_Max)    //DML 작업을 요하는 서비스 생성시....
       else                        Select_Process_Gen(FL_Max);

       Input_Process_Gen;

       if   CB_Select.Checked then CRUD_DataBase_Process       //DML 작업을 요하는 서비스 생성시....
       else
       begin
            if   CB_One.Checked then DataBase_Process
            else                     OneData_DataBase_Process;
       end;

       Add( Format('',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add( Format('/* 서비스 소스 완료...                                                        */',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
  end;
end;


//①
procedure TFM_CodeGen.Select_Process_Gen(FL_Max : Integer);
begin
  with E_TmaxCode.Lines do
  begin
       if CB_One.Checked then
       begin
            Add( Format('',[''] ));       
            Add( Format('/* Array Fetch 용 */',[''] ));
            if   FL_Max >= 7 then Add(FillDataFix('#define',10) + FillDataFix('MAX_ARR',FL_Max) +  '  50')
            else                  Add(FillDataFix('#define',10) +             'MAX_ARR  50 ');
       end;

       Add( Format('',[''] ));
       Add( Format('/* 입력 인수 길이 정보정의... */',[''] ));
       Add( FillDataFix('#define',10) +             'SQL_TEXT      5000');

       Add( Format('',[''] ));
       Add( Format('/* Field 길이 정보정의... */',[''] ));
       Mem_Data.First;
       while not Mem_Data.Eof do
       begin      //Showmessage(Mem_Data.FieldByName('FieldType').AsString);
            if  (Mem_Data.FieldByName('FieldType').AsString = 'ftInteger') or (Mem_Data.FieldByName('FieldType').AsString = 'ftFloat') then //dsa2000 2009.04
                 Add(FillDataFix('#define',10) +
                     FillDataFix(UpperCase(Mem_Data.FieldByName('FieldName').AsString   ),FL_Max + 2) + '  '+
                     FillDataFix( IntToStr(Mem_Data.FieldByName('FieldSize').AsInteger  ),FL_Max + 2))
            else if (Mem_Data.FieldByName('FieldType').AsString <> 'Blob형') then
                 Add(FillDataFix('#define',10) +
                     FillDataFix(UpperCase(Mem_Data.FieldByName('FieldName').AsString   ),FL_Max + 2) + '  '+
                     FillDataFix( IntToStr(Mem_Data.FieldByName('FieldSize').AsInteger-1),FL_Max + 2));

            Mem_Data.Next;
       end;

       //if CB_Blob.Checked then Add(FillDataFix('#define',10) + FillDataFix('IMAGE_SIZE', FL_Max + 2) + '  '+ FillDataFix('10',FL_Max + 2));

       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add( Format('/*   Data I/O용 구조체 정의..                                                 */',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add( FillDataFix('typedef',8) + FillDataFix('struct' ,7) + vSvcNM + '_in {' );
       Add(             '        char   c_sql_text[SQL_TEXT];' );
       Add( '} ts_' + vSvcNM + '_in;' );
       Add( Format('',[''] ));
       Add(FillDataFix('typedef',8) +
           FillDataFix('struct' ,7) + vSvcNM + '_out {' );

       Mem_Data.First;
       while not Mem_Data.Eof do
       begin
            if (Mem_Data.FieldByName('FieldType').AsString <> 'Blob형') then
                Add(FillDataFix('        char',NAMESIZE) +
                    FillDataFix('c_' + LowerCase(Mem_Data.FieldByName('FieldName').AsString),FL_FLen + 2) + '[' +
                    FillDataFix(       UpperCase(Mem_Data.FieldByName('FieldName').AsString),FL_FLen)     + '];');
            Mem_Data.Next;
       end;
       Add('} ts_' + vSvcNM + '_out;' );

       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add( Format('/*   Table I/O 용 구조체 정의.                                                */',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add( Format('EXEC SQL BEGIN DECLARE SECTION; '                                                 ,[''] ));

       Add( FillDataFix('  typedef',10) + FillDataFix('struct' ,7) + vSvcNM + '_tin {' );
       Add(             '          varchar     v_sql_text[SQL_TEXT + 1];' );
       Add( '  } ts_' + vSvcNM + '_tin;' );
       Add( Format('',[''] ));
       Add(FillDataFix('  typedef',10) +
           FillDataFix('struct' ,7) + vSvcNM + '_tout {' );
       Mem_Data.First;

       while not Mem_Data.Eof do
       begin
            if (Mem_Data.FieldByName('FieldType').AsString <> 'Blob형') then
                 Add(FillDataFix('          varchar',22) +
                     FillDataFix('v_'+ LowerCase(Mem_Data.FieldByName('FieldName').AsString),FL_FLen+2) +'[MAX_ARR][' +
                     FillDataFix(      UpperCase(Mem_Data.FieldByName('FieldName').AsString),FL_FLen) + ' + 1];');
             Mem_Data.Next;
       end;
       Add('  } ts_' + vSvcNM + '_tout;' );

       Add( Format('EXEC SQL END DECLARE SECTION; '                                                 ,[''] ));
       Add( Format('',[''] ));
       Add( Format('EXEC SQL INCLUDE sqlca.h;'                                                      ,[''] ));

       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add( Format('/*   전역 Function 선언부                                                     */',[''] ));
       Add( Format('/******************************************************************************/',[''] ));

       if (Mem_Param.RecordCount > 0) or (CB_Check.Checked) then
       begin
            Add( Format('void %S_input_process(void);                     /* 입력       처리   */',[vSvcNM] ));
            Add( Format('int  %S_input_data_check(void);                  /* 입력데이타 체크   */',[vSvcNM] ));
       end;

       if (Mem_Data.RecordCount > 0) then
       begin
            Add( Format('int  %S_database_process(void);                  /* DB         처리   */',[vSvcNM] ));
            Add( Format('int  %S_business_process(int,int,int,int *,int); /* 업무로직   처리   */',[vSvcNM] ));
            //Add( Format('int  %S_business_process(ts_%S_tout, ts_%S_img, int *, int *, int, int *, int);   /* 업무로직   처리   */',
            //     [vSvcNM,vSvcNM,vSvcNM] ));
            //Add( Format('int  %S_business_process(int *, int, int *, int);   /* 업무로직   처리   */',[vSvcNM] ));
       end;

       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add( Format('/*   전역변수 선언부                                                          */',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add( Format('static long           FGI_send_len;  /*Data 길이           */',[''] ));
       Add( Format('static char          *FGP_data;      /*Data 처리용         */',[''] ));
       Add( Format('static tmax_msg_head *FGS_msg_head;  /*Header 처리용       */',[''] ));
       Add( Format(''                                                                                ,[''] ));
       if (Mem_Param.RecordCount > 0) or (CB_Check.Checked) then
           Add( Format('static ts_%S_in    *FGS_%S_in;    /*Data I/O용          */',[vSvcNM,vSvcNM] ));
       if (Mem_Data.RecordCount > 0) then
           Add( Format('static ts_%S_out   *FGS_%S_out;'                           ,[vSvcNM,vSvcNM] ));
       if (Mem_Param.RecordCount > 0) or (CB_Check.Checked) then
           Add( Format('static ts_%S_tin   *FGS_%S_tin;   /*Oracle 자료 I/O용   */',[vSvcNM,vSvcNM] ));
       if (Mem_Data.RecordCount > 0) then
           Add( Format('static ts_%S_tout  *FGS_%S_tout;'                          ,[vSvcNM,vSvcNM] ));
       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/*******************************************************************************/',[''] ));
       Add( Format('/*   TMAX 서비스 선언부                                                        */',[''] ));
       Add( Format('/*******************************************************************************/',[''] ));
       Add( Format('void %S(transr)',[vSvcNM] ));
       Add( Format('TPSVCINFO *transr;',[''] ));
       Add( Format('{',[''] ));
       Add( Format('  int  FLI_ret;', [''] ));
       Add( Format('  char FLC_line[LINE_MAX_LENGTH];' ,[''] ));;

       if (Mem_Param.RecordCount > 0) or (CB_Check.Checked) then
           Add( Format('  ts_%S_tin FLS_%S_tin;',[vSvcNM,vSvcNM] ));

       Add( Format('',[''] ));
       Add( Format('  STRINIT(FLC_line);', [''] ));
       Add( Format('  hinsa_log_print(0, hinsa_fillspace(FLC_line, LINE_MAX_LENGTH - 1,''*''));', [''] ));
       Add( Format('  hinsa_log_print(0, "%s 서비스 시작...");', [vSvcNM] ));
       Add( Format('',[''] ));
       Add( Format('  FGI_send_len = sizeof(tmax_msg_head); ',[''] ));      
       Add( Format('  FGP_data     = transr->data;',[''] ));
       Add( Format('  FGS_msg_head = (tmax_msg_head *) transr->data;',[''] ));

       if (Mem_Param.RecordCount > 0) or (CB_Check.Checked) then
           Add( Format('  FGS_%S_in   = (ts_%S_in *)(transr->data+sizeof(tmax_msg_head));',[vSvcNM,vSvcNM] ));
       if (Mem_Param.RecordCount > 0) or (CB_Check.Checked) then
           Add( Format('  FGS_%S_tin  = &FLS_%S_tin;',[vSvcNM,vSvcNM] ));

       if (Mem_Param.RecordCount > 0) or (CB_Check.Checked) then
       begin
            Add( Format('',[''] ));
            Add( Format('  /* Client 입력자료 획득 */',[''] ));
            Add( Format('  hinsa_log_print(0,"%s 입력데이타 할당...");',[vSvcNM] ));
            Add( Format('  %S_input_process();',[vSvcNM] ));
            Add( Format('',[''] ));
            Add( Format('  /* Client 입력자료 유효성 검증 */',[''] ));
            Add( Format('  hinsa_log_print(0,"%S 입력자료 유효성 검사...");',[vSvcNM] ));
            Add( Format('  if (%S_input_data_check() != SUCCESS) ',[vSvcNM] ));
            Add( Format('  {',[''] ));
            Add( Format('    hinsa_log_print(0, "%S 서비스 종료 (에러발생으로 인한 종료)...");', [vSvcNM] ));
            Add( Format('    tpreturn(TPFAIL, 0, FGP_data, FGI_send_len, 0L);',[''] ));
            Add( Format('  }',[''] ));
       end;

       if (Mem_Data.RecordCount > 0) then
       begin
            Add( Format('',[''] ));
            Add( Format('  hinsa_log_print(0,"%S 데이타 프로세스 처리...");',[vSvcNM] ));
            Add( Format('   /* Database 작업 처리 */',[''] ));
            Add( Format('  if (%S_database_process() != SUCCESS) ',[vSvcNM] ));
            Add( Format('  {',[''] ));
            Add( Format('    hinsa_log_print(0, "%S 서비스 종료 (에러발생으로 인한 종료)...");', [vSvcNM] ));
            Add( Format('    tpreturn(TPFAIL, 0, FGP_data, FGI_send_len, 0L);',[''] ));
            Add( Format('  }',[''] ));
       end;

       Add( Format('',[''] ));
       Add( Format('  hinsa_log_print(0, "%S 서비스 종료...");',[vSvcNM] ));
       Add( Format('  STRINIT(FLC_line);', [''] ));
       Add( Format('  hinsa_log_print(0, hinsa_fillspace(FLC_line, LINE_MAX_LENGTH - 1,''*''));', [''] ));
       Add( Format('  tpreturn(TPSUCCESS, 0, FGP_data, FGI_send_len, 0L);',[''] ));
       Add( Format('}',[''] ));
       Add( Format('',[''] ));
  end;
end;

//  Input Process 함수 제너레이터 부분....
procedure TFM_CodeGen.Input_Process_Gen;
begin
  if (Mem_Param.RecordCount <= 0) and (not CB_Check.Checked) then System.Exit;

  with E_TmaxCode.Lines do
  begin
       Add( Format('/*******************************************************************************',[''] ));
       Add( Format(' 함 수 명 : %S_input_process'                                                ,[vSvcNM] ));
       Add( Format(' 설    명 : Client로부터 전송된 입력값을 host 변수에 move한다.'                  ,[''] ));
       Add( Format('*******************************************************************************/',[''] ));
       Add( Format('void %S_input_process(void)'                                                 ,[vSvcNM] ));
       Add( Format('{'                                                                               ,[''] ));
       Add( Format('   /* Host 변수 초기화 */'                                                       ,[''] ));
       Add( Format('  memset(FGS_%S_tin, 0x00, sizeof(ts_%S_tin));'                       ,[vSvcNM,vSvcNM] ));
       Add( Format(''                                                                                ,[''] ));
       Add( Format('   /* Client 입력 data를 host 변수에 move */'                                    ,[''] ));

       if CB_Check.Checked then
       begin
            Add(FillDataFix(Format('  STR2VCTRIM(FGS_%S_tin->v_%S, ', [vSvcNM,GL_Sql]),(FL_PLen + FL_SLen + 26))+
                FillDataFix(Format(' FGS_%S_in->c_%S,', [vSvcNM,GL_Sql]), (FL_PLen + FL_SLen + 12)) +
                            Format(' %S);', ['SQL_TEXT']));
       end;

       Add( Format('',[''] ));
       Add( Format('  return;',[''] ));
       Add( Format('}',[''] ));

       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/*******************************************************************************',[''] ));
       Add( Format(' 함 수 명 : %S_input_data_check',[vSvcNM] ));
       Add( Format(' 설    명 : Client로부터 전송된 입력값의 유효성을 검증한다.',[''] ));
       Add( Format(' 리 턴 값 : 성공 -> SUCCESS',[''] ));
       Add( Format('            실패 -> FAILURE',[''] ));
       Add( Format('*******************************************************************************/',[''] ));
       Add( Format('int  %S_input_data_check(void)',[vSvcNM] ));
       Add( Format('{',[''] ));
       Add( Format('   /* 입력 필수 항목 검증 */',[''] ));
       if CB_Check.Checked then
       begin
            Add( Format('  if ((FGS_%S_tin->v_%s).arr[0] == NULL) ',[vSvcNM,GL_Sql] ));
            Add( Format('  {',[''] ));
            Add( Format('    hinsa_msg_fmt(FGP_data, TMAXINS, 0, "(%s) 입력필수항목이 누락되었습니다!", 0, 0);',[GL_Sql] ));
            Add( Format('    return(FAILURE);',[''] ));
            Add( Format('  }',[''] ));
       end;
       Add( Format('',[''] ));
       Add( Format('  return(SUCCESS);',[''] ));
       Add( Format('}',[''] ));
  end;
end;

procedure TFM_CodeGen.DataBase_Process;
var
  FCnt : Integer;
begin
  if Mem_Data.RecordCount <= 0 then  System.Exit;

  with E_TmaxCode.Lines do
  begin
       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/*******************************************************************************',[''] ));
       Add( Format(' 함 수 명 : %S_database_process',[vSvcNM] ));
       Add( Format(' 설    명 : DB 작업을 처리한다.',[''] ));
       Add( Format(' 리 턴 값 : 성공 -> SUCCESS',[''] ));
       Add( Format('            실패 -> FAILURE',[''] ));
       Add( Format('*******************************************************************************/',[''] ));
       Add( Format('int  %S_database_process(void)',[vSvcNM] ));
       Add( Format('{',[''] ));
       Add( Format('  char FLC_line[MAX_STRING];',[''] ));
       Add( Format('  int  FLI_rtn;',[''] ));
       Add( Format('  long FLL_realloc_size;',[''] ));
       Add( Format('',[''] ));
       Add( Format('  char FLC_max_row[H_ERR_CNT + 1];',[''] ));
       Add( Format('  int  FLI_max_row;',[''] ));
       Add( Format('  char FLC_send_cnt[H_RCD_CNT + 1];',[''] ));
       Add( Format('  int  FLI_send_cnt;',[''] ));
       Add( Format('',[''] ));
       Add( Format('  int  FLI_fetch_cnt;',[''] ));
       Add( Format('  int  FLI_loop_cnt;',[''] ));
       Add( Format('  int  FLI_base_idx;',[''] ));
       Add( Format('  int  FLI_rec_cnt;',[''] ));
       Add( Format('  int  FLI_eof_check;',[''] ));
       Add( Format('',[''] ));

       if CB_Check.Checked then  Add( Format('  char  FLC_sql_stmt[%s + 1];',[GL_SqlSize] ));

       Add( Format('  ts_%S_tout FLS_%S_tout;',[vSvcNM, vSvcNM] ));
       Add( Format('',[''] ));
       Add( Format('  /*------------------------------------------------------------------------*/',[''] ));
       Add( Format('  /*  FLI_rtn          : 함수 return값 획득용 변수.                         */',[''] ));
       Add( Format('  /*  FLL_realloc_size : Buffer realloc size 계산용 변수.                   */',[''] ));
       Add( Format('  /*  FLI_fetch_cnt    : 자료 fetch 건수 획득용 변수.                       */',[''] ));
       Add( Format('  /*  FLI_loop_cnt     : DB로부터 추출해야 될 자료 건수 획득용 변수.        */',[''] ));
       Add( Format('  /*  FLI_base_idx     : 자료 전송용 buffer의 array base index.             */',[''] ));
       Add( Format('  /*------------------------------------------------------------------------*/',[''] ));
       Add( Format('',[''] ));
       Add( Format('  /*  클라이언트에 보낼 데이타 건수 (Delphi Property BatchRows값)... */',[''] ));
       Add( Format('  STRINIT(FLC_max_row);',[''] ));
       Add( Format('  strncpy(FLC_max_row, FGS_msg_head->c_err_code, H_ERR_CNT);',[''] ));
       Add( Format('  FLI_max_row = atoi(FLC_max_row);',[''] ));
       Add( Format('',[''] ));
       Add( Format('  /*  최종적으로 Client에게 보낸 레코드 건수 획득... */',[''] ));
       Add( Format('  memset(FLC_send_cnt, 0x00, sizeof(FLC_send_cnt));',[''] ));
       Add( Format('  strncpy(FLC_send_cnt, FGS_msg_head->c_record_count, H_RCD_CNT);',[''] ));
       Add( Format('  FLI_send_cnt = atoi(FLC_send_cnt);',[''] ));
       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('   /* Client로 전송할 buffer 확보... */',[''] ));
       Add( Format('  FLL_realloc_size = (long) ((sizeof(ts_%S_out) * FLI_max_row) + sizeof(tmax_msg_head) + 1);',[vSvcNM] ));
       Add( Format('  FGP_data         = tprealloc(FGP_data, FLL_realloc_size);',[''] ));
       Add( Format('',[''] ));
       Add( Format('  if (FGP_data == (char *) 0) ',[''] ));
       Add( Format('  {',[''] ));
       Add( Format('    hinsa_msg_fmt(FGP_data, TMAX, tperrno, "전송할 자료 메모리 할당 에러입니다.", 0, 0);',[''] ));
       Add( Format('    return(FAILURE);',[''] ));
       Add( Format('  }',[''] ));
       Add( Format('  FGI_send_len = FLL_realloc_size; ',[''] ));
       Add( Format('',[''] ));
       Add( Format('  FGS_msg_head = (tmax_msg_head *) FGP_data;',[''] ));
       Add( Format('  FGS_%S_out = (ts_%S_out *) (FGP_data + sizeof(tmax_msg_head));',[vSvcNM, vSvcNM] ));
       Add( Format('',[''] ));
       Add( Format('  memset((FGP_data + sizeof(tmax_msg_head)),  FILL_CHAR, (FLL_realloc_size - sizeof(tmax_msg_head)));',[''] ));
       Add( Format('  memset((FGP_data + (FLL_realloc_size - 1)), 0x00,     1);',[''] ));
       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('   /* DB자료 처리... */',[''] ));
       Add( Format('  FGS_%S_tout = &FLS_%S_tout;',[vSvcNM,vSvcNM] ));
       Add( Format('  memset(&FLS_%S_tout, 0x00, sizeof(FLS_%S_tout));',[vSvcNM,vSvcNM] ));
       Add( Format('',[''] ));
       Add( Format('  FLI_fetch_cnt = 0;',[''] ));
       Add( Format('  FLI_loop_cnt  = 0;',[''] ));
       Add( Format('  FLI_base_idx  = 0;',[''] ));
       Add( Format('  FLI_rec_cnt   = 0;',[''] ));
       if CB_Check.Checked then
       begin
           Add( Format('  /* 쿼리 인수로 설정된 인수 변수 등록 */',[''] ));
           Add( Format('  STRINIT(FLC_sql_stmt);',['']));
           Add( Format('  VC2STR(FLC_sql_stmt, FGS_%S_tin->v_%S);',[vSvcNM, GL_Sql] ));
           Add( Format('',[''] ));

           Add( Format('  EXEC SQL PREPARE S FROM :FLC_sql_stmt;',[''] ));
           Add( Format('  EXEC SQL DECLARE cur_01 CURSOR FOR S;',[''] ));
       end
       else
       begin
            Add( Format('  /* 질의를 확인하시고 수정하시기 바랍니다... */',[''] ));
            Add( Format('  EXEC SQL DECLARE cur_01 CURSOR FOR',[''] ));
            Add( Format('    SELECT  ',[''] ));
            with Mem_Data do
            begin
                 if RecordCount > 0 then
                 begin
                      First;
                      for FCnt := 0 to RecordCount - 1 do
                      begin
                           if CB_Nvl.Checked then
                           begin
                                if FCnt < RecordCount - 1 then
                                     Add( Format('             NVL(%S%S%S   ',[SelectType(FieldByName('FieldType').AsString),
                                                                               FillDataFix(LowerCase(FieldByName('FieldName').AsString),FL_FLen),
                                                                               SelectZero(FieldByName('FieldType').AsString)+',']))
                                else Add( Format('             NVL(%S%S%S   ',[SelectType(FieldByName('FieldType').AsString),
                                                                               FillDataFix(LowerCase(FieldByName('FieldName').AsString),FL_FLen),
                                                                               SelectZero(FieldByName('FieldType').AsString)]));
                           end
                           else
                           begin
                                if   FCnt < RecordCount - 1 then
                                     Add( Format('             %S ',  [FillDataFix(LowerCase(FieldByName('FieldName').AsString),FL_FLen)+',']))
                                else Add( Format('             %S ',  [FillDataFix(LowerCase(FieldByName('FieldName').AsString),FL_FLen)]));
                           end;
                           Next;
                      end;
                 end;
            end;
            Add( Format('      FROM  %S ',['사용할 테이블명을 입력하세요.'] ));
            Add( Format('     WHERE ',[''] ));
            if Mem_Data.RecordCount > 0 then  Add( Format(' /* WHERE 절을 넣으시면 됩니다... */',[''] ));
            Add( Format('',[''] ));
       end;
       Add( Format('',[''] ));
       Add( Format('  hinsa_log_print(0, "%S 커서 열기...");',[vSvcNM] ));
       Add( Format('  EXEC SQL OPEN  cur_01;',[''] ));
       Add( Format('',[''] ));
       Add( Format('  if (SQLCODE != SQL_OK) ',[''] ));
       Add( Format('  {',[''] ));
       Add( Format('    hinsa_msg_fmt(FGP_data, TMAXORA, SQLCODE, SQLERRM, 0, 0); ',[''] ));
       Add( Format('    STRINIT(FLC_line);',[''] ));
       Add( Format('    sprintf(FLC_line, "에러 내용 : [%s - %s]", SQLCODE, hinsa_storage_trim(SQLERRM)); ',['%d','%s']));
       Add( Format('    hinsa_log_print(0,FLC_line);',[''] ));
       Add( Format('    return(FAILURE);',[''] ));
       Add( Format('  }',[''] )); 
       Add( Format('',[''] ));
       Add( Format('  FLI_eof_check = FALSE;',[''] ));
       Add( Format('  while(1) ',[''] ));
       Add( Format('  {',[''] ));
       Add( Format('    memset(&FLS_%S_tout, 0x00, sizeof(FLS_%S_tout));',[vSvcNM,vSvcNM] ));
       Add( Format('',[''] ));
       Add( Format('    EXEC SQL FETCH cur_01 INTO ',[''] ));
       with Mem_Data do
       begin
            if RecordCount > 0 then
            begin
                 First;
                 FCnt := 0;
                 while Not Eof do
                 begin
                      if Fcnt < RecordCount - 1 then
                      begin
                           if (FieldByName('FieldType').AsString <> 'Blob형') then
                               Add( Format('              :FLS_%S_tout.v_%S,',[vSvcNM,LowerCase(FieldByName('FieldName').AsString)] ));
                      end
                      else
                      begin
                           if (FieldByName('FieldType').AsString <> 'Blob형') then
                               Add( Format('              :FLS_%S_tout.v_%S;',[vSvcNM,LowerCase(FieldByName('FieldName').AsString)] ));
                      end;
                      Inc(FCnt);
                      Next;
                 end;
            end;
       end;
       Add( Format('',[''] ));
       Add( Format('    FLI_loop_cnt  = sqlca.sqlerrd[2] - FLI_fetch_cnt;',[''] ));
       Add( Format('    FLI_base_idx  = FLI_fetch_cnt;',[''] ));
       Add( Format('    FLI_fetch_cnt = sqlca.sqlerrd[2];',[''] ));
       Add( Format('',[''] ));
       Add( Format('    switch (SQLCODE) ',[''] ));
       Add( Format('    {',[''] ));
       Add( Format('      case SQL_OK :',[''] ));
       Add( Format('        FLI_rtn = %S_business_process(FLI_loop_cnt, FLI_base_idx, FLI_send_cnt, &FLI_rec_cnt, FLI_max_row);',[vSvcNM] ));
       Add( Format('        break;',[''] ));
       Add( Format('',[''] ));
       Add( Format('      case SQL_NO_DATA :',[''] ));
       Add( Format('        FLI_rtn       = SUCCESS; ',[''] ));      
       Add( Format('        FLI_eof_check = TRUE; ',[''] ));
       Add( Format('        break;',[''] ));
       Add( Format('',[''] ));
       Add( Format('      case (SQL_NULL_COL) :',[''] ));
       Add( Format('        FLI_rtn = FAILURE;',[''] ));
       Add( Format('        break;',[''] ));
       Add( Format('',[''] ));
       Add( Format('      default :',[''] ));
       Add( Format('        FLI_rtn = FAILURE;',[''] ));
       Add( Format('        break;',[''] ));
       Add( Format('    }',[''] ));
       Add( Format('',[''] ));
       Add( Format('    if (FLI_rtn == FAILURE)',[''] ));
       Add( Format('    {',[''] ));
       Add( Format('      hinsa_msg_fmt(FGP_data, TMAXORA, SQLCODE, SQLERRM, 0, 0);',[''] ));
       Add( Format('      break;',[''] ));
       Add( Format('    }',[''] ));
       Add( Format('',[''] ));
       Add( Format('    if (SQLCODE != SQL_OK)',[''] ));
       Add( Format('    {',[''] ));
       Add( Format('      STRINIT(FLC_line);',[''] ));
       Add( Format('      sprintf(FLC_line,"%S [%S]번째 조회가 완료 되었습니다...", FLI_rec_cnt);',[vSvcNM, '%d'] ));
       Add( Format('      hinsa_log_print(0,FLC_line);',[''] ));
       Add( Format('      if (FLI_eof_check)',[''] ));
       Add( Format('      {',[''] ));
       Add( Format('        FLI_rtn = %S_business_process(FLI_loop_cnt, FLI_base_idx, FLI_send_cnt, &FLI_rec_cnt, FLI_max_row);',[vSvcNM] ));
       Add( Format('        hinsa_msg_fmt(FGP_data, TMAXUSER, SQLCODE, "데이타 EOF 까지 조회 되었습니다.", FLI_rec_cnt, (int) (FLI_rec_cnt * sizeof(ts_%S_out)));',[vSvcNM] ));
       Add( Format('      }',[''] ));
       Add( Format('      else',[''] ));
       Add( Format('        hinsa_msg_fmt(FGP_data, TMAXUSER, FLI_rec_cnt, "조회 되었습니다.", FLI_rec_cnt, (int) (FLI_rec_cnt * sizeof(ts_%S_out)));',[vSvcNM] ));
       Add( Format('      break;',[''] ));
       Add( Format('    }',[''] ));
       Add( Format('  }',[''] ));
       Add( Format('',[''] ));
       Add( Format('  hinsa_log_print(0, "%S 커서 닫기...");',[vSvcNM] ));
       Add( Format('  STRINIT(FLC_line);',[''] ));
       Add( Format('  if (FLI_rtn != SUCCESS)',[''] ));
       Add( Format('  {',[''] ));
       Add( Format('    sprintf(FLC_line, "%s:FAILURE  SQLCODE=[%s]", SVCNAME, SQLCODE);', ['%s','%d']));
       Add( Format('    hinsa_log_print(0,FLC_line);',[''] ));
       Add( Format('  }',[''] ));
       Add( Format('  else',[''] ));
       Add( Format('  {',[''] ));
       Add( Format('    sprintf(FLC_line,"%s:SUCCESS  SQLCODE=[%s]", SVCNAME, SQLCODE);', ['%s','%d']));
       Add( Format('    hinsa_log_print(0,FLC_line);',[''] ));
       Add( Format('  }',[''] ));
       Add( Format('  EXEC SQL CLOSE cur_01;',[''] ));
       Add( Format('',[''] ));
       Add( Format('  return(FLI_rtn);',[''] ));
       Add( Format('}',[''] ));


       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/*******************************************************************************',[''] ));
       Add( Format(' 함 수 명 : %S_business_process',[vSvcNM] ));
       Add( Format(' 설    명 : DB로부터 추출된 자료의 업무 logic을 처리한다.',[''] ));
       Add( Format(' 리 턴 값 : 성공 -> SUCCESS',[''] ));
       Add( Format('            실패 -> FAILURE',[''] ));
       Add( Format('*******************************************************************************/',[''] ));
       Add( Format('int  %S_business_process(AI_loop_cnt, AI_base_idx, AI_send_cnt, AIP_rec_cnt, AI_max_row)',[vSvcNM] ));
       Add( Format('int  AI_loop_cnt;',[''] ));
       Add( Format('int  AI_base_idx;',[''] ));
       Add( Format('int  AI_send_cnt;',[''] ));
       Add( Format('int  *AIP_rec_cnt;',[''] ));
       Add( Format('int  AI_max_row;',[''] ));
       Add( Format('{',[''] ));
       Add( Format('  int  FLI_ii;',[''] ));
       Add( Format('  char FLC_line[MAX_STRING];',[''] ));
       Add( Format('',[''] ));
       Add( Format('  /* Client에 이미 전송된 자료를 by-pass함. */',[''] ));
       Add( Format('  for (FLI_ii = 0; FLI_ii < AI_loop_cnt; FLI_ii++) ',[''] ));
       Add( Format('  {',[''] ));
       Add( Format('    if (AI_base_idx >= AI_send_cnt) ',[''] ));
       Add( Format('      break;',[''] ));
       Add( Format('    AI_base_idx++;',[''] ));
       Add( Format('  }',[''] ));
       Add( Format('',[''] ));
       Add( Format('  for (FLI_ii; FLI_ii < AI_loop_cnt; FLI_ii++) ',[''] ));
       Add( Format('  {',[''] ));

       with Mem_Data do
       begin
            if RecordCount > 0 then
            begin
                 First;
                 while not Eof do
                 begin
                      if (FieldByName('FieldType').AsString <> 'Blob형') then
                          Add( Format('    VC2STR(FGS_%S_out->c_%S, FGS_%S_tout->v_%S[FLI_ii]);',
                                     [vSvcNM,FillDataFix(LowerCase(FieldByName('FieldName').AsString),FL_FLen),
                                      vSvcNM,LowerCase(FieldByName('FieldName').AsString)] ));
                      Next;
                 end;
            end;
       end;
       Add( Format('',[''] ));
       Add( Format('    AI_base_idx++;',[''] ));
       Add( Format('    (*AIP_rec_cnt)++;',[''] ));
       Add( Format('',[''] ));
       Add( Format('    if (*AIP_rec_cnt >= AI_max_row)',[''] ));
       Add( Format('    {',[''] ));
       Add( Format('      STRINIT(FLC_line);',[''] ));
       Add( Format('      sprintf(FLC_line,"%S Batch Rows[%s]갯수 데이타 전송...", *AIP_rec_cnt);',[vSvcNM, '%d'] ));
       Add( Format('      hinsa_log_print(0,FLC_line);',[''] ));
       Add( Format('      hinsa_msg_fmt(FGP_data, TMAXUSER, *AIP_rec_cnt, "퀴리 데이타 데이타 전송...", *AIP_rec_cnt, (int) (*AIP_rec_cnt * sizeof(ts_%S_out)));',[vSvcNM] ));
       Add( Format('      SQLCODE = SQL_NO_DATA;',[''] ));
       Add( Format('      return(SUCCESS);',[''] ));
       Add( Format('    }',[''] ));

       Add( Format('',[''] ));
       Add( Format('    FGS_%S_out++;',[vSvcNM] ));
       Add( Format('  }',[''] ));
       Add( Format('',[''] ));
       Add( Format('  return(SUCCESS);',[''] ));
       Add( Format('}',[''] ));
  end;

  //////////////////////////////////////////////////////////////////////////////
  with E_DelCode.Lines do
  begin
       Clear;
       Add( Format('    //동적으로 필드 생성을 할 경우 사용하시기 바랍니다...',[''] ));
       Add( Format('    with %S do                                                              ',[GL_Comp] ));
       Add( Format('    begin                                                                   ',[''] ));
       Add( Format('         Close;                                                             ',[''] ));
       Add( Format('         ClearFieldInfo;                                                    ',[''] ));

       with Mem_Data do
       begin
            if RecordCount > 0 then
            begin
                 First;
                 while not Eof do
                 begin
                      if  (FieldByName('FieldType').AsString = 'ftInteger') or (FieldByName('FieldType').AsString = 'ftFloat') then
                           Add( Format('         AddField(%S, 타입정의, %S);',[FillDataFix(''''+FieldByName('FieldName').AsString+'''',FL_FLen + 2),
                                                                               IntToStr(FieldByName('FieldSize').AsInteger    )] ))
                      else
                           Add( Format('         AddField(%S, 타입정의, %S);',[FillDataFix(''''+FieldByName('FieldName').AsString+'''',FL_FLen + 2),
                                                                               IntToStr(FieldByName('FieldSize').AsInteger - 1)] ));
                     Next;
                 end;
            end;
       end;
       Add( Format('    end;                                              ',[''] ));

       /////////////////////////////////////////////////////////////////////////
       Add( Format('    // 동적으로 인수를 생성을 할 경우 사용하시기 바랍니다...',[''] ));
       Add( Format('    with %S do                                                              ',[GL_Comp] ));
       Add( Format('    begin                                                                   ',[''] ));
       Add( Format('         Close;                                                             ',[''] ));
       Add( Format('         ClearParamInfo;                                                    ',[''] ));
       with Mem_Param do
       begin
            if RecordCount > 0 then
            begin
                 First;
                 while not Eof do
                 begin
                      if  (FieldByName('FieldType').AsString = 'ftInteger') or (FieldByName('FieldType').AsString = 'ftFloat') then
                           Add( Format('         AddParam(%S, %S, %S);',[FillDataFix(''''+FieldByName('FieldName').AsString+'''',FL_PLen + 2),
                                                                         FillDataFix(IntToStr(FieldByName('FieldSize').AsInteger    ),5), '''인수값'''] ))
                      else
                           Add( Format('         AddParam(%S, %S, %S);',[FillDataFix(''''+FieldByName('FieldName').AsString+'''',FL_PLen + 2),
                                                                         FillDataFix(IntToStr(FieldByName('FieldSize').AsInteger - 1),5), '''인수값'''] ));
                      Next;
                 end;
            end;
       end;
       Add( Format('    end;                                                                    ',[''] ));

       /////////////////////////////////////////////////////////////////////////
       Add( Format('    // 인수값을 할당할 경우 사용하시기 바랍니다...',[''] ));
       Add( Format('    with %S do                                                              ',[GL_Comp] ));
       Add( Format('    begin                                                                   ',[''] ));
       with Mem_Param do
       begin
            if RecordCount > 0 then
            begin
                 First;
                 FCnt := 0;
                 while not Eof do
                 begin
                      Add( Format('         ParamInfo[%d].Value := %S;',[FCnt,'''인수값''']));
                      Inc(FCnt);
                      Next;
                 end;
            end;
       end;
       Add( Format('    end;                                                                    ',[''] ));
  end;
end;

procedure TFM_CodeGen.OneData_DataBase_Process;
var
  FCnt : Integer;
begin
  if Mem_Data.RecordCount <= 0 then System.Exit;

  with E_TmaxCode.Lines do
  begin
       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/*******************************************************************************',[''] ));
       Add( Format(' 함 수 명 : %S_database_process',[vSvcNM] ));
       Add( Format(' 설    명 : DB 작업을 처리한다.',[''] ));
       Add( Format(' 리 턴 값 : 성공 -> SUCCESS',[''] ));
       Add( Format('            실패 -> FAILURE',[''] ));
       Add( Format('*******************************************************************************/',[''] ));
       Add( Format('int  %S_database_process(void)',[vSvcNM] ));
       Add( Format('{',[''] ));
       Add( Format('  char FLC_line[MAX_STRING];',[''] ));
       Add( Format('  int  FLI_rtn;',[''] ));
       Add( Format('  long FLL_realloc_size;',[''] ));
       Add( Format('',[''] ));
       Add( Format('  char FLC_max_row[H_ERR_CNT + 1];',[''] ));
       Add( Format('  int  FLI_max_row;',[''] ));
       Add( Format('  char FLC_send_cnt[H_RCD_CNT + 1];',[''] ));
       Add( Format('  int  FLI_send_cnt;',[''] ));
       Add( Format('',[''] ));
       Add( Format('  int  FLI_base_idx;',[''] ));
       Add( Format('  int  FLI_rec_cnt;',[''] ));
       Add( Format('  int  FLI_eof_check;',[''] ));
       Add( Format('  int  FLI_image_size;',[''] ));
       Add( Format('',[''] ));
       Add( Format('  char  FLC_sql_stmt[%s + 1];',[GL_SqlSize] ));
       Add( Format('',[''] ));
       Add( Format('  ts_%S_tout FLS_%S_tout;',[vSvcNM,vSvcNM] ));
       Add( Format('  ts_%S_img  FLS_%S_img;',[vSvcNM,vSvcNM] ));

       Add( Format('',[''] ));
       Add( Format('  /*------------------------------------------------------------------------*/',[''] ));
       Add( Format('  /*  FLI_rtn          : 함수 return값 획득용 변수.                         */',[''] ));
       Add( Format('  /*  FLL_realloc_size : Buffer realloc size 계산용 변수.                   */',[''] ));
       Add( Format('  /*  i_fetch_cnt      : 자료 fetch 건수 획득용 변수.                       */',[''] ));
       Add( Format('  /*  i_loop_cnt       : DB로부터 추출해야 될 자료 건수 획득용 변수.        */',[''] ));
       Add( Format('  /*  i_base_idx       : 자료 전송용 buffer의 array base index.             */',[''] ));
       Add( Format('  /*------------------------------------------------------------------------*/',[''] ));

       Add( Format('',[''] ));
       Add( Format('  /*  클라이언트에 보낼 데이타 건수 (Delphi Property BatchRows값)... */',[''] ));
       Add( Format('  STRINIT(FLC_max_row);',[''] ));
       Add( Format('  strncpy(FLC_max_row, FGS_msg_head->c_err_code, H_ERR_CNT);',[''] ));
       Add( Format('  FLI_max_row = atoi(FLC_max_row);',[''] ));
       Add( Format('',[''] ));
       Add( Format('  /*  최종적으로 Client에게 보낸 레코드 건수 획득... */',[''] ));
       Add( Format('  memset(FLC_send_cnt, 0x00, sizeof(FLC_send_cnt));',[''] ));
       Add( Format('  strncpy(FLC_send_cnt, FGS_msg_head->c_record_count, H_RCD_CNT);',[''] ));
       Add( Format('  FLI_send_cnt = atoi(FLC_send_cnt);',[''] ));
       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('  FLI_base_idx  = 0;',[''] ));
       Add( Format('  FLI_rec_cnt   = 0;',[''] ));

       if CB_Check.Checked then
       begin
            Add( Format('  /* 쿼리 인수로 설정된 인수 변수 등록 */',[''] ));
            Add( Format('  STRINIT(FLC_sql_stmt);',['']));
            Add( Format('  VC2STR(FLC_sql_stmt, FGS_%S_tin->v_%S);',[vSvcNM, GL_Sql] ));
            Add( Format('',[''] ));

            Add( Format('  EXEC SQL PREPARE S FROM :FLC_sql_stmt;',[''] ));
            Add( Format('  EXEC SQL DECLARE cur_01 CURSOR FOR S;',[''] ));
       end
       else
       begin
            Add( Format('  /* 질의를 확인하시고 수정하시기 바랍니다... */',[''] ));
            Add( Format('  EXEC SQL DECLARE cur_01 CURSOR FOR',[''] ));
            Add( Format('    SELECT  ',[''] ));
            with Mem_Data do
            begin
                 if RecordCount > 0 then
                 begin
                      First;
                      for FCnt := 0 to RecordCount - 1 do
                      begin
                           if CB_Nvl.Checked then
                           begin
                                if   FCnt < RecordCount - 1 then
                                     Add( Format('             NVL(%S%S%S   ',[SelectType(FieldByName('FieldType').AsString),
                                                                               FillDataFix(LowerCase(FieldByName('FieldName').AsString),FL_FLen),
                                                                               SelectZero(FieldByName('FieldType').AsString)+',']))
                                else Add( Format('             NVL(%S%S%S   ',[SelectType(FieldByName('FieldType').AsString),
                                                                               FillDataFix(LowerCase(FieldByName('FieldName').AsString),FL_FLen),
                                                                               SelectZero(FieldByName('FieldType').AsString)]));
                           end
                           else
                           begin
                                if   FCnt < RecordCount - 1 then
                                     Add( Format('             %S ',  [FillDataFix(LowerCase(FieldByName('FieldName').AsString),FL_FLen)+',']))
                                else Add( Format('             %S ',  [FillDataFix(LowerCase(FieldByName('FieldName').AsString),FL_FLen)]));
                           end;
                          
                           Next;
                      end;
                 end;
            end;
            Add( Format('      FROM  %S ',['사용할 테이블명을 입력하세요.'] ));
            Add( Format('     WHERE ',[''] ));
            if Mem_Data.RecordCount > 0 then  Add( Format(' /* WHERE 절을 넣으시면 됩니다... */',[''] ));
            Add( Format('',[''] ));
       end;
       Add( Format('',[''] ));
       Add( Format('  hinsa_log_print(0, "%S 커서 열기...");',[vSvcNM] ));
       Add( Format('  EXEC SQL OPEN  cur_01;',[''] ));
       Add( Format('',[''] ));
       Add( Format('  if (SQLCODE != SQL_OK) ',[''] ));
       Add( Format('  {',[''] ));
       Add( Format('    hinsa_msg_fmt(FGP_data, TMAXORA, SQLCODE, SQLERRM, 0, 0); ',[''] ));
       Add( Format('    STRINIT(FLC_line);',[''] ));
       Add( Format('    sprintf(FLC_line, "에러 내용 : [%s - %s]", SQLCODE, hinsa_storage_trim(SQLERRM)); ',['%d','%s']));
       Add( Format('    hinsa_log_print(0,FLC_line);',[''] ));
       Add( Format('    return(FAILURE);',[''] ));
       Add( Format('  }',[''] ));
       Add( Format('',[''] ));
       Add( Format('  FLI_eof_check = FALSE;',[''] ));
       Add( Format('  FLI_image_size = 0;',[''] ));
       Add( Format('  while(1) ',[''] ));
       Add( Format('  {',[''] ));
       Add( Format('    memset(&FLS_%S_tout, 0x00, sizeof(FLS_%S_tout));',[vSvcNM,vSvcNM] ));
       Add( Format('    memset(&FLS_%S_img, 0x00, sizeof(FLS_%S_img));',[vSvcNM,vSvcNM] ));
       Add( Format('',[''] ));
       Add( Format('    /* Fetch 내용을 변경하시고자 할 경우 이부분을 수정하시기 바랍니다... */',[''] ));
       Add( Format('    EXEC SQL FETCH cur_01 INTO ',[''] ));
       with Mem_Data do
       begin
            if RecordCount > 0 then
            begin
                 First;
                 FCnt := 0;
                 while not Eof do
                 begin
                      if Fcnt < RecordCount - 1 then
                      begin
                           if  (FieldByName('FieldType').AsString <> 'Blob형') then
                                Add( Format('              :FLS_%S_tout.v_%S,',[vSvcNM,LowerCase(FieldByName('FieldName').AsString)] ))
                           else Add( Format('              :FLS_%S_img,',[vSvcNM,LowerCase(FieldByName('FieldName').AsString)] ));
                      end
                      else
                      begin
                           if  (FieldByName('FieldType').AsString <> 'Blob형') then
                                Add( Format('              :FLS_%S_tout.v_%S;',[vSvcNM,LowerCase(FieldByName('FieldName').AsString)] ))
                           else Add( Format('              :FLS_%S_img;',[vSvcNM,LowerCase(FieldByName('FieldName').AsString)] ));
                      end;

                      Inc(FCnt);
                      Next;
                 end;
            end;
       end;
       Add( Format('',[''] ));
       Add( Format('    switch (SQLCODE) ',[''] ));
       Add( Format('    {',[''] ));
       Add( Format('      case SQL_OK :',[''] ));
       Add( Format('        FLI_rtn = %S_business_process(FLS_%S_tout, FLS_%S_img, &FLI_image_size, &FLI_base_idx, FLI_send_cnt, &FLI_rec_cnt, FLI_max_row);',
                   [vSvcNM,vSvcNM,vSvcNM]));
       Add( Format('        break;',[''] ));
       Add( Format('',[''] ));
       Add( Format('      case SQL_NO_DATA :',[''] ));
       Add( Format('        FLI_rtn       = SUCCESS; ',[''] ));
       Add( Format('        FLI_eof_check = TRUE; ',[''] ));
       Add( Format('        break;',[''] ));
       Add( Format('',[''] ));
       Add( Format('      case (SQL_NULL_COL) :',[''] ));
       Add( Format('        FLI_rtn = FAILURE;',[''] ));
       Add( Format('        break;',[''] ));
       Add( Format('',[''] ));
       Add( Format('      default :',[''] ));
       Add( Format('        FLI_rtn = FAILURE;',[''] ));
       Add( Format('        break;',[''] ));
       Add( Format('    }',[''] ));
       Add( Format('',[''] ));
       Add( Format('    if (FLI_rtn == FAILURE)',[''] ));
       Add( Format('    {',[''] ));
       Add( Format('      hinsa_msg_fmt(FGP_data, TMAXORA, SQLCODE, SQLERRM, 0, 0);',[''] ));
       Add( Format('      break;',[''] ));
       Add( Format('    }',[''] ));
       Add( Format('',[''] ));
       Add( Format('    if (SQLCODE != SQL_OK)',[''] ));
       Add( Format('    {',[''] ));
       Add( Format('      STRINIT(FLC_line);',[''] ));
       Add( Format('      sprintf(FLC_line,"%S [%S]번째 조회가 완료 되었습니다...", FLI_rec_cnt);',[vSvcNM, '%d'] ));
       Add( Format('      hinsa_log_print(0,FLC_line);',[''] ));
       Add( Format('      if (FLI_eof_check)',[''] ));
       Add( Format('        hinsa_msg_fmt(FGP_data, TMAXUSER, SQLCODE, "데이타 EOF 까지 조회 되었습니다.", FLI_rec_cnt, (int) (FLI_rec_cnt * sizeof(ts_%S_out)));',[vSvcNM] ));
       Add( Format('      else',[''] ));
       Add( Format('        hinsa_msg_fmt(FGP_data, TMAXUSER, FLI_rec_cnt, "조회 되었습니다.", FLI_rec_cnt, (int) (FLI_rec_cnt * sizeof(ts_%S_out)));',[vSvcNM] ));
       Add( Format('      break;',[''] ));
       Add( Format('    }',[''] ));
       Add( Format('  }',[''] ));
       Add( Format('',[''] ));
       Add( Format('  hinsa_log_print(0, "%S 커서 닫기...");',[vSvcNM] ));
       Add( Format('  STRINIT(FLC_line);',[''] ));
       Add( Format('  if (FLI_rtn != SUCCESS)',[''] ));
       Add( Format('  {',[''] ));
       Add( Format('    sprintf(FLC_line, "%s:FAILURE  SQLCODE=[%s]", SVCNAME, SQLCODE);', ['%s','%d']));
       Add( Format('    hinsa_log_print(0,FLC_line);',[''] ));
       Add( Format('  }',[''] ));
       Add( Format('  else',[''] ));
       Add( Format('  {',[''] ));
       Add( Format('    sprintf(FLC_line,"%s:SUCCESS  SQLCODE=[%s]", SVCNAME, SQLCODE);', ['%s','%d']));
       Add( Format('    hinsa_log_print(0,FLC_line);',[''] ));
       Add( Format('  }',[''] ));
       Add( Format('  EXEC SQL CLOSE cur_01;',[''] ));
       Add( Format('',[''] ));
       Add( Format('  return(FLI_rtn);',[''] ));
       Add( Format('}',[''] ));

       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/*******************************************************************************',[''] ));
       Add( Format(' 함 수 명 : %S_business_process',[vSvcNM] ));
       Add( Format(' 설    명 : DB로부터 추출된 자료의 업무 logic을 처리한다.',[''] ));
       Add( Format(' 리 턴 값 : 성공 -> SUCCESS',[''] ));
       Add( Format('            실패 -> FAILURE',[''] ));
       Add( Format('*******************************************************************************/',[''] ));
       Add( Format('int  %S_business_process(AI_tout, AI_image, AIP_image_size, AIP_base_idx, AI_send_cnt, AIP_rec_cnt, AI_max_row)',[vSvcNM] ));
       Add( Format('ts_%S_tout AI_tout;',[vSvcNM] ));
       Add( Format('ts_%S_img  AI_image;',[vSvcNM] ));
       Add( Format('int  *AIP_image_size;',[''] ));
       Add( Format('int  *AIP_base_idx;',[''] ));
       Add( Format('int  AI_send_cnt;',[''] ));
       Add( Format('int  *AIP_rec_cnt;',[''] ));
       Add( Format('int  AI_max_row;',[''] ));
       Add( Format('{',[''] ));
       Add( Format('  char FLC_line[MAX_STRING];',[''] ));
       Add( Format('  char FLC_image_size[IMAGE_SIZE];',[''] ));
       Add( Format('  char *FLP_image_data;',[''] ));
       Add( Format('  char *FLP_org_data;',[''] ));
       Add( Format('  long FLL_realloc_size;',[''] ));
       Add( Format('  int  FLI_prev_img_size;',[''] ));

       Add( Format('',[''] ));
       Add( Format('  (*AIP_base_idx)++;',[''] ));
       Add( Format('  if (AI_send_cnt >= *AIP_base_idx)',[''] ));
       Add( Format('    return(SUCCESS);',[''] ));
       Add( Format('',[''] ));

       Add( Format('  /* Client로 전송할 buffer 확보... */',[''] ));
       Add( Format('  FLI_prev_img_size  = *AIP_image_size;',[''] ));
       Add( Format('  *AIP_image_size    = *AIP_image_size + (IMAGE_SIZE + AI_image.len);',[''] ));
       Add( Format('  FLL_realloc_size   = (long) ((sizeof(ts_%S_out) * ((*AIP_rec_cnt) + 1)) + sizeof(tmax_msg_head) +  *AIP_image_size);',[vSvcNM]));
       Add( Format('  FGP_data           = tprealloc(FGP_data, FLL_realloc_size);',[''] ));
       Add( Format('',[''] ));
       Add( Format('  if (FGP_data == (char *) 0)',[''] ));
       Add( Format('  {',[''] ));
       Add( Format('     hinsa_msg_fmt(FGP_data, TMAX, tperrno, "전송할 자료 메모리 할당 에러입니다.", 0, 0);',['']));
       Add( Format('     return(FAILURE);',[''] ));
       Add( Format('  }',[''] ));
       Add( Format('',[''] ));
       Add( Format('  gpc_send_len = FLL_realloc_size;',[''] ));
       Add( Format('  FLP_org_data = (char *)(FGP_data + sizeof(tmax_msg_head) + (sizeof(ts_%S_out) * (*AIP_rec_cnt)) + FLI_prev_img_size);',[vSvcNM]));
       Add( Format('  FGS_%S_out   = (ts_%S_out *) FLP_org_data;',[vSvcNM,vSvcNM] ));
       Add( Format('',[''] ));
       Add( Format('  memset(FLP_org_data, FILL_CHAR, sizeof(ts_%S_out));',[vSvcNM] ));
       Add( Format('',[''] ));
       with Mem_Data do
       begin
            if RecordCount > 0 then
            begin
                 First;
                 while Not Eof do
                 begin
                      if FieldByName('FieldType').AsString <> 'Blob형' then
                        Add( Format('  VC2STR(FGS_%S_out->c_%S, AI_tout.v_%S);',
                            [vSvcNM,FillDataFix(LowerCase(FieldByName('FieldName').AsString),FL_FLen),
                             LowerCase(FieldByName('FieldName').AsString)] ));
                      Next;
                 end;
            end;
       end;
       Add( Format('',[''] ));
       Add( Format('  /* 이미지 부분 처리 */',[''] ));
       Add( Format('  FLP_image_data = (char *)(FGP_data + sizeof(tmax_msg_head) + (sizeof(ts_%S_out) * (*AIP_rec_cnt + 1)) + FLI_prev_img_size);',[vSvcNM] ));
       Add( Format('',[''] ));
       Add( Format('  memset(FLP_image_data, FILL_CHAR, IMAGE_SIZE);',[''] ));
       Add( Format('  STRINIT(FLC_image_size);',[''] ));
       Add( Format('  sprintf(FLC_image_size,"%S",AI_image.len);',['%10d'] ));
       Add( Format('  memcpy(FLP_image_data, FLC_image_size, IMAGE_SIZE);',[''] ));
       Add( Format('',[''] ));
       Add( Format('  memset((FLP_image_data + IMAGE_SIZE), 0x00, AI_image.len);',[''] ));
       Add( Format('  memcpy((FLP_image_data + IMAGE_SIZE), AI_image.arr, AI_image.len);',[''] ));
       Add( Format('',[''] ));
       Add( Format('  (*AIP_rec_cnt)++;',[''] ));
       Add( Format('',[''] ));
       Add( Format('  if (*AIP_rec_cnt >= AI_max_row)',[''] ));
       Add( Format('  {',[''] ));
       Add( Format('    STRINIT(FLC_line);',[''] ));
       Add( Format('    sprintf(FLC_line,"%S Batch Rows[%s]갯수 데이타 전송...", *AIP_rec_cnt);',[vSvcNM, '%d'] ));
       Add( Format('    hinsa_log_print(0,FLC_line);',[''] ));
       Add( Format('    hinsa_msg_fmt(FGP_data, TMAXUSER, *AIP_rec_cnt, "퀴리 데이타 데이타 전송...", *AIP_rec_cnt, (int) (*AIP_rec_cnt * sizeof(ts_%S_out)));',[vSvcNM] ));
       Add( Format('    SQLCODE = SQL_NO_DATA;',[''] ));
       Add( Format('  }',[''] ));
       Add( Format('  else',[''] ));
       Add( Format('    FGS_%S_out++;',[vSvcNM] ));

       Add( Format('',[''] ));
       Add( Format('  return(SUCCESS);',[''] ));
       Add( Format('}',[''] ));
  end;

  //////////////////////////////////////////////////////////////////////////////
  with E_DelCode.Lines do
  begin
       Clear;
       Add( Format('// 동적으로 필드 생성을 할 경우 사용하시기 바랍니다...',[''] ));
       Add( Format('    with %S do                                                              ',[GL_Comp] ));
       Add( Format('      begin                                                                 ',[''] ));
       Add( Format('        Close;                                                              ',[''] ));
       Add( Format('        ClearFieldInfo;                                                     ',[''] ));
       with Mem_Data do
       begin
            if RecordCount > 0 then
            begin
                 First;
                 while not Eof do
                 begin
                      Add( Format('        AddField(%S, 타입정의, %S);',[FillDataFix(''''+FieldByName('FieldName').AsString+'''',FL_FLen + 2),
                                                                         IntToStr(FieldByName('FieldSize').AsInteger - 1)] ));
                      Next;
                 end;
            end;
       end;
       Add( Format('      end;                                              ',[''] ));
       Add( Format('// 동적으로 인수를 생성을 할 경우 사용하시기 바랍니다...',[''] ));
       Add( Format('    with %S do                                                              ',[GL_Comp] ));
       Add( Format('      begin                                                                 ',[''] ));
       Add( Format('        Close;                                                              ',[''] ));
       Add( Format('        ClearParamInfo;                                                     ',[''] ));
       with Mem_Param do
       begin
            if RecordCount > 0 then
            begin
                 First;
                 while not Eof do
                 begin
                      Add( Format('        AddParam(%S, %S, %S);',[FillDataFix(''''+FieldByName('FieldName').AsString+'''',FL_PLen + 2),
                                                                   FillDataFix(IntToStr(FieldByName('FieldSize').AsInteger - 1),5), '''인수값'''] ));
                      Next;
                 end;
            end;
       end;
       Add( Format('      end;                                                 ',[''] ));
       Add( Format('// 인수값을 할당할 경우 사용하시기 바랍니다...',[''] ));
       Add( Format('    with %S do                                                              ',[GL_Comp] ));
       Add( Format('      begin                                                                 ',[''] ));
       with Mem_Param do
       begin
            if RecordCount > 0 then
            begin
                 First;
                 FCnt := 0;
                 while not Eof do
                 begin
                      Add( Format('        ParamInfo[%d].Value := %S;',[FCnt,'''인수값''']));
                      Inc(FCnt);
                      Next;
                 end;
            end;
       end;
       Add( Format('      end;                                                 ',[''] ));

       Add( Format('// 서비스를 오픈합니다...',[''] ));
       Add( Format(' %S.Close; ',[GL_Comp] ));
       Add( Format(' %S.Open; ',[GL_Comp] ));
  end;
end;

//DML 작업을 요하는 서비스 생성시....
procedure TFM_CodeGen.CRUD_Process_Gen(FL_Max : Integer);
begin
  with E_TmaxCode.Lines do
  begin
       if Mem_Param.RecordCount > 0 then
       begin
           Add( Format('',[''] ));
           Add( Format('/* 입력 인수 길이 정보정의... */',[''] ));
           Mem_Param.First;
           while not Mem_Param.Eof do
           begin
                Add(FillDataFix('#define',10) +
                    FillDataFix(UpperCase(Mem_Param.FieldByName('FieldName').AsString  ), FL_Max + 2) + '  '+
                    FillDataFix( IntToStr(Mem_Data.FieldByName('FieldSize').AsInteger-1), FL_Max + 2));
                Mem_Param.Next;
           end;
       end;

       if (Mem_Param.RecordCount > 0) then
       begin
            Add( Format('',[''] ));
            Add( Format('',[''] ));
            Add( Format('/******************************************************************************/',[''] ));
            Add( Format('/*   Data I/O용 구조체 정의..                                                 */',[''] ));
            Add( Format('/******************************************************************************/',[''] ));
       end;

       if (Mem_Param.RecordCount > 0) then
       begin
            Add(FillDataFix('typedef',8) + FillDataFix('struct' ,7) + vSvcNM + '_in {' );
            Mem_Param.First;
            while not Mem_Param.Eof do
            begin
                 Add(FillDataFix('        char', NAMESIZE) +
                     FillDataFix('c_' + LowerCase(Mem_Param.FieldByName('FieldName').AsString),FL_PLen + 2) + '[' +
                     FillDataFix(UpperCase(Mem_Param.FieldByName('FieldName').AsString),FL_PLen) + '];');
                 Mem_Param.Next;
            end;
            if CB_Check.Checked then
               Add(FillDataFix('        char', NAMESIZE) +
                   FillDataFix('c_' + GL_Sql,FL_PLen + 2) + '[' +
                   FillDataFix(GL_SqlSize,FL_PLen + 2) + '];');

            Add('} ts_' + vSvcNM + '_in;' );
       end;

       if (Mem_Param.RecordCount > 0) then
       begin
            Add( Format('',[''] ));
            Add( Format('',[''] ));
            Add( Format('/******************************************************************************/',[''] ));
            Add( Format('/*   Table I/O 용 구조체 정의.                                                */',[''] ));
            Add( Format('/******************************************************************************/',[''] ));
            Add( Format('EXEC SQL BEGIN DECLARE SECTION; '                                                ,[''] ));

            Add(FillDataFix('  typedef',10) + FillDataFix('struct' ,7) + vSvcNM + '_tin {' );
            Mem_Param.First;
            while not Mem_Param.Eof do
            begin
                 Add(FillDataFix('          varchar',22) +
                                 FillDataFix('v_' + LowerCase(Mem_Param.FieldByName('FieldName').AsString),FL_PLen+2) + '[' +
                                 FillDataFix(UpperCase(Mem_Param.FieldByName('FieldName').AsString),FL_PLen) + ' + 1];');
                 Mem_Param.Next;
            end;

            if CB_Check.Checked then
               Add(FillDataFix('          varchar', 22) +
                   FillDataFix('v_' + GL_Sql,FL_PLen + 2) + '[' +
                   FillDataFix(GL_SqlSize,FL_PLen + 2) + ' + 1];');

            Add('  } ts_' + vSvcNM + '_tin;' );
            Add( Format('EXEC SQL END DECLARE SECTION; '                                                 ,[''] ));
       end;

       Add( Format('',[''] ));
       Add( Format('EXEC SQL INCLUDE sqlca.h;'                                                      ,[''] ));

       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add( Format('/*   전역 Function 선언부                                                     */',[''] ));
       Add( Format('/******************************************************************************/',[''] ));

       if (Mem_Param.RecordCount > 0) or (CB_Check.Checked) then
       begin
            Add( Format('void %S_input_process(void);                     /* 입력       처리   */',[vSvcNM] ));
            Add( Format('int  %S_input_data_check(void);                  /* 입력데이타 체크   */',[vSvcNM] ));
       end;
       Add( Format('int  %S_database_process(void);                  /* DB         처리   */',[vSvcNM] ));

       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add( Format('/*   전역변수 선언부                                                          */',[''] ));
       Add( Format('/******************************************************************************/',[''] ));
       Add( Format('static long           gpc_send_len;  /*Data 길이           */',[''] ));
       Add( Format('static char          *FGP_data;      /*Data 처리용         */',[''] ));
       Add( Format('static tmax_msg_head *FGS_msg_head;  /*Header 처리용       */',[''] ));
       Add( Format(''                                                                                ,[''] ));
       if (Mem_Param.RecordCount > 0) or (CB_Check.Checked) then
       begin
            Add( Format('static ts_%S_in   *FGS_%S_in;   /*Data I/O용          */',[vSvcNM,vSvcNM] ));
            Add( Format('static ts_%S_tin  *FGS_%S_tin;  /*Oracle 자료 I/O용   */',[vSvcNM,vSvcNM] ));
       end;
       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/*******************************************************************************/',[''] ));
       Add( Format('/*   TMAX 서비스 선언부                                                        */',[''] ));
       Add( Format('/*******************************************************************************/',[''] ));
       Add( Format('void %S(transr)',[vSvcNM] ));
       Add( Format('TPSVCINFO *transr;',[''] ));
       Add( Format('{',[''] ));
       Add( Format('  int  FLI_ret;', [''] ));
       Add( Format('  char FLC_line[LINE_MAX_LENGTH];' ,[''] ));;
       Add( Format('  ts_%S_tin FLS_%S_tin;',[vSvcNM,vSvcNM] ));
       Add( Format('',[''] ));
       Add( Format('  STRINIT(FLC_line);', [''] ));
       Add( Format('  hinsa_log_print(0, hinsa_fillspace(FLC_line, LINE_MAX_LENGTH - 1,''*''));', [''] ));
       Add( Format('  hinsa_log_print(0, "%s 서비스 시작...");', [vSvcNM] ));
       Add( Format('',[''] ));
       Add( Format('  gpc_send_len = sizeof(tmax_msg_head); ',[''] ));
       Add( Format('  FGP_data     = transr->data;',[''] ));
       Add( Format('  FGS_msg_head = (tmax_msg_head *) transr->data;',[''] ));
       
       if (Mem_Param.RecordCount > 0) or (CB_Check.Checked) then
       begin
            Add( Format('  FGS_%S_in   = (ts_%S_in *)(transr->data+sizeof(tmax_msg_head));',[vSvcNM,vSvcNM] ));
            Add( Format('  FGS_%S_tin  = &FLS_%S_tin;',[vSvcNM,vSvcNM] ));
       end;

       if (Mem_Param.RecordCount > 0) or (CB_Check.Checked) then
       begin
            Add( Format('',[''] ));
            Add( Format('  /* Client 입력자료 획득 */',[''] ));
            Add( Format('  hinsa_log_print(0,"%s 입력데이타 할당...");',[vSvcNM] ));
            Add( Format('  %S_input_process();',[vSvcNM] ));
            Add( Format('',[''] ));
            Add( Format('  /* Client 입력자료 유효성 검증 */',[''] ));
            Add( Format('  hinsa_log_print(0,"%S 입력자료 유효성 검사...");',[vSvcNM] ));
            Add( Format('  if (%S_input_data_check() != SUCCESS) ',[vSvcNM] ));
            Add( Format('  {',[''] ));
            Add( Format('    hinsa_log_print(0, "%S 서비스 종료 (에러발생으로 인한 종료)...");', [vSvcNM] ));
            Add( Format('    tpreturn(TPFAIL, 0, FGP_data, gpc_send_len, 0L);',[''] ));
            Add( Format('  }',[''] ));
       end;

       Add( Format('',[''] ));
       Add( Format('  hinsa_log_print(0,"%S 데이타 프로세스 처리...");',[vSvcNM] ));
       Add( Format('   /* Database 작업 처리 */',[''] ));
       Add( Format('  if (%S_database_process() != SUCCESS) ',[vSvcNM] ));
       Add( Format('  {',[''] ));
       Add( Format('    hinsa_log_print(0, "%S 서비스 종료 (에러발생으로 인한 종료)...");', [vSvcNM] ));
       Add( Format('    tpreturn(TPFAIL, 0, FGP_data, gpc_send_len, 0L);',[''] ));
       Add( Format('  }',[''] ));

       Add( Format('',[''] ));
       Add( Format('  hinsa_log_print(0, "%S 서비스 종료...");',[vSvcNM] ));
       Add( Format('  STRINIT(FLC_line);', [''] ));
       Add( Format('  hinsa_log_print(0, hinsa_fillspace(FLC_line, LINE_MAX_LENGTH - 1,''*''));', [''] ));
       Add( Format('  tpreturn(TPSUCCESS, 0, FGP_data, gpc_send_len, 0L);',[''] ));
       Add( Format('}',[''] ));
       Add( Format('',[''] ));
  end;
end;

procedure TFM_CodeGen.CRUD_DataBase_Process;
var
  FCnt : Integer;
begin
  with E_TmaxCode.Lines do
  begin
       Add( Format('',[''] ));
       Add( Format('',[''] ));
       Add( Format('/*******************************************************************************',[''] ));
       Add( Format(' 함 수 명 : %S_database_process',[vSvcNM] ));
       Add( Format(' 설    명 : DB 작업을 처리한다.',[''] ));
       Add( Format(' 리 턴 값 : 성공 -> SUCCESS',[''] ));
       Add( Format('            실패 -> FAILURE',[''] ));
       Add( Format('*******************************************************************************/',[''] ));
       Add( Format('int  %S_database_process(void)',[vSvcNM] ));
       Add( Format('{',[''] ));
       Add( Format('  char FLC_line[MAX_STRING];',[''] ));
       if CB_Check.Checked then  Add( Format('  char FLC_sql_stmt[%s + 1];',[GL_SqlSize] ));

       Add( Format('',[''] ));
       Add( Format('',[''] ));
       if CB_Check.Checked then
       begin
            Add( Format('  /* 전송된 SQL문장 등록 */',[''] ));
            Add( Format('  STRINIT(FLC_sql_stmt);',['']));
            if GL_Sql = '' then  GL_Sql := '전송된 SQL 문장 호스트 변수를 작성하세요...';
            Add( Format('  VC2STR(FLC_sql_stmt, FGS_%S_tin->v_%S);',[vSvcNM, GL_Sql] ));
            Add( Format('',[''] ));
            Add( Format('  /* DB자료 처리... */',[''] ));
            Add( Format('  hinsa_log_print(0, "%S SQL문장 실행...");',[vSvcNM] ));
            Add(        '  STRINIT(FLC_line);');
            Add(        '  sprintf(FLC_line, "%s", FLC_sql_stmt);');
            Add(        '  hinsa_log_print(0, FLC_line);');
            Add( Format('  EXEC SQL PREPARE S FROM :FLC_sql_stmt;',[''] ));
            Add( Format('  EXEC SQL EXECUTE S;',[''] ));
            
            // 에러처리 부분...
            Add( Format('',[''] ));
            Add( Format('  /* 현재 작업할 데이타가 Rollback중일 경우 */',[''] ));
            Add( Format('  if ((SQLCODE != SQL_OK || SQLCODE == -24761) && SQLCODE != SQL_NO_DATA) ',[''] ));
            Add( Format('  {',[''] ));                                       

            Add( Format('    hinsa_msg_fmt(FGP_data, TMAXORA, SQLCODE, SQLERRM, 0, 0); ',[''] ));
            Add( Format('    STRINIT(FLC_line);',[''] ));
            Add( Format('    sprintf(FLC_line, "에러 내용 : [%s - %s]", SQLCODE, hinsa_storage_trim(SQLERRM)); ',['%d','%s']));
            Add( Format('    hinsa_log_print(0,FLC_line);',[''] ));
            Add( Format('    return(FAILURE);',[''] ));
            Add( Format('  }',[''] ));
       end
       else
       begin
            Add( Format('  /* 작업할 SQL문장을 작성하세요...*/',[''] ));
            
            // 에러처리 부분...
            Add( Format('',[''] ));
            Add( Format('  /* 현재 작업할 데이타가 Rollback중일 경우 */',[''] ));
            Add( Format('  if ((SQLCODE != SQL_OK || SQLCODE == -24761) && SQLCODE != SQL_NO_DATA) ',[''] ));
            Add( Format('  {',[''] ));
            Add( Format('    hinsa_msg_fmt(FGP_data, TMAXORA, SQLCODE, SQLERRM, 0, 0); ',[''] ));
            Add( Format('    STRINIT(FLC_line);',[''] ));
            Add( Format('    sprintf(FLC_line, "에러 내용 : [%s - %s]", SQLCODE, hinsa_storage_trim(SQLERRM)); ',['%d','%s']));
            Add( Format('    hinsa_log_print(0,FLC_line);',[''] ));
            Add( Format('    return(FAILURE);',[''] ));
            Add( Format('  }',[''] ));
       end;
       Add( Format('',[''] ));
       Add( Format('  hinsa_msg_fmt(FGP_data, TMAXUSER, SQL_NO_DATA, "정상적으로 서비스가 완료 되었습니다...", 0, 0); ',[''] ));
       Add( Format('  return(SUCCESS);',[''] ));
       Add( Format('}',[''] ));
  end;

  //////////////////////////////////////////////////////////////////////////////
  with E_DelCode.Lines do
  begin
       Clear;
       Add( Format('// 동적으로 인수를 생성을 할 경우 사용하시기 바랍니다...',[''] ));
       Add( Format('    with %S do                                                              ',[GL_Comp] ));
       Add( Format('    begin                                                                   ',[''] ));
       Add( Format('         Close;                                                             ',[''] ));
       Add( Format('         ClearParamInfo;                                                    ',[''] ));
       with Mem_Param do
       begin
           if RecordCount > 0 then
           begin
                First;
                while not Eof do
                begin
                     Add( Format('        AddParam(%S, %S, %S);',[FillDataFix(''''+    FieldByName('FieldName').AsString      +'''',FL_PLen + 2),
                                                                  FillDataFix(IntToStr(FieldByName('FieldSize').AsInteger-1),5), '''인수값'''] ));
                     Next;
                end;
           end;
       end;
       Add( Format('// 인수값을 할당할 경우 사용하시기 바랍니다...',[''] ));
       Add( Format('    with %S do                                                              ',[GL_Comp] ));
       Add( Format('    begin                                                                   ',[''] ));
       with Mem_Param do
       begin
            if RecordCount > 0 then
            begin
                First;
                FCnt := 0;
                while not Eof do
                begin
                     Add( Format('        ParamInfo[%d].Value := %S;',[FCnt,'''인수값''']));
                     Inc(FCnt);
                     Next;
                end;
            end;
       end;
       Add( Format('      end;                                                 ',[''] ));

       Add( Format('// 서비스를 오픈합니다...',[''] ));
       Add( Format('if %S.Execute then ',[GL_Comp] ));
       Add( Format('  성공 ',[GL_Comp] ));
       Add( Format('else ',[] ));
       Add( Format('  실패 ',[] ));
  end;
end;


end.
