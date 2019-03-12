unit psc20403;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, OleCtrls, DB, DBTables, Menus,
  Teengine, DbChart, Series, Chart, Spin, Clipbrd, TeeProcs, DBClient,
  Grids, DBGrids;

type
  TChartForm = class(TForm)
    P_RecCnt: TPanel;
    BB_PointSeries: TBitBtn;
    BB_BarSeries: TBitBtn;
    BB_LineSeries: TBitBtn;
    BB_AreaSeries: TBitBtn;
    MainMenu1: TMainMenu;
    N_mainmenu: TMenuItem;
    N4: TMenuItem;
    N_close: TMenuItem;
    N_save: TMenuItem;
    N_print: TMenuItem;
    SaveDialog: TSaveDialog;
    BB_Previous: TBitBtn;
    BB_Next: TBitBtn;
    BB_FirstPage: TBitBtn;
    BB_LastPage: TBitBtn;
    SE_PageSpin: TSpinEdit;
    SE_points: TSpinEdit;
    OpenDialog: TOpenDialog;
    DBChart: TDBChart;
    BarSeries: TBarSeries;
    PointSeries: TPointSeries;
    AreaSeries: TAreaSeries;
    LineSeries: TLineSeries;
    DBG_pswdbas: TDBGrid;
    DS_pswdbas_d: TDataSource;
    Query_pswdbas_d: TQuery;
    Query_pswdbas_dAPPDATEMASK: TStringField;
    Query_pswdbas_dAPPAMT: TFloatField;
    Query_pswdbas: TQuery;
    Query_pswdbasAPPDATEMASK: TStringField;
    Query_pswdbasAPPAMT: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure N_closeClick(Sender: TObject);
    procedure BB_AllGraphClick(Sender: TObject);
    procedure N_saveClick(Sender: TObject);
    procedure N_printClick(Sender: TObject);
    procedure BB_PreviousClick(Sender: TObject);
    procedure BB_NextClick(Sender: TObject);
    procedure BB_FirstPageClick(Sender: TObject);
    procedure BB_LastPageClick(Sender: TObject);
    procedure SE_PageSpinChange(Sender: TObject);
    procedure SE_pointsChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBChartClick(Sender: TObject);
    procedure DBChartEnter(Sender: TObject);
    procedure DBChartExit(Sender: TObject);
  private
    { Private declarations }
    Cur_Graph: Integer;             // 현재 Series index
    SomeChartSeries: TChartSeries;  // 현재 Series instance
  public
    { Public declarations }
    procedure Update_Graph;
  end;

var
  ChartForm: TChartForm;
  On_DBChart: Boolean;

implementation
{$R *.DFM}

uses
  psc20401;

procedure TChartForm.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages;
  Cur_Graph := 4;  // 현재 그래프
  Update_Graph;
  SE_PageSpin.Value := DBChart.NumPages;  // 현재 페이지(default: 마지막}
  BB_LastPage.SetFocus;
  On_DBChart := False;  // focus가 On_DBChart에 있으면 TRUE
end;

//------------------------- 사용자 함수 -------------------------------
procedure TChartForm.Update_Graph;
var
  i: Integer;
begin
  if DBChart.SeriesCount > 0 then
    for i := 0 to DBChart.SeriesCount - 1 do
      DBChart.Series[i].Active := False;

  case Cur_Graph of
    1:
      begin
        BarSeries.Active := True;
        SomeChartSeries := BarSeries;
      end;
    2:
      begin
        PointSeries.Active := True;
        SomeChartSeries := PointSeries;
      end;
    3:
      begin
        AreaSeries.Active := True;
        SomeChartSeries := AreaSeries;
      end;
    4:
      begin
        LineSeries.Active := True;
        SomeChartSeries := LineSeries;
      end;
  end;
  DBChart.MaxPointsPerPage := SE_points.Value; // 한 페이지당 막대기 갯수
  Application.ProcessMessages;
  SE_PageSpin.Hint := '총 '+IntToStr(DBChart.NumPages)+' 페이지중 현재 '+IntToStr(DBChart.Page)+' 페이지';
end;

//------------------------ 메뉴 ---------------------------------------
procedure TChartForm.N_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TChartForm.N_saveClick(Sender: TObject);
var
  i: Integer;
