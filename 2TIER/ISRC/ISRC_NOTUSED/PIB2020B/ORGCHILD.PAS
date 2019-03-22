unit orgchild;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     ExtCtrls, ComCtrls, DB, DBTables, StdCtrls, Buttons, Mask, FileCtrl,lshape,
     datelib,printers, Menus,iniFiles,JPEG, Grids, DBGrids, MemDS,
  DBAccess, Ora;

// 각레벨들의 프라퍼티들..
type List_data = record
     gubun    : string;   // 조직의 찍히는 순서
     empno    : string;
     paycl    : string;
     orgnum   : string;
     empHint  : string;
     korname  : string;
     deptcode : string;
     extcode  : string;
     boncode  : string;
     deptname : string;
     fdeptname: string;
     level    : string;   // 1,2,3차 현재 조직 부서레벨
     lineyn   : string;   // 2차 레벨에서 선을 그리는지 판단 (부서레벨이 다를경우에 쓰임)
     extgap   : integer;  // 2차 레벨의 세로선을 그릴경우 3차레벨의 갯수를 저장하는 변수
end;

// 3차레벨의 구성 프라퍼티
type List_Level3 = record
     TopTitle   : TPanel;
     SubTitle   : TPanel;
     Data       : List_Data;
     xPos,yPos  : integer;   // 화면상에 찍히는 위치
     x1,y1,x2,y2: integer;   // 출력물에 찍히는 위치
     pflag      : string[4]; // 출력물 페이지 넘김에 쓰이기 위한 변수
end;

// 2차레벨의 구성 프라퍼티
type List_Level2 = record
     TopTitle   : TPanel;
     SubTitle   : TPanel;
     Data       : List_Data;
     SubList    : array [1..100] of List_Level3;
     xPos,yPos,epos: integer;  // 화면상에 찍히는 위치
     x1,y1,x2,y2: integer;     // 출력물에 찍히는 위치
     pflag      : string[4];   // 출력물 페이지 넘김에 쓰이기 위한 변수
end;

// 전체조직의 프라퍼티..
type List_jojik = record
     TopTitle  : TPanel;
     SubTitle  : TPanel;
     xPos,yPos : integer;
     x1,y1,x2,y2 : integer;
     Data      : List_Data;
     SubList   : array [1..100] of List_Level2;
end;

// 임시 텍스트화일 (용도 : 조직의 재구성을 위하여 쓰임)
type Text_Data = record
     gubun     : string[10];
     flag      : string[1];      // '라인','▶ 계속'ㅇ을 구분하기 위해 쓰인변수(값이 1일경우)
     level     : string[1];
     Gap       : string[2];
     deptcode  : string[6];
     deptname  : string[30];
     fdeptname : string[60];
     empno     : string[4];
     paycl     : string[2];
     korname   : string[10+2]; // + 2
     lineyn    : string[1];
     empHint   : string[70];
     lfcr      : array[0..1] of char;
end;

type
  TMDIChild = class(TForm)
    scBox: TScrollBox;
    PopMenu: TPopupMenu;
    personView: TMenuItem;
    porgopen: TMenuItem;
    perview: TPanel;
    perimage: TImage;
    perphoto: TMenuItem;
    N2: TMenuItem;
    p1: TPanel;
    p2: TPanel;
    p5: TPanel;
    p6: TPanel;
    p7: TPanel;
    P4: TPanel;
    p3: TPanel;
    Bprn: TSpeedButton;
    Qphoto: TOraQuery;
    OraQuery1: TOraQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BprnClick(Sender: TObject);
    procedure porgopenClick(Sender: TObject);
    procedure personViewClick(Sender: TObject);
    procedure perphotoClick(Sender: TObject);
  private
    { Private declarations }
    ListView    : List_Jojik;
    Level2_Cnt  : integer;
    deptPanel,empPanel : TPanel;
    Nextcode    : string;   // 상위부서코드명..
    Ndeptcode   : string;   // 원래 부서코드(첫레벨에서만 적용)
    linecnt     : array[1..2] of integer;
    dlevel      : array[1..2] of string[2];
    procedure ColorSet(pData : TPanel; pLevel : string);
    procedure SubColorSet(pData : TPanel; pLevel,lpaycl : string);
    procedure TopCreatePanel(var childPanel : Tpanel; lwidth,lheight,lleft,ltop,level : integer;
                             ldeptcode,lcaption,lhint : string);
    procedure SubCreatePanel(var childPanel : Tpanel; lwidth,lheight,lleft,ltop : integer;
                             lcaption,lhint : string);
    procedure lineCreate(lleft,ltop,x,y,lwidth,lheight : integer);
    procedure Create_Organization;
    procedure Search_Organization;
    procedure Create_File;
    procedure Locate_Organization;
    procedure extcodeDisp(var str : string);
    procedure DrawLevel;
    procedure PerimageLoading;
    procedure TopPanelDblClick(Sender : TObject);
    procedure SubPanelDblClick(Sender : TObject);
    procedure deptMouseDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
  public
    { Public declarations }
    Active_Paint : Boolean;
  end;

var
  jdata : Text_Data;
  j1File : file of Text_Data;
  j2File : file of Text_Data;
  JpegImage : TJpegImage;
  deptLevel : array[1..7] of string[1];

//const
{
  deptLevel : array[1..7] of string[1] = ('4','5','A','B','C','D','E');
  // 4 -> 사장실, 5 -> 부사장실, A-> 부분,B -> 실,단, C -> 본부, D -> 부, E -> 과

  //  30.00   2000.09.29    강기우       조직변경(부문 <--신규)으로인한  전()
  // 4 -> 사장실, 5 ->담당  A->부분  B -> 실,단 C -> 팀 D ->   , E ->
}

//  deptLevel : array[1..7] of string[1] = ('4','A','B','C','D','E','F');

implementation

uses orgMain,perForm,perimage;

{$R *.DFM}

// 상위부서명을 가져온다.........................
procedure TMDIChild.extcodeDisp(var str : string);
begin
  OraQuery1.close;
  OraQuery1.sql.clear;
  OraQuery1.sql.add('select distinct deptname||''  ''||deptabbr deptname from pihorga ');  //2002.01.31 shm pro*c run할때
  OraQuery1.sql.add(Format('where (deptcode = ''%s'' and gubun = ''0'' and orgym = ''%s'')',  //deptabbr 에 deptna3 move
                [str,MainForm.Selym] ));
  OraQuery1.Open;
  str := OraQuery1.FieldByName('deptname').AsString;
  OraQuery1.close;
end;

