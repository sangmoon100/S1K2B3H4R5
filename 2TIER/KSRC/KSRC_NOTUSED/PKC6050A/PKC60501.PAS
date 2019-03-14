unit PKC60501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  numedit, Mask, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids,
  pass, Tmax_DataSetText, Tmax_session, OnInsaCommon, Func, TmaxFunc,
  MemDS, DBAccess, Ora;

type
  TFpkc40401 = class(TForm)
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel9: TPanel;
    Panel3: TPanel;
    BBclose: TBitBtn;
    BitBtn2: TBitBtn;
    BBcancel: TBitBtn;
    Phelpmsg: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel4: TPanel;
    Efilename: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    NE1: TNumberEdit;
    NE2: TNumberEdit;
    NE3: TNumberEdit;
    NE11: TNumberEdit;
    NE21: TNumberEdit;
    NE31: TNumberEdit;
    Panel13: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    me_reqdate: TMaskEdit;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    TMaxSession: TTMaxSession;
    TDS_batch: TTMaxDataSet;
    OraQuery1: TOraQuery;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BBcloseClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BBcancelExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    procedure  MakeFileName;
    procedure  ClearResult;
    procedure  SetEmpTime;
    Procedure  Display_Msg2(p_str:string);   //Dsa2000
    procedure GetReqdate;

  end;

var
  Fpkc40401: TFpkc40401;
  qq : TOraQuery;


implementation

{$R *.DFM}

procedure  TFpkc40401.SetEmpTime;
begin
     Application.ProcessMessages;

     OraConnect;

     qq := TOraQuery.Create(Fpkc40401);
     qq.Session := Ora_Session;

     Lempno.Caption := Pkorname+'('+Pempno+')';
     Lsysdate.caption := fn_GetDateStr;


     with OraQuery1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select bacode, baname from pkmbank ');
          SQL.Add(' where maccyn = ''Y''              ');
          Open;
     end;

     GetReqdate;
     Application.ProcessMessages;
end;


procedure TFpkc40401.MakeFileName;
var
     fname : String;
begin
     fname := '';

     with qq do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select deddate from pkclient ');
          SQL.Add(' where bacode = :p_bacode    ');
          ParamByName('p_bacode').AsString := OraQuery1.FieldByName('bacode').AsString;
          Open;

          fname := FieldByName('deddate').AsString;

          fname := copy(fname,3,4) + OraQuery1.FieldByName('bacode').AsString;

          Close;
          SQL.Clear;
          SQL.Add('select max(seqno)+1 a from pkmbalog ');
          Open;

          fname := fname + Format('%4.3d',[FieldByName('a').AsInteger])+'.lst';

          Efilename.Text := fname;
     end;

end;

procedure TFpkc40401.DataSource1DataChange(Sender: TObject; Field: TField);
begin
     MakeFileName;
     ClearResult;
end;

procedure TFpkc40401.BBcloseClick(Sender: TObject);
begin
     close;
end;


//2003.09.03. Dsa2000  소켓 컴포넌트 바뀌면서 소스 수정.
Procedure TFpkc40401.Display_Msg2(p_str:String);
var
     i,j     : LongInt;
     Temp    : Array[0..1000] of Char;
     HostStr : String;
begin
     i        := 0;
     j        := 0;
     HostStr  := '';

     for i := 0 to Length(p_str) - 1 do
     begin
          if p_str[i] = #10 then
          begin
               Memo1.Lines.Add( HostStr );
               HostStr := '';
          end
          else
               HostStr := HostStr + p_str[i];
     end;
     if HostStr <> '' then Memo1.Lines.Add( HostStr );
end;

procedure TFpkc40401.BitBtn2Click(Sender: TObject);
var
     ResStr   : String;
     Info     : String;
     Receiver : String;
     Rundate,  ProgId, CmdStr   : String;  //서비스 개발...
     Count    : Integer;
begin
     Phelpmsg.Caption := '화일을 전송하는 중입니다';
     Application.ProcessMessages;
     Screen.Cursor := CrCross;


     Memo1.Clear;
     CmdStr  := '/hper/insa/HINSA/proc/bin/EDIbin/sndd'+' '+'-f'+' '
               +'/hper/insa/HINSA/data/EDIdata/'+Efilename.Text;

     with TDS_batch do
     begin
          Close;
          ServiceName := 'HINSA_batch';
          ClearFieldInfo;
          ClearParamInfo;
          AddParam('cmdstr', 300, CmdStr);
          Execute;

          Close;
          ServiceName := 'SHR0SSEL';
          ClearFieldInfo;
          ClearParamInfo;
          AddField('RESULT', ftString, 5000);
          Sql.Text := Format('SELECT RESULT FROM PYBATLOG '+
                             ' WHERE RUNDATE = ''%s''     '+
                             '   AND PROGID  = ''%s''     '+
                             ' ORDER BY SEQNO             ',[Rundate, ProgId ]);
          Open;

          while not Eof do
          begin
               Memo1.Lines.Add(FieldByName('RESULT').AsString);
               Next;
          end;
     end;