begin
  if SaveDialog.Execute then
  begin
    i := Pos('.', SaveDialog.FileName);
    if UpperCase(copy(SaveDialog.FileName,i+1,3)) = 'BMP' then
    begin
      with TBitmap.Create do
      try
        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;
        Width  := DBChart.Width;
        Height := DBChart.Height;
        DBChart.Draw(Canvas, Rect(0, 0, Width, Height));
        SaveToFile(SaveDialog.FileName);
//        MessageBeep(-1);
      finally
        Screen.Cursor := crDefault;
        Free;
      end;
    end
    else if UpperCase(copy(SaveDialog.FileName,i+1,3)) = 'WMF' then
    begin
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      DBChart.SaveToMetafile(SaveDialog.FileName);
      Screen.Cursor := crDefault;
//      MessageBeep(-1);
    end;
  end;
end;

procedure TChartForm.N_printClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  DBChart.PrintLandscape;
  Screen.Cursor := crDefault;
//  MessageBeep(-1);
end;

//-------------------------- Button Click -------------------------------
procedure TChartForm.BB_AllGraphClick(Sender: TObject);
begin
  Cur_Graph := TBitBtn(Sender).Tag;
  Update_Graph;
end;

procedure TChartForm.BB_PreviousClick(Sender: TObject);
begin
  if SE_PageSpin.Value > 1 then
    SE_PageSpin.Value := SE_PageSpin.Value - 1;
end;

procedure TChartForm.BB_NextClick(Sender: TObject);
begin
  if SE_PageSpin.Value < DBChart.NumPages then
    SE_PageSpin.Value := SE_PageSpin.Value + 1;
end;

procedure TChartForm.BB_FirstPageClick(Sender: TObject);
begin
  SE_PageSpin.Value := 1;
end;

procedure TChartForm.BB_LastPageClick(Sender: TObject);
begin
  SE_PageSpin.Value := DBChart.NumPages;
end;

procedure TChartForm.SE_PageSpinChange(Sender: TObject);
begin
  if SE_PageSpin.Value <= 0 then
    System.Exit;
  if SE_PageSpin.Value > DBChart.NumPages then
    SE_PageSpin.Value := DBChart.NumPages;
  DBChart.Page := SE_PageSpin.Value;
  Application.ProcessMessages;
  SE_PageSpin.Hint := '총 '+IntToStr(DBChart.NumPages)+' 페이지중 현재 '+IntToStr(DBChart.Page)+' 페이지';
end;

procedure TChartForm.SE_pointsChange(Sender: TObject);
begin
  if SE_points.Value <= 0 then
    System.Exit;
  DBChart.MaxPointsPerPage := SE_points.Value;
  Application.ProcessMessages;
  SE_PageSpin.Hint := '총 '+IntToStr(DBChart.NumPages)+' 페이지중 현재 '+IntToStr(DBChart.Page)+' 페이지';
end;

//-------------------------- 기능 -------------------------------
// Ketboard Scrolling
procedure TChartForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  XDelta, YDelta, XRange,YRange: Double;
begin
  if DBChart.SeriesCount = 0 then
    System.Exit;
  if On_DBChart = False then  // DBChart에 의한 키 입력이 아니면 무시
    System.Exit;

  { initialize some temporary variables... }
  XDelta := 0;
  YDelta := 0;
  with (SomeChartSeries as TChartSeries).GetHorizAxis do
    XRange := Maximum - Minimum;
  with (SomeChartSeries as TChartSeries).GetVertAxis  do
    YRange := Maximum - Minimum;
  { handle keyboard !!! }
  case key of
    VK_LEFT  : XDelta := -XRange/100;
    VK_RIGHT : XDelta :=  XRange/100;
    VK_UP    : YDelta :=  YRange/100;
    VK_DOWN  : YDelta := -YRange/100;
    vk_Next  : YDelta :=  YRange/10;
    vk_Prior : YDelta := -YRange/10;
    VK_SPACE : DBChart.UndoZoom;
  end;
  XDelta := -XDelta;
  YDelta := -YDelta;

  with DBChart do
  Begin
    LeftAxis.Scroll(YDelta,   False);
    RightAxis.Scroll(YDelta,  False);
    BottomAxis.Scroll(XDelta, False);
    TopAxis.Scroll(XDelta,    False);
  end;
end;

procedure TChartForm.DBChartClick(Sender: TObject);
begin
  DBChart.SetFocus;
  On_DBChart := True;
end;

procedure TChartForm.DBChartEnter(Sender: TObject);
begin
  On_DBChart := True;
end;

procedure TChartForm.DBChartExit(Sender: TObject);
begin
  On_DBChart := False;
end;

end.
