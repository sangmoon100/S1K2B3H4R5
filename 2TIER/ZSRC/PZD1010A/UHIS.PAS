unit UHis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora, Grids, DBGrids, ComCtrls, StdCtrls,
  OnEditStdCtrl, OnEditBaseCtrl, ExtCtrls, Buttons, Func, OnFocusButton;

type
  TFrmHis = class(TForm)
    DBGrid1: TDBGrid;
    OraQuery1: TOraQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    RG_Check: TRadioGroup;
    OnEd_Name: TOnEdit;
    OnEdit_Payra: TOnEdit;
    Panel2: TPanel;
    Chk_CardDate: TCheckBox;
    RadioGroup_OrderBy: TRadioGroup;
    DateTimePicker_Frm: TDateTimePicker;
    DateTimePicker_To: TDateTimePicker;
    Label1: TLabel;
    OnEdit_Sabun: TOnEdit;
    OnEdit_CardNo: TOnEdit;
    BT_OK: TOnFocusButton;
    BT_Close: TOnFocusButton;
    Panel3: TPanel;
    BT_DEL: TOnFocusButton;
    OraQuery2: TOraQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_CloseClick(Sender: TObject);
    procedure BT_OKClick(Sender: TObject);
    procedure Chk_CardDateClick(Sender: TObject);
    procedure Chk_CardDateExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_DELClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHis: TFrmHis;

implementation

uses UMain;

{$R *.DFM}

//검색 버튼

procedure TFrmHis.BT_OKClick(Sender: TObject);
var
  Fyyyy, Fmm, Fdd, Fyyyymmdd : string;
  Tyyyy, Tmm, Tdd, Tyyyymmdd : string;
begin
  OraQuery1.Session := Ora_Session;
  with OraQuery1 do
  begin
       Close;
       SQL.Clear;
       SQL.Add('select empno, korname, cardno, orders, prtdate ');
       SQL.Add('  from card.tprtcard                           ');
       SQL.Add( 'where 1 = 1                                   ');

       if RG_Check.ItemIndex = 0 then // AND
       begin
            if trim(OnEdit_Sabun.Text) <> '' then                        //사번
            begin
                SQL.Add('and empno =:empno ');
                ParamByName('empno').AsString:= OnEdit_Sabun.text;
            end;

            if trim(OnEd_Name.Text) <> '' then                          //이름
            begin
                SQL.Add('and korname =:korname ');
                ParamByName('korname').AsString:= OnEd_Name.Text;
            end;

            if trim(OnEdit_CardNo.Text) <> '' then                      // 카드번호
            begin
                SQL.Add('and CardNo =:CardNo ');
                ParamByName('CardNo').AsString:= OnEdit_CardNo.Text;
            end;

            if trim(OnEdit_Payra.Text) <> ''  then                       //직급
            begin
                SQL.Add('and orders =:orders ');
                ParamByName('orders').AsString:= OnEdit_Payra.Text;
            end;

            if Chk_CardDate.Checked = True then
            begin
                Fyyyy     := copy(DateToStr(DateTimePicker_Frm.date),1,4);
                Fmm       := copy(DateToStr(DateTimePicker_Frm.date),6,2);
                Fdd       := copy(DateToStr(DateTimePicker_Frm.date),9,2);
                Fyyyymmdd := Fyyyy + Fmm + Fdd;

                Tyyyy     := copy(DateToStr(DateTimePicker_To.date),1,4);
                Tmm       := copy(DateToStr(DateTimePicker_To.date),6,2);
                Tdd       := copy(DateToStr(DateTimePicker_To.date),9,2);
                Tyyyymmdd := Tyyyy + Tmm + Tdd;

                SQL.Add('and prtdate BETWEEN :Fyyyymmdd AND :Tyyyymmdd ');
                ParamByName('Fyyyymmdd').AsString := Fyyyymmdd;
                ParamByName('Tyyyymmdd').AsString := Tyyyymmdd;
            end;

            case RadioGroup_OrderBy.ItemIndex of
               0: SQL.Add('order by  empno  , orders');
               1: SQL.Add('order by  korname, orders');
               2: SQL.Add('order by  orders , empno ');
               3: SQL.Add('order by  cardno ');
               4: SQL.Add('order by  prtdate, empno ');
            end;
       end
       else if RG_Check.ItemIndex = 1 then // OR
       begin
            if trim(OnEdit_Sabun.Text) <> '' then                       //사번
            begin
                SQL.Add('and empno =:empno ');
                ParamByName('empno').AsString:= OnEdit_Sabun.text;
            end;

            if trim(OnEd_Name.Text) <> '' then                          //이름
            begin
                SQL.Add('or korname =:korname ');
                ParamByName('korname').AsString:= OnEd_Name.Text;
            end;

            if trim(OnEdit_CardNo.Text) <> '' then                      // 카드번호
            begin
                SQL.Add('or CardNo =:CardNo ');
                ParamByName('CardNo').AsString:= OnEdit_CardNo.Text;
            end;

            if trim(OnEdit_Payra.Text) <> ''  then                       //직급
            begin
                SQL.Add('or orders =:orders ');
                ParamByName('orders').AsString:= OnEdit_PayRa.Text;
            end;

            if Chk_CardDate.Checked = True then
            begin
                Fyyyy     := copy(DateToStr(DateTimePicker_Frm.date),1,4);
                Fmm       := copy(DateToStr(DateTimePicker_Frm.date),6,2);
                Fdd       := copy(DateToStr(DateTimePicker_Frm.date),9,2);
                Fyyyymmdd := Fyyyy + Fmm + Fdd;

                Tyyyy     := copy(DateToStr(DateTimePicker_To.date),1,4);
                Tmm       := copy(DateToStr(DateTimePicker_To.date),6,2);
                Tdd       := copy(DateToStr(DateTimePicker_To.date),9,2);
                Tyyyymmdd := Tyyyy + Tmm + Tdd;

                SQL.Add('or prtdate BETWEEN :Fyyyymmdd AND :Tyyyymmdd ');
                ParamByName('Fyyyymmdd').AsString := Fyyyymmdd;
                ParamByName('Tyyyymmdd').AsString := Tyyyymmdd;
            end;

            case RadioGroup_OrderBy.ItemIndex of
               0: SQL.Add('order by  empno  , orders');
               1: SQL.Add('order by  korname, orders');
               2: SQL.Add('order by  orders , empno ');
               3: SQL.Add('order by  cardno ');
               4: SQL.Add('order by  prtdate, empno ');
            end;
       end;

       Open;
  end;