// 오른쪽 버턴을 누를경우 팝업 메뉴항목이 나온다.-------------------------------
procedure TMDIChild.deptMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (TPanel(Sender).Tag = 0) and (TPanel(Sender).HelpContext = 0) then begin
      if copy(TPanel(Sender).Name,1,2) = 'PA' then begin
         if trim(ListView.Data.extcode) <> '' then
            MainForm.SelDept := ListView.Data.extcode;
         Ndeptcode := ListView.Data.deptcode;
      end else MainForm.SelDept := ListView.Data.deptcode;
      deptPanel := ListView.TopTitle;
  end;

  if (TPanel(Sender).Tag <> 0) and (TPanel(Sender).HelpContext = 0) then begin
      if copy(TPanel(Sender).Name,1,2) = 'PA' then begin
           if trim(ListView.SubList[TPanel(Sender).Tag].Data.extcode) <> '' then
              MainForm.SelDept := ListView.SubList[TPanel(Sender).Tag].Data.extcode;
          Ndeptcode := ListView.SubList[TPanel(Sender).Tag].Data.deptcode;
      end else MainForm.SelDept := ListView.SubList[TPanel(Sender).Tag].Data.deptcode;
      deptPanel := ListView.SubList[TPanel(Sender).Tag].TopTitle;
  end;

  if (TPanel(Sender).Tag <> 0) and (TPanel(Sender).HelpContext <> 0) then begin
      if copy(TPanel(Sender).Name,1,2) = 'PA' then begin
         if trim(ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].Data.extcode) <> '' then
            MainForm.SelDept := ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].Data.extcode;
         Ndeptcode := ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].Data.deptcode;
      end else MainForm.SelDept := ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].Data.deptcode;
      deptPanel := ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].TopTitle;
  end;

  if copy(TPanel(Sender).Name,1,2) = 'PA' then begin
     porgopen.Caption := '←조직열람';
     Nextcode := MainForm.SelDept;
     extcodeDisp(Nextcode);
  end else begin
     porgopen.Caption := '조직열람→';
  end;

  if Button = mbRight then begin
     PopMenu.AutoPopup := False;
     PopMenu.Popup(TWincontrol(Sender).left+left+X,
                   TWincontrol(Sender).top+(top+15)+Y);
  end;
end;

// 조직도에서 부서를 선택하게 만든다.-------------------------------------------
procedure TMDIChild.porgopenClick(Sender: TObject);
begin
  TopPanelDblClick(deptPanel);
end;

// 사원열람을 보여준다..--------------------------------------------------------
procedure TMDIChild.personViewClick(Sender: TObject);
begin
  if copy(deptPanel.Name,1,2) = 'PA' then
     MainForm.SelDept := Ndeptcode;

  PersonForm := TPersonForm.Create(MainForm);
  Try
    PersonForm.Deptname.Caption := deptPanel.Caption;
    PersonForm.ShowModal;
  Finally
    PersonForm.Free;
  End;
end;

// 사진열람을 보여준다..--------------------------------------------------------
procedure TMDIChild.perphotoClick(Sender: TObject);
begin
  if copy(deptPanel.Name,1,2) = 'PA' then
     MainForm.SelDept := Ndeptcode;

  PerImageForm := TPerImageForm.Create(MainForm);
  Try
    PerImageForm.Deptname.Caption := deptPanel.Caption;
    PerImageForm.ShowModal;
  Finally
    PerImageForm.Free;
  End;
end;

// 조직도에서 사원을 더블클릭하면 개인인사 종합열람을 보여준다------------------
procedure TMDIChild.SubPanelDblClick(Sender : TObject);
var
  str : string;
  iniFile : TiniFile;
begin
  iniFile      := TiniFile.Create('c:\insa.ini');
  if (TPanel(Sender).Tag = 0) and (TPanel(Sender).HelpContext = 0) then begin
      if ListView.subTitle.Caption = '' then system.exit;
      str := ListView.Data.empno+','+
             ListView.Data.paycl+','+
             ListView.Data.boncode+','+
             ListView.Data.extcode+','+
             ListView.Data.deptcode+','+
             ListView.Data.level+','+
             ListView.Data.orgnum;
      iniFile.WriteString('insa','사원번호',ListView.Data.empno);
      MainForm.Sel_Empno := ListView.Data.empno;
  end;
  if (TPanel(Sender).Tag <> 0) and (TPanel(Sender).HelpContext = 0) then begin
      if ListView.SubList[TPanel(Sender).Tag].subTitle.Caption = '' then system.exit;
      str := ListView.SubList[TPanel(Sender).Tag].Data.empno+','+
             ListView.SubList[TPanel(Sender).Tag].Data.paycl+','+
             ListView.SubList[TPanel(Sender).Tag].Data.boncode+','+
             ListView.SubList[TPanel(Sender).Tag].Data.extcode+','+
             ListView.SubList[TPanel(Sender).Tag].Data.deptcode+','+
             ListView.SubList[TPanel(Sender).Tag].Data.level+','+
             ListView.SubList[TPanel(Sender).Tag].Data.orgnum;
      iniFile.WriteString('insa','사원번호',
              ListView.SubList[TPanel(Sender).Tag].Data.empno);
      MainForm.Sel_Empno := ListView.SubList[TPanel(Sender).Tag].Data.empno;
  end;
  if (TPanel(Sender).Tag <> 0) and (TPanel(Sender).HelpContext <> 0) then begin
      if ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].subTitle.Caption
         = '▶ 계속' then system.exit;
      str := ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].Data.empno+','+
             ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].Data.paycl+','+
             ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].Data.boncode+','+
             ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].Data.extcode+','+
             ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].Data.deptcode+','+
             ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].Data.level+','+
             ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].Data.orgnum;
      iniFile.WriteString('insa','사원번호',
             ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].Data.empno);
      MainForm.Sel_Empno := ListView.SubList[TPanel(Sender).HelpContext].SubList[TPanel(Sender).Tag].Data.empno;
  end;
  iniFile.Destroy;
  if MainForm.mainOrgym <> MainForm.Selym then begin
     MessageBox(handle,'현조직만 개인열람을 실행할 수 있습니다 !!.','확 인',MB_OK or $0030);
     MainForm.statusBar.panels[0].Text := Hint;  system.exit;
  end;

  if MainForm.empnocheck(str) = False then begin
     MessageBox(handle,'당신은 개인열람을 볼권한이 없습니다 !!.','확 인',MB_OK or $0030);
     MainForm.statusBar.panels[0].Text := Hint;
  end;
end;

// 조직도에서 부서를 더블클릭하면 1레벨로 선택하게 만든다.----------------------
procedure TMDIChild.TopPanelDblClick(Sender : TObject);
begin
   if trim(MainForm.SelDept) = '' then begin
      MessageBox(0,'상위부서가 존재하지 않습니다.','관리자에게 변경요망',MB_OK or $0030);
      system.exit;
   end;
//   if Tpanel(sender).color <> $00A58EE6 then begin
      if Copy(Tpanel(sender).Name,1,2) = 'PA' then
           MainForm.CreateMDIChild('◎ ' + Nextcode)
      else MainForm.CreateMDIChild('◎ ' + Tpanel(Sender).Caption);
//   end;
end;

// 상위 패널을 지정한 위치에 만든다.--------------------------------------------
procedure TMDIChild.TopCreatePanel(var childPanel : Tpanel; lwidth,lheight,lleft,ltop,level : integer;
                                   ldeptcode,lcaption,lhint : string);
begin
  childPanel := Tpanel.Create(scBox);
  childPanel.width   := lwidth;   childPanel.Height  := lheight;
  childPanel.left    := lleft;    childPanel.Top     := ltop;
  childPanel.cursor  := crHand1;
  if level = 1 then childPanel.Name  := 'PA'+ldeptcode;
  if level = 2 then childPanel.Name  := 'PB'+ldeptcode;
  if level = 3 then childPanel.Name  := 'PC'+ldeptcode;
  childPanel.OnDblClick  := TopPanelDblClick;
  childPanel.OnMouseDown := deptMouseDown;
  childPanel.Caption     := lcaption;
  childPanel.Hint        := ' ☞ '+lhint;
end;
// 서브 패널을 지정한 위치에 만든다.--------------------------------------------
procedure TMDIChild.SubCreatePanel(var childPanel : Tpanel; lwidth,lheight,lleft,ltop : integer;
                                   lcaption,lhint : string);
begin
  childPanel := Tpanel.Create(scBox);
  childPanel.width   := lwidth;   childPanel.Height  := lheight;
  childPanel.left    := lleft;    childPanel.Top     := ltop;
  childPanel.Caption := trim(lcaption);
  childPanel.cursor  := crHand1;
  childPanel.Hint    := ' ☞ '+lhint;
  childPanel.OnDblClick  := SubPanelDblClick;
