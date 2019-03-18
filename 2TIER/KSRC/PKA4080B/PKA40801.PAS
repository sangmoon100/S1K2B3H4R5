{-------------------------------------------------------------------------------
 PROGRAM-NAME   : Pka4080B.exe(개인별근태이력조회)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 근태
 Programmer     : 허  철  행
 Version        : 10.01
 Date           : 1998.05.19
Update Contents
  버전    수정일       수정자   관련근거       수정내용
   1.00   1996.09.13   허철행   설계명세서     최초개발본
   2.00   1996.10.14   허철행                  본부코드변동으로 인한수정..
  10.01   1998.05.21   이랑교   전1998.05.13   반연차항목추가
--------------------------------------------------------------------------------}

{-------------------------------------------------------------------------------
 USER LIBRARY : Kyempno
-------------------------------------------------------------------------------}
unit pka40801;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, StdCtrls, Mask, Buttons, Gauges, ExtCtrls, Kylib1,
  ComCtrls, Spin, Grids, DBGrids, DBCtrls, Kyempno, pass, Iempno, 
  Animate, Ora, MemDS, DBAccess;

type
  TFpka40301 = class(TForm)
    Phelpmsg: TPanel;
    Panel19: TPanel;
    Lempinfo: TLabel;
    Lsysdate: TLabel;
    Panel6: TPanel;
    Panel3: TPanel;
    BBprint: TBitBtn;
    BBhelp: TBitBtn;
    BBclose: TBitBtn;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Eempno: TEdit;
    PNkorname: TPanel;
    Pdeptname: TPanel;
    SBempno: TSpeedButton;
    BBsetup: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    MEduyy: TMaskEdit;
    SBup: TSpeedButton;
    SBdn: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    OraQuery1: TOraQuery;
    OraQuery2: TOraQuery;
    OraQuery1DUYYMM: TStringField;
    OraQuery1DD1: TStringField;
    OraQuery1DD2: TStringField;
    OraQuery1DD3: TStringField;
    OraQuery1DD4: TStringField;
    OraQuery1DD5: TStringField;
    OraQuery1DD6: TStringField;
    OraQuery1DD7: TStringField;
    OraQuery1DD8: TStringField;
    OraQuery1DD9: TStringField;
    OraQuery1DD10: TStringField;
    OraQuery1DD11: TStringField;
    OraQuery1DD12: TStringField;
    OraQuery1DD13: TStringField;
    OraQuery1DD14: TStringField;
    OraQuery1DD15: TStringField;
    OraQuery1DD16: TStringField;
    OraQuery1DD17: TStringField;
    OraQuery1DD18: TStringField;
    OraQuery1DD19: TStringField;
    OraQuery1DD20: TStringField;
    OraQuery1DD21: TStringField;
    OraQuery1DD22: TStringField;
    OraQuery1DD23: TStringField;
    OraQuery1DD24: TStringField;
    OraQuery1DD25: TStringField;
    OraQuery1DD26: TStringField;
    OraQuery1DD27: TStringField;
    OraQuery1DD28: TStringField;
    OraQuery1DD29: TStringField;
    OraQuery1DD30: TStringField;
    OraQuery1DD31: TStringField;
    OraQuery1d1: TStringField;
    OraQuery1d2: TStringField;
    OraQuery1d3: TStringField;
    OraQuery1d4: TStringField;
    OraQuery1d5: TStringField;
    OraQuery1d6: TStringField;
    OraQuery1d7: TStringField;
    OraQuery1d8: TStringField;
    OraQuery1d9: TStringField;
    OraQuery1d10: TStringField;
    OraQuery1d11: TStringField;
    OraQuery1d12: TStringField;
    OraQuery1d13: TStringField;
    OraQuery1d14: TStringField;
    OraQuery1d15: TStringField;
    OraQuery1d16: TStringField;
    OraQuery1d17: TStringField;
    OraQuery1d18: TStringField;
    OraQuery1d19: TStringField;
    OraQuery1d20: TStringField;
    OraQuery1d21: TStringField;
    OraQuery1d22: TStringField;
    OraQuery1d23: TStringField;
    OraQuery1d24: TStringField;
    OraQuery1d25: TStringField;
    OraQuery1d26: TStringField;
    OraQuery1d27: TStringField;
    OraQuery1d28: TStringField;
    OraQuery1d29: TStringField;
    OraQuery1d30: TStringField;
    OraQuery1d31: TStringField;
    OraQuery2DUYYMM: TStringField;
    OraQuery2EMPNO: TStringField;
    OraQuery2KORNAME: TStringField;
    OraQuery2ORGNUM: TStringField;
    OraQuery2DEPTCODE: TStringField;
    OraQuery2DD1: TStringField;
    OraQuery2DD2: TStringField;
    OraQuery2DD3: TStringField;
    OraQuery2DD4: TStringField;
    OraQuery2DD5: TStringField;
    OraQuery2DD6: TStringField;
    OraQuery2DD7: TStringField;
    OraQuery2DD8: TStringField;
    OraQuery2DD9: TStringField;
    OraQuery2DD10: TStringField;
    OraQuery2DD11: TStringField;
    OraQuery2DD12: TStringField;
    OraQuery2DD13: TStringField;
    OraQuery2DD14: TStringField;
    OraQuery2DD15: TStringField;
    OraQuery2DD16: TStringField;
    OraQuery2DD17: TStringField;
    OraQuery2DD18: TStringField;
    OraQuery2DD19: TStringField;
    OraQuery2DD20: TStringField;
    OraQuery2DD21: TStringField;
    OraQuery2DD22: TStringField;
    OraQuery2DD23: TStringField;
    OraQuery2DD24: TStringField;
    OraQuery2DD25: TStringField;
    OraQuery2DD26: TStringField;
    OraQuery2DD27: TStringField;
    OraQuery2DD28: TStringField;
    OraQuery2DD29: TStringField;
    OraQuery2DD30: TStringField;
    OraQuery2DD31: TStringField;
    OraQuery2CONYN: TStringField;
    OraQuery2ENDYN: TStringField;
    OraQuery2NORMAL: TIntegerField;
    OraQuery2LATE: TIntegerField;
    OraQuery2EARLEAVE: TIntegerField;
    OraQuery2REPOFF: TIntegerField;
    OraQuery2SPEOFF: TIntegerField;
    OraQuery2SATOFF: TIntegerField;
    OraQuery2DOMTOUR: TIntegerField;
    OraQuery2SEATOUR: TIntegerField;
    OraQuery2CORPDISP: TIntegerField;
    OraQuery2DOMDISP: TIntegerField;
    OraQuery2SEADISP: TIntegerField;
    OraQuery2EDU: TIntegerField;
    OraQuery2LODGE: TIntegerField;
    OraQuery2SPECIAL: TIntegerField;
    OraQuery2LONGWORK: TIntegerField;
    OraQuery2PUBVAC: TIntegerField;
    OraQuery2PUBSICK: TIntegerField;
    OraQuery2BEAR: TIntegerField;
    OraQuery2CELEB: TIntegerField;
    OraQuery2BIRTH: TIntegerField;
    OraQuery2HEALTH: TIntegerField;
    OraQuery2HALF: TIntegerField;
    OraQuery2MONTH: TIntegerField;
    OraQuery2YEAR: TIntegerField;
    OraQuery2SICK: TIntegerField;
    OraQuery2ABSENCE: TIntegerField;
    OraQuery2PUBREST: TIntegerField;
    OraQuery2SICKREST: TIntegerField;
    OraQuery2BABYREST: TIntegerField;
    OraQuery2MILREST: TIntegerField;
    OraQuery2STAYREST: TIntegerField;
    OraQuery2STUDYREST: TIntegerField;
    OraQuery2GENREST: TIntegerField;
    OraQuery2ETCREST: TIntegerField;
    OraQuery2ETC1: TIntegerField;
    OraQuery2ETC2: TIntegerField;
    OraQuery2ETC3: TIntegerField;
    OraQuery2ETC4: TIntegerField;
    OraQuery2ETC5: TIntegerField;
    OraQuery2HOLIDAY: TIntegerField;
    OraQuery2NOINPUT: TIntegerField;
    OraQuery2YMDEDCNT: TIntegerField;
    OraQuery2MCARDEDCNT: TIntegerField;
    OraQuery2NOPAYCNT: TIntegerField;
    OraQuery2REALDD: TIntegerField;
    OraQuery2FULLYN: TStringField;
    OraQuery2WRITETIME: TStringField;
    OraQuery2WRITEMAN: TStringField;
    OraQuery2CONTIME: TStringField;
    OraQuery2CONMAN: TStringField;
    OraQuery2MONTHDD: TIntegerField;
    OraQuery2BONCODE: TStringField;
    OraQuery2YEARHALF: TIntegerField;
    OraQuery2PRIZE: TIntegerField;
    OraQuery2EXCHANGE: TIntegerField;
    OraQuery2EXCHHOLI: TIntegerField;
    OraQuery2WALKOUT: TIntegerField;
    OraQuery2WORKSTOP: TIntegerField;
    OraQuery2BEFORE: TIntegerField;
    OraQuery2TEMPORARY: TIntegerField;
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure SBupClick(Sender: TObject);
    procedure SBdnClick(Sender: TObject);
    procedure SBempnoClick(Sender: TObject);
    procedure EempnoEnter(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBprintClick(Sender: TObject);
    procedure BBsetupClick(Sender: TObject);
    procedure OraQuery1CalcFields(DataSet: TDataSet);
    procedure PageControl1Change(Sender: TObject);

  private
    { Private declarations }
    LSsysdate : String[15];                                  // system date
    function get_Kntecode(v_value: String) : String;
    procedure Create_KnteCode;
    procedure Retrieve_Day;
    procedure Retrieve_Kind;

  public
    { Public declarations }
    GSgrade1   : String;       //등급1. 급여등급
    GSgrade2   : String;       //등급2. 인사등급
  end;

var
  Fpka40301: TFpka40301;
  Knte_code : TStringList;
  Knte_Data : TStringList;

implementation

uses Func, KeyEmpno;

{$R *.DFM}

//------------------------------ User Function ---------------------------------

function TFpka40301.get_Kntecode(v_value: String): String;
var
     i : integer;
begin

     i := knte_code.IndexOf(v_value);

     if i <> -1 then Result := knte_data.Strings[i]
                else Result := '';

end;


//------------------------------ User Procedure --------------------------------

//스트링 그리드에 근태코드, 이름값 저장.
procedure TFpka40301.Create_KnteCode;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Knte_Code := TStringList.Create;
     Knte_data := TStringList.Create;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select codeno, codename    ');
               SQL.Add('  from pyccode             ');
               SQL.Add(' where codeid = ''Y110''   ');
               Open;

               if RecordCount = 0 then Exit;

               while Not eof do
               begin
                    Knte_Code.Add(FieldByName('codeno').AsString);
                    Knte_data.Add(FieldByName('codename').AsString);
                    Next;
               end;

          end;
     Finally
          qq.Free;
     end;

end;

procedure TFpka40301.Retrieve_Day;
begin
     OraQuery1.Session := Ora_Session;

     with OraQuery1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select *                                 ');
          SQL.Add('  from pkhduty                           ');
          SQL.Add(' where duyymm like :Pduyy                ');
          SQL.Add('   and empno = :Pempno                   ');
          ParamByName('Pduyy').AsString := MEduyy.text + '%';
          ParamByName('Pempno').AsString := Eempno.Text;
          Open;

          if RecordCount <> 0 then
          begin
               PhelpMsg.Caption := ' 자료가 조회되었습니다.';
               BBhelp.setfocus;
          end
          else
          begin
               Messagebeep(1);
               PhelpMsg.Caption := ' 조회한사원이 조회년도 근태이력에 존재하지 않습니다.';
               Eempno.setfocus;
          end;
     end
end;

procedure TFpka40301.Retrieve_Kind;
begin
     OraQuery2.Session := Ora_Session;

     with OraQuery2 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select *                                 ');
          SQL.Add('  from pkhduty                           ');
          SQL.Add(' where duyymm like :Pduyy                ');
          SQL.Add('   and empno = :Pempno                   ');
          ParamByName('Pduyy').AsString := MEduyy.text + '%';
          ParamByName('Pempno').AsString := Eempno.Text;
          Open;

          if RecordCount <> 0 then
          begin
               PhelpMsg.Caption := ' 자료가 조회되었습니다.';
               BBhelp.setfocus;
          end
          else
          begin
               Messagebeep(1);
               PhelpMsg.Caption := ' 조회한사원이 조회년도 근태이력에 존재하지 않습니다.';
               Eempno.setfocus;
          end;
     end
end;



//-------------------------------- MAIN ----------------------------------------
// 화면활성시
procedure TFpka40301.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
begin


     PhelpMsg.Caption := ' 작업자, 작업일설정 및 개인별 근태이력을 조회하고 있습니다.';
     Application.ProcessMessages;

     OraConnect;

     GSgrade1  := copy(Passemp(cmdline,4),3,1);
     GSgrade2  := copy(Passemp(cmdline,4),2,1);

     LSsysdate := Fn_GetDateTimeStr;
     Lsysdate.Caption := Fn_GetDateStr;

     Lempinfo.Caption := Pkorname + '(' + Pempno + ')';

     MEduyy.Text := Copy(LSsysdate,1,4);
     Eempno.Text := Pempno;
     PNkorname.Caption := Pkorname;
     PhelpMsg.Caption := ' 작업자의 조직차수, 부서코드, 본부코드 설정중입니다.';

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select orgnum, deptcode, boncode ');
               SQL.Add('  from pimpmas                   ');
               SQL.Add(' where empno = :Pempno           ');
               ParamByName('Pempno').AsString := Pempno;
               Open;

               Pdeptname.Caption := ' '+GetDeptName(FieldByName('orgnum').AsString, FieldByName('deptcode').AsString);
          end;

     Finally
          qq.Free;
     end;

     Create_KnteCode;
     PageControl1.ActivePage := TabSheet1;
     Retrieve_Day;
     Retrieve_Kind;
     PhelpMsg.Caption := ' 작업자,작업일설정 및 개인별 근태이력을 조회를 완료했습니다.';
     SendMessage(Phelpmsg.handle,WM_PAINT,0,0);

end;

// 일자별상세내역
procedure TFpka40301.OraQuery1CalcFields(DataSet: TDataSet);
var
     i : integer;
     tmp_str : String;
begin
     for i := 1 to 31 do
     begin
          tmp_str := get_Kntecode(DataSet.FindField('DD'+Inttostr(i)).AsString);
          if tmp_str = '정상' then DataSet.FindField('d'+IntToStr(i)).AsString := '☆' + tmp_str
          else                     DataSet.FindField('d'+IntToStr(i)).AsString := tmp_str;
     end;
end;

// 조회년월
procedure TFpka40301.SBupClick(Sender: TObject);
begin
     MEduyy.Text := FormatFloat('0000',StrToFloat(MEduyy.Text)+1);
     Retrieve_Day;
     Retrieve_Kind;
end;

procedure TFpka40301.SBdnClick(Sender: TObject);
begin
     MEduyy.Text := FormatFloat('0000',StrToFloat(MEduyy.Text)-1);
     Retrieve_Day;
     Retrieve_Kind;
end;

// 자료조회
procedure TFpka40301.SBempnoClick(Sender: TObject);
begin
  // 권한 A,B,C ----------------------------------------------------------------
  if ((GSgrade1 = 'A') or (GSgrade1 = 'B') or (GSgrade1 = 'C')) or
     ((GSgrade2 = 'A') or (GSgrade2 = 'B') or (GSgrade2 = 'C')) then
  begin
       Phelpmsg.caption := ' 조회할 사원을 선택(입력)후 Enter Key 를 선택하세요!...';

       FKeyEmpno := TFKeyEmpno.Create(Self);

       try
            FKeyEmpno.EdEmpno.Text := Eempno.Text;
            FKeyEmpno.ShowModal;

            if FKeyEmpno.CloseChk = -1 then Exit;

            EEmpno.Text     := FKeyEmpno.v_KeyEmpno;
            PNKorname.Caption := FKeyEmpno.v_KeyKorname;
            Pdeptname.caption := ' '+GetDeptName(FKeyEmpno.v_KeyOrgnum, FKeyEmpno.v_KeyDeptcode);

       finally
            FKeyEmpno.Free;
       end;

       Retrieve_Day;    // 자료조회
       Retrieve_Kind;
       exit;
  end;
end;

// 조회준비
procedure TFpka40301.EempnoEnter(Sender: TObject);
begin
     Eempno.text := '';
     PNkorname.caption := '';
     Pdeptname.caption := '';
     Phelpmsg.caption := ' 조회할 사원을 선택(입력)후 Enter Key 를 선택하세요!...';
end;

// 자료조회
procedure TFpka40301.EempnoKeyPress(Sender: TObject; var Key: Char);
var
     qq : TOraQuery;
begin
  If Key = #13 then
  begin
       key := #0;

       qq := TOraQuery.Create(Nil);
       qq.Session := Ora_Session;

       Try //Try begin
            with qq do
            begin //with begin
                 Close;
                 SQL.Clear;
                 SQL.Add('select empno, korname, orgnum, deptcode  ');
                 SQL.Add('  from pimpmas                           ');
                 SQL.Add(' where empno like :Pempno                ');
                 SQL.Add('    or korname like :Pkorname            ');
                 ParamByName('Pempno').AsString := Eempno.Text + '%';
                 ParamByName('Pkorname').AsString := Eempno.Text + '%';
                 Open;

                 if RecordCount = 1 then
                 begin
                      if Not( ((GSgrade1 = 'A') or (GSgrade1 = 'B') or (GSgrade1 = 'C')) or
                              ((GSgrade2 = 'A') or (GSgrade2 = 'B') or (GSgrade2 = 'C')) ) then
                      begin
                           MessageBox(handle,'현 작업자는 동일부서의 사원만 조회할 수 있습니다.', '조회권한초과',MB_ICONEXCLAMATION);
                           exit;
                      end;

                      Eempno.text := FieldByName('empno').AsString;
                      PNkorname.caption := FieldByName('korname').AsString;
                      Pdeptname.caption := ' '+GetDeptName(FieldByName('orgnum').AsString, FieldByName('deptcode').AsString);

                      Retrieve_Day;
                      Retrieve_Kind;
                 end
                 else if RecordCount > 1 then
                 begin
                      SBempnoClick(SBempno);
                 end
                 else
                 begin
                      MessageBox(handle,'조회한사원이 존재하지 않습니다.', '조회오류',MB_ICONEXCLAMATION);
                      exit;
                 end;
            end //with end
       Finally
            qq.Free
       end; //Try end
  end;
end;

// 종료
procedure TFpka40301.BBcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFpka40301.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If IDCANCEL = Application.MessageBox('작업을 종료하시겠습니까?', '작업안내', mb_OKCancel) then
  begin
       Knte_Code.Free;
       Knte_data.Free;
       Action := caNone;
       exit;
  end;
end;

procedure TFpka40301.BBprintClick(Sender: TObject);
var
   ReturnValue : Word;
   FileName : array[0..200] of char;
   LSfilename : string;
begin
     Phelpmsg.Caption := ' 개인별근태내역서출력 프로그램 실행...';
     SendMessage(Phelpmsg.handle,WM_PAINT,0,0);

     LSfilename := homediropen+'\Bin\2Tier\pka4090c.exe ,'
                  +Passemp(cmdline, 1) +','+Passemp(cmdline, 2) +','+Passemp(cmdline, 3) +','
                  +Passemp(cmdline, 4) +','+Passemp(cmdline, 5) +','+Passemp(cmdline, 6) +','
                  +Passemp(cmdline, 7) +','+Passemp(cmdline, 8) +','+Passemp(cmdline, 9) +','
                  +Passemp(cmdline,10) +','+Passemp(cmdline,11) +','+Passemp(cmdline,12) +','
                  +Passemp(cmdline,13) +','+Passemp(cmdline,14) +','+Passemp(cmdline,15);  //2016.06.17 eyha os 보안강화로 인해 적용 14,15 추가

     Strpcopy( FileName, LSfilename );

     ReturnValue := winexec(FileName, SW_SHOWNORMAL);

     If ReturnValue < 32 then
     begin
          Case ReturnValue of
              0 :
              begin
                   MessageBox(handle,'메모리가부족하여 프로그램을 실행할 수 없습니다', '프로그램화일오류.', MB_ICONWARNING);
                   exit;
              end;
              1 :
              begin
                   MessageBox(handle,'실행화일이 아닙니다', '프로그램화일오류.', MB_ICONWARNING);
                   exit;
              end;
              2 :
              begin
                   MessageBox(handle,'개인별근태내역서 프로그램화일이 없습니다.', '프로그램화일오류.', MB_ICONWARNING);
                   exit;
              end;
              3 :
              begin
                   MessageBox(handle,'프로그램의 경로가 바르게 지정되어있지 않습니다', '프로그램화일오류.', MB_ICONWARNING);
                   exit;
              end;
          end;
     end;

     Phelpmsg.Caption := '';
     SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
end;

procedure TFpka40301.BBsetupClick(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;


procedure TFpka40301.PageControl1Change(Sender: TObject);
begin
     if PageControl1.ActivePage = TabSheet1 then Retrieve_day
     else                                        Retrieve_Kind;
end;

end.