end;

// 폼 활성화 시
procedure TFrmHis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmHis.BT_CloseClick(Sender: TObject);
begin
  Close;
end;                                      

procedure TFrmHis.Chk_CardDateClick(Sender: TObject);
begin
  BT_OK.SetFocus;
end;

procedure TFrmHis.Chk_CardDateExit(Sender: TObject);
begin
  if Chk_CardDate.Checked = True then
  begin
       DateTimePicker_Frm.Enabled := True;
       DateTimePicker_To.Enabled  := True;
       DateTimePicker_Frm.SetFocus;
  end
  else
  begin
       DateTimePicker_Frm.Enabled := False;
       DateTimePicker_To.Enabled  := False;
  end
end;

procedure TFrmHis.FormShow(Sender: TObject);
begin
  OnEdit_Sabun.SetFocus;

  DateTimePicker_Frm.Date := GetFirstDayofLastMonth(fn_GetDateTime);
  DateTimePicker_To.Date  := GetLastDayofThisMonth(fn_GetDateTime);

  BT_OKClick(Sender);
end;

procedure TFrmHis.BT_DELClick(Sender: TObject);
begin
     if MessageDlg('삭제 작업을 진행하시겠습니까?', mtInformation, [mbYes, mbNo], 0) <> mrYes then exit;

     OraQuery2.Session := Ora_Session;
     with OraQuery2 do
     begin
          Close;
          SQL.Clear;
          Sql.Add('DELETE FROM card.tprtcard                                         ');
          Sql.Add(' WHERE empno = '''+OraQuery1.FieldByName('empno').AsString+'''    ');
          Sql.Add('   AND cardno = '''+OraQuery1.FieldByName('cardno').AsString+'''  ');
          ExecSQL;
     end;

     BT_OKClick(nil);
end;

end.
