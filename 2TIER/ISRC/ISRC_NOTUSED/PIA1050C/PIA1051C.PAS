{header.--------------------------------------------------------------------------------
PROGRAM-NAME    :  PIA1050A(인사기록표)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 1.01
Date            : 1998.12.22
Update contents
    버전   수정일      수정자  관련근거           수정내용
--------------------------------------------------------------------------------
    1.00   1996.06.15  전철호  신규프로그램개발   처리명세서
    1.01   1998.12.22  김혜진                     급호->직급, 직렬->직군. 호봉삭제,외국어점수(청취/독해)
    30.01  1999.12.31  윤형식  Y2k                인사발령 6자리 --> 8자리 크기변경
    31.04  2006.06.16  H.E.S   델파이 버전 업     QReport 버전 업
--------------------------------------------------------------------------------}
unit Pia1051c;

interface
uses  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms,    Dialogs,  StdCtrls, Buttons,  Gauges,  Mask,     ExtCtrls,
  inifiles, timeftp,  KeyEmpno, keycode,  datelib, DeptCode, DB,   //codelib, fempno,  dept1lib
  DBTables, Pass,     codetext, forgnum,  QuickRpt, ImgList, QRPrntr,
  MemDS, DBAccess, Ora, Func;



{$I pia1050c.inc}
type  Tpia1051cForm = class(TForm)
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel2: TPanel;
    Label11: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    Gauge1: TGauge;
    Panel5: TPanel;
    helpDsr: TLabel;
    helpLabel: TLabel;
    Panel11: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    part1: TPanel;
    part2: TPanel;
    part3: TPanel;
    empno1: TMaskEdit;
    Label7: TLabel;
    empno2: TMaskEdit;
    deptcode1: TMaskEdit;
    Label1: TLabel;
    deptcode2: TMaskEdit;
    paycl1: TMaskEdit;
    Label6: TLabel;
    paycl2: TMaskEdit;
    filenm: TMaskEdit;
    Panel4: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    item1: TPanel;
    item2: TPanel;
    item3: TPanel;
    item4: TPanel;
    select1: TPanel;
    select2: TPanel;
    select3: TPanel;
    select4: TPanel;
    select5: TPanel;
    Bscreen: TBitBtn;
    Bprint: TBitBtn;
    Bexit: TBitBtn;
    hp: TPanel;
    FileOpen: TOpenDialog;
    SpeedButton1: TSpeedButton;
    Bdept: TBitBtn;
    im1: TImage;
    im2: TImage;
    im3: TImage;
    dm1: TImage;
    dm2: TImage;
    dm3: TImage;
    dm4: TImage;
    sm1: TImage;
    sm2: TImage;
    sm3: TImage;
    sm4: TImage;
    sm5: TImage;
    korname1: TPanel;
    korname2: TPanel;
    Btext: TBitBtn;
    ImageList1: TImageList;
    OraQuery1: TOraQuery;
    Qdept: TOraQuery;
    QMas: TOraQuery;
    QCode: TOraQuery;

    procedure BexitClick(Sender: TObject);
    procedure partClick(Sender: TObject);
    procedure itemClick(Sender: TObject);
    procedure SelectClick(Sender: TObject);
    procedure empnoClick(Sender: TObject);
    procedure deptclick(Sender: TObject);
    procedure codeClick(Sender: TObject);
    procedure DataTabControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataKeyPress(Sender: TObject; var Key: Char);
    procedure BscreenClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DataExit(Sender: TObject);
    procedure BdeptClick(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure BtextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

  private    { Private declarations }
    EnterKey           : integer;
    ReSel              : integer;
    Start              : integer;
    ConditionLoop      : Boolean;
    FreeCheck,FreeDept : Boolean;
    DataEmpno          : Boolean;
    WordPad            : Boolean;
    tData              : Datasource_insa;
//    aData              : Datasource_insa2;
//    akData             : Datasource_insa3;
    sData              : Datasource_insa4;
//    jData              : Datasource_insa5;

    function  QempDisp(str : string) : string;//    procedure Showpreview;
    procedure create_Text1;
    procedure create_Text2;
    procedure create_Text3;
    procedure create_Text4;
    procedure create_Text5;
    procedure pimsch_search(str : string);
    procedure pimcar_search(str : string);
    procedure pimfam_search(str : string);
    procedure pimtran_search(str : string);
    procedure pimfore_search(str : string);
    procedure pimrew_search(str : string);
    procedure pimrew2_search(str : string);
    procedure pimpun_search(str : string);
    procedure pimpun2_search(str : string);
    procedure pimlic_search(str : string);
    procedure pimedu_search(str : string);

  public
    { Public declarations }
    pempno      : string;
    pkorname    : string;
    password    : string;
    gu1,gu2     : integer;
    gu3         : array[1..5] of integer;
    CurDate     : string[8];
    payrachdate : string;
    insa1Report : TQuickRep;
    insa2Report : TQuickRep;
    insa3Report : TQuickRep;
    insa4Report : TQuickRep;
    insa5Report : TQuickRep;
    tFile1      : file of Datasource_insa;
    tFile2      : file of Datasource_insa2;
    tFile3      : file of Datasource_insa3;
    tFile4      : file of Datasource_insa4;
    tFile5      : file of Datasource_insa5;

    pageCnt  : integer;    pageSel  : integer;
    pageItem : integer;

    function  QcodeDisp(s1,s2 : string) : string;
    function  QDeptDisp(s1,s2 : String) : String;
    procedure MakeTextFile;
    procedure HelpHint(str : string);
    procedure Access(cnt : integer);
    procedure PrintSel;
  end;

type sText = record
     empno : array[1..4] of char;
     lfcr  : array[1..2] of char;
end;


var  pia1051cForm: Tpia1051cForm;
  empText     : sText;
  eFile       : file of sText;
  ErrorHelp   : array[0..255] of char;
  HomeDir     : string;


implementationuses pia1052c,pia1053c,pia1054c,pia1055c,pia1056c,pia1057c,pia1058c;

{$R *.DFM}
procedure Tpia1051cForm.MakeTextFile;var
     str : string;
begin
     codeToText(HomeDir+'\pia1050c.cod','',0);
//     showmessage(HomeDir);
     with OraQuery1 do
     begin
          close;
          sql.clear;
          sql.add('select codeid,                                                          ');
          sql.add('       codeno,                                                          ');
          sql.add('       codename                                                         ');
          sql.add('from pyccode                                                            ');
          sql.add('where (codeid = ''I001'' or codeid = ''I002'' ) or                      ');
          sql.add('      (codeid = ''I031'' or codeid = ''I034'' ) or                      ');
          sql.add('      (codeid = ''I035'' or codeid = ''I039'' ) or                      ');
          sql.add('      (codeid = ''I101'' or codeid = ''I300'' ) or                      ');
          sql.add('      (codeid = ''I112'' or codeid = ''I113'' ) or                      ');
          sql.add('      (codeid = ''I114'' or codeid = ''I115'' ) or                      ');
          sql.add('      (codeid = ''I211'' or codeid = ''I225'' ) or                      ');
          sql.add('      (codeid = ''I221'' or codeid = ''I003'' ) or                      ');
          sql.add('      (codeid = ''I602'' or codeid = ''I603'' or codeid = ''I611'' ) or ');
          sql.add('      (codeid = ''I141'' or codeid = ''I036'' ) or                      ');
          sql.add('      (codeid = ''I231'' or codeid = ''I232'' ) or                      ');
          sql.add('      (codeid = ''I037'' or codeid = ''I310'' )                         ');
          sql.add('order by codeid,codeno                                                  ');
          open;
          while not eof do
          begin
               str := '';
               str := FieldByName('codeid').AsString+','+
                      FieldByName('codeno').AsString+','+
                      FieldByName('codename').AsString;
               codeToText('',str,1);
               next;
          end;
      OraQuery1.close;
     end;
 codeToText('','',2);
end;


// 성명을 읽어온다..function Tpia1051cForm.QempDisp(str : string) : string;
begin
     result := '';
     if trim(str) = '' then system.exit;
     with Qmas do
     begin
          Sql.clear; Qmas.close;
          Sql.Add('select korname from pimpmas where empno = :lempno ');
          ParamByName('lempno').AsString := str;
          Open;

          if recordCount > 0 then
          begin
               result := Qmas.FieldByName('korname').AsString;
          end
          else result := '미등록사원';
          close;
     end;
end;


{코드명을 불러온다..}function Tpia1051cForm.QcodeDisp(s1,s2 : string) : string;
begin
    if trim(s2) = '' then begin QcodeDisp := ''; system.exit; end;
    if FreeCheck = False then
    with QCode do
    begin
         Close;
         Parambyname('lcodeid').AsString  := s1;
         Parambyname('lcodesub').AsString := s2;
         Open;
         QCodeDisp := Qcode.FieldByName('CodeName').AsString;
    end
    else
    begin
       QCodeDisp := TextCodeDisp(s1,s2,HomeDir+'\pia1050c.cod');
    end;
end;


function Tpia1051cForm.QDeptDisp(s1,s2 : String) : String;{부서명을 가져온다..}
var
     str : string;
begin
     if trim(s2) = '' then begin QDeptDisp := ''; system.exit; end;
     if FreeDept = False then
     with Qdept do
     begin
          Close;
          Parambyname('lorg').AsString  := s1;
          Parambyname('ldept').AsString := s2;
          Open;
          if trim(FieldByName('DeptName').AsString) = ''  then QdeptDisp := '부서코드('+s2+') '+'조직차수('+s1+')'
          else QdeptDisp := Qdept.FieldByName('DeptName').AsString;
     end
     else
     begin
          str := TextDeptDisp(s1,s2,HomeDir+'\pia1050c.dep');
          if trim(str) = '' then QDeptDisp := '부서코드('+s2+') '+'조직차수('+s1+')'
          else QDeptDisp := str;
 end;
end;


procedure Tpia1051cForm.helpHint(str : string);begin
     HelpDsr.Caption := str;
     SendMessage(hp.handle,WM_PAINT,0,0);
end;


{종료버턴을 누를경우 }procedure Tpia1051cForm.BexitClick(Sender: TObject);
begin
     close;
end;


procedure Tpia1051cForm.FormClose(Sender: TObject;     var Action: TCloseAction);
begin
     codeToText(HomeDir+'\pia1050c.cod','',3);
     codeToText(HomeDir+'\pia1050c.dep','',3);
     if FileExists(HomeDir+'\list\pia1050c.tmp') = True then DeleteFile(PChar(HomeDir+'\list\pia1050c.tmp'));
     if FileExists(HomeDir+'\list\pia1051c.tmp') = True then DeleteFile(PChar(HomeDir+'\list\pia1051c.tmp'));
     if FileExists(HomeDir+'\list\pia1052c.tmp') = True then DeleteFile(PChar(HomeDir+'\list\pia1052c.tmp'));
     if FileExists(HomeDir+'\list\pia1053c.tmp') = True then DeleteFile(PChar(HomeDir+'\list\pia1053c.tmp'));
     if FileExists(HomeDir+'\list\pia1054c.tmp') = True then DeleteFile(PChar(HomeDir+'\list\pia1054c.tmp'));

     Action := caFree;
end;

procedure Tpia1051cForm.partClick(Sender: TObject);
begin
     im1.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
     im2.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
     im3.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');

     case TPanel(Sender).HelpContext of
          1 : im1.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
          2 : im2.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
          3 : im3.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
     end;

     gu1 := TPanel(Sender).HelpContext;
end;


procedure Tpia1051cForm.itemClick(Sender: TObject);begin
     dm1.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
     dm2.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
     dm3.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
     dm4.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');

     case TPanel(Sender).HelpContext of
         1 : dm1.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
         2 : dm2.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
         3 : dm3.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
         4 : dm4.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
     end;

     gu2 := TPanel(Sender).HelpContext;
end;


procedure Tpia1051cForm.SelectClick(Sender: TObject);var
     i : integer;
begin
     case TPanel(Sender).HelpContext of
        1 : begin
                 if gu3[1] = 0 then
                 begin
                      sm1.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
                      gu3[1] := 1;
                 end
                 else
                 begin
                      sm1.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
                      gu3[1] := 0;
                 end;
            end;
        2 : begin
                 if gu3[2] = 0 then
                 begin
                      sm2.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
                      gu3[2] := 1;
                 end
                 else
                 begin
                      gu3[2] := 0;
                      sm2.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
                 end;
            end;
        3 : begin
                 if gu3[3] = 0 then
                 begin
                      sm3.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
                      gu3[3] := 1;
                 end
                 else
                 begin
                      gu3[3] := 0;
                      sm3.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
                 end;
            end;
        4 : begin
                 if gu3[4] = 0 then
                 begin
                      sm4.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
                      gu3[4] := 1;
                 end
                 else
                 begin
                      gu3[4] := 0;
                      sm4.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
                 end;
            end;
        5 : begin
                 if gu3[5] = 0 then
                 begin
                      sm5.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
                      gu3[5] := 1;
                 end
                 else
                 begin
                      gu3[5] := 0;
                      sm5.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
                 end;
            end;
     end;
     for i := 1 to 5 do
        if gu3[i] = 1 then
        begin
             PageSel := i;
             break;
        end;
end;


procedure Tpia1051cForm.empnoClick(Sender: TObject);begin
  FKeyEmpno := TFKeyEmpno.Create(Self);
  try
       if TMaskEdit(Sender).Name = 'empno1' then
            FKeyEmpno.EdEmpno.Text := empno1.Text
       else
            FKeyEmpno.EdEmpno.Text := empno2.Text;
       FKeyEmpno.v_Table_Name := 'pkmpmas';
       FKeyEmpno.ShowModal;

       if FKeyEmpno.CloseChk = -1 then Exit;

       if FKeyEmpno.v_KeyEmpno <> '' then
       begin
           if TMaskEdit(Sender).Name = 'empno1' then
           begin
                empno1.Text      := FKeyempno.v_KeyEmpno;
                korname1.Caption := FKeyEmpno.v_KeyKorname;
           end
           else
           begin
                empno2.Text      := FKeyempno.v_KeyEmpno;
                korname2.Caption := FKeyEmpno.v_KeyKorname;
           end;
       end;
  finally
       FKeyEmpno.Free;
  end;
end;


procedure Tpia1051cForm.deptclick(Sender: TObject);begin
     FDeptCode := TFDeptCode.Create(Self);
     Try
          FDeptCode.ShowModal;
          if FDeptCode.GSdeptcode <> '' then
          begin
               if TMaskEdit(Sender).Name = 'deptcode1' then
                    deptcode1.Text     := FDeptCode.GSdeptcode
               else deptcode2.Text     := FDeptCode.GSdeptcode;
          end;
     Finally
          FDeptCode.Free;
     End;
end;


procedure Tpia1051cForm.codeClick(Sender: TObject);begin
  Fkeycode := TFkeycode.Create(self);
  Try
    case TMaskEdit(Sender).HelpContext of
      1: begin
	  Fkeycode.FormData := 'BAND코드 열람';
	  Fkeycode.DataVal1  := 'I112';
	  end;
    end;
    Fkeycode.ShowModal;
    if Fkeycode.Code = '' then System.Exit;
    case TMaskEdit(Sender).HelpContext of
      1: begin
           if Fkeycode.Code <> '' then
           begin
              if TMaskEdit(Sender).Name = 'paycl1' then
                   paycl1.Text	 := Fkeycode.Code
              else paycl2.Text	 := Fkeycode.Code;
           end;
         end;
    end;

  Finally
    Fkeycode.Free;
  END;

end;



procedure Tpia1051cForm.DataTabControl(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
     if not(ssShift  in Shift) then
     begin
          if (Key = vk_Tab) or (Key = vk_Return) then
          begin
               HelpDsr.Caption := '';
               case TMaskEdit(Sender).Tag of
                   1 : begin
                       if EnterKey <> 0 then empno2.Setfocus;
                       EnterKey := 1;
                       empno2.Text := empno1.Text;
                       end;
                   2 : begin
                       deptcode1.SetFocus;
                       Dataempno := True;
                       end;
                   3 : begin
                       deptcode2.SetFocus;
                       deptcode2.Text := deptcode1.Text;
                       end;
                   4 : paycl1.SetFocus;
                   5 : begin
                       paycl2.Text := paycl1.Text;
                       paycl2.SetFocus;
                       end;
                   6 : filenm.SetFocus;
                   7 : empno1.SetFocus;
               end; {case end}
          end; {inner if end}
     end {if end}
     else
     begin
          if (Key = vk_Tab) or (Key = vk_Return) then
          begin
               HelpDsr.Caption := '';
               case TMaskEdit(Sender).Tag of
                   1 : filenm.Setfocus;
                   2 : empno1.SetFocus;
                   3 : empno2.SetFocus;
                   4 : deptcode1.SetFocus;
                   5 : deptcode2.SetFocus;
                   6 : paycl1.SetFocus;
                   7 : paycl2.SetFocus;
               end; {case end}
          end; {inner if end}
     end; {else end}
end;


procedure Tpia1051cForm.DataKeyPress(Sender: TObject; var Key: Char);begin
     HelpHint('');
     if key = chr(13) then key := chr(0);
end;

{
procedure Tpia1051cForm.ShowPreView;
begin
  pia1057cForm := Tpia1057cForm.Create(Self);
  Try
    case Resel of
      1 : pia1057cForm.insaReport := pia1052cForm.insa1Report;//   insa1Report;
      2 : pia1057cForm.insaReport := pia1053cForm.insa2Report;//   insa2Report;
      3 : pia1057cForm.insaReport := pia1054cForm.insa3Report;//   insa3Report;
      4 : pia1057cForm.insaReport := pia1055cForm.insa4Report;//   insa4Report;
      5 : pia1057cForm.insaReport := pia1056cForm.insa5Report;//   insa5Report;
    end;
    pia1057cForm.Pagecnt    := pageCnt;
    pia1057cForm.ShowModal;
  Finally
    pia1057cForm.Free;
  End;
end;
}

procedure Tpia1051cForm.BtextClick(Sender: TObject);begin
     wordpad := True;
     BscreenClick(Sender);

     if wordpad = True then
     begin
          if WinExec(PChar('c:\program files\Accessories\wordpad '+HomeDir+'\list\pia1050c.out'),
             SW_SHOW) < 32 then
             WinExec(PChar('edit '+HomeDir+'\list\pia1050c.out'),SW_SHOW);
     end;

     empno1.SetFocus;
end;


procedure Tpia1051cForm.BscreenClick(Sender: TObject);{실행버턴을 누를경우}
var
     i,cnt,fCheck : integer;
begin
     cnt := 0;
     fCheck := 0;

     for i := 1 to 5 do
     begin
          if gu3[i] = 1 then inc(cnt);
     end;

     if cnt <= 0 then
     begin
          MessageBox(handle,'출력여부를 선택하십시오 !!..','확  인',MB_OK or $0020);
          empno1.SetFocus;
          wordPad := False;
          System.Exit;
     end;

     for i := 1 to 5 do
     begin
          if gu3[i] = 1 then
          begin
               PageSel := i;
               break;
          end;
     end;

     if gu3[1] = 1 then begin AssignFile(tFile1,HomeDir+'\list\pia1050c.tmp'); System.ReWrite(tFile1); end;
     if gu3[2] = 1 then begin AssignFile(tFile2,HomeDir+'\list\pia1051c.tmp'); System.ReWrite(tFile2); end;
     if gu3[3] = 1 then begin AssignFile(tFile3,HomeDir+'\list\pia1052c.tmp'); System.ReWrite(tFile3); end;
     if gu3[4] = 1 then begin AssignFile(tFile4,HomeDir+'\list\pia1053c.tmp'); System.ReWrite(tFile4); end;
     if gu3[5] = 1 then begin AssignFile(tFile5,HomeDir+'\list\pia1054c.tmp'); System.ReWrite(tFile5); end;

     HelpHint('기본인사 화일을 읽는 중입니다 !!..');     {조건에 맞는 데이타를 추출한다..}

     with Qmas do
     begin
          Close;
          Sql.Clear;
          Sql.Add('select empno,korname,orgnum,deptcode,juminid,sex,holdname,holdrel,empdate,empterm,          ');
          Sql.Add('       empcode,emppaycl,emppaygr,health,empschgr,regaddr,curaddr,zipno,religion,blood,telno,');
          Sql.Add('       habit,height,bornarea,ability,weight,armykind,armyfrdate,armytodate,                 ');
          Sql.Add('       armycl,armydis,armyfield,armyex,cardate,retdate,retsayu1,retgubun,                   ');
          Sql.Add('       jobline,jobgun,paycl,paygr,bcaryy,bcarmm from pimpmas                                ');

          case gu1 of
               1 : begin   {사원번호순}
                        Sql.Add(' where empno between :lempno1 and :lempno2          ');
                        case gu2 of
                             1 :  Sql.Add(' and pstate < ''60''                      ');
                             2 :  Sql.Add(' and pstate >= ''60'' and pstate < ''80'' ');
                             3 :  Sql.Add(' and pstate >= ''80''                     ');
                             else;
                        end;
                        Sql.Add(' order by empno ');
                        ParamByName('lempno1').AsString := empno1.Text;
                        ParamByName('lempno2').AsString := empno2.Text;
                        Open;
                        pageCnt := RecordCount;   // ShowMessage(inttostr(pageCnt));
                   end;
               2 : begin   {부서/직급순}
                        Sql.Add(' where deptcode between :ldeptcode1 and :ldeptcode2');
                        Sql.Add('   and paycl between :lpaycl1 and :lpaycl2         ');
                        case gu2 of
                             1 :  Sql.Add(' and pstate < ''60''                      ');
                             2 :  Sql.Add(' and pstate >= ''60'' and pstate < ''80'' ');
                             3 :  Sql.Add(' and pstate >= ''80''                     ');
                             else;
                        end;
                        Sql.Add(' order by deptcode,paycl,payra,paygr,empno ');
                        ParamByName('ldeptcode1').AsString := deptcode1.Text;
                        ParamByName('ldeptcode2').AsString := deptcode2.Text;
                        ParamByName('lpaycl1'   ).AsString := paycl1.Text;
                        ParamByName('lpaycl2'   ).AsString := paycl2.Text;
                        Open;
                        pageCnt := RecordCount;
                   end;
               3 : begin
                        if FileExists(Filenm.Text) = False then
                        begin
                             Showmessage('화일이 있는지 확인 하십시오..');
                             //MessageBox(handle,'화일이 있는지 확인 하십시오..','에  러',MB_OK or $0020);
                             wordPad := False;
                             Filenm.SetFocus;
                             System.Exit;
                        end;

                        AssignFile(eFile,Filenm.Text); System.ReSet(eFile);
                        pageCnt := FileSize(eFile);

                        for i := 1 to FileSize(eFile) do
                        begin
                             Read(eFile,empText);
                             HelpHint('기본인사 화일을 읽는 중입니다 !!..');
                             Close;
                             SQL.Clear;
                             Sql.Add('select empno,korname,juminid,sex,holdname,holdrel,empdate,emppaycl,empterm,');
                             Sql.Add('       emppaygr,empcode,health,empschgr,regaddr,curaddr,zipno,religion,blood,telno,');
                             Sql.Add('       habit,height,bornarea,ability,weight,armykind,armyfrdate,armytodate,');
                             Sql.Add('       armycl,armydis,armyfield,armyex,cardate,retdate,retsayu1,retgubun, ');
                             Sql.Add('       jobline,jobgun,paycl,paygr,bcaryy,bcarmm from pimpmas ');
                             Sql.Add('where empno = :lempno');
                             ParamByName('lempno').AsString := empText.empno;
                             Open;

                             if RecordCount > 0 then inc(fCheck);
                             if gu3[1] = 1 then  create_Text1;
                             if gu3[2] = 1 then  create_Text2;
                             if gu3[3] = 1 then  create_Text3;
                             if gu3[4] = 1 then  create_Text4;
                             if gu3[5] = 1 then  create_Text5;
                             Access(i);
                        end;
                        System.Close(eFile);
                        PageCnt := fCheck;
                    end;
          end;
     end;

     if gu1 <= 2 then     begin          if pageCnt <= 0 then
          begin
               MessageBox(handle,'조건에 맞는 데이타가 없습니다..!!','확  인',MB_OK or $0030);
               empno1.SetFocus;

               for i := 1 to 5 do
               if gu3[i] = 1 then begin PageSel := i; break; end;
               if gu3[1] = 1 then  System.Close(tFile1);
               if gu3[2] = 1 then  System.Close(tFile2);
               if gu3[3] = 1 then  System.Close(tFile3);
               if gu3[4] = 1 then  System.Close(tFile4);
               if gu3[5] = 1 then  System.Close(tFile5);
               wordPad := False;
               System.Exit;
          end;        //   showmessage(inttostr(gu3[i])); showmessage(inttostr(gu3[1]));

          for i := 1 to 5 do
          begin
               if gu3[i] = 1 then
               begin
                    PageSel := i;
                    break;
               end;
          end;

          if gu3[1] = 1 then begin  create_Text1; Gauge1.Progress := 0;  end;
          if gu3[2] = 1 then begin  create_Text2; Gauge1.Progress := 0;  end;
          if gu3[3] = 1 then begin  create_Text3; Gauge1.Progress := 0;  end;
          if gu3[4] = 1 then begin  create_Text4; Gauge1.Progress := 0;  end;
          if gu3[5] = 1 then begin  create_Text5; Gauge1.Progress := 0;  end;
     end;

     for i := 1 to 5 do
     begin
          if gu3[i] = 1 then
          begin
               PageSel := i;
               break;
          end;
     end;

     if gu3[1] = 1 then  System.Close(tFile1);
     if gu3[2] = 1 then  System.Close(tFile2);
     if gu3[3] = 1 then  System.Close(tFile3);
     if gu3[4] = 1 then  System.Close(tFile4);
     if gu3[5] = 1 then  System.Close(tFile5);
     HelpHint('추출된 자료를 출력합니다 !!..');


      if TBitBtn(Sender).Name = 'Bscreen' then
      begin                              pia1057cForm := Tpia1057cForm.Create(Self);                              for i := 1 to 5 do               begin                    if gu3[i] = 1 then                    begin                         PageSel := i;                         break;                    end;               end;               case PageSel of               1 : begin                        if gu3[1] = 1 then                        begin                             pia1057cForm.Pagecnt               := pageCnt;                             pia1052cForm.insa1Report.OnPreview := pia1052cForm.insa1ReportPreview;                             pia1052cForm.insa1Report.Preview;                       end                   end;               2 : begin                        if gu3[2] = 1 then                        begin                             pia1057cForm.Pagecnt               := pageCnt;                             pia1053cForm.insa2Report.OnPreview := pia1053cForm.insa2ReportPreview;                             pia1053cForm.insa2Report.Preview;                         end                    end;               3 : begin                        if gu3[3] = 1 then                        begin                             pia1057cForm.Pagecnt               := pageCnt;                             pia1054cForm.insa3Report.OnPreview := pia1054cForm.insa3ReportPreview;                             pia1054cForm.insa3Report.Preview;                        end                   end;               4 : begin                        if gu3[4] = 1 then                        begin                             pia1057cForm.Pagecnt               := pageCnt;                             pia1055cForm.insa4Report.OnPreview := pia1055cForm.insa4ReportPreview;                             pia1055cForm.insa4Report.Preview;                       end                   end;               5 : begin                        if gu3[5] = 1 then                        begin                             pia1057cForm.Pagecnt               := pageCnt;                             pia1056cForm.insa5Report.OnPreview := pia1056cForm.insa5ReportPreview;                             pia1056cForm.insa5Report.Preview;                       end;                   end;               end;{           for i := 1 to 5 do           begin                if gu3[i] = 1 then                begin                     PageSel := i;                     break;                end;           end;           if gu3[1] = 1 then insa1Report.Preview;           if gu3[2] = 1 then insa2Report.Preview;           if gu3[3] = 1 then insa3Report.Preview;           if gu3[4] = 1 then insa4Report.Preview;           if gu3[5] = 1 then insa5Report.Preview;
}
      end;

      if TBitBtn(Sender).Name = 'Bprint' then
      begin

           for i := 1 to 5 do
           begin
                if gu3[i] = 1 then
                begin
                     PageSel := i;
                     break;
                end;
           end;

     for i := 1 to Qmas.RecordCount do
     begin       if gu3[1] = 1 then       begin          insa1Report.PrinterSettings.FirstPage := i;          insa1Report.PrinterSettings.LastPage  := i;          insa1Report.Print;       end;       if gu3[2] = 1 then       begin          insa2Report.PrinterSettings.FirstPage := i;          insa2Report.PrinterSettings.LastPage  := i;          insa2Report.Print;       end;       if gu3[3] = 1 then       begin          insa3Report.PrinterSettings.FirstPage := i;          insa3Report.PrinterSettings.LastPage  := i;          insa3Report.Print;       end;       if gu3[4] = 1 then       begin          insa4Report.PrinterSettings.FirstPage := i;          insa4Report.PrinterSettings.LastPage  := i;          insa4Report.Print;       end;       if gu3[5] = 1 then       begin          insa5Report.PrinterSettings.FirstPage := i;          insa5Report.PrinterSettings.LastPage  := i;          insa5Report.Print;       end;     end;
{
           if gu3[1] = 1 then insa1Report.Print;
           if gu3[2] = 1 then insa2Report.Print;           if gu3[3] = 1 then insa3Report.Print;           if gu3[4] = 1 then insa4Report.Print;           if gu3[5] = 1 then insa5Report.Print;
}
      end;

      if TbitBtn(Sender).Name = 'Btext' then      begin           Form_TextFile1(pagecnt);           Qmas.Close;           OraQuery1.Close;           HelpHint('작업이 완료되었습니다..');
           Gauge1.Progress := 0;
           empno1.Setfocus;      end;end;


procedure Tpia1051cForm.PrintSel;begin
     case PageSel of
       1 :  if gu3[1] = 1 then  begin insa1Report.Preview; Resel := 1; end;
       2 :  if gu3[2] = 1 then  begin insa2Report.Preview; Resel := 2; end;
       3 :  if gu3[3] = 1 then  begin insa3Report.Preview; Resel := 3; end;
       4 :  if gu3[4] = 1 then  begin insa4Report.Preview; Resel := 4; end;
       5 :  if gu3[5] = 1 then  begin insa5Report.Preview; Resel := 5; end;
     end;
end;


procedure Tpia1051cForm.Access(cnt : integer);begin
     if PageCnt <> cnt then
        Gauge1.progress := (cnt*100) div PageCnt else Gauge1.Progress := 100;
        UpdateWindow(panel3.handle);
end;


procedure Tpia1051cForm.create_Text1;{○ 페이지 1 : 기본인사,학력,자격,가족,입사전사항등}
var
     cnt    : integer;
     sqlstr : string;
     tEmpno : string;
begin
     {추출된 인사마스터를 차례대로 옮기면서 해당된 가족,학력 등등을 추출한다..}
     cnt := 1;  Qmas.First;

     while not Qmas.Eof do
     begin
          with Qmas,tData do
          begin
               empno     := FieldByName('empno').AsString;  //showmessage(empno);
               korname   := FieldByName('korname').AsString;
               empdate   := FieldByName('empdate').AsString;
               sqlstr := Format('select orgnum,deptcode from pihanno where '+
                                '(empno = ''%s'' and anfrdate = ''%s'') and '+
                                '((substr(ancode,1,1) || substr(ancode,3,1)) = ''%s'') ',
                                [empno,empdate,'11']);

               OraQuery1.sql.clear;
               OraQuery1.close;
               OraQuery1.sql.add(sqlstr);
               OraQuery1.Open;
               deptname  := QdeptDisp(OraQuery1.FieldByName('orgnum').AsString,
                                      OraQuery1.FieldByName('deptcode').AsString);
               OraQuery1.close;
         //  1.01   1998.12.22    김혜진  급호->직급, 직렬->직군. 호봉삭제,외국어점수(청취/독해)
         //     jobline   := QcodeDisp('I115',FieldByName('jobline').AsString);
         {      paycl     := copy(QcodeDisp('I112',FieldByName('emppaycl').AsString),1,6) +'-'+
                            FormatFloat('00',FieldByName('emppaygr').AsFloat);}
               jobline   := QcodeDisp('I115',FieldByName('jobgun').AsString);
               paycl     := copy(QcodeDisp('I112',FieldByName('emppaycl').AsString),1,6);
               empcode   := Qcodedisp('I101',FieldByName('empcode').AsString);
               empschgr  := QcodeDisp('I221',FieldByName('empschgr').AsString);
               cardate   := FieldByName('cardate').AsString;
               sex       := QcodeDisp('I039',FieldByName('sex').AsString);
               religion  := QcodeDisp('I002',FieldByName('religion').AsString);
               habit     := FieldByName('habit').AsString;
               ability   := FieldByName('ability').AsString;
               height    := FormatFloat('##0',FieldByName('height').AsFloat);
               weight    := FormatFloat('##0',FieldByName('weight').AsFloat);
               blood     := FieldByName('blood').AsString;
               juminid   := FieldByName('juminid').AsString;
               empterm   := FieldByName('empterm').AsString;
               holdname  := FieldByName('holdname').AsString;
               holdrel   := QcodeDisp('I211',FieldByName('holdrel').AsString);
               retgubun  := QcodeDisp('I310',FieldByName('retgubun').AsString);
               retdate   := FieldByName('retdate').AsString;
               retsayu   := QcodeDisp('I141',FieldByName('retsayu1').AsString);
               armykind  := QcodeDisp('I031',FieldByName('armykind').AsString);
               armycl    := QcodeDisp('I034',FieldByName('armycl').AsString);
               armyfield := QcodeDisp('I035',FieldByName('armyfield').AsString);
               armydis   := QcodeDisp('I036',FieldByName('armydis').AsString);
               armyex    := QcodeDisp('I037',FieldByName('armyex').AsString);
               armydate  := copy(FieldByName('armyfrdate').AsString,3,2)+'.'+
                            copy(FieldByName('armyfrdate').AsString,5,2)+'~'+
                            copy(FieldByName('armytodate').AsString,3,2)+'.'+
                            copy(FieldByName('armytodate').AsString,5,2);
               curaddr   := FieldByName('curaddr').AsString;
               regaddr   := FieldByName('regaddr').AsString;
               telno     := FieldByName('telno').AsString;
               bornarea  := QcodeDisp('I001',FieldByName('bornarea').AsString);
               bcarym    := FormatFloat('00',FieldByName('bcaryy').AsFloat)+
                            FormatFloat('00',FieldByName('bcarmm').AsFloat);
               tEmpno    := FieldByName('empno').AsString;
               pimsch_search(tEmpno);  {학력사항 루틴 Call}
               pimedu_search(tEmpno);  {비정규학력 루틴 Call}
               pimcar_search(tEmpno);  {입사전경력 루틴 Call}
               pimfam_search(tEmpno);  {가족사항 루틴 Call}
               pimrew_search(tEmpno);  {포상사항 루틴 Call}
               pimpun_search(tEmpno);  {징계사항 루틴 Call}
               pimlic_search(tEmpno);  {자격사항 루틴 Call}

               if gu1 <= 2 then Access(cnt);               inc(cnt);
               gubun := 'D'; system.write(tFile1,tData);
               gubun := 'P'; system.write(tFile1,tData);
               Qmas.Next;
          end; {with Qmas,tData do begin}
     end;
end;


procedure Tpia1051cForm.create_Text2;{○ 페이지 2 : 인사발령내역}
var
     cnt,i,j,ncheck : integer;
     rd  : array[1..62] of DataSource_insa2;
const
     tancode  : array[1..6] of string[3] = ('336','337','346','656','452','454');  //ancode (I300)
     tancode1 : array[1..5] of string[3] = ('341','6'  ,'4'  ,'233','243'      );
begin
     cnt := 1;
     Qmas.First;
     while not Qmas.Eof do
          with OraQuery1 do
          begin
               HelpHint('('+Qmas.FieldByName('korname').AsString+') 인사발령화일(I)을 읽고 있는 중입니다 !!.');
               Close;
               Sql.Clear;
               sql.add('select ancode,paygr,bpaygr,anfrdate,antodate,paycl,                               ');
               sql.add('       case when(anfrdate >= '''+payrachdate+''') then payra else '''' end payra, ');
	       sql.add('       case when(anfrdate <  '''+payrachdate+''') then payra else '''' end payra2,');
               sql.add('       tjobduty,annono,mark1,orgnum,deptcode from pihanno                         ');
               sql.add('where (empno = :lempno and anupdyn = ''Y'')                                       ');
               sql.add('order by anfrdate,annono,ancode                                                   ');
               ParamByName('lempno').AsString := Qmas.FieldByName('empno').AsString;
               Open;
               HelpHint('('+Qmas.FieldByName('korname').AsString+') 인사발령화일(I) 조건에 맞는 데이타 추출 !!.');
               First;

               for i := 1 to 60 do               begin                    rd[i].empno    := Qmas.FieldByName('empno').AsString;
                    rd[i].korname  := Qmas.FieldByName('korname').AsString;
                    rd[i].andate   := '';  rd[i].paygr    := '';  rd[i].bpaygr   := '';
                    rd[i].paycl    := '';  rd[i].annono   := '';  rd[i].andata   := '';
                    rd[i].tjobduty := '';  rd[i].payra    := '';  rd[i].payra2   := '';rd[i].ancode   := '';
               end;

               i := 1;
               while not OraQuery1.Eof do
               begin
                    ncheck := 0;
                    for j := 1 to 6 do
                    if copy(OraQuery1.FieldByName('ancode').AsString,1,length(trim(tancode[j]))) = tancode[j] then
                    inc(nCheck);
                    if nCheck > 0 then begin OraQuery1.Next; continue;  end;
                    if (OraQuery1.FieldByName('ancode').AsString = '341') and
                       (OraQuery1.FieldByName('paygr').AsFloat = OraQuery1.FieldByName('bpaygr').AsFloat) then
                    begin OraQuery1.Next; continue;  end;
                    rd[i].ancode   := QcodeDisp('I300',OraQuery1.FieldByName('ancode').AsString);
                    if trim(OraQuery1.FieldByName('antodate').AsString) <> '' then
                    begin
                         rd[i].andate := copy(OraQuery1.FieldByName('anfrdate').AsString,3,2)+'.'+
                                         copy(OraQuery1.FieldByName('anfrdate').AsString,5,2)+'.'+
                                         copy(OraQuery1.FieldByName('anfrdate').AsString,7,2)+'~'+
                                         copy(OraQuery1.FieldByName('antodate').AsString,3,2)+'.'+
                                         copy(OraQuery1.FieldByName('antodate').AsString,5,2)+'.'+
                                         copy(OraQuery1.FieldByName('antodate').AsString,7,2);
                    end
                    else
                    begin
                         rd[i].andate := copy(OraQuery1.FieldByName('anfrdate').AsString,3,2)+'.'+
                                         copy(OraQuery1.FieldByName('anfrdate').AsString,5,2)+'.'+
                                         copy(OraQuery1.FieldByName('anfrdate').AsString,7,2);
                    end;
                    rd[i].paygr    := FormatFloat('##',OraQuery1.FieldByName('paygr').asFloat);
                    rd[i].paycl    := QcodeDisp('I112',OraQuery1.FieldByName('paycl').asString);
                    rd[i].payra    := QcodeDisp('I113',OraQuery1.FieldByName('payra').AsString);
                    rd[i].payra2   := QcodeDisp('I113',OraQuery1.FieldByName('payra2').AsString);
                    rd[i].tjobduty := OraQuery1.FieldByName('tjobduty').AsString;
   { ----------------------------------------------------------------------------
       버전   수정일      수정자  관련근거        수정내용
       30.01  1999.12.31  윤형식  Y2k             인사발령 6자리 --> 8자리 크기변경
    ---------------------------------------------------------------------------}
   //         rd[i].annono   := copy(Qsql.FieldByName('annono').AsString,1,2)+'-'+
   //                           copy(Qsql.FieldByName('annono').AsString,3,4);
                    rd[i].annono   := copy(OraQuery1.FieldByName('annono').AsString,1,4)+'-'+
                                      copy(OraQuery1.FieldByName('annono').AsString,5,4);
                    nCheck   := 0;
                    for j := 1 to 5 do
                    if copy(OraQuery1.FieldByName('ancode').AsString,1,length(trim(tancode1[j]))) = tancode1[j] then
                    inc(nCheck);
                    if nCheck > 0 then
                    rd[i].andata := OraQuery1.FieldByName('mark1').AsString
                    else rd[i].andata := Qdeptdisp(OraQuery1.FieldByName('orgnum').AsString,
                                                   OraQuery1.FieldByName('deptcode').AsString);
                                           inc(i);
                    OraQuery1.Next;
                    if i > 60 then break;
                    end;

         for i := 1 to 60 do         begin             rd[i].gubun := 'D'; system.write(tFile2,rd[i]);
         end;
         if gu1 <= 2 then Access(cnt);
         inc(cnt); Qmas.Next;
         rd[61].gubun := 'L'; system.write(tFile2,rd[61]);
         rd[62].gubun := 'P'; system.write(tFile2,rd[62]);
     end; {while not Qmas.Eof do begin}
     OraQuery1.Close;
end;


procedure Tpia1051cForm.create_Text3;{○ 페이지 3 : 인사발령승급내역,인사고과}
var
     cnt,i : integer;
     rd    : array[1..62] of DataSource_Insa3;
begin
     cnt := 1;
     Qmas.First;
     while not Qmas.Eof do
          with OraQuery1 do
          begin
               HelpHint('('+Qmas.FieldByName('korname').AsString+') 인사발령화일(II)을 읽고 있는 중입니다 !!.');
               Close;
               Sql.Clear;
               sql.add('select  nvl((select codename from pyccode  where codeid = ''I300'' and codeno = a.ancode), '''') ancode,                                                                                                       ');
               sql.add('case when a.antodate is null then substr(a.anfrdate,3,2)||''.''||substr(a.anfrdate,5,2)||''.''||substr(a.anfrdate,7,2)                                                                                         ');
               sql.add('			     else substr(a.anfrdate,3,2)||''.''||substr(a.anfrdate,5,2)||''.''||substr(a.anfrdate,7,2)||''~''||substr(a.antodate,3,2)||''.''||substr(a.antodate,5,2)||''.''||substr(a.antodate,7,2)  ');
               sql.add('end as andate,                                                                                                                                                                                             ');
               sql.add('nvl((select codename from pyccode where codeid = ''I112'' and codeno = a.paycl), '''') paycl,                                                                                                                  ');
               sql.add('a.paygr ,                                                                                                                                                                                                  ');
               sql.add('case when a.mark1 is null then nvl((select b.deptname from pycdept b  where b.deptcode = a.deptcode and b.orgnum = a.orgnum),'''')                                                                           ');
               sql.add('                     else a.mark1                                                                                                                                                                          ');
               sql.add('end as andata,                                                                                                                                                                                             ');
               sql.add('substr(a.annono,1,4)||''-''||substr(a.annono,5,4) annono                                                                                                                                                     ');
               sql.add('from pihanno a                                                                                                                                                                                             ');
               sql.add('where (empno = :lempno and anupdyn = ''Y'')                                                                                                                                                                  ');
               sql.add('and ancode not in (''336'',''337'',''346'',''656'',''452'',''454'',''341'',''6'',''4'',''233'',''243'')                                                                                                                          ');
               sql.add('order by anfrdate,annono,ancode                                                                                                                                                                            ');
               ParamByName('lempno').AsString := Qmas.FieldByName('empno').AsString;
               Open;
               HelpHint('('+Qmas.FieldByName('korname').AsString+') 인사발령화일(II) 조건에 맞는 데이타 추출 !!.');
               First;

               for i := 1 to 60 do
               begin
                    rd[i].empno    := Qmas.FieldByName('empno').AsString;
                    rd[i].korname  := Qmas.FieldByName('korname').AsString;
                    rd[i].ancode   := '';
                    rd[i].andate   := '';  rd[i].paygr    := '';
                    rd[i].paycl    := '';  rd[i].annono   := '';  rd[i].andata   := '';
                end;

               i := 1;               while not Eof do
               begin
                    rd[i].ancode   := FieldByName('ancode').AsString;
                    rd[i].andate   := FieldByName('andate').AsString;
                    rd[i].paygr    := FieldByName('paygr').AsString;
                    rd[i].paycl    := FieldByName('paycl').AsString;
                    rd[i].andata   := FieldByName('andata').AsString;
                    rd[i].annono   := FieldByName('annono').AsString;
                    inc(i);

                    OraQuery1.Next;
                    if i > 60 then break;
               end; {while not Eof do}

               // 인사고과를 알아내어 변수에 할당한다.. ****               HelpHint('('+Qmas.FieldByName('korname').AsString+') 인사고과화일을 읽는 중입니다. !!.');
               Close;
               Sql.Clear;
               sql.add('select substr(intodate,3,2)||''.''||substr(intodate,5,2)||''.''||substr(intodate,7,2) intodate,      ');
               sql.add('       nvl((select codename from pyccode where codeid = ''I112'' and codeno = paycl), '''') paycl2,  ');
               sql.add('       adjclass ,                                                                                ');
               sql.add('       adjscore ,                                                                                ');
               sql.add('       payclrank ,                                                                               ');
               sql.add('       totrank                                                                                   ');
               sql.add('  from pihingo                                                                                   ');
               sql.add(' where (empno = :lempno) order by intodate                                                       ');
               ParamByName('lempno').AsString := Qmas.FieldByName('empno').AsString;
               Open;
               HelpHint('('+Qmas.FieldByName('korname').AsString+') 인사고과화일 조건에 맞는 데이타 추출 !!.');
               First;

               for i := 1 to 62 do
               begin
                    rd[i].intodate   := '';      rd[i].paycl2     := '';
                    rd[i].adjclass   := '';      rd[i].adjscore   := '';
                    rd[i].payclrank  := '';      rd[i].totrank    := '';
               end;

               i := 1;               while not Eof do
               begin
                    rd[i].intodate   :=  FieldByName('intodate').AsString;
                    rd[i].adjclass   :=  FieldByName('adjclass').AsString;
                    rd[i].payclrank  :=  FieldByName('payclrank').AsString;
                    rd[i].paycl2     :=  FieldByName('paycl2').AsString;
                    rd[i].adjscore   :=  FieldByName('adjscore').AsString;
                    rd[i].totrank    :=  FieldByName('totrank').AsString;
                    inc(i);

                    if i > 60 then break;
                    OraQuery1.Next;
               end; {while not Eof do}


               //인사발령 2,인사고과를 화일에 기록한다..               for i := 1 to 60 do
               begin
                    rd[i].gubun := 'D'; system.write(tFile3,rd[i]);
               end;

               if gu1 <= 2 then Access(cnt);
                  inc(cnt); Qmas.Next;
                  rd[61].gubun := 'L'; system.write(tFile3,rd[61]);
                  rd[62].gubun := 'P'; system.write(tFile3,rd[62]);

     end; {not Qmas.Eof}
     OraQuery1.Close;
end;
 
{procedure Tpia1051cForm.create_Text3;
//○ 페이지 3 : 인사발령승급내역,인사고과
var
     cnt,i,j,ncheck,sw : integer;
     rd    : array[1..62] of DataSource_Insa3;
const
     tancode : array[1..8] of string[3] = ('1','311','322','336','337','341','346','656');
begin
     cnt := 1;
     Qmas.First;
     while not Qmas.Eof do
     begin
          HelpHint('('+Qmas.FieldByName('korname').AsString+') 인사발령화일(II)을 읽고 있는 중입니다 !!.');
          Qsql.Close;
          Qsql.Sql.Clear;
          Qsql.sql.add('select ancode,paygr,rpaygr,spaygr,lpaygr,anfrdate,antodate,');
          Qsql.sql.add('       paycl,bpaycl,payra,bpayra,annono,mark1              ');
          Qsql.sql.add('from pihanno                                               ');
          Qsql.sql.add('where (empno = :lempno and anupdyn = ''Y'')                ');
          Qsql.sql.add('order by anfrdate,annono,ancode                            ');
          Qsql.ParamByName('lempno').AsString := Qmas.FieldByName('empno').AsString;
          Qsql.Open;
          HelpHint('('+Qmas.FieldByName('korname').AsString+') 인사발령화일(II) 조건에 맞는 데이타 추출 !!.');
          Qsql.First;
          for i := 1 to 60 do
          begin
              rd[i].empno    := Qmas.FieldByName('empno').AsString;
              rd[i].korname  := Qmas.FieldByName('korname').AsString;
              rd[i].ancode   := '';
              rd[i].andate   := '';  rd[i].paygr    := '';  rd[i].bpaygr   := '';
              rd[i].paycl    := '';  rd[i].annono   := '';  rd[i].andata   := '';
          end;

          i := 1;
          while not Qsql.Eof do
          begin
               rd[i].ancode   := Qsql.FieldByName('ancode').AsString;
               rd[i].andate   := Qsql.FieldByName('andate').AsString;
               rd[i].paygr    := Qsql.FieldByName('paygr').AsString;
               rd[i].paycl    := Qsql.FieldByName('paycl').AsString;
               rd[i].andata   := Qsql.FieldByName('andata').AsString;
               rd[i].annono   := Qsql.FieldByName('annono').AsString;
               inc(i);

               QSql.Next;
               if i > 60 then break;
               end;
          end; //while end

	       ncheck := 0;
               for j := 1 to 8 do
                   if copy(Qsql.FieldByName('ancode').AsString,1,length(trim(tancode[j]))) = tancode[j] then inc(nCheck);

               if (nCheck > 0) or
                  ((Qsql.FieldByName('paycl').asString <> Qsql.FieldByName('bpaycl').asString) or
                  (Qsql.FieldByName('payra').asString <> Qsql.FieldByName('bpayra').asString)) then
               begin
                    if nCheck > 0 then
                    begin
                         sw := 0;
                         rd[i].ancode   := QcodeDisp('I300',Qsql.FieldByName('ancode').AsString);
                         rd[i].andate   := copy(Qsql.FieldByName('anfrdate').AsString,3,2)+'.'+
                                           copy(Qsql.FieldByName('anfrdate').AsString,5,2)+'.'+
                                           copy(Qsql.FieldByName('anfrdate').AsString,7,2);
                         rd[i].paygr    := FormatFloat('##',Qsql.FieldByName('paygr').asFloat);
                         rd[i].paycl    := copy(QcodeDisp('I112',Qsql.FieldByName('paycl').asString),1,6);
              ----------------------------------------------------------------------------
                 버전   수정일      수정자  관련근거        수정내용
                 30.01  1999.12.31  윤형식  Y2k             인사발령 6자리 --> 8자리 크기변경
              ---------------------------------------------------------------------------
             //            rd[i].annono   := copy(Qsql.FieldByName('annono').AsString,1,2)+'-'+
             //                              copy(Qsql.FieldByName('annono').AsString,3,4);
                         rd[i].annono   := copy(Qsql.FieldByName('annono').AsString,1,4)+'-'+
                                           copy(Qsql.FieldByName('annono').AsString,5,4);
                         rd[i].andata    := Qsql.FieldByName('mark1').AsString;

                         if trim(rd[i].andata) = '' then
                         begin
                              if Qsql.FieldByName('rpaygr').asFloat > 0 then
                              begin
                                   inc(sw);
                                   rd[i].andata := '정기 '+FormatFloat('##',Qsql.FieldByName('rpaygr').asFloat);
                              end;
                              if Qsql.FieldByName('lpaygr').asFloat > 0 then
                               begin
                                    if sw > 0 then
                                       rd[i].andata := rd[i].andata+',장기 '+FormatFloat('##',Qsql.FieldByName('lpaygr').asFloat)
                                    else
                                    begin
                                        inc(sw);
                                        rd[i].andata := '장기 '+FormatFloat('##',Qsql.FieldByName('lpaygr').asFloat);
                                    end;
                              end;
                              if Qsql.FieldByName('spaygr').asFloat > 0 then
                              begin
                                   if sw > 0 then
                                      rd[i].andata := rd[i].andata+',특별 '+FormatFloat('##',Qsql.FieldByName('spaygr').asFloat)
                                   else
                                      rd[i].andata := '특별 '+FormatFloat('##',Qsql.FieldByName('spaygr').asFloat);
                              end;
                         end; //rtrim(andata) = '' then  begin
                    end
                    else
                    begin
                    Qsql.Next; continue;
               end;  //if end
               end
               else
               begin
               Qsql.Next; continue;
               end;  //if end

               inc(i);
               if i > 60 then break;
               QSql.Next;
          end; //while end

          // 인사고과를 알아내어 변수에 할당한다.. ****
          HelpHint('('+Qmas.FieldByName('korname').AsString+') 인사고과화일을 읽는 중입니다. !!.');
          Qsql.Close; Qsql.Sql.Clear;
          Qsql.sql.add('select intodate,paycl,adjclass,adjscore,');
          Qsql.sql.add('       payclrank,totrank from pihingo ');
          Qsql.sql.add('where (empno = :lempno) order by intodate');
          Qsql.ParamByName('lempno').AsString := Qmas.FieldByName('empno').AsString;
          Qsql.Open;
          HelpHint('('+Qmas.FieldByName('korname').AsString+') 인사고과화일 조건에 맞는 데이타 추출 !!.');
          Qsql.First;
          for i := 1 to 62 do
          begin
               rd[i].intodate   := '';      rd[i].paycl2     := '';
               rd[i].adjclass   := '';      rd[i].adjscore   := '';
               rd[i].payclrank  := '';      rd[i].totrank    := '';
          end;

          i := 1;
          while not Qsql.Eof do
          begin
               rd[i].intodate   :=  copy(Qsql.FieldByName('intodate').AsString,3,2)+'.'+
                                    copy(Qsql.FieldByName('intodate').AsString,5,2)+'.'+
                                    copy(Qsql.FieldByName('intodate').AsString,7,2);
               rd[i].adjclass   :=  Qsql.FieldByName('adjclass').AsString;
               rd[i].payclrank  :=  FormatFloat('####0',Qsql.FieldByName('payclrank').AsFloat);
               rd[i].paycl2     :=  QcodeDisp('I112',Qsql.FieldByName('paycl').AsString);
               rd[i].adjscore   :=  FormatFloat('##0.00',Qsql.FieldByName('adjscore').AsFloat);
               rd[i].totrank    :=  FormatFloat('####0',Qsql.FieldByName('totrank').AsFloat);
               inc(i);

               if i > 60 then break;
               QSql.Next;
          end;

          //인사발령 2,인사고과를 화일에 기록한다..
          for i := 1 to 60 do
          begin
               rd[i].gubun := 'D'; system.write(tFile3,rd[i]);
          end;

          if gu1 <= 2 then Access(cnt);
             inc(cnt); Qmas.Next;
             rd[61].gubun := 'L'; system.write(tFile3,rd[61]);
             rd[62].gubun := 'P'; system.write(tFile3,rd[62]);
     end; //not Qmas.Eof
     Qsql.Close;
end;
}procedure Tpia1051cForm.create_Text4;{○ 페이지 4 : 교육,재직의무,외국어,포상,징계}
var
     cnt    : integer;
begin
     cnt := 1; Qmas.First;
     while not Qmas.Eof do
     begin
          with Qmas,sData do
          begin
               empno     := FieldByName('empno').AsString;
               korname   := FieldByName('korname').AsString;

               pimtran_search(empno);               pimfore_search(empno);
               pimrew2_search(empno);
               pimpun2_search(empno);

               if gu1 <= 2 then Access(cnt);               Next; inc(cnt);
               gubun := 'D'; system.write(tFile4,sData);
               gubun := 'P'; system.write(tFile4,sData);
          end; {with Qmas,sData do begin}
     end; {while not Qmas.Eof do begin}
end;

{----------------------테이블 변경으로 수정-------------------------------------------------------------------}procedure Tpia1051cForm.create_Text5;
{○ 페이지 5 : 직무기록}
var
     cnt,i : integer;
     rd    : array[1..62] of DataSource_Insa5;
begin
     cnt := 1;
     Qmas.First;
     while not Qmas.Eof do
          with OraQuery1 do
          begin
               HelpHint('('+Qmas.FieldByName('korname').AsString+') 직무기록화일을 읽고 있는 중입니다 !!.');
               Close;
               SQL.Clear;
               SQL.Add('SELECT JOBFIELDNAME, DUTYKINDNAME, DUTYNAME, PAYCLNAME, DUTYDATE, YY, MM, DUTYTEXT, DUTY                     ');
               SQL.Add('from(SELECT rownum no, DECODE(rownum,num,JOBFIELDNAME, '' '') JOBFIELDNAME,                                  ');
               SQL.Add('DECODE(rownum,num,DUTYKINDNAME, '' '') DUTYKINDNAME,                                                         ');
               SQL.Add('DECODE(rownum,num,DUTYNAME, '' '')     DUTYNAME,                                                             ');
               SQL.Add('DECODE(rownum,num,PAYCLNAME, '' '')    PAYCLNAME,                                                            ');
               SQL.Add('DECODE(rownum,num,DUTYDATE, '' '')     DUTYDATE,                                                             ');
               SQL.Add('DECODE(rownum,num,YY, '' '') YY,                                                                             ');
               SQL.Add('DECODE(rownum,num,MM, '' '') MM,                                                                             ');
               SQL.Add('DUTYTEXT,                                                                                                    ');
               SQL.Add('DECODE(rownum,num,DUTY, '' '')         DUTY                                                                  ');
               SQL.Add(' FROM                                                                                                        ');
               SQL.Add(' (                                                                                                           ');
               SQL.Add('     SELECT                                                                                                  ');
               SQL.Add('      rank() over(order by a.frdutydate asc ) num,                                                           ');
               SQL.Add('      nvl(        c.jobfieldname  ,'' '') JOBFIELDNAME ,                                                     ');
               SQL.Add('      nvl(        d.dutykindname  ,'' '') DUTYKINDNAME ,                                                     ');
               SQL.Add('      nvl(DECODE(E.USEYN,''N'',''(舊)''||e.dutyname ,e.dutyname), '' '') DUTYNAME ,                          ');
               SQL.Add('      nvl(        b.payclname     ,'' '') PAYCLNAME    ,                                                     ');
               SQL.Add('      nvl(        a.frdutydate    ,'' '') || '' ~ '' ||                                                      ');
               SQL.Add('      nvl(        a.todutydate    ,'' '') DUTYDATE     ,                                                     ');
               SQL.Add('      nvl(to_char(a.dutyyy       ),''0'')||''년'' YY,                                                        ');
               SQL.Add('      nvl(to_char(a.dutymm       ),''0'')||''월'' MM,                                                        ');
               SQL.Add('      nvl(        g.dutytext      ,'' '') DUTYTEXT     ,                                                     ');
               SQL.Add('      nvl(        a.duty          ,'' '') DUTY                                                               ');
               SQL.Add('     FROM  pishrmas a,                                                                                       ');
               SQL.Add('           (select codeno, codename payclname    from pyccode where codeid = ''I112'') b,                    ');
               SQL.Add('           (select codeno, codename jobfieldname from pyccode where codeid = ''I116'') c,                    ');
               SQL.Add('           pishrdukind d,                                                                                    ');
               SQL.Add('           pishrduty e,                                                                                      ');
               SQL.Add('           pishrlevel f,                                                                                     ');
               SQL.Add('           (select 1, 0 subdutyno, empno, dutyno, dutytext    dutytext from pishrmas                         ');
               SQL.Add('            union all                                                                                        ');
               SQL.Add('                    select 2, subdutyno + 1 subdutyno, empno, dutyno, subdutytext dutytext from pishrsub) g  ');
               SQL.Add('              WHERE  a.empno = :lempno                                                                       ');
               SQL.Add('                and  a.empno = g.empno and a.dutyno = g.dutyno                                               ');
               SQL.Add('                and  a.paycl = b.codeno                                                                      ');
               SQL.Add('                and  a.JobField = c.codeno                                                                   ');
               SQL.Add('                and  a.JobField = d.JobField                                                                 ');
               SQL.Add('                and  a.dutykind = d.dutykind                                                                 ');
               SQL.Add('                and  a.JobField = e.JobField                                                                 ');
               SQL.Add('                and  a.dutykind = e.dutykind                                                                 ');
               SQL.Add('                and  a.duty = e.duty                                                                         ');
               SQL.Add('                and  a.dutylevel = f.dutylevel(+)                                                            ');
               SQL.Add('              order by a.frdutydate, a.dutytermrate desc, a.JobField, a.dutykind, a.dutyno, g.subdutyno      ');
               SQL.Add('          ) ) a                                                                                              ');
               ParamByName('lempno').AsString := Qmas.FieldByName('empno').AsString;
               Open;
               HelpHint('('+Qmas.FieldByName('korname').AsString+') 직무기록화일 조건에 맞는 데이타 추출 !!.');
               First;

 
         for i := 1 to 60 do
         begin
              rd[i].empno         := Qmas.FieldByName('empno').AsString;
              rd[i].korname       := Qmas.FieldByName('korname').AsString;
              rd[i].JOBFIELDNAME  := '';    rd[i].DUTYKINDNAME  := '';
              rd[i].DUTYNAME      := '';    rd[i].PAYCLNAME     := '';
              rd[i].DUTYDATE      := '';    rd[i].YY            := '';
              rd[i].MM            := '';    rd[i].DUTYTEXT      := '';
              rd[i].DUTY          := '';
         end;

         i := 1;
         while not OraQuery1.Eof do
         begin
              rd[i].JOBFIELDNAME   := OraQuery1.FieldByName('JOBFIELDNAME').AsString;
              rd[i].DUTYKINDNAME   := OraQuery1.FieldByName('DUTYKINDNAME').AsString;
              rd[i].DUTYNAME       := OraQuery1.FieldByName('DUTYNAME').AsString;
              rd[i].PAYCLNAME      := OraQuery1.FieldByName('PAYCLNAME').AsString;
              rd[i].DUTYDATE       := OraQuery1.FieldByName('DUTYDATE').AsString;
              rd[i].YY             := OraQuery1.FieldByName('YY').AsString;
              rd[i].MM             := OraQuery1.FieldByName('MM').AsString;
              rd[i].DUTYTEXT       := OraQuery1.FieldByName('DUTYTEXT').AsString;
              rd[i].DUTY           := OraQuery1.FieldByName('DUTY').AsString;
              inc(i);

              OraQuery1.Next;
              if i > 60 then break;
              end;


         for i := 1 to 60 do
         begin
              rd[i].gubun := 'D';
              system.write(tFile5,rd[i]);
         end;
         if gu1 <= 2 then Access(cnt);
         inc(cnt);
         Qmas.Next;


         rd[61].gubun := 'L'; system.write(tFile5,rd[61]);
         rd[62].gubun := 'P'; system.write(tFile5,rd[62]);
     end; {while not Qmas.Eof do begin}
    { Qsql.Close;}
end;

//procedure Tpia1051cForm.create_Text5;{○ 페이지 5 : 직무기록}
{var
  cnt,i : integer;
  rd    : array[1..62] of DataSource_Insa5;
begin
  cnt := 1;  Qmas.First;
  while not Qmas.Eof do begin
      HelpHint('('+Qmas.FieldByName('korname').AsString+') 직무기록화일을 읽고 있는 중입니다 !!.');
      HelpHint('('+Qmas.FieldByName('korname').AsString+') 직무기록화일 조건에 맞는 데이타 추출 !!.');
      for i := 1 to 60 do begin
         rd[i].empno    := Qmas.FieldByName('empno').AsString;
         rd[i].korname  := Qmas.FieldByName('korname').AsString;
         rd[i].jobgun   := '';    rd[i].jobline  := '';
         rd[i].jobkind  := '';    rd[i].jobdate  := '';
         rd[i].paycl    := '';    rd[i].jobduty  := '';
         rd[i].jobcode  := '';
      end;

      for i := 1 to 60 do begin          rd[i].gubun := 'D'; system.write(tFile5,rd[i]);
      end;
      if gu1 <= 2 then Access(cnt);
      inc(cnt); Qmas.Next;

      rd[61].gubun := 'L'; system.write(tFile5,rd[61]);      rd[62].gubun := 'P'; system.write(tFile5,rd[62]);
  end; {while not Qmas.Eof do begin}
 { Qsql.Close;}
//end;


// 학력사항을 읽는다..----------------------------------------------------------procedure Tpia1051cForm.pimsch_search(str : string);
var
     i : integer;
begin
     HelpHint('('+Qmas.FieldByName('korname').AsString+') 학력사항화일을 읽고 있는 중입니다 !!.');
     for i := 1 to 7 do
     begin
          tData.schgr[i]     := '';
          tData.schnm[i]     := '';
          tData.schtoym[i]   := '';
          tData.majorcode[i] := '';
          tData.schkind[i]   := '';
          tData.stopic1      := '';
          tData.stopic2      := '';
     end;

     with OraQuery1 do
     begin
          Close;
          sql.clear;
          sql.add('select schgr,schnm,schfrym,schtoym,majorcode,schkind,stopic ');
          sql.add('from pimscho where empno = :lempno order by schrank');
          ParamByName('lempno').AsString := str;
          Open;

          if RecordCount <= 0 then begin Close; system.Exit; end;          for i := 1 to 7 do begin
              tData.schgr[i]     := QcodeDisp('I221',OraQuery1.FieldByName('schgr').AsString);
              tData.schnm[i]     := FieldByName('schnm').AsString;
              tData.schtoym[i]   := copy(FieldByName('schfrym').AsString,3,2)+'.'+
                                    copy(FieldByName('schfrym').AsString,5,2)+'~'+
                                    copy(FieldByName('schtoym').AsString,3,2)+'.'+
                                    copy(FieldByName('schtoym').AsString,5,2);
              tData.majorcode[i] := QcodeDisp('I225',FieldByName('majorcode').AsString);
              tData.schkind[i]   := FieldByName('schkind').AsString;
              if tData.schgr[i] = '석사' then tData.stopic1 := FieldByName('stopic').AsString;
              if tData.schgr[i] = '박사' then tData.stopic2 := FieldByName('stopic').AsString;
              Next;
              if Eof = True then Break;
          end;
          Close;
     end;
end;

// 입사전경력사항을 읽는다..----------------------------------------------------procedure Tpia1051cForm.pimcar_search(str : string);
var
     i : integer;
begin
     HelpHint('('+Qmas.FieldByName('korname').AsString+') 입사전경력화일을 읽고 있는 중입니다 !!.');
     for i := 1 to 12 do
     begin
          tData.carplace[i] := '';
          tData.carymd[i]   := '';
          tData.cardept[i]  := '';
          tData.carjobnm[i] := '';
     end;

     with OraQuery1 do
     begin
          Close;          sql.clear;          sql.add('select carplace,cardeptnm,carfrdate,cartodate,carjobnm ');
          sql.add('from pimcarr where empno = :lempno order by carfrdate');
          ParamByName('lempno').AsString := str;
          Open;

          if RecordCount <= 0 then begin Close; system.Exit; end;          for i := 1 to 12 do begin
              tData.carplace[i]  := FieldByName('carplace').AsString;
              tData.cardept[i]   := trim(FieldByName('cardeptnm').AsString);
              tData.carymd[i]    := copy(FieldByName('carfrdate').AsString,3,2)+'.'+
                                    copy(FieldByName('carfrdate').AsString,5,2)+' ~ '+
                                    copy(FieldByName('cartodate').AsString,3,2)+'.'+
                                    copy(FieldByName('cartodate').AsString,5,2);
              tData.carjobnm[i]  := FieldByName('carjobnm').AsString;
              Next;
              if Eof = True then Break;
          end;
          Close;
     end;
end;

// 가족사항을 읽는다..----------------------------------------------------------procedure Tpia1051cForm.pimfam_search(str : string);
var
     i : integer;
begin
     HelpHint('('+Qmas.FieldByName('korname').AsString+') 가족사항화일을 읽고 있는 중입니다 !!.');
     for i := 1 to 11 do
     begin
          tData.facode[i]  := '';
          tData.faschgr[i] := '';
          tData.faname[i]  := '';
          tData.fabirth[i] := '';
          tData.faplace[i] := '';
     end;

     with OraQuery1 do
     begin
          Close;
          sql.clear;
          sql.add('select facode,faschgr,faplace,fabirthdate,faname ');
          sql.add('from pimfami where empno = :lempno order by facode,fabirthdate');
          ParamByName('lempno').AsString := str;
          Open;

          if RecordCount <= 0 then begin Close; system.Exit; end;
          for i := 1 to 11 do begin
              tData.facode[i]    := QcodeDisp('I211',FieldByName('facode').AsString);
              tData.faschgr[i]   := QcodeDisp('I221',FieldByName('faschgr').AsString);
              tData.faplace[i]   := trim(FieldByName('faplace').AsString);
              tData.fabirth[i]   := copy(FieldByName('fabirthdate').AsString,3,2);
              tData.faname[i]    := FieldByName('faname').AsString;
              Next;

              if Eof = True then Break;
          end;
          Close;
     end;
end;


// 교육사항을 읽는다..----------------------------------------------------------procedure Tpia1051cForm.pimtran_search(str : string);
var
     i : integer;
begin
     HelpHint('('+Qmas.FieldByName('korname').AsString+') 교육사항화일을 읽고 있는 중입니다 !!.');
     for i := 1 to 25 do
     begin
         sData.edutype[i]   := '';
         sData.edugubun[i]  := '';
         sData.edudate[i]   := '';
         sData.educourse[i] := '';
         sData.edutime[i]   := '';
         sData.eduscore[i]  := '';
         sData.edubigo[i]   := '';
     end;

     with OraQuery1 do
     begin
          Close;
          sql.clear;
          //sql.add('select edutype,edugubun,edufrdate,edutodate,educourse,edutime,eduscore,edubigo ');
          //sql.add('from pihtran where (empno = :lempno) order by edufrdate desc');
          sql.add('select EMPNO,                                  ');
          sql.add('       EDUORGNM   edutype,                     ');
          sql.add('	  '' ''      edugubun,                    ');
          sql.add('	  EDUFRDATE  edufrdate,                   ');
          sql.add('       EDUTODATE  edutodate,                   ');
          sql.add('       EDUCONTENT educourse,                   ');
          sql.add('       '' ''      edutime,                     ');
          sql.add('	  '' ''      eduscore,                    ');
          sql.add('       EDUBIGO    Edubigo                      ');
          sql.add('  from pimeduc                                 ');
          sql.add(' where (empno = :lempno)                       ');
          sql.add('union all                                      ');
          sql.add('select EMPNO,                                  ');
          sql.add('       (select EDU_NAME from pedu2type         ');
          sql.add('         where EDU_TYPE = a.EDU_TYPE) edutype, ');
          sql.add('	  SCORE_TYPE            edugubun,         ');
          sql.add('	  EDU_DATE_FROM         edufrdate,        ');
          sql.add('       EDU_DATE_TO           edutodate,        ');
          sql.add('       EDU_TITLE             educourse,        ');
          sql.add('       TO_CHAR(EDU_TIME)     edutime,          ');
          sql.add('	  TO_CHAR(EDU_SCORE)    eduscore,         ');
          sql.add('       '' ''                 Edubigo           ');
          sql.add('  from pedu2item  a                            ');
          sql.add(' where EDU_PASS_YN =''Y''                      ');
          sql.add('   and (empno = :lempno)                       ');
          sql.add(' order by empno, edufrdate desc                ');


          ParamByName('lempno').AsString := str;
          Open;

          if RecordCount <= 0 then begin Close; system.Exit; end;          for i := 1 to 25 do begin
              //sData.edutype[i]   := QcodeDisp('I602',FieldByName('edutype').AsString);
              //sData.edugubun[i]  := QcodeDisp('I603',FieldByName('edugubun').AsString);
              sData.edutype[i]   := FieldByName('edutype').AsString;
              sData.edugubun[i]  := FieldByName('edugubun').AsString;
              sData.edudate[i]   := copy(FieldByName('edufrdate').AsString,3,2)+'.'+
                                    copy(FieldByName('edufrdate').AsString,5,2)+'.'+
                                    copy(FieldByName('edufrdate').AsString,7,2)+' ~ '+
                                    copy(FieldByName('edutodate').AsString,3,2)+'.'+
                                    copy(FieldByName('edutodate').AsString,5,2)+'.'+
                                    copy(FieldByName('edutodate').AsString,7,2);
              sData.educourse[i] := FieldByName('educourse').AsString;
              sData.edutime[i]   := FieldByName('edutime').AsString;
              sData.eduscore[i]  := FieldByName('eduscore').AsString;
              sData.edubigo[i]   := FieldByName('edubigo').AsString;
              Next;
              if i   = 25   then Break;
              if Eof = True then Break;
          end;
          Close;
     end;
end;


// 외국어사항을 읽는다..--------------------------------------------------------procedure Tpia1051cForm.pimfore_search(str : string);
var
     i : integer;
begin
     HelpHint('('+Qmas.FieldByName('korname').AsString+') 외국어사항화일을 읽고 있는 중입니다 !!.');
     for i := 1 to 10 do
     begin
         sData.langname[i]   := '';
         sData.examname[i]   := '';
         sData.examdate[i]   := '';
         sData.score[i]      := '';
         sData.examplace[i]  := '';
     end;

     with OraQuery1 do
     begin
          Close;
          sql.clear;
          sql.add('select langname,examname,examdate,examscore1,examscore2,examscore12,examplace  ');
          sql.add('from pihfore where (empno = :lempno)  order by langname,examdate ');
          ParamByName('lempno').AsString := str;
          Open;

          if RecordCount <= 0 then begin Close; system.Exit; end;
          for i := 1 to 4 do begin
              sData.langname[i]   := FieldByName('langname').AsString;
              sData.examname[i]   := QcodeDisp('I611',FieldByName('examname').AsString);
              sData.examdate[i]   := copy(FieldByName('examdate').AsString,3,2)+'.'+
                                     copy(FieldByName('examdate').AsString,5,2)+'.'+
                                     copy(FieldByName('examdate').AsString,7,2);
       //  1.01   1998.12.22    김혜진  급호->직급, 직렬->직군. 호봉삭제,외국어점수(청취/독해)
       {    sData.score[i]      := FormatFloat('###0',OraQuery1.FieldByName('examscore').AsFloat)+' ('+
                                     FormatFloat('###0',OraQuery1.FieldByName('fullscore').AsFloat)+')';}
              sData.score[i]      := FormatFloat('###0',FieldByName('examscore12').AsFloat)+
                                    '('+ FormatFloat('###0',FieldByName('examscore1').AsFloat)+'/'+
                                         FormatFloat('###0',FieldByName('examscore2').AsFloat)+')';
              sData.examplace[i]  := FieldByName('examplace').AsString;
              Next;
              if Eof = True then Break;
          end;
          Close;
     end;
end;


// 입사전포상사항을 읽는다..----------------------------------------------------procedure Tpia1051cForm.pimrew_search(str : string);
var
     i : integer;
begin
     HelpHint('('+Qmas.FieldByName('korname').AsString+') 입사전 포상사항화일을 읽고 있는 중입니다 !!.');
     for i := 1 to 4 do
     begin
          tData.rekindnm[i] := '';
          sData.redate[i]   := '';
          tData.reorgnm[i]  := '';
          tData.recause[i]  := '';
     end;

     with OraQuery1 do
     begin
          Close;
          sql.clear;
          sql.add('select rekindnm,redate,reorgnm,recause from pimrewa ');
          sql.add('where (empno = :lempno and retime = ''1'') order by redate');
          ParamByName('lempno').AsString := str;
          Open;
          if RecordCount <= 0 then begin Close; system.Exit; end;
          for i := 1 to 4 do begin
              tData.rekindnm[i] := FieldByName('rekindnm').AsString;
              tData.redate[i]   := copy(FieldByName('redate').AsString,3,2)+'.'+
                                   copy(FieldByName('redate').AsString,5,2)+'.'+
                                   copy(FieldByName('redate').AsString,7,2);
              tData.reorgnm[i]  := FieldByName('reorgnm').AsString;
              tData.recause[i]  := FieldByName('recause').AsString;
              Next;
              if Eof = True then Break;
          end;
          Close;
     end;
end;


// 입사후포상사항을 읽는다..----------------------------------------------------procedure Tpia1051cForm.pimrew2_search(str : string);
var
     i : integer;
begin
     HelpHint('('+Qmas.FieldByName('korname').AsString+') 입사후 포상사항화일을 읽고 있는 중입니다 !!.');
     for i := 1 to 15 do
     begin
          sData.rekindnm[i] := '';
          sData.redate[i]   := '';
          sData.reorgnm[i]  := '';
          sData.recause[i]  := '';
     end;

     with OraQuery1 do
     begin
          Close;
          sql.clear;
          sql.add('select rekindnm,redate,reorgnm,recause from pimrewa ');
          sql.add('where (empno = :lempno and retime = ''2'') order by redate');
          ParamByName('lempno').AsString := str;
          Open;
          if RecordCount <= 0 then begin Close; system.Exit; end;
          for i := 1 to 15 do begin
              sData.rekindnm[i] := FieldByName('rekindnm').AsString;
              sData.redate[i]   := copy(FieldByName('redate').AsString,3,2)+'.'+
                                   copy(FieldByName('redate').AsString,5,2)+'.'+
                                   copy(FieldByName('redate').AsString,7,2);
              sData.reorgnm[i]  := FieldByName('reorgnm').AsString;
              sData.recause[i]  := FieldByName('recause').AsString;
              Next;
              if Eof = True then Break;
          end;
          Close;
     end;
end;


// 입사전징계사항을 읽는다..----------------------------------------------------procedure Tpia1051cForm.pimpun_search(str : string);
var
     i : integer;
begin
     HelpHint('('+Qmas.FieldByName('korname').AsString+') 입사전 징계사항화일을 읽고 있는 중입니다 !!.');
     for i := 1 to 4 do
     begin
          tData.pukindnm[i] := '';
          tData.puorgnm[i]  := '';
          tData.pucause[i]  := '';
     end;

     with OraQuery1 do
     begin
          Close;
          sql.clear;
          sql.add('select pukindnm,pudate,puorgnm,pucause from pimpuni ');
          sql.add('where (empno = :lempno and putime = ''1'') order by pudate');
          ParamByName('lempno').AsString := str;
          Open;
          if RecordCount <= 0 then begin Close; system.Exit; end;
          for i := 1 to 4 do begin
              tData.pukindnm[i] := FieldByName('pukindnm').AsString;
              tData.pudate[i]   := copy(FieldByName('pudate').AsString,3,2)+'.'+
                                   copy(FieldByName('pudate').AsString,5,2)+'.'+
                                   copy(FieldByName('pudate').AsString,7,2);
              tData.puorgnm[i]  := FieldByName('puorgnm').AsString;
              tData.pucause[i]  := FieldByName('pucause').AsString;
              Next;
              if Eof = True then Break;
          end;
          Close;
     end;
end;

// 입사후징계사항을 읽는다..----------------------------------------------------procedure Tpia1051cForm.pimpun2_search(str : string);
var
     i : integer;
begin
     HelpHint('('+Qmas.FieldByName('korname').AsString+') 입사후 징계사항화일을 읽고 있는 중입니다 !!.');
     for i := 1 to 15 do
     begin
          sData.pukindnm[i] := '';
          sData.pudate[i]   := '';
          sData.pucontent[i]:= '';
          sData.pucause[i]  := '';
     end;

     with OraQuery1 do
     begin
          Close;
          sql.clear;
          sql.add('select pukindnm,pudate,puorgnm,pucause,pucontent from pimpuni ');
          sql.add('where (empno = :lempno and putime = ''2'') order by pudate');
          ParamByName('lempno').AsString := str;
          Open;
          if RecordCount <= 0 then begin Close; system.Exit; end;
          for i := 1 to 15 do begin
              sData.pukindnm[i] := FieldByName('pukindnm').AsString;
              sData.pudate[i]   := copy(FieldByName('pudate').AsString,3,2)+'.'+
                                   copy(FieldByName('pudate').AsString,5,2)+'.'+
                                   copy(FieldByName('pudate').AsString,7,2);
              sData.pucontent[i]:= FieldByName('pucontent').AsString;
              sData.pucause[i]  := FieldByName('pucause').AsString;
              Next;
              if Eof = True then Break;
          end;
          Close;
     end;
end;

// 자격사항을 읽는다..----------------------------------------------------------procedure Tpia1051cForm.pimlic_search(str : string);
var
     i : integer;
begin
     HelpHint('('+Qmas.FieldByName('korname').AsString+') 자격사항화일을 읽고 있는 중입니다 !!.');
     for i := 1 to 4 do
     begin
          tData.lickind[i]     := '';
          tData.licgr[i]       := '';
          tData.licgetdate[i]  := '';
          tData.licno[i]       := '';
     end;

     with OraQuery1 do
     begin
          Close;
          sql.clear;
          sql.add('select lickind,licgr,licgetdate,licno from pimlice ');
          sql.add('where (empno = :lempno) order by licrank');
          ParamByName('lempno').AsString := str;
          Open;
          if RecordCount <= 0 then begin Close; system.Exit; end;
          for i := 1 to 6 do begin
              tData.lickind[i]    := QcodeDisp('I231',FieldByName('lickind').AsString);
              tData.licgr[i]      := QcodeDisp('I232',FieldByName('licgr').AsString);
              tData.licgetdate[i] := copy(FieldByName('licgetdate').AsString,3,2)+'.'+
                                     copy(FieldByName('licgetdate').AsString,5,2)+'.'+
                                     copy(FieldByName('licgetdate').AsString,7,2);
              tData.licno[i]      := FieldByName('licno').AsString;
              Next;
              if Eof = True then Break;
          end;
          Close;
     end;
end;

// 비정규학력사항을 읽는다..----------------------------------------------------procedure Tpia1051cForm.pimedu_search(str : string);
var
     i : integer;
begin
     HelpHint('('+Qmas.FieldByName('korname').AsString+') 비정규학력을 읽고 있는 중입니다 !!.');
     for i := 1 to 4 do
     begin
          tData.eduorgnm[i]   := '';
          tData.edudate[i]    := '';
          tData.educontent[i] := '';
     end;

     with OraQuery1 do
     begin
          Close;
          sql.clear;
          sql.add('select eduorgnm,edufrdate,edutodate,educontent from pimeduc ');
          sql.add('where (empno = :lempno) order by edufrdate');
          ParamByName('lempno').AsString := str;
          Open;
          if RecordCount <= 0 then begin Close; system.Exit; end;
          for i := 1 to 4 do begin
              tData.eduorgnm[i]   := FieldByName('eduorgnm').AsString;
              tData.edudate[i]    := copy(FieldByName('edufrdate').AsString,3,2)+'.'+
                                     copy(FieldByName('edufrdate').AsString,5,2)+'~'+
                                     copy(FieldByName('edutodate').AsString,3,2)+'.'+
                                     copy(FieldByName('edutodate').AsString,5,2);
              tData.educontent[i] := FieldByName('educontent').AsString;
              Next;
              if Eof = True then Break;
          end;
          Close;
     end;
end;


procedure Tpia1051cForm.SpeedButton1Click(Sender: TObject);begin
     FileOpen.Execute;
     Filenm.Text := FileOpen.FileName;
     Filenm.SetFocus;
end;


procedure Tpia1051cForm.DataExit(Sender: TObject);begin
     if Dataempno = True then
     begin
          if (TmaskEdit(Sender).tag = 1) then korname1.Caption := QempDisp(TmaskEdit(Sender).Text);
          if (TmaskEdit(Sender).tag = 2) then korname2.Caption := QempDisp(TmaskEdit(Sender).Text);
     end;
     Dataempno := False;
end;


procedure Tpia1051cForm.DataChange(Sender: TObject);begin
     Dataempno := True;
end;


procedure Tpia1051cForm.BdeptClick(Sender: TObject);begin
     if FreeDept = False then
     begin
          Bdept.Caption := '부서코드 해제';
     end
     else
     begin
          Bdept.Caption := '부서코드 다운';
          deptToText(HomeDir+'\pia1050c.dep','',3);
          FreeDept := False;
          system.exit;
     end;

     FreeDept := DiskSpaceCheck;

     if FreeDept = False then system.exit;
     Try
         forg := Tforg.Create(self);
         forg.filename := 'pia1050c.dep';
         forg.ShowModal;

         if forg.ModalResult <> mrYes then
         begin
              Bdept.Caption := '부서코드 다운';
              FreeDept      := False;
         end;

     Finally
         forg.Free;
     End;
end;


procedure Tpia1051cForm.FormShow(Sender: TObject);var
     CurDate : string;
     i : Integer;
begin
     EnterKey := 1;     {누르지 않았다..}
     Start    := 0;
     top      := 5;

     HomeDir  := HomeDirOpen;
     pempno   := PassEmp(cmdline,1);
     pkorname := PassEmp(cmdline,2);
     password := PassEmp(cmdline,3);
     ConditionLoop := True;
     for i := 1 to 5 do gu3[i] := 0;
     gu1 := 1; PageSel := 1;
     insa1Report := pia1052cForm.insa1Report;
     insa2Report := pia1053cForm.insa2Report;
     insa3Report := pia1054cForm.insa3Report;
     insa4Report := pia1055cForm.insa4Report;
     insa5Report := pia1056cForm.insa5Report;
     partClick(part1);
     itemClick(item1);
     SelectClick(select1);
     SelectClick(select2);
     SelectClick(select3);
     SelectClick(select4);
     empno1.SetFocus;


     if Start = 0 then
     begin
          Start := 1;
          ReSel := 1;

          HelpDsr.Caption := ' 종합인사시스템에 접속중입니다, 잠시만기다리세요...';
          Application.ProcessMessages;

          OraConnect;

          Lempno.Caption   := Pkorname + '(' + Pempno+')';
          Lsysdate.Caption := fn_GetDateStr;
          
          if copy(Pgrade,2,1) > 'C' then
          begin
               MessageBox(handle,'프로그램 사용권한이 없습니다 !!.','알 림',MB_OK or $0030);
               close;
          end;


          with OraQuery1 do //직위체계변경일
          begin
               Close;
               sql.clear;
               sql.add('select Value3 from pimvari                  ');
               sql.add('where gubun = ''00'' and sgubun = ''0001''  ');
               Open;
               payrachdate := fields[0].AsString;
               close;
          end;

          FreeCheck := DiskSpaceCheck;
          HelpDsr.Caption := '인사코드 데이타를 다운받고 있습니다 !!(잠시만 기다리세요)';
          Application.Processmessages;

          if FreeCheck = True then MakeTextFile;

          HelpDsr.Caption := '';
     end;
end;

end.