end;
// 라인선을 만든다.-------------------------------------------------------------
procedure TMDIChild.lineCreate(lleft,ltop,x,y,lwidth,lheight : integer);
var
  line : TlineShape;
begin
  line := TlineShape.Create(scBox);
  line.left   := lleft;   line.Top    := ltop;
  line.DXpos  := x;       line.DYpos  := y;
  line.width  := lwidth;  line.height := lheight;
  line.parent := scBox;
end;

//----------------------------폼에 관련된 사항들--------------------------------
procedure TMDIChild.FormCreate(Sender: TObject);
begin
  Windowstate  := wsMaximized;
  Active_Paint := True;
end;

procedure TMDIChild.FormActivate(Sender: TObject);
var
  i: Integer;
begin
  if Active_Paint = True then
  begin
     Active_Paint := False;

//30.00  순서대로 읽어서 넣는다. 중간에 늘어나도 상관없다.///////////////////////
     for i:=1 to 7 do
       deptLevel[i] := ' ';

     with OraQuery1 do
     begin
        Close;
        Sql.clear;
        if MainForm.mainOrgym >= '200504' then
           Sql.Text := 'select distinct substr(deptlevel,1,1) ddd from pycdept where orgnum=''H09'' '
        else
           Sql.Text := 'select distinct substr(deptlevel,1,1) ddd from pycdept where orgnum=''H01'' ';
        open;

        i:=1;
        while not EOF do
        begin
          deptLevel[i] := FieldByName('ddd').AsString;
          Next;
          Inc(i);
        end;
        Close;
     end;
     //--------------------------------------------------------
     // 2005.10.07. 조직개편으로 프로그램 보완 (수정자 : ch.k.j)
     //--------------------------------------------------------
     if MainForm.mainOrgym >= '200510' then
     begin
       p3.Visible := True;
       P4.Caption := '총 괄';
       P3.Caption := '본 부';
       P5.Caption := '실/지사';
       P6.Caption := '팀';
//       P7.Caption := '팀';
     end
     //--------------------------------------------------------
     else
     if    (MainForm.mainOrgym >= '200010')
       and (MainForm.mainOrgym <= '200509')  then  //200010월부로 중간조직 생성
     begin
       p3.Visible := False;
       P4.Caption := '본부';
       P5.Caption := '담당/단';
       P6.Caption := '실단위';
       P7.Caption := '팀단위';
     end
     else
     begin
       p3.Visible := False;
       P4.Caption := '부문';
       P5.Caption := '실단위';
       P6.Caption := '팀단위';
       P7.Caption := '하위부서';
     end;
/////////////////////////////////////////////////////////////////////////////////

     Top := 0; left := 0;
     ScBox.VertScrollBar.Position := 0;
     perView.Visible := False;
     SendMessage(handle,WM_PAINT,0,0);
     SendMessage(scbox.handle,WM_PAINT,0,0);
     Search_Organization;  //조직도 데이타를 찾는다.
     Create_File;
     Create_Organization;
     Locate_Organization;
     DrawLevel;
     PerImageLoading;   //사진 가져오기.
     perView.Visible := True;
  end;

end;

// 대표사진을 읽어온다..--------------------------------------------------------
procedure TMDIChild.PerimageLoading;
var
  stream  : TMemoryStream;
  JPEGImage : TjpegImage;
begin
  Qphoto.close;
  Qphoto.ParamByName('lempno').AsString := ListView.Data.empno;
  Qphoto.Open;

   try
     stream    := TMemoryStream.Create;
     JPEGImage := TJPEGImage.Create;

     perimage.picture.Graphic := nil;

     TblobField(Qphoto.FieldByName('photo')).SaveToStream(stream);
     stream.Position := 0;

     JPEGImage.LoadFromStream(stream);
     if stream.Size <> 0 then
       perimage.picture.Assign(JPEGImage)
     else begin
      if FileExists(HomeDir+'\pic\사람1.bmp') = True then
         perimage.picture.LoadFromFile(HomeDir+'\pic\사람1.bmp');
     end;
     Qphoto.Close;
   finally
     stream.free;
     JPEGImage.Free;
   end;

{
  perimage.picture.Assign(Qphoto.FieldByName('photo'));
  if trim(Qphoto.FieldByName('empno').AsString) = '' then begin
     if FileExists(pChar(HomeDir+'\pic\사람1.bmp')) = True then
        perimage.picture.LoadFromFile(HomeDir+'\pic\사람1.bmp');
  end;
  Qphoto.close;
  }
end;

procedure TMDIChild.FormResize(Sender: TObject);
begin
  if Width < 770 then Width := 770;
end;

procedure TMDIChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//조직도 데이타를 찾는다........................................................
procedure TMDIChild.Search_Organization;
var
  i,j,n,cnt : integer;
  tpayrayn  : string;
begin
  {첫레벨 데이타 할당}
  linecnt[1] := 0;
  linecnt[2] := 0;
  OraQuery1.Close;
  OraQuery1.sql.clear;
