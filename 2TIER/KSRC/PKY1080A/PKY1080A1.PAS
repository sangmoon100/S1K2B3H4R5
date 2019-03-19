unit PKY1080A1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables, DBCtrls,
  Grids, DBGrids, Pass, MemDS, DBAccess, Ora, OraSmart,pePrnview, Func;

type
  TFM_Main = class(TForm)
    Panel3: TPanel;
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel4: TPanel;
    btprior: TBitBtn;
    btnext: TBitBtn;
    BBclose: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    BBinsert: TBitBtn;
    BBmodify: TBitBtn;
    BBdelete: TBitBtn;
    maintitle: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    RGKind: TRadioGroup;
    Qry1: TOraQuery;
    Qry1DATANO: TStringField;
    Qry1DATAKIND: TStringField;
    Qry1DATANAME: TStringField;
    Qry1DATAFLD: TStringField;
    Qry1STTKIND: TStringField;
    Qry1MONTHYN: TStringField;
    Qry1MOVEKIND: TStringField;
    Qry1FROMTBL: TStringField;
    Qry1FROMFLD: TStringField;
    Qry1WHEREFLD: TStringField;
    Qry1WHEREVALUE: TStringField;
    Qry1PCFILE: TStringField;
    Qry1HANCODE: TStringField;
    Qry1WORKTIME: TStringField;
    Qry1WORKMAN: TStringField;
    Qry1WORKTEL: TStringField;
    Qry1WORKCNT: TIntegerField;
    Qry1CLEARYN: TStringField;
    Qry1CLEARTIME: TStringField;
    Qry1MOVEYN: TStringField;
    Qry1MOVETIME: TStringField;
    Qry1MOVECNT: TIntegerField;
    Qry1MOVEAMT: TFloatField;
    Qry1MOVEMAN: TStringField;
    Qry1SOGUBYN: TStringField;
    Qry1WRITETIME: TStringField;
    Qry1WRITEMAN: TStringField;
    Qry1WORKAMT: TFloatField;
    Qry1CLEARADD: TStringField;
    Qry1TMOVEKIND: TStringField;
    procedure BBcloseClick(Sender: TObject);
    procedure btnextClick(Sender: TObject);
    procedure btpriorClick(Sender: TObject);
    procedure BBdeleteClick(Sender: TObject);
    procedure BBinsertClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BBmodifyClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure RGKindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MOUSEWHEELMessage(var Msg: TMsg; var Handled: Boolean);
  private
    { Private declarations }
  public
    W_worktype : string;  // 0:공통, 1:정규직, 2:일반직
    
    procedure Get_Record(v_key : integer);
    { Public declarations }
  end;

var
  FM_Main: TFM_Main;
  datano : String;



implementation

uses PKY1080A2;


{$R *.DFM}

//*************************** User Define ***********************************//
//해당항목 값을 출력한다.
procedure TFM_Main.Get_Record(v_key: integer);
begin
     with Qry1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select a.*,                                    ' + #13 +
                  '       (select codename from pyccode           ' + #13 +
                  '         where codeid = ''K212''               ' + #13 +
                  '           and codeno = a.movekind) tmovekind  ' + #13 +
                  '  from PKMPFLD a                               ');

          case v_key of
               0: SQL.Add(' where datano between ''000'' and ''099'' ');
               1: SQL.Add(' where datano between ''100'' and ''199'' ');
               2: SQL.Add(' where datano between ''200'' and ''299'' ');
               3: SQL.Add(' where datano between ''300'' and ''399'' ');
          end;

          SQL.Add(' order by a.datano ');

          Open;
     end;
end;

//*************************** User Define ***********************************//

procedure TFM_Main.FormCreate(Sender: TObject);
begin
     OraConnect;

     Application.OnMessage := MOUSEWHEELMessage; //디비그리드에서 마우스 휠작동을 위한 Application Message 설정.
end;

