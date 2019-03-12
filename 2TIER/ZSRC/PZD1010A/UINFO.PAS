unit UInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnEditBaseCtrl, OnEditStdCtrl, ExtCtrls, Grids, DBGrids, Db, MemDS,
  DBAccess, Ora, StdCtrls, Buttons, Func, OnFocusButton;

type
  TFrmInfo = class(TForm)
    Panel1: TPanel;
    OnMaskEdit_Buho: TOnMaskEdit;
    OnMaskEdit_CardNo: TOnMaskEdit;
    OnMaskEdit_Chipno: TOnMaskEdit;
    OraQuery1: TOraQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    P_Empno: TPanel;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    CB_IOLevel: TComboBox;
    Ed_Chipno: TEdit;
    Label3: TLabel;
    Ed_Cardno: TEdit;
    BT_Modify: TOnFocusButton;
    BT_Close: TOnFocusButton;
    BT_Delete: TOnFocusButton;
    BT_All: TOnFocusButton;
    procedure FormActivate(Sender: TObject);
    procedure OnMaskEdit_BuhoKeyPress(Sender: TObject; var Key: Char);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BitBtn3Click(Sender: TObject);
    procedure OnMaskEdit_CardNoKeyPress(Sender: TObject; var Key: Char);
    procedure OnMaskEdit_ChipnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_CloseClick(Sender: TObject);
    procedure BT_ModifyClick(Sender: TObject);
    procedure BT_DeleteClick(Sender: TObject);
    procedure BT_AllClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmInfo: TFrmInfo;

implementation

uses UMain;


{$R *.DFM}

procedure TFrmInfo.FormActivate(Sender: TObject);
begin
  OraQuery1.Session := Ora_Session;
  with OraQuery1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add('select empno, cardno, chipno, iolevel ');
       Sql.Add('  from card.tprtcardmst               ');
       Open;
 end;
end;

procedure TFrmInfo.OnMaskEdit_BuhoKeyPress(Sender: TObject; var Key: Char);
var
  v_iolevel : integer;
