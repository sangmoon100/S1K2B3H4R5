unit pkg30101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, IniFiles, DB, DBTables, numedit, Mask,
  MemDS, DBAccess, Ora, Func;

type
  TM_KG3010A = class(TForm)
    Panel1: TPanel;
    L_UserName: TLabel;
    L_Date: TLabel;
    Panel2: TPanel;
    P_Buttons: TPanel;
    BB_Delete: TBitBtn;
    BB_Save: TBitBtn;
    BB_Cancel: TBitBtn;
    BB_Help: TBitBtn;
    BB_Close: TBitBtn;
    P_Help: TPanel;
    ME_FixMon: TMaskEdit;
    ME_CalcMon: TMaskEdit;
    NE_WeekMaxTime: TNumberEdit;
    ME_ChasuTime: TMaskEdit;
    ME_SumEnd: TMaskEdit;
    ME_WinEnd: TMaskEdit;
    Panel4: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    SB_FixMon: TSpeedButton;
    SB_CalcMon: TSpeedButton;
    Panel9: TPanel;
    ovtmnightamt: TNumberEdit;
    Label1: TLabel;
    Qry1: TOraQuery;
    Qry2: TOraQuery;
    Panel10: TPanel;
    ovminamt: TNumberEdit;
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_DeleteClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure ME_FixMonExit(Sender: TObject);
    procedure ME_CalcMonExit(Sender: TObject);
    procedure ME_ChasuTimeExit(Sender: TObject);
    procedure ME_SumEndExit(Sender: TObject);
    procedure ME_WinEndExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_FixMonClick(Sender: TObject);
    procedure SB_CalcMonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CancelClick(Sender: TObject);
  private
    { Private declarations }
    ActiveFlag    : Boolean;
    WorkMode      : Integer;              {... 작업모드                      ...}
  public
    { Public declarations }

    CurDate       : String[20];           {... 서버날짜                      ...}
    Function   Check_All : Boolean;
    Function   Get_SysDate : String;
    Function   Check_Date( InDate : String ) : Boolean;
    Function   Check_Time( InTime : String ) : Boolean;
    Procedure  Get_Record;
    Procedure  Fill_Fields;
    Procedure  Clear_Fields;
    Procedure  Insert_Record;
    Procedure  Update_Record;
    Procedure  Delete_Record;
    Procedure  SetUp;
  end;

var
  M_KG3010A: TM_KG3010A;

implementation

{$R *.DFM}

uses FormMon1;//TimeFtp,, Pass  //Calen2 ==> FormMon1 kth

{===============================================================================
 ======================  < User Define Functions >  ============================
 ===============================================================================}

{==============================================================================
             시스템의 날짜와 시간을 읽어오는 함수.
 ==============================================================================}
Function TM_KG3010A.Get_SysDate : String;
begin
     Qry2.Close;
     Qry2.Sql.Clear;
     Qry2.Sql.Add( ' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHHMMSS'') ' );
     Qry2.Sql.Add( ' FROM   DUAL                               ' );
     Qry2.Open;
     Result := Qry2.Fields[0].AsString;
end;

{==============================================================================
         날짜를 체크하는 함수.
 ==============================================================================}
Function TM_KG3010A.Check_Date( InDate : String ) : Boolean;
var
   Buffer : String;
   Tmp    : Real;
begin
  if Length(InDate) <> 6 then
     begin
          Result := False;
          System.Exit;
     end;

  Buffer := Copy(InDate,1,4) + DateSeparator + Copy(InDate,5,2) + DateSeparator + '01';
  Try
  Tmp := StrToDate( Buffer );
  Except on EConvertError do
    begin
       Result := False;
       System.Exit;
    end;
  end;

  Result := True;
end;

{==============================================================================
        시간을 체크하는 함수.
 ==============================================================================}
Function TM_KG3010A.Check_Time( InTime : String ) : Boolean;
var
   Buffer : String;
   Tmp    : Real;
begin
     if Length(InTime) <> 4 then
     begin
          Result := False;
          System.Exit;
     end;

     Buffer := '1996-01-01' + ' ' + Copy(InTime,1,2) + TimeSeparator + Copy(InTime,3,2) ;
     Try
     Tmp := StrToDateTime( Buffer );
     Except on EConvertError do
       begin
         Result := False;
         System.Exit;
       end;
     end;

     Result := True;

