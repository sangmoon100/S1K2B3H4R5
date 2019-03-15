{* ===================  USER LIBRARY  ======================================
  TimeFtp :  서버 Time Call
  Calen1  :  달력 년/월/일
  Kylib1  :  DateCheck
  Pass    :  login 시 사번, 비밀번호 확인
  DateLib :
========================================================================= *}

unit pkg10101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, DBTables, DB, Ora, Func;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Phelpmsg: TPanel;
    Panel4: TPanel;
    L_UserName: TLabel;
    L_Curdate: TLabel;
    BBsave: TBitBtn;
    BBcancel: TBitBtn;
    BBhelp: TBitBtn;
    BBexit: TBitBtn;
    Bevel1: TBevel;
    Panel5: TPanel;
    NEmatecnt: TNumberEdit;
    Panel6: TPanel;
    NEmateamt: TNumberEdit;
    Panel7: TPanel;
    NEchildcnt: TNumberEdit;
    Panel8: TPanel;
    NEchildamt: TNumberEdit;
    Panel9: TPanel;
    NEtogethermm: TNumberEdit;
    Panel10: TPanel;
    NEparentcnt: TNumberEdit;
    Panel11: TPanel;
    NEparentamt: TNumberEdit;
    Panel12: TPanel;
    NEchildmaxage: TNumberEdit;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    NEparentminage: TNumberEdit;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Procedure LLdata;
    { Private declarations }
  public
    Start : Integer;
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Running: Boolean;

implementation
{$R *.DFM}


{폼 활성화.....................................................................}
procedure TMainForm.FormActivate(Sender: TObject);
begin
     if Running then System.Exit;

     Running := True;
     Application.ProcessMessages;

     OraConnect;

     L_Curdate.Caption  := fn_GetDateStr;
     L_UserName.Caption := PKorname + '(' + Pempno + ')';

     LLdata;

     Application.ProcessMessages;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     Start := 0;
     Running := False;
end;

Procedure TMainForm.LLdata;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select * from pkcfmbas   ');
               Open;

               if RecordCount > 0 then
               begin
                    Phelpmsg.Caption     := '  등록된 자료가 조회되었습니다.';
                    NEmatecnt.Value      := FieldByName('MATECNT').AsFloat;      { 배우자수 }
                    NEmateamt.Value      := FieldByName('MATEAMT').AsFloat;      { 가족수당 }

                    NEparentcnt.Value    := FieldByName('PARENTCNT').AsFloat;    { 직계존속수 }
                    NEparentamt.Value    := FieldByName('PARENTAMT').AsFloat;    { 가족수당 }
                    NEparentminage.Value := FieldByName('PARENTMINAGE').AsFloat; { 연령기준(남) }
                    NEtogethermm.Value   := FieldByName('TOGETHERMM').AsFloat;   { 동거기준기간 }

                    NEchildcnt.Value     := FieldByName('CHILDCNT').AsFloat;     { 직계비속수 }
                    NEchildamt.Value     := FieldByName('CHILDAMT').AsFloat;     { 가족수당 }
                    NEchildmaxage.Value  := FieldByName('CHILDMAXAGE').AsFloat;  { 제한연령 }
               end
               else
               begin
                    Phelpmsg.Caption := '  등록된 자료가 없습니다.  신규등록하세요.';
               end;
          end;
     Finally
          qq.Free;
     end;

     Application.ProcessMessages;
end;

procedure TMainForm.BBexitClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if Application.MessageBox('작업을 종료하시겠습니까?','작업안내', mb_YesNo) = IDYES then
          Action := caFree
     else
          Action := caNone;
end;

{완료 버튼을 눌렀다.............................................................}
procedure TMainForm.BBsaveClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     if IDNO = Application.MessageBox('가족수당 기준 내역을 저장하시겠습니까?','작업 안내',MB_YesNo ) then
          System.Exit;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('delete from pkcfmbas  ');
               ExecSQL;

               Close;
               SQL.Clear;
               SQL.Add('insert into pkcfmbas ( matecnt,                             ');
               SQL.Add('                       mateamt,                             ');
               SQL.Add('                       parentcnt,                           ');
               SQL.Add('                       parentamt,                           ');
               SQL.Add('                       parentminage,                        ');
               SQL.Add('                       togethermm,                          ');
               SQL.Add('                       childcnt,                            ');
               SQL.Add('                       childamt,                            ');
               SQL.Add('                       childmaxage,                         ');
               SQL.Add('                       writetime,                           ');
               SQL.Add('                       writeman )                           ');
               SQL.Add('              values ( :lmatecnt,                           ');
               SQL.Add('                       :lmateamt,                           ');
               SQL.Add('                       :lparentcnt,                         ');
               SQL.Add('                       :lparentamt,                         ');
               SQL.Add('                       :lparentminage,                      ');
               SQL.Add('                       :ltogethermm,                        ');
               SQL.Add('                       :lchildcnt,                          ');
               SQL.Add('                       :lchildamt,                          ');
               SQL.Add('                       :lchildmaxage,                       ');
               SQL.Add('                       to_char(sysdate,''YYYYMMDDHH24MI''), ');
               SQL.Add('                       :pempno )                            ');
               ParamByName('lmatecnt').AsFloat      := NEmatecnt.Value;
               ParamByName('lmateamt').AsFloat      := NEmateamt.Value;
               ParamByName('lparentcnt').AsFloat    := NEparentcnt.Value;
               ParamByName('lparentamt').AsFloat    := NEparentamt.Value;
               ParamByName('lparentminage').AsFloat := NEparentminage.Value;
               ParamByName('ltogethermm').AsFloat   := NEtogethermm.Value;
               ParamByName('lchildcnt').AsFloat     := NEchildcnt.Value;
               ParamByName('lchildamt').AsFloat     := NEchildamt.Value;
               ParamByName('lchildmaxage').AsFloat  := NEchildmaxage.Value;
               ParamByName('pempno').AsString       := pempno;
               ExecSQL;
               Close;

               Phelpmsg.Caption := '  가족수당 지급기준 내역을 저장하였습니다.';
          end;
     Finally
          qq.Free;
     end;
end;

procedure TMainForm.BBcancelClick(Sender: TObject);
begin
     NEmatecnt.Value      := 0;
     NEmateamt.Value      := 0;
     NEparentcnt.Value    := 0;
     NEparentamt.Value    := 0;
     NEparentminage.Value := 0;
     NEtogethermm.Value   := 0;
     NEchildcnt.Value     := 0;
     NEchildamt.Value     := 0;
     NEchildmaxage.Value  := 0;
     LLdata;
end;

end.