//  OraQuery1.sql.add('select * from pihorga ');
  OraQuery1.sql.add('select deptcode,extcode,orgnum,boncode,korname,empno,paycl,adpayrayn,  ');
  OraQuery1.sql.add(' payranm,payclnm,deptlevel,lineyn,deptname||''  ''||deptabbr deptname from pihorga ');
  OraQuery1.sql.add(Format('where (deptcode = ''%s'' and gubun = ''0'' and orgym = ''%s'')',
                [MainForm.SelDept,MainForm.Selym] ));
  OraQuery1.sql.add('order by deptcode,deptlevel,paycl');
  OraQuery1.Open;

  ListView.Data.korname  := OraQuery1.FieldByName('korname').AsString;
  ListView.Data.empno    := OraQuery1.FieldByName('empno').AsString;
  ListView.Data.paycl    := OraQuery1.FieldByName('paycl').AsString;
  ListView.Data.orgnum   := OraQuery1.FieldByName('orgnum').AsString;
  ListView.Data.deptcode := OraQuery1.FieldByName('deptcode').AsString;
  ListView.Data.extcode  := OraQuery1.FieldByName('extcode').AsString;
  ListView.Data.boncode  := OraQuery1.FieldByName('boncode').AsString;
  cnt := PasCount(OraQuery1.FieldByName('deptname').AsString,' ');
  ListView.Data.deptname := PasString(OraQuery1.FieldByName('deptname').AsString,' ',cnt);
  ListView.Data.fdeptname:= OraQuery1.FieldByName('deptname').AsString;
  ListView.Data.level    := copy(OraQuery1.FieldByName('deptlevel').AsString,1,1);
  tpayrayn := '';
  if OraQuery1.FieldByName('adpayrayn').AsString ='Y' then tpayrayn := '[겸직] ';
  ListView.Data.empHint  := tpayrayn+trim(ListView.Data.deptname)+'/'+
                            trim(OraQuery1.FieldByName('payranm').AsString)+'/'+
                            trim(OraQuery1.FieldByName('korname').AsString)+'/'+
                            trim(OraQuery1.FieldByName('payclnm').AsString)+'/'+
                            trim(OraQuery1.FieldByName('empno').AsString);
  ListView.Data.extGap   := 0;

  // 둘째레벨 데이타 할당
  OraQuery1.Close;   OraQuery1.sql.clear;
  OraQuery1.sql.add('select deptcode,extcode,orgnum,boncode,korname,empno,paycl,adpayrayn,  ');
  OraQuery1.sql.add(' payranm,payclnm,deptlevel,lineyn,deptname||''  ''||deptabbr deptname from pihorga ');
  OraQuery1.sql.add(Format('where (extcode = ''%s'' and gubun = ''0'' and orgym = ''%s'')',
                [ListView.Data.deptcode,MainForm.Selym] ));
  // 추가
  OraQuery1.sql.add('and deptcode in(select deptcode from pycdept where closedate is null and orgnum in(select max(orgnum) from pycdept))');
  OraQuery1.sql.add('order by lineyn desc,deptcode,deptlevel,paycl');
  OraQuery1.Open;
  Level2_Cnt := OraQuery1.RecordCount;
  if Level2_Cnt > 0 then begin
     for i := 1 to Level2_Cnt do begin
         if i > 100 then begin Level2_Cnt := i; Break; end;
         ListView.SubList[i].Data.deptcode := OraQuery1.FieldByName('deptcode').AsString;
         ListView.SubList[i].Data.extcode  := OraQuery1.FieldByName('extcode').AsString;
         ListView.SubList[i].Data.orgnum   := OraQuery1.FieldByName('orgnum').AsString;
         ListView.SubList[i].Data.boncode  := OraQuery1.FieldByName('boncode').AsString;
         ListView.SubList[i].Data.korname  := OraQuery1.FieldByName('korname').AsString;
         ListView.SubList[i].Data.empno    := OraQuery1.FieldByName('empno').AsString;
         ListView.SubList[i].Data.paycl    := OraQuery1.FieldByName('paycl').AsString;
         cnt := PasCount(OraQuery1.FieldByName('deptname').AsString,' ');
         ListView.SubList[i].Data.deptname := PasString(OraQuery1.FieldByName('deptname').AsString,' ',cnt);
         tpayrayn := '';
         if OraQuery1.FieldByName('adpayrayn').AsString ='Y' then tpayrayn := '[겸직] ';
         ListView.SubList[i].Data.empHint  := tpayrayn+trim(ListView.SubList[i].Data.deptname)+'/'+
                                              trim(OraQuery1.FieldByName('payranm').AsString)+'/'+
                                              trim(OraQuery1.FieldByName('korname').AsString)+'/'+
                                              trim(OraQuery1.FieldByName('payclnm').AsString)+'/'+
                                              trim(OraQuery1.FieldByName('empno').AsString);

         ListView.SubList[i].Data.fdeptname:= OraQuery1.FieldByName('deptname').AsString;
         ListView.SubList[i].Data.level    := copy(OraQuery1.FieldByName('deptlevel').AsString,1,1);
         ListView.SubList[i].Data.extGap   := 0;
         ListView.SubList[i].Data.lineyn   := OraQuery1.FieldByName('lineyn').AsString;
         if OraQuery1.FieldByName('lineyn').AsString = 'N' then
            inc(linecnt[1]); // 특별부서 갯수 카운트(2차레벨)
         OraQuery1.Next;
     end;
  end;

  // 셋째레벨 데이타 할당
  for i := 1 to Level2_Cnt do
  begin
      OraQuery1.Close;
      OraQuery1.sql.clear;
//      OraQuery1.sql.add('select * from pihorga ');
      OraQuery1.sql.add('select deptcode,extcode,orgnum,boncode,korname,empno,paycl,adpayrayn,  ');
      OraQuery1.sql.add(' payranm,payclnm,deptlevel,lineyn,deptname||''  ''||deptabbr deptname from pihorga ');
      OraQuery1.sql.add(Format('where (extcode = ''%s'' and gubun = ''0'' and orgym = ''%s'')',
                    [ListView.SubList[i].Data.deptcode,MainForm.Selym] ));
      //추가 쿼리 다시 손봐야 함.
      OraQuery1.sql.add('and deptcode in(select deptcode from pycdept where closedate is null and orgnum in(select max(orgnum) from pycdept))');
      OraQuery1.sql.add('order by lineyn desc,deptcode,deptlevel,paycl');
      OraQuery1.Open;
      // 2차 레벨에서 부서간의 간격을 알기위해서 3차레벨에서 2차 레벨의 해당
      // 하위 부서의 수를 갭으로 판단하여 드로우 할경우 간격을 띄기 위해서 사용한다.
      // 이경우는 2차레벨을 구성할 때만 필요하지만 나중에 4차레벨을 구성할 경우
      // 2,3 차레벨에 모두 적용되어진다.
      if OraQuery1.RecordCount > 0 then begin
         ListView.SubList[i].Data.extGap   := OraQuery1.RecordCount;
      end else begin
         ListView.SubList[i].Data.extGap   := 0;
      end;

      if ListView.SubList[i].Data.extGap > 0 then begin
         for j := 1 to ListView.SubList[i].Data.extGap do begin
             if j > 100 then
             begin
               ListView.SubList[i].Data.extGap := j;
               Break;
             end;
             ListView.SubList[i].SubList[j].Data.deptcode := OraQuery1.FieldByName('deptcode').AsString;
             ListView.SubList[i].SubList[j].Data.extcode  := OraQuery1.FieldByName('extcode').AsString;
             ListView.SubList[i].SubList[j].Data.orgnum   := OraQuery1.FieldByName('orgnum').AsString;
             ListView.SubList[i].SubList[j].Data.boncode  := OraQuery1.FieldByName('boncode').AsString;
             ListView.SubList[i].SubList[j].Data.korname  := OraQuery1.FieldByName('korname').AsString;
             ListView.SubList[i].SubList[j].Data.empno    := OraQuery1.FieldByName('empno').AsString;
             ListView.SubList[i].SubList[j].Data.paycl    := OraQuery1.FieldByName('paycl').AsString;
             cnt := PasCount(OraQuery1.FieldByName('deptname').AsString,' ');
             ListView.SubList[i].SubList[j].Data.deptname := PasString(OraQuery1.FieldByName('deptname').AsString,' ',cnt);
             tpayrayn := '';
             if OraQuery1.FieldByName('adpayrayn').AsString ='Y' then tpayrayn := '[겸직] ';
             ListView.SubList[i].SubList[j].Data.empHint  := tpayrayn+trim(ListView.SubList[i].SubList[j].Data.deptname)+'/'+
                                                             trim(OraQuery1.FieldByName('payranm').AsString)+'/'+
                                                             trim(OraQuery1.FieldByName('korname').AsString)+'/'+
                                                             trim(OraQuery1.FieldByName('payclnm').AsString)+'/'+
                                                             trim(OraQuery1.FieldByName('empno').AsString);
             ListView.SubList[i].SubList[j].Data.fdeptname:= OraQuery1.FieldByName('deptname').AsString;
             ListView.SubList[i].SubList[j].Data.level    := copy(OraQuery1.FieldByName('deptlevel').AsString,1,1);
             ListView.SubList[i].SubList[j].Data.lineyn   := OraQuery1.FieldByName('lineyn').AsString;
             if OraQuery1.FieldByName('lineyn').AsString = 'N' then
                inc(linecnt[2]); // 특별부서 갯수 카운트(3차레벨) 이럴경우는 없다고 판단됨
                                 // 하지만 4차 레벨을 할 경우 필요함.
             OraQuery1.Next;
        end;
     end;
  end;
  OraQuery1.Close;
end;

// 트리를 구성할 수 있는 화일을 생성한다..--------------------------------------
//
procedure TMDIChild.Create_File;
var
  i,j,n : integer;