begin
  if not ( (Key = #13) and (Length(OnMaskEdit_Buho.Text)=4) )  then exit;

  OraQuery1.Session := Ora_Session;
  with OraQuery1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add('select empno, cardno, chipno, iolevel ');
       Sql.Add('  from card.tprtcardmst               ');
       Sql.Add(' where empno =:empno                  ');
       ParamByName('empno').AsString:= OnMaskEdit_Buho.Text;
       Open;

       if   Trim(OraQuery1.FieldByName('iolevel').AsString) = '' then
       begin
            CB_IOLEVEL.Text := ' ';
            Ed_Chipno.Text  := OraQuery1.FieldByName('chipno').AsString;
            Ed_Cardno.Text  := OraQuery1.FieldByName('cardno').AsString;
       end
       else
       begin
            v_iolevel := StrToInt(OraQuery1.FieldByName('iolevel').AsString);

            case v_iolevel of
                01 : CB_IOLEVEL.Text := '01 사원 (일반)';
                02 : CB_IOLEVEL.Text := '02 사원 (전층)';
                03 : CB_IOLEVEL.Text := '03 출입 (일반)';
                04 : CB_IOLEVEL.Text := '04 출입 (전층)';
                05 : CB_IOLEVEL.Text := '05 출입 (단층)';
                06 : CB_IOLEVEL.Text := '06 방문';
            end;
            Ed_Chipno.Text  := OraQuery1.FieldByName('chipno').AsString;
            Ed_Cardno.Text  := OraQuery1.FieldByName('cardno').AsString;
       end;
  end;
end;

procedure TFrmInfo.BT_AllClick(Sender: TObject);
begin
  OraQuery1.Session := Ora_Session;
  with OraQuery1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add('select empno, cardno, chipno, iolevel ');
       Sql.Add('  from card.tprtcardmst               ');
       Open;
  end;
end;

procedure TFrmInfo.DataSource1DataChange(Sender: TObject; Field: TField);
var
  v_iolevel : integer;
begin
  P_Empno.Caption  := OraQuery1.FieldByName('empno').AsString;

  if   Trim(OraQuery1.FieldByName('iolevel').AsString) = '' then
  begin
       CB_IOLEVEL.Text := ' ';
       Ed_Chipno.Text  := OraQuery1.FieldByName('chipno').AsString;
       Ed_Cardno.Text  := OraQuery1.FieldByName('cardno').AsString;
  end
  else
  begin
       v_iolevel := StrToInt(OraQuery1.FieldByName('iolevel').AsString);

       case v_iolevel of
         01 : CB_IOLEVEL.Text := '01 사원 (일반)';
         02 : CB_IOLEVEL.Text := '02 사원 (전층)';
         03 : CB_IOLEVEL.Text := '03 출입 (일반)';
         04 : CB_IOLEVEL.Text := '04 출입 (전층)';
         05 : CB_IOLEVEL.Text := '05 출입 (단층)';
         06 : CB_IOLEVEL.Text := '06 방문';
       end;
       Ed_Chipno.Text  := OraQuery1.FieldByName('chipno').AsString;
       Ed_Cardno.Text  := OraQuery1.FieldByName('cardno').AsString;
  end;
end;

procedure TFrmInfo.BitBtn3Click(Sender: TObject);
begin

end;

//카드번호 엔터시
procedure TFrmInfo.OnMaskEdit_CardNoKeyPress(Sender: TObject; var Key: Char);
var
  v_iolevel : integer;
begin
  if not ( (Key = #13) and (Length(OnMaskEdit_Buho.Text)=4) ) then exit;

  OraQuery1.Session := Ora_Session;
  with OraQuery1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add('select empno, cardno, chipno, iolevel ');
       Sql.Add('  from card.tprtcardmst               ');
       Sql.Add(' where cardno =:cardno                ');
       ParamByName('cardno').AsString:= OnMaskEdit_CardNo.Text;
       Open;

       if   Trim(OraQuery1.FieldByName('iolevel').AsString) = '' then
       begin
            CB_IOLEVEL.Text := ' ';
            Ed_Chipno.Text  := OraQuery1.FieldByName('chipno').AsString;
            Ed_Cardno.Text  := OraQuery1.FieldByName('cardno').AsString;
       end
       else
       begin
            v_iolevel := StrToInt(OraQuery1.FieldByName('iolevel').AsString);

            case v_iolevel of
              01 : CB_IOLEVEL.Text := '01 사원 (일반)';
              02 : CB_IOLEVEL.Text := '02 사원 (전층)';
              03 : CB_IOLEVEL.Text := '03 출입 (일반)';
              04 : CB_IOLEVEL.Text := '04 출입 (전층)';
              05 : CB_IOLEVEL.Text := '05 출입 (단층)';
              06 : CB_IOLEVEL.Text := '06 방문';
            end;
            Ed_Chipno.Text  := OraQuery1.FieldByName('chipno').AsString;
            Ed_Cardno.Text  := OraQuery1.FieldByName('cardno').AsString;
       end;
  end;
end;

procedure TFrmInfo.OnMaskEdit_ChipnoKeyPress(Sender: TObject; var Key: Char);
var
  v_iolevel : integer;
begin
  if not ( (Key = #13) and (Length(OnMaskEdit_Buho.Text)=4) ) then exit;

  OraQuery1.Session := Ora_Session;
  with OraQuery1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add('select empno, cardno, chipno, iolevel ');
       Sql.Add('  from card.tprtcardmst               ');
       Sql.Add(' where Chipno =:Chipno                ');

       ParamByName('Chipno').AsString:= OnMaskEdit_Chipno.Text;
       Open;

       if   Trim(OraQuery1.FieldByName('iolevel').AsString) = '' then
       begin
            CB_IOLEVEL.Text := ' ';
            Ed_Chipno.Text  := OraQuery1.FieldByName('chipno').AsString;
            Ed_Cardno.Text  := OraQuery1.FieldByName('cardno').AsString;
       end
       else
       begin
            v_iolevel := StrToInt(OraQuery1.FieldByName('iolevel').AsString);

            case v_iolevel of
              01 : CB_IOLEVEL.Text := '01 사원 (일반)';
              02 : CB_IOLEVEL.Text := '02 사원 (전층)';
              03 : CB_IOLEVEL.Text := '03 출입 (일반)';
              04 : CB_IOLEVEL.Text := '04 출입 (전층)';
              05 : CB_IOLEVEL.Text := '05 출입 (단층)';
              06 : CB_IOLEVEL.Text := '06 방문';
            end;
            Ed_Chipno.Text  := OraQuery1.FieldByName('chipno').AsString;
            Ed_Cardno.Text  := OraQuery1.FieldByName('cardno').AsString;
       end;
  end;
end;

// 수정버튼 클릭시
procedure TFrmInfo.BT_ModifyClick(Sender: TObject);
var
  v_iolevel      : integer;
  v_iolevel_copy : string;
  v_Ucardno       : string;
begin
  if MessageDlg('변경된 정보를 출입시스템에 전송 하시겠습니까?', mtInformation, [mbYes, mbNo], 0) <> mrYes then exit;

  v_Ucardno := DBGrid1.Fields[1].AsString;

  OraQuery1.Session := Ora_Session;
  with OraQuery1 do
  begin
       v_iolevel_copy := Copy(CB_IOLEVEL.Text,1,2);
       Close;
       SQL.Clear;
       Sql.Add(' UPDATE card.tprtcardmst                  ');
       Sql.Add('    SET iolevel = '''+v_iolevel_copy+''' ,');
       Sql.Add('        cardno  = '''+Ed_Cardno.Text+''' ,');
       Sql.Add('        chipno  = '''+Ed_Chipno.Text+'''  ');
       Sql.Add('  WHERE empno   = '''+OnMaskEdit_Buho.Text+'''');
       ExecSQL;
  end;

  with OraQuery1 do  //발급이력 카드 번호 수정
  begin
       Close;
       SQL.Clear;
       Sql.Add(' UPDATE card.tprtcard                        ');
       Sql.Add('    SET cardno = '''+Ed_Cardno.Text+'''      ');
       Sql.Add('  WHERE empno  = '''+OnMaskEdit_Buho.Text+'''');
       Sql.Add('    and cardno = '''+v_Ucardno+'''           ');
       ExecSQL;
  end;

   with OraQuery1 do
   begin
        Close;
        SQL.Clear;
        Sql.Add('select empno, cardno, chipno, iolevel ');
        Sql.Add('  from card.tprtcardmst               ');
        Sql.Add(' where empno =:empno                  ');

        ParamByName('empno').AsString:= OnMaskEdit_Buho.Text;
        Open;

        if   Trim(OraQuery1.FieldByName('iolevel').AsString) = '' then
        begin
             CB_IOLEVEL.Text := ' ';
             Ed_Chipno.Text  := FieldByName('chipno').AsString;
             Ed_Cardno.Text  := FieldByName('cardno').AsString;
        end
        else
        begin
             v_iolevel := StrToInt(FieldByName('iolevel').AsString);

             case v_iolevel of
                 01 : CB_IOLEVEL.Text := '01 사원 (일반)';
                 02 : CB_IOLEVEL.Text := '02 사원 (전층)';
                 03 : CB_IOLEVEL.Text := '03 출입 (일반)';
                 04 : CB_IOLEVEL.Text := '04 출입 (전층)';
                 05 : CB_IOLEVEL.Text := '05 출입 (단층)';
                 06 : CB_IOLEVEL.Text := '06 방문';
             end;
             Ed_Chipno.Text  := OraQuery1.FieldByName('chipno').AsString;
             Ed_Cardno.Text  := OraQuery1.FieldByName('cardno').AsString;
        end;
   end;
end;

procedure TFrmInfo.BT_DeleteClick(Sender: TObject);
begin
  if MessageDlg('삭제 작업을 진행하시겠습니까?', mtInformation, [mbYes, mbNo], 0) <> mrYes then exit;
  
  OraQuery1.Session := Ora_Session;
  with OraQuery1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add('DELETE card.tprtcardmst                    ');
       Sql.Add(' WHERE empno = '''+OnMaskEdit_Buho.Text+'''');
       ExecSQL;
  end;
end;

procedure TFrmInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmInfo.BT_CloseClick(Sender: TObject);
begin
  Close;
end;





end.
