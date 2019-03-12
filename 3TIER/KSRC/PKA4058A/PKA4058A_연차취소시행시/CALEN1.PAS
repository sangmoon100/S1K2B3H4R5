unit Calen1;
interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, ExtCtrls, StdCtrls, Tabs, jshape, datelib, Registry;

type
  Tcalendar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    d1: TPanel;
    d2: TPanel;
    d3: TPanel;
    d4: TPanel;
    d5: TPanel;
    d6: TPanel;
    d7: TPanel;
    d8: TPanel;
    d9: TPanel;
    d10: TPanel;
    d11: TPanel;
    d12: TPanel;
    d13: TPanel;
    d14: TPanel;
    d15: TPanel;
    d16: TPanel;
    d17: TPanel;
    d18: TPanel;
    d19: TPanel;
    d20: TPanel;
    d21: TPanel;
    d22: TPanel;
    d23: TPanel;
    d24: TPanel;
    d25: TPanel;
    d26: TPanel;
    d28: TPanel;
    d34: TPanel;
    d32: TPanel;
    d33: TPanel;
    d29: TPanel;
    d30: TPanel;
    d31: TPanel;
    d27: TPanel;
    d35: TPanel;
    d36: TPanel;
    d37: TPanel;
    d38: TPanel;
    d39: TPanel;
    d40: TPanel;
    d41: TPanel;
    d42: TPanel;
    mainPan: TPanel;
    Image1: TImage;
    ok: JeonShape;
    cancel: JeonShape;
    dec10: JeonShape;
    add10: JeonShape;
    YearDec: JeonShape;
    YearAdd: JeonShape;
    Tab1: JeonShape;
    Tab2: JeonShape;
    Tab3: JeonShape;
    Tab4: JeonShape;
    Tab5: JeonShape;
    Tab6: JeonShape;
    Tab7: JeonShape;
    Tab8: JeonShape;
    Tab9: JeonShape;
    Tab10: JeonShape;
    Tab11: JeonShape;
    Tab12: JeonShape;
    monLabel: TPanel;
    CalFile: TOpenDialog;
    CalLoad: JeonShape;
    procedure FormActivate(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure TabMonthClick(Sender: TObject);
    procedure d1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure yearDecClick(Sender: TObject);
    procedure yearAddClick(Sender: TObject);
    procedure d1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure okClick(Sender: TObject);
    procedure CalLoadClick(Sender: TObject);
  private
   { Private declarations }
    helpDay  : THintWindow;
    present  : TDateTime;
    CalHome  : string;
    Year,Month,Day      : word;
    SelCol,SelRow,Gubun : integer;
    TabMonth : JeonShape;
    monArr   : array[1..6,1..7] of TPanel;
    cur_year : word;

    procedure FillDate(present : TDateTime);
    procedure FillFont;
    procedure DataSearch(tmonth : string);
    procedure CalLoading;
  public
    DayCaption : String[8];
    { Public declarations }
  end;

var
  calendar       : Tcalendar;
const
   DayInMonth : array[1..12]  of integer = (31,28,31,30,31,30,31,31,30,31,30,31);
   Holiday    : array[1..9]   of string  = ('0101','0301','0505',
                                            '0517','0606','0815',
                                            '1003','1009','1225');
//dsa2000  2013.09. 삭제
{   Holiday1   : array[1..7]   of string  = ('0419','0501','0508','0515','0625','0923','1001',); }

   HoliScr    : array[1..9]   of string =  ('신정','삼일절','어린이날',
                                            '석가탄신일','현충일','광복절',
                                            '개천절','한글날','성탄절');
//dsa2000  2013.09. 삭제
{   HoliScr1   : array[1..7]   of string =  ('4.19혁명기념일','근로자의날','어버이날',
                                            '스승의날','6.25사변일','창립기념일','국군의날');}

implementation
{$R *.DFM}

// 날짜를 달력폼에 뿌린다.......................................................
procedure TCalendar.FillDate(present : TDateTime);
var
   mon : string;
   firstDate : TDateTime;
   StartCol,i,dayCtr,sc,sr,r,LastDay,h : integer;
   flag   : Boolean;
begin
   sc := 0; sr := 0;
   firstdate := encodeDate(Year,Month,1);
   StartCol  := DayOfWeek(firstDate);
   Lastday   := DayInMonth[Month];

   if (Year Mod 4 = 0) and ((Year Mod 100 <> 0) or (Year Mod 400 = 0)) then
   begin
        if (Month = 2) and (LastDay = 29) then
            Lastday := DayInMonth[Month];
        if (Month = 2) and (LastDay = 28) then
            LastDay := 29;
   end
   else Lastday := DayInMonth[Month];

   monLabel.Caption := intTostr(Year)+' 년 '+intTostr(Month)+' 월';
   dayCtr := 1;

   for i := StartCol to 7 do
   begin
        if i <> 1 then
            if i <> 7 then
                MonArr[1,i].Font.Color := clBlack;

        MonArr[1,i].Caption := intTostr(dayCtr);
  {..................................................................}
        for h := 1 to 9 do
        begin
             if (FormatFloat('00',Month)+FormatFloat('00',dayCtr)) = Holiday[h] then
             begin
                  MonArr[1,i].Font.Color := clRed;
                  MonArr[1,i].Caption    := intTostr(dayCtr);
             end
        end;
  {.....................................................................}
         if dayCtr = Day then
         begin
              sc := i;
              sr := 1;
         end;
         inc(dayCtr);
   end;

   r := 2;   {둘째 열로 이동 }
   i := 1;

   Flag := True;

   while Flag do
   begin
        if Flag then
        begin
             if (i <> 1) then
                 if (i<> 7) then
                     MonArr[r,i].Font.Color := clBlack;

             MonArr[r,i].Caption    := intTostr(dayCtr);
 {..................................................................}
             for h := 1 to 9 do
             begin
                  if (FormatFloat('00',Month)+FormatFloat('00',dayCtr)) = Holiday[h] then
                  begin
                       MonArr[r,i].Font.Color := clRed;
                       MonArr[r,i].Caption    := intTostr(dayCtr);
                  end
             end;
 {.....................................................................}
             if dayCtr = Day then
             begin
                  sc := i;  sr := r;
             end;
             inc(dayCtr);
             flag := dayCtr < (LastDay+1);
             if i = 7 then
             begin
                  i := 1;
                  inc(r);
             end
             else inc(i);
        end;
   end; {while}

  if Day > DayInMonth[month] then
  begin
       sc := i-1; sr := r;
  end;
  SelCol := sc;
  SelRow := sr;
  MonArr[sr,sc].Color     := $00B8E09A;
  MonArr[sr,sc].Font.Size := 12;
end;

// 폼이 액티브 될시 현재날짜를 뿌린다...........................................
procedure Tcalendar.FormActivate(Sender: TObject);
begin
  Gubun := 0;  present := now;
  monArr[1, 1] := d1;  monArr[1, 2] := d2;  monArr[1, 3] := d3;  monArr[1, 4] := d4;
  monArr[1, 5] := d5;  monArr[1, 6] := d6;  monArr[1, 7] := d7;

  monArr[2, 1] := d8;  monArr[2, 2] := d9;  monArr[2, 3] := d10; monArr[2, 4] := d11;
  monArr[2, 5] := d12; monArr[2, 6] := d13; monArr[2, 7] := d14;

  monArr[3, 1] := d15; monArr[3, 2] := d16; monArr[3, 3] := d17; monArr[3, 4] := d18;
  monArr[3, 5] := d19; monArr[3, 6] := d20; monArr[3, 7] := d21;

  monArr[4, 1] := d22; monArr[4, 2] := d23; monArr[4, 3] := d24; monArr[4, 4] := d25;
  monArr[4, 5] := d26; monArr[4, 6] := d27; monArr[4, 7] := d28;

  monArr[5, 1] := d29; monArr[5, 2] := d30; monArr[5, 3] := d31; monArr[5, 4] := d32;
  monArr[5, 5] := d33; monArr[5, 6] := d34; monArr[5, 7] := d35;

  monArr[6, 1] := d36; monArr[6, 2] := d37; monArr[6, 3] := d38; monArr[6, 4] := d39;
  monArr[6, 5] := d40; monArr[6, 6] := d41; monArr[6, 7] := d42;

  CalLoading;
  DecodeDate(present,Year,Month,Day);

  cur_year := year;
  
  // file control part..........
  case Month of
    1 : TabMonthClick(Tab1);
    2 : TabMonthClick(Tab2);
    3 : TabMonthClick(Tab3);
    4 : TabMonthClick(Tab4);
    5 : TabMonthClick(Tab5);
    6 : TabMonthClick(Tab6);
    7 : TabMonthClick(Tab7);
    8 : TabMonthClick(Tab8);
    9 : TabMonthClick(Tab9);
   10 : TabMonthClick(Tab10);
   11 : TabMonthClick(Tab11);
   12 : TabMonthClick(Tab12);
  end;
end;

// 일자를 뿌려진곳의 폰트를 셋팅한다............................................
procedure Tcalendar.FillFont;
var
  i , j : integer;
begin
  for i := 1 to 6 do
    for j := 1 to 7 do begin
        MonArr[i,j].Font.Color := clBlack;
        MonArr[i,j].Caption    := '';
        MonArr[i,j].Hint       := '';
        MonArr[i,j].Color      := clWhite;
        MonArr[i,j].Font.Size  := 10;
        MonArr[i,j].HelpContext := 0;
    end;

  for i := 1 to 6 do begin
     MonArr[i,1].Font.Color := clRed;
     MonArr[i,7].Font.Color := clBlue;
  end;
end;

procedure Tcalendar.TabMonthClick(Sender: TObject);
var
  i,j : integer;
begin
  TabMonth      := JeonShape(Sender);
  TabMonth.Down := True;
  Month         := TabMonth.Tag;
  FillFont;
  Filldate(present);
  DataSearch(FormatFloat('00',Month));  // 데이타를 찾는다.
end;

procedure Tcalendar.d1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   i,j,n : integer;
   serch : integer;
   serch1: integer;
   yStr,pMon,cStr : string;
   Rect  : TRect;
begin
  if (TPanel(Sender).Caption <> '') and
     (Button = mbLeft) then begin
    for i := 1 to 6 do
      for j := 1 to 7 do begin
          if (MonArr[i,j].HelpContext = 0) then MonArr[i,j].Color := clWhite;
          if (MonArr[i,j].HelpContext = 1) then MonArr[i,j].Color := $00D9E4FF;
          MonArr[i,j].Font.Size := 10;
      end;

     TPanel(Sender).Color     := $00B8E09A;
     TPanel(Sender).Font.Size := 12;
     Day := StrToInt(TPanel(Sender).Caption);

  //............................................................................
     serch  := 0;
     serch1 := 0;
     for  i := 1 to 9 do
       if (FormatFloat('00',Month)+
           FormatFloat('00',strtoint(TPanel(Sender).Caption))) = HoliDay[i] then begin
          serch := i; break;
       end;

{     for  i := 1 to 7 do
       if (FormatFloat('00',Month)+
           FormatFloat('00',strtoint(TPanel(Sender).Caption))) = HoliDay1[i] then begin
          serch1 := i; break;
       end; }

     if (serch > 0) or (serch1 > 0) or (TPanel(Sender).Hint <> '') then begin
        helpDay := THintWindow.Create(self);
        helpDay.Canvas.Font.Size := 9;
        helpDay.Canvas.Font.Name := '굴림체';
        helpday.Color  := $00E2E2E2;

        if (serch > 0) and (serch1 = 0) then begin
           yStr := TPanel(Sender).Hint + HoliScr[serch];
           helpDay.Caption := chr(13)+' '+yStr;
        end;
//dsa2000  2013.09. 삭제
{        if (serch = 0) and (serch1 > 0) then begin
           yStr := TPanel(Sender).Hint + HoliScr1[serch1];
           helpDay.Caption := chr(13)+' '+yStr;
        end;}
        if (serch = 0) and (serch1 = 0) and (TPanel(Sender).Hint <> '') then begin
           yStr := TPanel(Sender).Hint;
           helpDay.Caption := chr(13)+' '+yStr;
        end;

        Rect.Top          := (TPanel(Sender).Top  + (MainPan.Top+Top)) - 10;
        Rect.Left         := (TPanel(Sender).Left + (MainPan.Left+Left));
        Rect.Bottom       := (Rect.Top  + 40);
        Rect.Right        := (Rect.Left + helpday.canvas.TextWidth(helpDay.Caption)+10);
        helpDay.ActivateHint(Rect,helpDay.Caption);
        helpDay.parent    := self;
        Gubun := 1;
     end;
  end; //if TPanel(Sender).Caption <> '' then begin
end;

procedure Tcalendar.yearDecClick(Sender: TObject);
var
   i, j: integer;
begin
  if TSpeedButton(Sender).Name = 'dec10' then
     Year := Year - 10
  else Year := Year - 1;

  //2015.01.27.hjku..선택 연도를 현재 년도 기준으로 +/- 1년이보여질 수 있도록 구현(요청서)... 이명노M요청
  if((cur_year-1) > year) then year := cur_year-1;

  FillFont;
  Filldate(present);
  DataSearch(FormatFloat('00',Month));  // 데이타를 찾는다.
end;

procedure Tcalendar.yearAddClick(Sender: TObject);
var
   i, j: integer;
begin
  if TSpeedButton(Sender).Name = 'add10' then
      Year := Year + 10
  else Year := Year + 1;

  //2015.01.27.hjku..선택 연도를 현재 년도 기준으로 +/- 1년이보여질 수 있도록 구현(요청서)... 이명노M요청
  if((cur_year+1) < year) then year := cur_year+1;
      
  FillFont;
  Filldate(present);
  DataSearch(FormatFloat('00',Month));  // 데이타를 찾는다.
end;

procedure Tcalendar.d1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (TPanel(Sender).Caption <> '') and (Gubun <> 0) then helpDay.Free;
  Gubun := 0;
end;

procedure Tcalendar.cancelClick(Sender: TObject);
begin
   close;
end;

procedure Tcalendar.okClick(Sender: TObject);
var
  MM, DD : String;
begin
  MM := FormatFloat('00',Month);
  DD := FormatFloat('00',Day);
  DayCaption := intTostr(Year)+MM+DD;
  Close;
end;

// 달에관한 내용을 찾는다.......................................................
procedure Tcalendar.DataSearch(tmonth : string);
var
  Fcal : system.TextFile;
  i,j  : integer;
  rStr,tdate,fdate,fcontent : string;
begin
  if FileExists(CalHome) = False then system.exit;
  system.AssignFile(Fcal,CalHome); system.ReSet(Fcal);
  while not Eof(Fcal) do begin
     readln(Fcal,rStr);
     fdate    := PasString(rStr,',',1);
     fcontent := PasString(rStr,',',2);
     if copy(fdate,1,2) = tmonth then begin
        for i := 1 to 6 do begin
           for j := 1 to 7 do begin
              if MonArr[i,j].Caption <> '' then begin
                 tdate := FormatFloat('00',StrToInt(MonArr[i,j].Caption));
                 if tdate = copy(fdate,3,2) then begin
                    MonArr[i,j].Hint  := fcontent;
                    MonArr[i,j].Color := $00D9E4FF;
                    MonArr[i,j].HelpContext := 1;
                 end;
              end;
           end;
        end;
     end;
  end;
  system.close(Fcal);
end;

// 행사일이 적혀있는 화일을 읽어온다............................................
procedure Tcalendar.CalLoadClick(Sender: TObject);
var
  CalRoot  : TRegistry;
  OpenBool : Boolean;
begin
  calFile.Execute;
  CalRoot := TRegistry.Create;
  CalRoot.RootKey  := HKEY_LOCAL_MACHINE;
  CalRoot.CreateKey('SOFTWARE\(주) 데이콤\종합인사정보시스템\');
  CalRoot.OpenKey('SOFTWARE\(주) 데이콤\종합인사정보시스템\',OpenBool);
  CalRoot.WriteString('CALENDARDIR',calFile.FileName);
  CalRoot.Destroy;
  CalHome := calFile.FileName;
  FillFont;
  Filldate(present);
  DataSearch(FormatFloat('00',Month));  // 데이타를 찾는다.
end;

procedure Tcalendar.CalLoading;
var
  CalRoot  : TRegistry;
  OpenBool : Boolean;
begin
  CalRoot := TRegistry.Create;
  CalRoot.RootKey  := HKEY_LOCAL_MACHINE;
  CalRoot.OpenKey('SOFTWARE\(주) 데이콤\종합인사정보시스템\',OpenBool);
  CalHome := CalRoot.ReadString('CALENDARDIR');
  CalRoot.Destroy;
end;

end.