begin
  for n := 1 to 7 do
      if ListView.Data.level = deptLevel[n] then break;
  if n <= 6 then dlevel[1] := deptLevel[n+1];
  if n <= 5 then dlevel[2] := deptLevel[n+2];
  AssignFile(j1File,'c:\jojick1.tmp');
  System.ReWrite(j1File);
  AssignFile(j2File,'c:\jojick2.tmp');
  System.ReWrite(j2File);

  // 2,3차레벨을 거친다..
  for i := 1 to Level2_Cnt do
  begin
      jData.gubun    := inttostr(i);
      jData.level    := ListView.SubList[i].Data.level;
      jData.gap      := inttostr(ListView.SubList[i].Data.extgap);
      jData.deptcode := ListView.SubList[i].Data.deptcode;
      jData.deptname := ListView.SubList[i].Data.deptname;
      jData.fdeptname:= ListView.SubList[i].Data.fdeptname;
      jData.empno    := ListView.SubList[i].Data.empno;
      jData.empHint  := ListView.SubList[i].Data.empHint;
      jData.korname  := ListView.SubList[i].Data.korname;
      jData.paycl    := ListView.SubList[i].Data.paycl;
      jData.lineyn   := ListView.SubList[i].Data.lineyn;
      jData.lfcr[0]  := #10;
      jData.lfcr[1]  := #13;
      if jData.level <> dlevel[1] then
      begin
         if jData.level <> dlevel[2] then
           jdata.flag := '1'
         else
           jdata.flag := '0';
         jData.gap := '1';  // 갭을 1을 넣는다..
         system.Write(j2File,jData);
      end;
      if jData.level <> dlevel[1] then jData.flag := '1' else jData.flag := '0';
      system.Write(j1File,jData);

      if jdata.flag = '0' then begin
      for j := 1 to ListView.SubList[i].Data.extGap do begin
             jData.gubun    := inttostr(i);
             jData.level    := ListView.SubList[i].SubList[j].Data.level;
             jData.gap      := inttostr(ListView.SubList[i].SubList[j].Data.extgap);
             jData.deptcode := ListView.SubList[i].SubList[j].Data.deptcode;
             jData.deptname := ListView.SubList[i].SubList[j].Data.deptname;
             jData.fdeptname:= ListView.SubList[i].SubList[j].Data.fdeptname;
             jData.empno    := ListView.SubList[i].SubList[j].Data.empno;
             jData.empHint  := ListView.SubList[i].SubList[j].Data.empHint;
             jData.korname  := ListView.SubList[i].SubList[j].Data.korname;
             jData.paycl    := ListView.SubList[i].SubList[j].Data.paycl;
             jData.lineyn   := ListView.SubList[i].SubList[j].Data.lineyn;
             jData.lfcr[0]  := #10; jData.lfcr[1]  := #13;
             if jData.level <> dlevel[2] then  jData.flag := '1'
             else jData.flag := '0';
             system.Write(j2File,jData);
      end;
      end; // if jdata.flag = '0' then begin
      jdata.flag := '0';
  end;
  system.close(j1File);
  system.close(j2File);
  // 조직도 화일을 오픈해서 재구성한다..
  AssignFile(j1File,'c:\jojick1.tmp');  system.ReSet(j1File);
  Level2_Cnt := FileSize(j1File);
  for i := 1 to Level2_Cnt do begin
      read(j1File,jdata);
      ListView.SubList[i].Data.extGap   := strtoint(jdata.gap);
      ListView.SubList[i].Data.gubun    := jdata.gubun;
      ListView.SubList[i].Data.deptcode := jdata.deptcode;
      ListView.SubList[i].Data.deptname := jdata.deptname;
      ListView.SubList[i].Data.empno    := jdata.empno;
      ListView.SubList[i].Data.empHint  := jdata.empHint;
      ListView.SubList[i].Data.lineyn   := jdata.lineyn;
      if jdata.flag = '0' then
           ListView.SubList[i].Data.korname := jdata.korname
      else ListView.SubList[i].Data.korname := '라인';
      ListView.SubList[i].Data.fdeptname:= jdata.fdeptname;
      ListView.SubList[i].Data.paycl    := jdata.paycl;
      ListView.SubList[i].Data.level    := jdata.level;
  end;

  AssignFile(j2File,'c:\jojick2.tmp');  system.ReSet(j2File);
  for i := 1 to Level2_Cnt do begin
      Seek(j2File,0); n := 1;
      for j := 1 to FileSize(j2File) do begin
      read(j2File,jdata);
      if ListView.SubList[i].Data.gubun = jdata.gubun then begin
         ListView.SubList[i].SubList[n].Data.deptcode := jdata.deptcode;
         ListView.SubList[i].SubList[n].Data.empno    := jdata.empno;
         ListView.SubList[i].SubList[n].Data.empHint  := jdata.empHint;
         ListView.SubList[i].SubList[n].Data.deptname := jdata.deptname;
         ListView.SubList[i].SubList[n].Data.lineyn   := jdata.lineyn;
         if jdata.flag = '0' then
            ListView.SubList[i].SubList[n].Data.korname := jdata.korname
         else ListView.SubList[i].SubList[n].Data.korname := '▶ 계속';
         ListView.SubList[i].SubList[n].Data.fdeptname:= jdata.fdeptname;
         ListView.SubList[i].SubList[n].Data.paycl    := jdata.paycl;
         ListView.SubList[i].SubList[n].Data.level    := jdata.level;
         inc(n);
      end;
      end;
  end;
  system.close(j1File);
  system.close(j2File);
end;

// 조직을 구성한다..------------------------------------------------------------
procedure TMDIChild.Create_Organization;
var
  i,j,n    : integer;
begin
 with ListView do begin
      {1차 레벨 생성}
      TopCreatePanel(Toptitle,150,25,10,20,1,Data.deptCode,Data.deptname,Data.fdeptname);
      ColorSet(TopTitle,Data.level);
      SubCreatePanel(Subtitle,150,25,10,45,Data.korname,Data.emphint);
      SubColorSet(SubTitle,Data.level,Data.paycl);
//  1차만 위치조정.
      xPos := TopTitle.Top+12;
      yPos := SubTitle.Left+150;

      {2차 레벨 생성}
      for i := 1 to Level2_Cnt do begin
          TopCreatePanel(SubList[i].Toptitle,150,25,210,20+((i-1)*35),2,
                         SubList[i].Data.deptcode,
                         SubList[i].Data.deptname,
                         SubList[i].Data.fdeptname);
          SubList[i].Toptitle.Tag := i;
          ColorSet(SubList[i].TopTitle,SubList[i].Data.level);
          SubCreatePanel(SubList[i].Subtitle,80,25,360,20+((i-1)*35),
                         SubList[i].Data.korname,SubList[i].Data.empHint);
          SubColorSet(SubList[i].SubTitle,SubList[i].Data.level,SubList[i].Data.paycl);
          SubList[i].Subtitle.Tag := i;
          if SubList[i].Data.korname = '라인' then begin
             SubList[i].Toptitle.visible := False;
             SubList[i].Subtitle.visible := False;
          end;
      end;

      {3 차레벨 생성}
      n := 1;
      for i := 1 to Level2_Cnt do
      begin
          for j := 1 to SubList[i].Data.extGap do
          begin
              TopCreatePanel(SubList[i].SubList[j].Toptitle,150,25,490,20+((n-1)*35),3,
                             SubList[i].SubList[j].Data.deptcode,
                             SubList[i].SubList[j].Data.deptname,
                             SubList[i].SubList[j].Data.fdeptname);
              SubList[i].SubList[j].Toptitle.Tag         := j;
              SubList[i].SubList[j].Toptitle.HelpContext := i;
              if SubList[i].SubList[j].Data.korname = '▶ 계속' then
              begin
                 ColorSet(SubList[i].SubList[j].TopTitle,SubList[i].SubList[j].Data.Level);  //'98');-->30.00
                 SubList[i].SubList[j].data.empHint := SubList[i].SubList[j].data.empHint+
                                                       ' → 계속 이어지는 해당부서의 장';
              end
              else
                 ColorSet(SubList[i].SubList[j].TopTitle,SubList[i].SubList[j].Data.level);

              SubCreatePanel(SubList[i].SubList[j].Subtitle,80,25,640,20+((n-1)*35),
                             SubList[i].SubList[j].Data.korname,
                             SubList[i].SubList[j].Data.empHint);
              SubColorSet(SubList[i].SubList[j].SubTitle,SubList[i].SubList[j].Data.level,
                       SubList[i].SubList[j].Data.paycl);
              SubList[i].SubList[j].Subtitle.Tag         := j;
              SubList[i].SubList[j].Subtitle.HelpContext := i;
              inc(n);
          end;
      end;
 end;