end;

{==============================================================================
             '저장' 전에 Data 무결성을 체그하는 함수.
 ==============================================================================}
Function TM_KG3010A.Check_All : Boolean;
begin
     if not Check_Date( ME_FixMon.Text ) then
        begin
             P_Help.Caption := '   ''최종마감월''이 유효하지 않습니다...';
             ME_FixMon.SetFocus;
             Result := False;
             System.Exit;
        end;

     if not Check_Date( ME_CalcMon.Text ) then
        begin
             P_Help.Caption := '   ''최종집계월''이 유효하지 않습니다...';
             ME_CalcMon.SetFocus;
             Result := False;
             System.Exit;
        end;

     if not Check_Time( ME_ChasuTime.Text ) then
        begin
             P_Help.Caption := '   ''차수변경시간''이 유효하지 않습니다...';
             ME_ChasuTime.SetFocus;
             Result := False;
             System.Exit;
        end;

     if not Check_Time( ME_SumEnd.Text ) then
        begin
             P_Help.Caption := '   ''하절기퇴근시간''이 유효하지 않습니다...';
             ME_SumEnd.SetFocus;
             Result := False;
             System.Exit;
        end;

     if not Check_Time( ME_WinEnd.Text ) then
        begin
          P_Help.Caption := '   ''동절기퇴근시간''이 유효하지 않습니다...';
          ME_WinEnd.SetFocus;
          Result := False;
          System.Exit;
        end;

     Result := True;
end;

{===============================================================================
 ======================  < User Define Procedures >  ===========================
 ===============================================================================}

{==============================================================================
             현재 등록된 내역을 읽어 오는 Procedure.
 ==============================================================================}
Procedure TM_KG3010A.Get_Record;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT *                                              ' );
     Qry1.Sql.Add( ' FROM   PKCOTBAS                                       ' );
     Qry1.Open;

     if not Qry1.Eof then
        begin
             WorkMode := 1;
             Fill_Fields;
             P_Help.Caption       := '   등록된 자료에 대한 조회가 완료되었습니다...';
        end
     else
        begin
             WorkMode :=0;
             Clear_Fields;
             P_Help.Caption       := '   등록된 자료가 존재하지 않습니다...';
        end;
     Qry1.Close;
end;

{==============================================================================
          읽어온 Data를 화면에 보여주는 procedure.
 ==============================================================================}
Procedure TM_KG3010A.Fill_Fields;
begin
     ME_FixMon.Text       := Qry1.FieldByName('FixMon').AsString;
     ME_CalcMon.Text      := Qry1.FieldByName('CalcMon').AsString;
     NE_WeekMaxTime.Value := Qry1.FieldByName('WeekMaxTime').AsFloat;
     ME_ChasuTime.Text    := Qry1.FieldByName('ChasuTime').AsString;
     ME_SumEnd.Text       := Qry1.FieldByName('SumEnd').AsString;
     ME_WinEnd.Text       := Qry1.FieldByName('WinEnd').AsString;
     ovtmnightamt.Value   := Qry1.FieldByName('ovtmnightamt').AsFloat;
     ovminamt.value       := Qry1.fieldbyname('ovminamt').AsFloat;
end;

{==============================================================================
          화면을 Clear시키는 Procedure.
 ==============================================================================}
Procedure TM_KG3010A.Clear_Fields;
begin
     ME_FixMon.Text       := '';
     ME_CalcMon.Text      := '';
     NE_WeekMaxTime.Value := 0;
     ME_ChasuTime.Text    := '';
     ME_SumEnd.Text       := '';
     ME_WinEnd.Text       := '';
end;

{==============================================================================
          'Insert'를 수행하는 Procedure.
 ==============================================================================}