procedure TFM_Main.FormActivate(Sender: TObject);
begin
     Application.ProcessMessages;

     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     if   (copy(Pempno, 1,1) = 'D') or ((Copy(Pgrade,3,1) <= 'C') and (fn_YmanagerCheck)) then
     begin
          maintitle.Color   := clTeal;
          maintitle.Caption := '급여항목관리[파견직]';
          RGKind.ItemIndex  := 3;
          RGKind.Enabled    := False;
          Panel1.Visible    := False;
     end
     else
     begin
          MessageBox(handle,'파견직 관리자 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;
     Lsysdate.caption := Fn_GetDateStr;
     Lempno.Caption   := Pkorname+'('+Pempno+')';

     Get_Record(RGKind.ItemIndex);
end;

procedure TFM_Main.BBcloseClick(Sender: TObject);
begin
     Close;
end;

procedure TFM_Main.btnextClick(Sender: TObject);
begin
     Qry1.Next;
end;

procedure TFM_Main.btpriorClick(Sender: TObject);
begin
     Qry1.Prior;
end;

procedure TFM_Main.BBdeleteClick(Sender: TObject);
var
    tmpstr : String;
begin
     if Qry1.RecordCount = 0 then
     begin
          Application.MessageBox('삭제할 자료가 없습니다', '작업안내', mb_OK+$0030);
          exit;
     end;

     tmpStr := '['+Qry1.FieldByName('dataname').AsString+']'+' 항목을 삭제하시겠습니까?';

     if Application.MessageBox(PChar(tmpStr), '작업안내', mb_YesNo+$0020) = ID_Yes then
     begin
         //2015.11.17 eyha 작업이력 저장
         FM_Sub.V_datano        := Qry1.FieldByName('datano').AsString    ;
         FM_Sub.V_dataname      := Qry1.FieldByName('dataname').AsString  ;
         FM_Sub.V_datafld       := Qry1.FieldByName('datafld').AsString   ;
         FM_Sub.V_clearadd      := Qry1.FieldByName('clearadd').AsString  ;
         FM_Sub.V_monthyn       := Qry1.FieldByName('monthyn').AsString   ;
         FM_Sub.V_sogubyn       := Qry1.FieldByName('sogubyn').AsString   ;
         FM_Sub.V_pcfile        := Qry1.FieldByName('pcfile').AsString    ;
         FM_Sub.V_movekind      := Qry1.FieldByName('movekind').AsString  ;
         FM_Sub.V_fromtbl       := Qry1.FieldByName('fromtbl').AsString   ;
         FM_Sub.V_fromfld       := Qry1.FieldByName('fromfld').AsString   ;
         FM_Sub.V_wherefld      := Qry1.FieldByName('wherefld').AsString  ;
         FM_Sub.V_wherevalue    := Qry1.FieldByName('wherevalue').AsString;

         if not FM_Sub.Save_History('급여항목관리','삭제',Pempno,W_worktype,'',Qry1.FieldByName('dataname').AsString) then
         begin
            MessageDlg('작업이력저장이 실패 하였습니다...',mtError, [mbOk], 0);
            exit;
         end;

         Qry1.SQLDelete.Clear;
         Qry1.SQLDelete.Add(' delete from pkmpfld where datano = '''+Qry1.FieldByName('datano').AsString+''' ');
         Qry1.Delete;
     end;
end;

procedure TFM_Main.BBinsertClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               SQL.Clear;
               SQL.Add('select max(datano) a from pkmpfld  ');

               case RGKind.ItemIndex of
                    0: SQL.Add(' where datakind = 0');
                    1: SQL.Add(' where datakind = 1');
                    2: SQL.Add(' where datakind = 2');
                    3: SQL.Add(' where datakind = 3');
               end;

               Open;

               if FieldByName('a').AsString = '' then
               begin
                    case RGKind.ItemIndex of
                         0: datano := '000';
                         1: datano := '100';
                         2: datano := '200';
                         3: datano := '300';
                    end
               end
               else
               begin
                    datano := Format('%3.3d',[StrToInt(FieldByName('a').AsString)+1]);
               end;

          end;
     finally
          qq.Free;
     end;

     FM_Sub.Edatano.Text    := datano;
     FM_Sub.Edatano.Enabled := True;
     FM_Sub.W_mode          := 0;
     FM_Sub.ShowModal;
end;


procedure TFM_Main.BBmodifyClick(Sender: TObject);
begin
     if Qry1.RecordCount = 0 then
     begin
          Application.MessageBox('수정할 자료가 없습니다', '작업안내', mb_OK+$0030);
          exit;
     end;

     FM_Sub.Edatano.Text := Qry1DATANO.Text;
     FM_Sub.W_mode          := 1;
     FM_Sub.ShowModal;
end;

procedure TFM_Main.RGKindClick(Sender: TObject);
begin
     Get_Record(RGKind.ItemIndex);

     if RGKind.ItemIndex = 3 then
       W_worktype := '일반직'
     else
       W_worktype := '정규직';
end;

procedure TFM_Main.DBGrid1DblClick(Sender: TObject);
begin
     if (Qry1.RecordCount = 0) then
     begin
          Application.MessageBox('수정할 자료가 없습니다', '자료오류', mb_OK+$0030);
          exit;
     end;

     FM_Sub.Edatano.Enabled := False;
     FM_Sub.Edatano.Text    := Qry1DATANO.Text;
     FM_Sub.W_mode          := 1;
     FM_Sub.ShowModal;
end;

//디비그리드에서 마우스 휠작동을 위한 Application Message 구현.
procedure TFM_Main.MOUSEWHEELMessage(var Msg: TMsg; var Handled: Boolean);
begin
     if Msg.Message = WM_MOUSEWHEEL then
     begin
          if ActiveControl = TControl(DBGrid1) then
          Begin
               if Msg.wParam > 0 then
               begin
                   keybd_event(VK_UP, VK_UP, 0, 0);
                   keybd_event(VK_UP, VK_UP, KEYEVENTF_KEYUP, 0);
               end
               else if Msg.wParam < 0 then begin
                   keybd_event(VK_DOWN, VK_DOWN, 0, 0);
                   keybd_event(VK_DOWN, VK_DOWN, KEYEVENTF_KEYUP, 0);
               end;
               ActiveControl.Invalidate;
          end;
     end;
end;

end.