end;

// 조직도 패널의 자리를 결정한다................................................
procedure TMDIChild.Locate_Organization;
var
  i,j,n,trange : integer;
  Gap,nTop : integer;
begin
 with ListView do begin
      // 2차 레벨 재배치.
      Gap := 0; nTop := 0;
      for i := 1 to Level2_Cnt do begin
          if i > 1 then begin
             SubList[i].TopTitle.Top := (20)+((i-1)*35)+nTop;
             SubList[i].SubTitle.Top := (20)+((i-1)*35)+nTop;
          end else begin
             SubList[i].TopTitle.Top := (20)+((i-1)*35);
             SubList[i].SubTitle.Top := (20)+((i-1)*35);
          end;
          SubList[i].xPos   := SubList[i].TopTitle.Top+12;
          SubList[i].yPos   := SubList[i].TopTitle.Left;
          SubList[i].ePos   := SubList[i].TopTitle.Left+230;
          if SubList[i].Data.extgap > 0 then  begin
             Gap   := 0;
             Gap   := ((SubList[i].Data.extGap-1)*35);
             nTop  := nTop+Gap;
          end;
      end;

      // 3차 레벨 재배치
      scBox.VertScrollBar.Range := 0;
      Gap := 0; nTop := 0; trange := 0;
      for i := 1 to Level2_Cnt do begin
          n := 1;
          for j := 1 to SubList[i].Data.extGap do begin
              nTop := SubList[i].TopTitle.Top;
              SubList[i].SubList[j].TopTitle.Top := nTop+((n-1)*35);
              SubList[i].SubList[j].SubTitle.Top := nTop+((n-1)*35);
              SubList[i].SubList[j].xPos         := SubList[i].SubList[j].TopTitle.Top+12;
              SubList[i].SubList[j].yPos         := SubList[i].SubList[j].TopTitle.Left;
              inc(n);
          end;
          if n = 1 then trange := trange + n else trange := trange + (n-1);
      end;
 end;
 scBox.VertScrollBar.Range     := (trange*35) + 50;
 scBox.VertScrollBar.increment := scBox.VertScrollBar.Range div 5;
end;

// 부서에 맞는 색을 칠한다..----------------------------------------------------
procedure TMDIChild.ColorSet(pData : TPanel; pLevel : string);
begin
  if trim(pLevel) = ''  then begin
     pData.color := $00C0C080; system.Exit
  end;
  pData.color := $00A58EE6;
{  if trim(pLevel) = 'A'  then pData.color := $00FFD988;
  if trim(pLevel) = 'B'  then pData.color := $00C0C080;
  if trim(pLevel) = 'C'  then pData.color := $00E9BCC1;
  if trim(pLevel) = 'D'  then pData.color := $00D3F7CA;
  if trim(pLevel) = 'E'  then pData.color := $00C0FAFA;
  if trim(pLevel) = '4'  then pData.color := $00A58EE6;
  if trim(pLevel) = '5'  then pData.color := $00FFC4FF;
  if trim(pLevel) = '6'  then pData.color := $00FFC4FF;
  if trim(pLevel) = '98' then pData.color := $00E2E2E2;
  if trim(pLevel) = '99' then pData.color := $00FFFFCC;}
  if trim(pLevel) = 'A'  then pData.color := $00FFD988;  //부문
  if trim(pLevel) = 'B'  then pData.color := $00D1FFC1;  //본부
  if trim(pLevel) = 'C'  then pData.color := $00C0C080;  //실
  if trim(pLevel) = 'D'  then pData.color := $00E9BCC1;  //팀
  if trim(pLevel) = 'E'  then pData.color := $00C0FAFA;
  if trim(pLevel) = '4'  then pData.color := $00A58EE6;
  if trim(pLevel) = '5'  then pData.color := $00FFC4FF;
  if trim(pLevel) = '6'  then pData.color := $00FFC4FF;
  if trim(pLevel) = '98' then pData.color := $00E2E2E2;
  if trim(pLevel) = '99' then pData.color := $00FFFFCC;
end;

procedure TMDIChild.SubColorSet(pData : TPanel; pLevel,lpaycl : string);
var
  i : integer;
  procedure Checking;
  begin
    if MainForm.Selym <= '199812' then
      begin
        case lpaycl[1] of
         'N' : pData.color := $00C0C080;
         'O' : pData.color := $00E9BCC1;
         'P' : pData.color := $00D3F7CA;
         'Q' : pData.color := $00C0FAFA;
        else  pData.color := $00B5FDFA;
        end;
      end;
  end;
begin
  if (trim(pLevel) = '') or
     (trim(pData.Caption) = '▶ 계속') or
     (trim(lpaycl) = '') then begin
     pData.color := $00B5FDFA;
     system.Exit
  end;
  pData.color := $00B5FDFA;
  if MainForm.Selym <= '199812' then
    begin
      if (trim(pLevel) = 'B') and (copy(lpaycl,1,1) <> 'N') then Checking;
      if (trim(pLevel) = 'C') and (copy(lpaycl,1,1) <> 'O') then Checking;
      if (trim(pLevel) = 'D') and (copy(lpaycl,1,1) <> 'P') then Checking;
      if (trim(pLevel) = 'E') and (copy(lpaycl,1,1) <> 'Q') then Checking;
    end;
end;

// 생성된 조직도의 선을 그린다......--------------------------------------------
procedure TMDIChild.DrawLevel;
var
 i,j  : integer;
