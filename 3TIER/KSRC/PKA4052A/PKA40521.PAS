{-------------------------------------------------------------------------------
 PROGRAM-NAME   : 초과근무 현황조회(Pka4052A.exe)                                                                                 
 SYSTEM-NAME    : 초과                                                                                                            
 SUBSYSTEM-NAME : 초과수당                                                                                                        
 Programmer     : 김 태 호                                                                                                        
 Version        : 10.01                                                                                                           
 Date           : 2011.04.26                                                                                                      
                                                                                                                                  
Update Contents                                                                                                                   
  버전    수정일       수정자   수정내용                             관련근거                                                     
1.00    2011.04.26     김태호   최초개발본                           설계명세서                                                   
--------------------------------------------------------------------------------}                                                 
                                                                                                                                  
unit PKA40521;
                                                                                                                                  
interface                                                                                                                         
                                                                                                                                  
uses                                                                                                                              
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,                                                       
  ExtCtrls, OnScheme, ComCtrls, OnEditBaseCtrl, OnEditStdCtrl,                                                                    
  OnEditBtnCtrl, OnEditMdate, OnShapeLabel, OnPopupEdit, StdCtrls,                                                                
  OnFocusButton, Grids, DBGrids, OnGrDBGrid, OnInsaCommon, Db, OnTmaxPersonEdit,                                                  
  Tmax_DataSetText, OnDBGrid, Tmax_session, Mask, OnRegistry,                                                                     
  TmaxFunc, OnStringUtils, OnEditCombo, comobj ;                                                                                  
                                                                                                                                  
type                                                                                                                              
  TFM_Main = class(TForm)                                                                                                         
    SF_Main: TOnSchemeForm;                                                                                                       
    Panel1: TPanel;                                                                                                               
    SB_Help: TStatusBar;                                                                                                          
    PageControl1: TPageControl;                                                                                                   
    Panel2: TPanel;                                                                                                               
    OnShapeLabel1: TOnShapeLabel;                                                                                                 
    PA_Buttons: TPanel;                                                                                                           
    BT_Find: TOnFocusButton;                                                                                                      
    BT_Close: TOnFocusButton;                                                                                                     
    TDS_Grid: TTMaxDataSet;                                                                                                       
    DataSource1: TDataSource;                                                                                                     
    BT_Print: TOnFocusButton;                                                                                                     
    TMaxSession: TTMaxSession;                                                                                                    
    Panel3: TPanel;                                                                                                               
    ED_year: TOnComboEdit;                                                                                                        
    E_empno: TTMaxPersonPopupEdit;                                                                                                
    TDS1: TTMaxDataSet;                                                                                                           
    E_deptname: TOnEdit;                                                                                                          
    E_deptcode: TOnWinPopupEdit;                                                                                                  
    DbGrid1: TOnGrDbGrid;
    procedure BT_CloseClick(Sender: TObject);                                                                                     
    procedure EempnoInitPopup(Sender: TObject);                                                                                   
    procedure BT_FindClick(Sender: TObject);                                                                                      
    procedure EempnoCloseUp(Sender: TObject; var Text: String;                                                                    
      var Accept: Boolean);                                                                                                       
    procedure FormPaint(Sender: TObject);                                                                                         
    procedure E_deptcodeInitPopup(Sender: TObject);                                                                               
    procedure E_empnoChange(Sender: TObject);                                                                                     
    procedure E_empnoEnter(Sender: TObject);                                                                                      
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);                                                                    
    procedure E_empnoReadEnded(Sender: TObject);                                                                                  
    procedure E_deptcodeCloseUp(Sender: TObject; var Text: String;                                                                
      var Accept: Boolean);                                                                                                       
    procedure E_deptcodeKeyPress(Sender: TObject; var Key: Char);                                                                 
  private                                                                                                                         
    { Private declarations }                                                                                                      
      TempRow : Integer;                                                                                                          
  public                                                                                                                          
    { Public declarations }                                                                                                       
    FG_Date   : String[8];     //Host Date                                                                                        
    GSempno   : String[4];     //Login사번                                                                                        
    GSkorname : String[12];    //Login성명                                                                                        
    GSpass    : String;        //비밀번호                                                                                         
    GSgrade   : String;        //등급                                                                                             
    All_Flag  : Boolean ;      //if 운영자 ? True : False                                                                         
    GSorgnum  : String;        // Login조직차수                                                                                   
    GSdeptcode : String;       // Login부서코드                                                                                   
    GSdeptcode2 : String;       // Login부서코드                                                                                  
                                                                                                                                  
    Curdeptcode : String;       // 조회할 사번 부서코드                                                                           
                                                                                                                                  
    procedure Retrieve;                                                                                                           
    function StringOfDept(StringOfdeptcode : string): String;                                                                     
  end;                                                                                                                            
                                                                                                                                  