//dsa2000   2004.08.27  초과근무 야간식대 계산시 DB에서 읽어 오도록 하기위해 OVTMNIGHTAMT 추가.
Procedure TM_KG3010A.Insert_Record;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' INSERT INTO  PKCOTBAS ( FIXMON, CALCMON, WEEKMAXTIME,   ' );
     Qry1.Sql.Add( '        SUMEND, WINEND, CHASUTIME, WRITETIME, WRITEMAN, OVTMNIGHTAMT,OVMINAMT ) ' );
     Qry1.Sql.Add( ' VALUES ( :fixmon, :calcmon, :weekmaxtime, :sumend,      ' );
     Qry1.Sql.Add( '          :winend, :chasutime, :writetime, :writeman, :ovtmnightamt,:ovminamt )   ' );

     Qry1.ParamByName('fixmon').AsString      := ME_FixMon.Text;
     Qry1.ParamByName('calcmon').AsString     := ME_CalcMon.Text;
     Qry1.ParamByName('weekmaxtime').AsFloat  := NE_WeekMaxTime.Value;
     Qry1.ParamByName('sumend').AsString      := ME_SumEnd.Text;
     Qry1.ParamByName('winend').AsString      := ME_WinEnd.Text;
     Qry1.ParamByName('chasutime').AsString   := ME_ChasuTime.Text;
     Qry1.ParamByName('writetime').AsString   := Get_SysDate;
     Qry1.ParamByName('writeman').AsString    := PEmpNo;
     Qry1.ParamByName('ovtmnightamt').AsFloat := ovtmnightamt.value;  //dsa2000 추가 2004.08.27
     Qry1.ParamByName('ovminamt').AsFloat := ovminamt.Value;  //추가 2008.2.18

     Qry1.ExecSql;
     Qry1.Close;
     P_Help.Caption := '   새로운 데이타가 입력되었습니다...';

end;

{==============================================================================
          'Update'를 수행하는 Procedure.
 ==============================================================================}
 //dsa2000   2004.08.27  초과근무 야간식대 계산시 DB에서 읽어 오도록 하기위해 OVTMNIGHTAMT 추가.
Procedure TM_KG3010A.Update_Record;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' UPDATE   PKCOTBAS                                      ' );
     Qry1.Sql.Add( ' SET      FIXMON = :fixmon, CALCMON = :calcmon,         ' );
     Qry1.Sql.Add( '          WEEKMAXTIME = :weekmaxtime, SUMEND = :sumend, ' );
     Qry1.Sql.Add( '          WINEND = :winend, CHASUTIME = :chasutime,     ' );
     Qry1.Sql.Add( '          WRITETIME = :writetime, WRITEMAN = :writeman, ' );
     Qry1.Sql.Add( '          OVTMNIGHTAMT = :ovtmnightamt,                 ' );     //dsa2000 추가 2004.08.27
     Qry1.Sql.Add( '          OVMINAMT = :ovminamt                          ' );     //추가 2008.2.18

     Qry1.ParamByName('fixmon').AsString      := ME_FixMon.Text;
     Qry1.ParamByName('calcmon').AsString     := ME_CalcMon.Text;
     Qry1.ParamByName('weekmaxtime').AsFloat  := NE_WeekMaxTime.Value;
     Qry1.ParamByName('sumend').AsString      := ME_SumEnd.Text;
     Qry1.ParamByName('winend').AsString      := ME_WinEnd.Text;
     Qry1.ParamByName('chasutime').AsString   := ME_ChasuTime.Text;
     Qry1.ParamByName('writetime').AsString   := Get_SysDate;
     Qry1.ParamByName('writeman').AsString    := PEmpNo;
     Qry1.ParamByName('ovtmnightamt').AsFloat := ovtmnightamt.Value;  //dsa2000 추가 2004.08.27
     Qry1.ParamByName('ovminamt').AsFloat     := ovminamt.Value;  //추가 2008.2.18

     Qry1.ExecSql;
     Qry1.Close;
     P_Help.Caption := '   변경된 데이타가 저장되었습니다...';
end;

{==============================================================================
          '삭제'를 수행하는 Procedure.
 ==============================================================================}
Procedure TM_KG3010A.Delete_Record;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' DELETE  FROM PKCOTBAS                           ' );
     Qry1.ExecSql;
     Qry1.Close;

     P_Help.Caption := '   데이타가 삭제되었습니다...';
end;

{==============================================================================
         초기화를 수행하는 Procedure.
 ==============================================================================}
Procedure TM_KG3010A.SetUp;
begin
     P_Help.Caption := '   급여시스템에 접속 중입니다...';
     OraConnect;

     Application.ProcessMessages;


     CurDate             := fn_GetDateTimeStr;
     L_Date.Caption      := Copy(CurDate,1,4) + '-' + Copy(CurDate,5,2) + '-' +
                            Copy(CurDate,7,2);
     L_UserName.Caption  := PKorName+ '(' + Pempno + ')';
     Application.ProcessMessages;

     Get_Record;