begin
 with ListView do begin
      TopTitle.parent  := scBox; SubTitle.parent  := scBox;
      for i := 1 to Level2_Cnt do begin
          SubList[i].TopTitle.parent  := scBox;
          SubList[i].SubTitle.parent  := scBox;
      end;
      for i := 1 to Level2_Cnt do
          for j := 1 to SubList[i].Data.extGap do begin
              SubList[i].SubList[j].TopTitle.parent  := scBox;
              SubList[i].SubList[j].SubTitle.parent  := scBox;
          end;
  end;

  // 2차레벨 세로선을 그린다.
  if Level2_Cnt > 0 then begin
     lineCreate(ListView.yPos,ListView.xPos,25,0,25,1);
     lineCreate(ListView.yPos+25,ListView.xPos,ListView.SubList[1].xPos,0,
                ListView.SubList[1].xPos,1);
     lineCreate(ListView.yPos+25,ListView.SubList[1].xPos,25,0,25,1);
     // 특별조직일경우 2차레벨에서 수직선을 전체2차레벨에서 - 특별조직만큼 뺀 크기만큼 그린다.
     // 단 특별조직은 항상 맨 하위에 나타난다..(즉 lineyn 순으로 Desc 한다)
     lineCreate(ListView.SubList[1].yPos-25,ListView.SubList[1].xPos,0,
                ListView.SubList[Level2_cnt-linecnt[1]].xPos - ListView.SubList[1].xPos,1,
                ListView.SubList[Level2_cnt-linecnt[1]].xPos - ListView.SubList[1].xPos);
  end;

  // 1 -> 2 가로선그리기
  for i := 1 to Level2_Cnt do begin
      if ListView.SubList[i].SubTitle.visible <> False then begin
         // 특별 조직일경우 (예 : 감사실일 경우} 1->2차 라인을 그리지 않는다..
         if ListView.SubList[i].Data.lineyn <> 'N' then
            lineCreate(ListView.yPos+25,ListView.SubList[i].xPos,25,0,25,1);
      end else
        begin
          if ListView.SubList[i].Data.lineyn <> 'N' then
            lineCreate(ListView.yPos+25,ListView.SubList[i].xPos,255,0,255,1);
        end;
  end;

  for j := 1 to Level2_Cnt do begin
      if ListView.SubList[j].Data.extGap > 0 then begin
         if ListView.SubList[j].SubList[1].Data.LineYn <> 'N' then
           begin
             lineCreate(ListView.SubList[j].ePos,ListView.SubList[j].xPos,50,0,50,1);
             lineCreate(ListView.SubList[j].ePos+25,ListView.SubList[j].SubList[1].xPos,0,
                        ListView.SubList[j].SubList[ListView.SubList[j].Data.extGap].xPos -
                        ListView.SubList[j].SubList[1].xPos,1,
                        ListView.SubList[j].SubList[ListView.SubList[j].Data.extGap].xPos -
                        ListView.SubList[j].SubList[1].xPos);
           end;             
         for i := 1 to ListView.SubList[j].Data.extGap do
           begin
             if ListView.SubList[j].SubList[i].Data.lineyn = 'Y' then
               lineCreate(ListView.SubList[j].ePos+25,ListView.SubList[j].SubList[i].xPos,
                          25,0,25,1);
           end;
      end;
  end;
end;

// 현재의 조직을 출력한다..-----------------------------------------------------
// 페이지 스킵은 3차레벨이 30보다 클경우 넘어간다..
procedure TMDIChild.BprnClick(Sender: TObject);
var
  i,j,n : integer;
  nw,nh : integer;
  ngap,nTop,pheight : integer;
  pagecnt,tpage     : integer;
  Rect : TRect;
  // page 시작 세로 위치는 32, 끝 위치는 1152 (33번째 찍히는 위치)
  // 출력에서의 주의할 사항은 2차렙레에서 3차레벨을 드로잉할때
  // (1). 3차 레벨의 갯수에 따라 2차레벨이 드로잉되는 과정.
  // (2). 2차 레벨이 다음장에 찍힐 경우 연장선(이음선)을 그리는 방법.
  // (3). 3차 레벨이 다음장에 찍힐 경우 연장선(이음선)을 그리는 방법.
  // (4). (2)의 경우에 현재장에 2차레벨이 마지막이고 3차레벨이 다음장에 찍힐경우
  //      3차 레벨 연장선(이음선)을 그리는 방법.
  // 위의 처리방법은 다음과 같이 해결함.
  // 첫째. 출력물의 1,2,3차 레벨의 위치를 판단한다.(변수 X1,X2,Y1,Y2)
  // 둘째. 다음장 출력물을 경우 (2),(3),(4)의 과정을 판단할 수 있도록 pflag 변수를
  //       사용하여 [3차레벨의 연장선일 경우는 pflag = PC.]
  //                [2       "                 pflag = P0 (3 차 레벨이 없는 경우)]
  //                [2       "                 pflag = P+3차레벨 현재장에 찍힌갯수 (3차 레벨이 있는 경우)]
  //       페이지 넘김을 해결함..(가장 핵심 포인트임)
  // 세째  나머지 이해 안가는 부분은 데이타를 화면상의 구조인 LISTVIEW 데이타를
  //       그대로 썼스니 그부분을 참조하기 바란다..
begin
 printer.BeginDoc;
 printer.Canvas.Font      := p1.Font;
 nw := printer.Canvas.TextWidth('W');
 nh := printer.Canvas.TextHeight('W')+20;
 printer.Canvas.Font.size := 14;
 printer.Canvas.TextOut(nw*7,nh*3,'⊙ 조직도 ('+copy(ListView.Data.deptname,1,30)+')');
 nTop := nh*6; pagecnt := 1; tpage := 1; pheight := 0;
 // 프린터 찍힐 위치를 판단한다..
 printer.Canvas.Font.size := 8;
 with ListView do begin
      x1 := ypos;
      x2 := x1+550;
      y1 := nTop+(xpos-pheight);
      y2 := y1+55;
      ngap := 0;
      for i := 1 to Level2_Cnt do begin
          SubList[i].pflag := 'NO';
          SubList[i].x1 := (ypos+800);
          SubList[i].x2 := SubList[i].x1+550;
          SubList[i].y1 := (ngap+(nTop+(SubList[i].xPos-pheight)));
          SubList[i].y2 := SubList[i].y1+55;
          for j := 1 to SubList[i].Data.extGap do begin
              SubList[i].SubList[j].pflag := 'NO';
              SubList[i].SubList[j].x1 := (ypos+800*2);
              SubList[i].SubList[j].x2 := SubList[i].SubList[j].x1+550;
              SubList[i].SubList[j].y1 := (ngap+(nTop+(SubList[i].SubList[j].xpos-pheight))+(j-1)*nh);
              SubList[i].SubList[j].y2 := SubList[i].SubList[j].y1+55;
              inc(pagecnt);
              if pagecnt > 31 then begin
                 // 3차 레벨이 다음장에 이어질때 'PC' 문자를 리턴한다..
                 if j <> SubList[i].Data.extGap then begin
                    SubList[i].SubList[j].pflag := 'PC';
                 end;
                 // 2차 레벨이 다음장에 이어질때 3차레벨이 현재장에 찍힌 갯수를 'P'+갯수 형태로 넘긴다.
                 if i <> (Level2_Cnt - linecnt[1]) then begin
                    SubList[i].pflag := 'P'+inttostr(j);
                 end;
                 inc(tpage); pagecnt := 1;
                 pheight := (tpage-1)*1120+(j*nh); ngap := 0;
              end;
          end;
          ngap := ((SubList[i].Data.extGap)*nh)+ngap;
          // 3차레벨이 없을경우 1줄을 더그리기때문에 pagecnt를 1 더한다..
          if (SubList[i].Data.extGap = 0) then begin
              ngap := nh+ngap;
              inc(pagecnt);
              if pagecnt > 31 then begin
                 // 2차 레벨이 다음장에 이어질때 3차레벨이 없을경우 현재장에
                 // 찍힌 갯수를 'P0' 형태로 넘긴다.
                 if i <> (Level2_Cnt - linecnt[1]) then begin
                    SubList[i].pflag := 'P0';
                 end;
                 pagecnt := 1;  inc(tpage);
                 pheight := (tpage-1)*1120; ngap := 0;
              end;
          end;
      end; // for i := 1 to Level2_Cnt do begin
 end;  // with ListView do begin