var                                                                                                                               
  FM_Main: TFM_Main;                                                                                                              
                                                                                                                                  
implementation                                                                                                                    
                                                                                                                                  
uses   PKA40522,PKA40523;                                                                                                         
                                                                                                                                  
{$R *.DFM}                                                                                                                        
                                                                                                                                  
procedure TFM_Main.BT_CloseClick(Sender: TObject);                                                                                
begin
  Close;                                                                                                                          
end;                                                                                                                              
                                                                                                                                  
                                                                                                                                  
procedure TFM_Main.Retrieve;
var
  SqlText : String;                                                                                                               
begin                                                                                                                             
  if (length(E_empno.empno) < 4)  then
  begin
      MessageDlg('조회하려는 사번을 정확히 입력하세요', mtConfirmation, [mbYes], 0);
      E_empno.SetFocus;
      exit;
  end;

                                                                                                                                  
  with TDS_Grid do
  begin
       ServiceName := 'HINSA_select10';
       Close;
       Sql.Clear;
       Sql.Add( 'SELECT OVTMYYMM, TOTDD,EXTHH, NIGHTHH, HOLIHH, OVERHH,EXTAMT, NIGHTAMT, HOLIAMT, OVERAMT FROM PKHOTSUM    ');
       Sql.Add( ' WHERE OVTMYYMM LIKE '''+  Copy(ED_year.Text,1,4) + '%''                                                   ');
       Sql.Add( '   AND EMPNO ='''+ E_empno.empno + '''                                                                    ');

       ClearFieldInfo;
       AddField('OVTMYYMM', ftString, 100);
       AddField('TOTDD'   , ftFloat, 100);
       AddField('EXTHH'   , ftFloat, 100);
       AddField('NIGHTHH' , ftFloat, 100);
       AddField('HOLIHH'  , ftFloat, 100);
       AddField('OVERHH'  , ftFloat, 100);
       AddField('EXTAMT'  , ftFloat, 100);
       AddField('NIGHTAMT', ftFloat, 100);
       AddField('HOLIAMT' , ftFloat, 100);
       AddField('OVERAMT' , ftFloat, 100);
//       sql.savetofile('c:\aa.sql');
       Open;

       FieldByName('TOTDD').Alignment := taRightJustify;
       FieldByName('EXTHH').Alignment := taRightJustify;
       FieldByName('NIGHTHH').Alignment := taRightJustify;
       FieldByName('HOLIHH').Alignment := taRightJustify;
       FieldByName('OVERHH').Alignment := taRightJustify;
       FieldByName('EXTAMT').Alignment := taRightJustify;
       FieldByName('NIGHTAMT').Alignment := taRightJustify;
       FieldByName('HOLIAMT').Alignment := taRightJustify;
       FieldByName('OVERAMT').Alignment := taRightJustify;
       TFloatField(FieldByName('EXTAMT')).DisplayFormat := '#,##0';
       TFloatField(FieldByName('NIGHTAMT')).DisplayFormat := '#,##0';
       TFloatField(FieldByName('HOLIAMT')).DisplayFormat := '#,##0';
       TFloatField(FieldByName('OVERAMT')).DisplayFormat := '#,##0';
  end;

  if TDS_Grid.RecordCount < 1 then
  begin
       MessageDlg('조회한사원이 조회년도 초과근무 존재하지 않습니다.', mtInformation, [mbYes], 0 );
       SB_help.Panels[1].Text := '조회한사원이 조회년도 초과근무 이력에 존재하지 않습니다.';
  end
  else
  begin
       SB_help.Panels[1].Text := '자료가 조회되었습니다.';
  end;

end;                                                                                                                              
                                                                                                                                  
                                                                                                                                  
procedure TFM_Main.EempnoInitPopup(Sender: TObject);                                                                              
begin                                                                                                                             
  if All_Flag then                                                                                                                
    begin                                                                                                                         
      EmpForm.GSorgnumS    := Trim(GSorgnum);                                                                                     
      EmpForm.GSdeptcodeS  := Trim(StringOfDept(Curdeptcode));                                                                    
    end                                                                                                                           
  else                                                                                                                            
    begin                                                                                                                         
      EmpForm.GSorgnumS    := Trim(GSorgnum);                                                                                     
      EmpForm.GSdeptcodeS  := Trim(StringOfDept(GSdeptcode));                                                                     
    end;
                                                                                                                                  
  EmpForm.Edit         := TOnWinPopupEdit(Sender);
  EmpForm.E_Cond.Text  := '';                                                                                                     
  EmpForm.E_condButtonClick(Sender,0);                                                                                            
                                                                                                                                  
  TOnWinPopupEdit(Sender).PopupControl := EmpForm ;                                                                               
                                                                                                                                  
end;                                                                                                                              
                                                                                                                                  
function TFM_Main.StringOfDept(StringOfdeptcode : string): String;                                                                
var                                                                                                                               
  LengthOfDept : Integer;                                                                                                         
begin                                                                                                                             
  for LengthOfDept := Length(StringOfdeptcode) downto 1  do begin                                                                 
    if Copy(StringOfdeptcode,LengthOfDept,1) <> '0' then begin                                                                    
      StringOfDept := Copy(StringOfdeptcode,1,LengthOfDept);                                                                      
      Exit;                                                                                                                       
    end;                                                                                                                          
  end;                                                                                                                            
end;                                                                                                                              
                                                                                                                                  
                                                                                                                                  
procedure TFM_Main.BT_FindClick(Sender: TObject);
begin
  Retrieve;
end;
                                                                                                                                  
procedure TFM_Main.EempnoCloseUp(Sender: TObject; var Text: String;                                                               
  var Accept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
    begin                                                                                                                         
      E_empno.Text    := EmpForm.GSempnoS ;
      //E_Deptname.Text := EmpForm.GSdeptnameS;
      Retrieve;
    end;
end;

procedure TFM_Main.FormPaint(Sender: TObject);
var
  FL_IDate: Integer;
  FL_Date : String;                                                                                                               
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;                                                                                                    
  SF_Main.Refresh;                                                                                                                
  SB_help.Panels[1].Text := '인사시스템에 접속 중입니다...';                                                                      
                                                                                                                                  
  ///////////////////////////////////////////////////////////////////////                                                         
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';                                                                           
  TMaxSession.LabelName   := 'HANAROHPER';                                                                                        
  TMaxSession.Connect  := False;                                                                                                  
  TMaxSession.Host     := Hinsa_Param(cmdline,10);                                                                                
  TMaxSession.Port     := '9999';                                                                                                 
                                                                                                                                  
  try                                                                                                                             
    TMaxSession.Connect := True;                                                                                                  
  except                                                                                                                          
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);                                                              
    Application.Terminate;                                                                                                        
    Exit;                                                                                                                         
  end;                                                                                                                            
                                                                                                                                  
  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.                                                                       
  FM_Tmax := TFM_Tmax.Create(Self);                                                                                               
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then             
    Application.Terminate;                                                                                                        
  ///////////////////////////////////////////////////////////////////////                                                         

  SB_help.Panels[1].Text := '';                                                                                                   
                                                                                                                                  
  Application.ProcessMessages;                                                                                                    
  GSempno   := Hinsa_Param(cmdLine,1);                                                                                            
  GSkorname := Hinsa_Param(cmdLine,2);                                                                                            
  GSpass    := Hinsa_Param(cmdLine,3);                                                                                            
  GSgrade   := Hinsa_Param(cmdLine,4);                                                                                            
                                                                                                                                  
  if ( GSgrade[2] <'C' ) or (GSgrade[3] <'C' ) then  All_Flag := True  //운영자
  else                                               All_Flag := False;
                                                                                                                                  
  //if All_Flag = False then Eempno.Enabled := False;                                                                             
                                                                                                                                  
                                                                                                                                  
                                                                                                                                  
  FM_Tmax           := TFM_Tmax.Create(Self);                                                                                     
  FM_Tmax.T_Session := TMaxSession;                                                                                               
  FG_Date           := FM_Tmax.GetData('sysdate','','');                                                                          
                                                                                                                                  
  E_empno.Text        := GSempno;                                                                                                 
                                                                                                                                  
                                                                                                                                  
  SB_help.Panels[1].Text := ' 작업자의 조직차수,부서코드,본부코드 설정중...';                                                     
                                                                                                                                  
                                                                                                                                  
  with TDS1 do                                                                                                                    
  begin                                                                                                                           
       ServiceName := 'HINSA_select';                                                                                             
       Close;                                                                                                                     
       Sql.Clear;                                                                                                                 
       Sql.Add ('Select Eempno, ''field2'', ''field3'', ''field4'', ''field5'' ');                                                
       Sql.Add ('  from pimeemp            ');                                                                                    
       Sql.Add (' where Eempno   = '''+ GSempno +'''  ');                                                                         
                                                                                                                                  
       ClearFieldInfo;                                                                                                            
       AddField('field1' ,  ftString, 100);                                                                                       
       AddField('field2' ,  ftString, 100);                                                                                       
       AddField('field3' ,  ftString, 100);                                                                                       
       AddField('field4' ,  ftString, 100);                                                                                       
       AddField('field5' ,  ftString, 100);                                                                                       
       Open;                                                                                                                      
                                                                                                                                  
  end;                                                                                                                            
                                                                                                                                  
  FL_Date    := Copy(FG_Date,1,4);                                                                                                

  if not IsNumber(FL_Date) then                                                                                                   
    System.Exit;                                                                                                                  
                                                                                                                                  
  FL_IDate := GetStrToint(FL_Date);                                                                                               
  ED_year.Items.Clear;                                                                                                            
  ED_year.KeyItems.Clear;                                                                                                         
  ED_year.Items.Add(IntToStr(FL_IDate-1)+' 년');                                                                                  
  ED_year.Items.Add(FL_Date+' 년');                                                                                               
  ED_year.Items.Add(IntToStr(FL_IDate+1)+' 년');                                                                                  
  ED_year.KeyItems.Add(IntToStr(FL_IDate-1));                                                                                     
  ED_year.KeyItems.Add(FL_Date);                                                                                                  
  ED_year.KeyItems.Add(IntToStr(FL_IDate+1));                                                                                     
  ED_year.ItemIndex := 1;                                                                                                         
                                                                                                                                  
//  FG_Month := Copy(FG_Date,5,2);                                                                                                
                                                                                                                                  
     if ( GSgrade[2] <'C' ) or (GSgrade[3] <'C' ) then
     begin                                                                                                                        
          E_empno.Enabled := True;                                                                                                
          E_empno.Text  := GSempno;                                                                                               
          E_empno.empno := E_empno.Text;                                                                                          
          E_empno.PL_get_singledata;
          GSorgnum  := E_empno.orgnum;
     end
     else if TDS1.FieldByName('field1').AsString <> ''  then                                                                      
     begin
          E_empno.Enabled := True;
          E_empno.text := GSempno;                                                                                                
                                                                                                                                  
          E_empno.Text := GSempno;                                                                                                
          E_empno.Sql  := 'SELECT A.empno,   A.korname,    A.paycl,   A.payra,   A.orgnum,   A.deptcode, A.pstate,  '+            
                          '       D.codename payraname,    C.codename payclname, B.deptname, B.deptna3,  B.extcode, '+
                          '       A.empdate, A.orgempdate, A.juminid, A.jobdept                                     '+            
                          '  FROM pycdept B, pyccode C, pyccode D, pimpmas A                                        '+            
                          ' WHERE D.codeid(+) = ''I113''                                                            '+            
                          '   AND A.payra     = D.codeno(+)                                                         '+            
                          '   AND C.codeid(+) = ''I112''                                                            '+            
                          '   AND A.paycl     = C.codeno(+)                                                         '+            
                          '   AND A.orgnum    = B.orgnum(+)                                                         '+            
                          '   AND A.jobdept   = B.deptcode(+)                                                       '+            
                          '   AND (A.empno    = ''%s'' OR A.korname = ''%s'') ';                                                  
                                                                                                                                  

           E_empno.empno := E_empno.Text;
           E_empno.PL_get_singledata;
           GSorgnum  := E_empno.orgnum;                                                                                           
           GSdeptcode         := E_empno.jobdept;                                                                                 
           E_deptname.Text    := E_empno.deptname ;
     end
     else
     begin                                                                                                                        
          MessageDlg('현재는 사용 하실 수가 없습니다.  ', mtInformation,[mbOk], 0);
          Close;                                                                                                                  
          System.Exit;                                                                                                            
     end;

    FM_Tmax           := TFM_Tmax.Create(Self);
    FM_Tmax.T_Session := TMaxSession;
    E_deptname.Text   := FM_Tmax.GetData('deptname',GSorgnum,E_deptcode.Text) ;

    SB_help.Panels[1].Text := '조회할 사번을 입력후 Enter Key를 치세요..';
    SendMessage(SB_help.handle,WM_PAINT,0,0);                                                                                     
end;                                                                                                                              
                                                                                                                                  
procedure TFM_Main.E_deptcodeInitPopup(Sender: TObject);                                                                          
begin                                                                                                                             
  if All_Flag then                                                                                                                
  begin                                                                                                                           
       DeptForm.GSdeptcodeS  := '';                                                                                               
  end                                                                                                                             
  else                                                                                                                            
  begin                                                                                                                           
       DeptForm.GSdeptcodeS  := Trim(StringOfDept(GSdeptcode));                                                                   
  end;                                                                                                                            
                                                                                                                                  
  DeptForm.Edit         := TOnWinPopupEdit(Sender);                                                                               
                                                                                                                                  
  //2016.10.31 jissi  해당팀장님의 근태결재부서 전부 나오도록 수정                                                                
  DeptForm.FG_empno     := Self.GSempno;                                                                                          
  DeptForm.FG_date      := Copy(Self.FG_date,1,8);                                                                                
  DeptForm.FG_Grade     := Self.GSGrade;                                                                                          

  DeptForm.E_condButtonClick(Sender,0);
                                                                                                                                  
  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;                                                                              
end;                                                                                                                              
                                                                                                                                  
procedure TFM_Main.E_empnoChange(Sender: TObject);                                                                                
begin
     E_empno.Param_deptcode := E_deptCode.Text;
end;                                                                                                                              
                                                                                                                                  
procedure TFM_Main.E_empnoEnter(Sender: TObject);                                                                                 
begin                                                                                                                             
  E_empno.Sql  := '';                                                                                                             
  E_empno.Param_deptcode := E_deptCode.Text;
end;
                                                                                                                                  
procedure TFM_Main.E_empnoKeyPress(Sender: TObject; var Key: Char);                                                               
begin                                                                                                                             
  E_empno.Param_deptcode := E_deptCode.Text;
  if Key = Chr(13) then                                                                                                           
  begin
       E_empno.empno := E_empno.Text;
       E_empno.Param_deptcode := E_deptCode.Text;                                                                                 
       E_empno.PL_get_singledata;
       GSorgnum           := E_empno.orgnum;
       E_deptcode.Text   := E_empno.jobdept;
       FM_Tmax           := TFM_Tmax.Create(Self);
       FM_Tmax.T_Session := TMaxSession;
       E_deptname.Text   := FM_Tmax.GetData('deptname',GSorgnum,E_deptcode.Text) ;
       Key := #0;
  end;                                                                                                                            
end;                                                                                                                              
                                                                                                                                  
procedure TFM_Main.E_empnoReadEnded(Sender: TObject);                                                                             
begin                                                                                                                             
//ReadEnded 이벤트가 없으면 콘트롤에 값을 뿌려주지 않고 그냥 skip 하는 문제 해결을 위해.  $00E6CCCC $00E1E1E1
  E_empno.Param_deptcode := E_deptCode.Text;
  SB_Help.Panels[1].Text :='';
  GSorgnum           := E_empno.orgnum;
  E_deptcode.Text    := E_empno.jobdept;
  FM_Tmax            := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session  := TMaxSession;
  E_deptname.Text    := FM_Tmax.GetData('deptname',GSorgnum,E_deptcode.Text) ;
  Retrieve;
end;
                                                                                                                                  
procedure TFM_Main.E_deptcodeCloseUp(Sender: TObject; var Text: String;                                                           
  var Accept: Boolean);                                                                                                           
begin
  if DeptForm.GSdeptcode <> '' then                                                                                               
    begin
      E_deptcode.Text    := DeptForm.GSdeptcode;                                                                                  
      E_deptname.Text    := DeptForm.GSdeptname;
      E_empno.Text       := '';
    end;                                                                                                                          
end;
                                                                                                                                  
procedure TFM_Main.E_deptcodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin                                                                                                                           
    if E_deptcode.Text ='' then
      begin
        FM_Tmax           := TFM_Tmax.Create(Self);
        FM_Tmax.T_Session := TMaxSession;
        //E_deptcode.Text   := FM_Tmax.GetData('deptname',GSorgnum,E_deptcode.Text);
        E_deptname.Text   := FM_Tmax.GetData('deptname',GSorgnum,E_deptcode.Text);
      end;
  end;                                                                                                                            
end;

end.