//============================================================================//

     with qq do   //DSA2000  2005.01.추가... 전송실패여부 업데이트 체크 위해.
     begin
          Close;
          SQL.Clear;
          SQL.Add ( 'select count(*) cnt from pkmbalog ');
          SQL.Add ( ' where seqno = :L1                ');
          ParamByName('L1').AsInteger := StrToInt(copy(Efilename.Text,7,4));
          Open;
          Count := FieldByName('cnt').AsInteger;
          Close;
     end;

     if Count > 0 then
     begin
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('update pkmbalog                                            ');
               SQL.Add('   set transyn   = ''Y'',                                  ');
               SQL.Add('       writetime = to_char(sysdate,''yyyymmddhh24miss''),  ');
               SQL.Add('       writeman  = :empno                                  ');
               SQL.Add('where seqno = :L1                                          ');
               ParamByName('empno').AsString := Pempno;
               ParamByName('L1').AsInteger := StrToInt(copy(Efilename.Text,7,4)); //2003.06. 강륜종 : Seqno 증가(4자리)로 업데이트가 잘못되고 있어 수정함...
               ExecSQL;                                                           //StrToInt(copy(Efilename.Text,6,3));
               Phelpmsg.Caption := '전송을 완료했습니다';
          end;
     end
     else
          Phelpmsg.Caption := '전송 실패...';

     Screen.Cursor := crDefault;
end;

procedure TFpkc40401.ClearResult;
begin
     NE1.value  := 0;
     NE11.value := 0;
     NE2.value  := 0;
     NE21.value := 0;
     NE3.value  := 0;
     NE31.value := 0;
end;

procedure TFpkc40401.BBcancelClick(Sender: TObject);
var
     LastMsg : String ;
     Rundate,  ProgId, CmdStr   : String;  //서비스 개발...
begin
     Phelpmsg.Caption := '이체자료 화일을 만들고 있습니다';
     Application.ProcessMessages;

     Memo1.Clear;
     Memo1.Lines.Add('실행중...');

     FM_Tmax           := TFM_Tmax.Create(Self);
     FM_Tmax.T_Session := TMaxSession;
     Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);
     
     ProgId  := 'pkc6050a';
     CmdStr  := '/hper/insa/HINSA/proc/bin/Kbin/pkc6050a'+' '+OraQuery1.FieldByName('bacode').AsString+' '
               +Efilename.Text+' '+me_reqdate.Text+' '+me_reqdate.Text+' '+Pempno+' '+ProgId+' '+Rundate;

     with TDS_batch do
     begin
          Close;
          ServiceName := 'HINSA_batch';
          ClearFieldInfo;
          ClearParamInfo;
          AddParam('cmdstr', 300, CmdStr);
          Execute;

          Close;
          ServiceName := 'SHR0SSEL';
          ClearFieldInfo;
          ClearParamInfo;
          AddField('RESULT', ftString, 5000);
          Sql.Text := Format('SELECT RESULT FROM PYBATLOG '+
                             ' WHERE RUNDATE = ''%s''     '+
                             '   AND PROGID  = ''%s''     '+
                             ' ORDER BY SEQNO             ',[Rundate, ProgId ]);
          Open;

          while not Eof do
          begin
               Memo1.Lines.Add(FieldByName('RESULT').AsString);
               Next;
          end;
     end;

     if Pos('OK',Memo1.Text) > 0 then
     begin
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select *                                        ');
               SQL.Add('from pkmbalog                                   ');
               SQL.Add('where seqno = (select max(seqno) from pkmbalog )');
               Open;

               NE1.value  := FieldByName('mmovecnt').AsFloat;
               NE11.value := FieldByName('mmoveamt').AsFloat;
               NE2.value  := FieldByName('cmovecnt').AsFloat;
               NE21.value := FieldByName('cmoveamt').AsFloat;
               NE3.value  := FieldByName('movecnt').AsFloat;
               NE31.value := FieldByName('moveamt').AsFloat;
          end;

          Phelpmsg.Caption := '이체자료 화일을 생성을 완료했습니다';
          Application.ProcessMessages;
     end
     else
          Phelpmsg.Caption := LastMsg;
end;

procedure TFpkc40401.FormActivate(Sender: TObject);
begin
     SetEmpTime;
end;

procedure TFpkc40401.BBcancelExit(Sender: TObject);
begin
     Phelpmsg.Caption :='';
end;

//의뢰일자를 setting
// 1998. 04. 10
procedure TFpkc40401.GetReqdate;
begin
     with qq do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select reqdate,          ');
          SQL.Add('       to_char(Last_day(to_date(reqdate,   ''YYYYMMDD'')), ''YYYYMMDD'') paydate  ');
          SQL.Add('from pkclient            ');
          SQL.Add('where bacode = :p_bacode ');
          ParamByName('p_bacode').AsString := OraQuery1.FieldByName('bacode').AsString;
          Open;

          me_reqdate.Text := FieldByName('paydate').AsString;
//          me_caldate.Text := FieldByName('paydate').AsString;
     end;
end;

procedure TFpkc40401.BitBtn1Click(Sender: TObject);
begin
//     Fpkw10602 := TFpkw10602.Create(Self) ;
//     Fpkw10602.RemoteTxt.Text := EfileName.Text ;
//     Fpkw10602.Showmodal ;
end;

procedure TFpkc40401.FormCreate(Sender: TObject);
begin
     TMaxSession.ServiceTimeOut := 1000;

     TMaxSession.Connect  := False;
     TMaxSession.Host     := Hinsa_Param(cmdline,10);
     TMaxSession.Port     := '9999';

     try
          TMaxSession.Connect := True;
          TMaxSession.TMax_Begin(5000);
     except
          Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
          Application.Terminate;
          Exit;
     end;
end;

procedure TFpkc40401.Button1Click(Sender: TObject);
begin
     showmessage(OraQuery1.FieldByName('bacode').AsString);
end;

end.