// 프린터위치가 파악된 데이타를 이용하여 출력한다..
 pagecnt := 1;
 with ListView do begin
      // 1 차 레벨 출력.
      Printer.Canvas.Rectangle(x1-20,y1-15,x2,y2);
      Printer.Canvas.Rectangle(x1+350,y1-15,x1+352,y2);
      Printer.Canvas.TextOut(x1,y1,copy(Data.deptname,1,20));
      Printer.Canvas.TextOut(x1+370,y1,copy(Data.korname,1,8));
      Rect.top   := y1+80;
      Rect.left  := x1+100;
      Rect.Right := (perimage.Picture.Graphic.width*4+Rect.left);
      Rect.Bottom:= (perimage.Picture.Graphic.Height*4+Rect.top);
      Printer.Canvas.StretchDraw(Rect,perimage.picture.Bitmap);
      // 2차 레벨 출력.
      for i := 1 to Level2_Cnt do begin
          if i = 1 then begin // 1차레벨에서 2차레벨에 한선만 드로링.. (1일 경우)
             Printer.Canvas.MoveTo(x2,y1+20);
             Printer.Canvas.LineTo(SubList[1].x1-20,SubList[1].y1+20);
          end;
          // 2차레벨 세로선이 특별부서 보다 작거나 같을때만 세로선을 드로잉..
          if i < (Level2_cnt - linecnt[1]) then begin
             if SubList[i].pflag = 'NO' then begin
                Printer.Canvas.MoveTo(x2+150,SubList[i].y1+20);
                Printer.Canvas.LineTo(x2+150,SubList[i+1].y1+20);
             end;
            // 2차레벨이 다음장에 계속이어질때. 현재장에 이음줄을 드로잉..
             if copy(SubList[i].pflag,1,1) = 'P' then begin
                Printer.Canvas.MoveTo(x2+150,SubList[i].y1+20);
                j := strToInt(copy(SubList[i].pflag,2,3));
                Printer.Canvas.LineTo(x2+150,SubList[i].subList[j].y1+75);
             end;
          end;
             // 1차 레벨에서 2차레벨을 반만 드로잉 한다..왜!! 하위부서이기때문에
             // 근데 라인구분이 N 이면 드로잉 노우!!.
          if ListView.SubList[i].SubTitle.visible <> False then begin
             if ListView.SubList[i].Data.lineyn <> 'N' then begin
                Printer.Canvas.MoveTo(SubList[i].x1-100,SubList[i].y1+20);
                Printer.Canvas.LineTo(SubList[i].x1-20, SubList[i].y1+20);
             end;
          end else begin
              if ListView.SubList[i].Data.lineyn <> 'N' then begin
                Printer.Canvas.MoveTo(SubList[i].x1-100,SubList[i].y1+20);
                Printer.Canvas.LineTo((SubList[i].x1-20)+570, SubList[i].y1+20);
              end;
          end;
          // 현 2차레벨보다 낮을경우는 데이타를 출력안함 ** 주의
          if ListView.SubList[i].SubTitle.visible <> False then begin
             Printer.Canvas.Rectangle(SubList[i].x1-20,SubList[i].y1-15,
                                      SubList[i].x2,   SubList[i].y2);
             Printer.Canvas.Rectangle(SubList[i].x1+350,SubList[i].y1-15,
                                      SubList[i].x1+352,SubList[i].y2);
             Printer.Canvas.TextOut(SubList[i].x1,SubList[i].y1,
                                    copy(SubList[i].Data.deptname,1,20));
             Printer.Canvas.TextOut(SubList[i].x1+370,SubList[i].y1,
                                    copy(SubList[i].Data.korname,1,8));
          end;

          for j := 1 to SubList[i].Data.extGap do begin
              if j = 1 then begin
                 // 2-> 차레벨 가로선을 드로잉한다..
                 Printer.Canvas.MoveTo(SubList[i].x2,              SubList[i].y1+20);
                 Printer.Canvas.LineTo(SubList[i].SubList[1].x1-20,SubList[i].y1+20);
              end;
                 // 3차레벨 세로선,가로선을 드로잉한다..
              if j < SubList[i].Data.extGap then begin
                 if SubList[i].SubList[j].pflag = 'NO' then begin
                    Printer.Canvas.MoveTo(SubList[i].x2+150,SubList[i].SubList[j].y1+20);
                    Printer.Canvas.LineTo(SubList[i].x2+150,SubList[i].SubList[j+1].y1+20);
                 end;
                 // 3차레벨이 다음장에 계속이어질때. 현재장에 이음줄을 드로잉..
                 if SubList[i].SubList[j].pflag = 'PC' then begin
                    Printer.Canvas.MoveTo(SubList[i].x2+150,SubList[i].SubList[j].y1+20);
                    Printer.Canvas.LineTo(SubList[i].x2+150,SubList[i].SubList[j].y1+75);
                 end;
              end;
              Printer.Canvas.MoveTo(SubList[i].SubList[j].x1-100,SubList[i].SubList[j].y1+20);
              Printer.Canvas.LineTo(SubList[i].SubList[j].x1-20, SubList[i].SubList[j].y1+20);

              Printer.Canvas.Rectangle(SubList[i].SubList[j].x1-20,SubList[i].SubList[j].y1-15,
                                       SubList[i].SubList[j].x2,SubList[i].SubList[j].y2);
              Printer.Canvas.Rectangle(SubList[i].SubList[j].x1+350,SubList[i].SubList[j].y1-15,
                                       SubList[i].SubList[j].x1+352,SubList[i].SubList[j].y2);
              Printer.Canvas.TextOut(SubList[i].SubList[j].x1,SubList[i].SubList[j].y1,
                                     copy(SubList[i].SubList[j].Data.deptname,1,20));
              Printer.Canvas.TextOut(SubList[i].SubList[j].x1+370,SubList[i].SubList[j].y1,
                                     copy(SubList[i].SubList[j].Data.korname,1,8));
              inc(pagecnt);
              if pagecnt > 31 then begin
                 pagecnt := 1;
                 printer.NewPage;
                 // 2차레벨이 다음장에 계속이어질때.다음장에 이음줄을 드로잉..
                 if copy(SubList[i].pflag,1,1) = 'P' then begin
                    n:= 0;
                    Printer.Canvas.MoveTo(x2+150,SubList[i+1].y1+20);
                    n := SubList[i].Data.extGap - strToInt(copy(SubList[i].pflag,2,3));
                    if n <> 0 then Printer.Canvas.LineTo(x2+150,SubList[i+1].y1+20 - (n+1)*75)
                              else Printer.Canvas.LineTo(x2+150,SubList[i+1].y1+20 - 55);
                 end;
                 // 3차레벨에서 다음장에 계속이어질때.다음장에 이음줄을 드로잉..
                 if SubList[i].SubList[j].pflag = 'PC' then begin
                    Printer.Canvas.MoveTo(SubList[i].x2+150,SubList[i].SubList[j+1].y1-35);
                    Printer.Canvas.LineTo(SubList[i].x2+150,SubList[i].SubList[j+1].y1+20);
                 end;
              end;
          end;

          if (SubList[i].Data.extGap = 0) then begin
              inc(pagecnt);
              if pagecnt > 31 then begin
                 pagecnt := 1;
                 printer.NewPage;
                 // 2차레벨이 다음장에 계속이어질때. 다음장에 이음줄을 드로잉..
                 if copy(SubList[i].pflag,1,1) = 'P' then begin
                    n:= 0;
                    Printer.Canvas.MoveTo(x2+150,SubList[i].y1+20);
                    n := SubList[i].Data.extGap - strToInt(copy(SubList[i].pflag,2,3));
                    if n <> 0 then Printer.Canvas.LineTo(x2+150,SubList[i+1].y1+20 - (n+1)*75)
                              else Printer.Canvas.LineTo(x2+150,SubList[i+1].y1+20 - 55);
                 end;
              end;
          end;
      end; // for i := 1 to Level2_Cnt do begin
 end;  // with ListView do begin
 printer.EndDoc;
 MessageBox(handle,'출력이 완료되었습니다 !!.','알 림',MB_OK or $0030);
end;

end.
