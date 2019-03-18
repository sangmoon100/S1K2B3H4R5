unit pkw20501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Sockets, Mask, ExtCtrls, FormMon2, func,
  DBTables, Db, Tmax_DataSetText, Tmax_session, OnInsaCommon, TmaxFunc;

type
  TFpkhigdusum = class(TForm)
    Panel4: TPanel;
    Phelpmsg: TPanel;
    Panel6: TPanel;
    BBrun: TBitBtn;
    Panel3: TPanel;
    Panel13: TPanel;
    MEfr: TMaskEdit;
    SBfr: TSpeedButton;
    Panel1: TPanel;
    cb_fixmon: TComboBox;
    Panel5: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel7: TPanel;
    TMaxSession: TTMaxSession;
    TDS_batch: TTMaxDataSet;
    Memo1: TMemo;
    procedure BBrunClick(Sender: TObject);
    procedure SBfrClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    Function  Display_Msg : String;
    Procedure  Display_Msg2(p_str:string);   //Dsa2000
    
  end;

var
  Fpkhigdusum: TFpkhigdusum;

implementation

uses pkw20502, pkw20503;

{$R *.DFM}

procedure TFpkhigdusum.BBrunClick(Sender: TObject);
var
  tmpstr : string;
   Rundate,  ProgId, CmdStr   : String;  //서비스 개발...
begin
      If Length(MEfr.Text) <> 6 then
      begin
          Application.MessageBox('작업기준년월을 정확히 입력하세요....',
                                   '작업안내', mb_OK);
          MEfr.SetFocus;
          exit;
      end;

      If Length(cb_fixmon.Text) <> 1 then
      begin
          Application.MessageBox('월마감여부를 정확히 입력하세요....',
                                   '작업안내', mb_OK);
          cb_fixmon.SetFocus;
          exit;
      end;

      PHelpmsg.Caption   := ' 파견직 근태 집계 중... ';
      BBrun.CurSor := CrHourGlass;

  {   Sockets1.Command   := '~/bin/Kbin/pkw2050g ' + MEfr.text + ' ' + cb_fixmon.text +
                           ' ' + MainForm.gsempno + ' ' + MainForm.GSuser   ;
      Sockets1.Execute;
      Tmpstr             := Display_Msg;  }
  //2003.09.03. Dsa2000  소켓 컴포넌트 바뀌면서 소스 수정
  //      Tmpstr := Rexec.Execute('~/HINSA/proc/bin/Kbin/pkw2050g ' + MEfr.text + ' ' + cb_fixmon.text +
  {    Tmpstr := Rexec.Execute('~/HINSA/proc/src/Ksrc/pkw2050g ' + MEfr.text + ' ' + cb_fixmon.text +
                           ' ' + MainForm.gsempno + ' ' + MainForm.GSuser );
      Display_Msg2(Tmpstr);    }

     //dsa2000  2004.12. Rexec 대체서비스 개발하여 수정작업함.(보안문제로)
     Memo1.Clear;
     Memo1.Lines.Add('실행중...');

     FM_Tmax           := TFM_Tmax.Create(Self);
     FM_Tmax.T_Session := TMaxSession;
     Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14); 
     
     ProgId  := 'pkw2050g';
     CmdStr  := '/hper/insa/HINSA/proc/bin/Kbin/pkw2050g'+' '+MEfr.text+' '
               +cb_fixmon.text+' '+Pempno+' '+ProgId+' '+Rundate;

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

      if Pos('OK',Memo1.Text) > 0 then
         PHelpmsg.Caption := ' 근태 집계가 완료되었습니다. '
      else
         PHelpmsg.Caption := ' 근태 집계에 실패했습니다. ';

      BBrun.CurSor := CrDefault;
      Application.ProcessMessages;

end;

{Function TFpkhigdusum.Display_Msg : String;
var
   i,j     : LongInt;
   Temp    : Array[0..200] of Char;
   str     : String;
begin
     i     := 0;
     j     := 0;

     Sockets1.LastMsg[Sockets1.Len] :=  #0;

     While Sockets1.LastMsg[i] <> #0 do
     begin
          if Sockets1.LastMsg[i] <> #10 then
             begin
                  Temp[j] := Sockets1.LastMsg[i];
                  i := i + 1;
                  j := j + 1;
             end
          else
              begin
                 i := i + 1;
                 Temp[j] := #0;
                 j := 0;
                 Str   := StrPas( Temp );
                 ListBox.Items.Add( Str );
                 Application.ProcessMessages;
              end;
     end;

     Result := Str;
end;}

//2003.09.03. Dsa2000  소켓 컴포넌트 바뀌면서 소스 수정.
Procedure TFpkhigdusum.Display_Msg2(p_str:String);
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

procedure TFpkhigdusum.SBfrClick(Sender: TObject);
var
  Month2Form : TMonth2Form;
begin
Try
    Month2Form := TMonth2Form.Create(nil);
    Month2Form.rdaycaption := MEfr.Text;
    Month2Form.ShowModal;
    MEfr.text :=month2form.daycaption;
  Finally
    Month2Form.Free;
  End;
end;

procedure TFpkhigdusum.FormShow(Sender: TObject);
begin
    DM.Query2.Close;
    DM.Query2.Sql.Clear;
    DM.Query2.Sql.Add (' Select cpaydate from pkcigbas ') ;
    DM.Query2.Open;
    MEfr.Text := DM.Query2.FieldbyName('cpaydate').Asstring ;

    cb_fixmon.text := 'Y' ;
end;

procedure TFpkhigdusum.FormCreate(Sender: TObject);
begin
//2004.12. dsa2000   Rexec 대체서비스 개발하여 수정작업함.(보안문제로)

     TMaxSession.ServiceTimeOut := 1000;
          
     TMaxSession.Host     := Hinsa_Param(cmdline,10);
     TMaxSession.Connect  := False;
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

end.