end;


{==============================================================================
 ===================       Event Handlers      ================================
 ============================================================================== }

//... '종료' 버튼을 눌렀을 경우 ...
procedure TM_KG3010A.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

//... '삭제' 버튼을 누른 경우 ...
procedure TM_KG3010A.BB_DeleteClick(Sender: TObject);
begin
  if WorkMode = 1 then
     begin
     if ( IDYES = Application.MessageBox( '현재 데이타를 삭제 할까요?', '확 인', MB_YesNo ) ) then
        begin
             Delete_Record;
             WorkMode := 0;
             Clear_Fields;
        end;
     end
  else
      P_Help.Caption := '   등록이 안된 자료에 대해서는 삭제가 불가능합니다...';
end;

//... '저장' 버튼을 누른 경우 ...
procedure TM_KG3010A.BB_SaveClick(Sender: TObject);
begin
     if WorkMode = 0 then
        begin
             if Check_All then
             begin
                  Insert_Record;
                  WorkMode := 1;
             end;
        end
     else
         begin
            if Check_All then
               Update_Record;
         end;
end;

//... 'ME_FixMon'을 Exit하는 경우 ...
procedure TM_KG3010A.ME_FixMonExit(Sender: TObject);
begin
     if not Check_Date( ME_FixMon.Text ) then
        P_Help.Caption := '   ''최종마감월''이 유효하지 않습니다...';
end;

//... 'ME_CalcMon'을 Exit하는 경우 ...
procedure TM_KG3010A.ME_CalcMonExit(Sender: TObject);
begin
     if not Check_Date( ME_CalcMon.Text ) then
        P_Help.Caption := '   ''최종집계월''이 유효하지 않습니다...';
end;

//... 'ME_ChasuTime'을 Exit하는 경우 ...
procedure TM_KG3010A.ME_ChasuTimeExit(Sender: TObject);
begin
     if not Check_Time( ME_ChasuTime.Text ) then
        P_Help.Caption := '   ''차수변경시간''이 유효하지 않습니다...';
end;

//... 'ME_SumEnd'을 Exit하는 경우 ...
procedure TM_KG3010A.ME_SumEndExit(Sender: TObject);
begin
     if not Check_Time( ME_SumEnd.Text ) then
        P_Help.Caption := '   ''하절기퇴근시간''이 유효하지 않습니다...';
end;

//... 'ME_WinEnd'을 Exit하는 경우 ...
procedure TM_KG3010A.ME_WinEndExit(Sender: TObject);
begin
     if not Check_Time( ME_WinEnd.Text ) then
        P_Help.Caption := '   ''동절기퇴근시간''이 유효하지 않습니다...';
end;

//... 폼이 생성될 경우 ...
procedure TM_KG3010A.FormCreate(Sender: TObject);
begin
     ActiveFlag := True;
end;

procedure TM_KG3010A.SB_FixMonClick(Sender: TObject);
begin
    Try
        MonthForm := TMonthForm.Create(Self);
        MonthForm.ShowModal;
        if MonthForm.DayCaption <> '' then
           ME_FixMon.Text := Copy(MonthForm.DayCaption,1,6);
    Finally
        MonthForm.Free;
    End;
end;

procedure TM_KG3010A.SB_CalcMonClick(Sender: TObject);
begin
    Try 
        MonthForm := TMonthForm.Create(Self);
        MonthForm.ShowModal;
        if MonthForm.DayCaption <> '' then
           ME_CalcMon.Text := Copy(MonthForm.DayCaption,1,6);
    Finally
        MonthForm.Free;
    End;

end;

procedure TM_KG3010A.FormActivate(Sender: TObject);
begin
     if ActiveFlag then
        SetUp;
     ActiveFlag := False;
end;

procedure TM_KG3010A.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if IDYes = Application.MessageBox('종료하시겠습니까?','확 인',MB_YesNo) then
        begin
             Action := caFree
        end
     else
         Action := caNone;
end;

procedure TM_KG3010A.BB_CancelClick(Sender: TObject);
begin
     Get_Record;
end;

end.
