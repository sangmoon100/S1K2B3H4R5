unit Pki30601;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, Mask , DB,
  Ora, Func, MemDS, DBAccess ;//DBTablesm,

type
  TRec_Ptr = ^TRec;
  TRec = Record
    EmpNO       : String[04];
    KorName     : String[12];
    PayCl       : String[03];
    DrvName     : String[20];
    AppNo       : Integer;
    AppDate     : String[08];
    GiveYN      : String[01];
    GiveAmt     : LongInt;
    Index       : Integer;
    Ptr         : TRec_Ptr;
  end;

  TCodePtr = ^TCode;
  TCode = Record
     CodeNo   : String[05];
     CodeName : String[30];
     Ptr      : TCodePtr;
  end;

  TM_KI3060C = class(TForm)
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_PtrSetUp: TBitBtn;
    P_Help: TPanel;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    RB_Kind1: TRadioButton;
    ME_FromDate: TMaskEdit;
    ME_ToDate: TMaskEdit;
    GroupBox2: TGroupBox;
    RB_POrder1: TRadioButton;
    RB_POrder2: TRadioButton;
    Shape1: TShape;
    L_UserName: TLabel;
    Label4: TLabel;
    L_Date: TLabel;
    Panel12: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Label6: TLabel;
    RB_Printer: TRadioButton;
    RB_Screen: TRadioButton;
    BB_Run: TBitBtn;
    Bb_Help: TBitBtn;
    SP_FrDate: TSpeedButton;
    SP_ToDate: TSpeedButton;
    Image1: TImage;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    RB_Kind2: TRadioButton;
    RB_Kind3: TRadioButton;
    RB_Kind4: TRadioButton;
    Qry1: TOraQuery;
    procedure BB_CloseClick(Sender: TObject);
    //procedure BB_ScreenClick(Sender: TObject);
    procedure BB_PtrSetUpClick(Sender: TObject);
    procedure SP_FrDateClick(Sender: TObject);
    procedure SP_ToDateClick(Sender: TObject);
    procedure BB_RunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Success      : Boolean;
    ActiveFlag   : Boolean;
  public
    { Public declarations }
    CurDate       : String[20];           {... 서버날짜                      ...}

    ErrorHelp     : Array[0..255] of Char;
    Mem_Ptr       : TRec_Ptr;
    CI112         : TCodePtr;

    Procedure Get_Records;
    Procedure Make_Link;
    Procedure Free_Mem;
    Procedure View;
    Procedure Set_CodeTable(var First : TCodePtr; CodeID : String );
    Procedure Free_CodeTable(var First : TCodePtr );
    Procedure SetUp;

    Function  Add_Months( Month : String ; N : Integer ) : String;
    Function  Check_All : Boolean;
    Function  Check_Date( InDate : String ) : Boolean;
    Function  Get_CodeName(var Start : TCodePtr; CodeNo  : String ) : String;
  end;

var
  M_KI3060C : TM_KI3060C;
  CurDate   : String;

implementation

{$R *.DFM}

uses
    TimeFtp, Calen1, pass, Pki30602, Pki30603;

{===============================================================================
 ======================  < User Define Functions >  ===========================
 ===============================================================================}

{===============================================================================
         기준월 + N 개월한 날짜를 구하는 함수.
 ===============================================================================}
Function TM_KI3060C.Add_Months( Month : String ; N : Integer ) : String;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT  TO_CHAR( ADD_MONTHS( TO_DATE(:Month,''YYYYMM''),   ' );
     Qry1.Sql.Add( '                  :N ),''YYYYMM'' )                         ' );
     Qry1.Sql.Add( ' FROM DUAL                                                  ' );
     Qry1.ParamByName('Month').AsString := Month;
     Qry1.ParamByName('N').AsInteger    := N;
     Qry1.Open;
     Result := Qry1.Fields[0].AsString;
     Qry1.Close;
end;

{===============================================================================
         조회하기 전에 조회 조건을 검사하는 함수.
 ===============================================================================}
Function TM_KI3060C.Check_All : Boolean;
begin
     if not Check_Date(ME_FromDate.Text) then
        begin
             Result := False;
             ME_FromDate.SetFocus;
             System.Exit;
        end;

     if not Check_Date(ME_ToDate.Text) then
        begin
             Result := False;
             ME_ToDate.SetFocus;
             System.Exit;
        end;

     P_Help.Caption := '';
     Result         := True;
end;


{===============================================================================
              날짜가 정확한 지를 점검하는 함수.
 ===============================================================================}
Function TM_KI3060C.Check_Date( InDate : String ) : Boolean;
var
   Temp   : Real;
begin
     if Length(InDate) <> 8 then
        begin
             P_Help.Caption := '   신청일을 8자리로 입력하십시요...';
             Result         := False;
             System.Exit;
        end;

     InDate := Copy(InDate,1,4) + DateSeparator + Copy(InDate,5,2) + DateSeparator + Copy(InDate,7,2) ;
     Try
     Temp   := StrToDate(InDate);
     Except on EConvertError do
            begin
                 P_Help.Caption  := '   존재하지 않는 날짜입니다. 확인하시고 다시 입력하세요...';
                 Result          := False;
                 System.Exit;
            end;
     end;

     P_Help.Caption := '';
     Result         := True;
end;

{==============================================================================
         Code 테이블에서 해당 코드값에 대한 코드명을 가져오는 함수.
 ==============================================================================}
Function TM_KI3060C.Get_CodeName(var Start : TCodePtr; CodeNo  : String ) : String;
var
   Flag : Boolean;
   Cur  : TCodePtr;
begin
     Cur := Start;
     if Cur = NIL then
        begin
             Result := '';
             System.Exit;
        end;

     Flag := False;
     While (Cur^.Ptr <> Nil) do
           begin
                if Cur^.CodeNO = CodeNo then
                   begin
                        Flag := True;
                        System.Break;
                   end
                else
                   Cur := Cur^.Ptr;
           end;

     if Flag then
        Result := Cur^.CodeName
     else
        begin
             if Cur^.CodeNo = CodeNo then
                Result := Cur^.CodeName
             else
                Result := '';
        end;

end;


{===============================================================================
 ======================  < User Define Procedures >  ===========================
 ===============================================================================}

{===============================================================================
         사용자 정의 미리보기 Form을 생성하는 Procedure.
 ===============================================================================}
Procedure TM_KI3060C.View;
begin
     Try
        PreviewForm := TPreviewForm.Create(Self);
        PreviewForm.ShowModal;
     Finally
        PreviewForm.Free;
     end;
end;

{===============================================================================
              작업 조건에 맞는 Record를 얻는 Procedure.
 ===============================================================================}
Procedure TM_KI3060C.Get_Records;
var
   A : String;
begin
  Qry1.Close;
  Qry1.Sql.Clear;
  Qry1.Sql.Add( ' SELECT EMPNO, KORNAME, PAYCL, DRVNAME, APPNO, APPDATE,          ' );
  Qry1.Sql.Add( '        GIVEYN, GIVEAMT                                          ' );
  Qry1.Sql.Add( ' FROM   PKMDRAPP A, PKCDRBAS B                                   ' );
  Qry1.Sql.Add( ' WHERE (A.DRVKIND = B.DRVKIND AND A.DRVKIND LIKE :drvkind) AND   ' );
  Qry1.Sql.Add( '       (APPDATE >= :FromDate  AND APPDATE <= :ToDate )           ' );
  Qry1.Sql.Add( '       and a.paycl  between  b.payclfr and b.payclto    ' );

  if RB_POrder1.Checked then
     Qry1.Sql.Add( ' ORDER BY EMPNO         ' )
  else
     Qry1.Sql.Add( ' ORDER BY APPDATE,EMPNO ' );
  Qry1.ParamByName('FromDate').AsString := ME_FromDate.Text;
  Qry1.ParamByName('ToDate').AsString   := ME_ToDate.Text;
  if RB_Kind1.Checked then
     A := '%';
  if RB_Kind2.Checked then
     A := '1%';
  if RB_Kind3.Checked then
     A := '2%';
  if RB_Kind4.Checked then
     A := '3%';
  Qry1.ParamByName('drvkind').AsString := A;
  Qry1.Open;

  if Qry1.Eof then
     begin
          P_Help.Caption := '   해당되는 자료가 없습니다...';
          Success := False;
          Qry1.Close;
     end
  else
     begin
          Make_Link;
          Success := True;
          Qry1.Close;
     end;
end;

{===============================================================================
                Record들의  Single Linked List로 만드는 Procedure.
 ===============================================================================}
Procedure TM_KI3060C.Make_Link;
var
   i,IncValue,Progress : Integer;
   Current,Previous    : TRec_Ptr;
begin
     P_Help.Caption := '   작업조건에  맞는 자료를 추출하고 있습니다. ';

     for i := 1 to Qry1.RecordCount do
         begin
              Previous := Current;
              New(Current);
              if i = 1 then
                 Mem_Ptr := Current;

              Current^.EmpNo     := Qry1.FieldByName('EmpNo').AsString;
              Current^.KorName   := Qry1.FieldByName('KorName').AsString;
              Current^.PayCl     := Qry1.FieldByName('PayCl').AsString;
              Current^.DrvName   := Qry1.FieldByName('DrvName').AsString;
              Current^.AppNo     := Qry1.FieldByName('AppNo').AsInteger;
              Current^.AppDate   := Qry1.FieldByName('AppDate').AsString;
              Current^.GiveYN    := Qry1.FieldByName('GiveYN').AsString;
              Current^.GiveAmt   := Qry1.FieldByName('GiveAmt').AsInteger;
              Current^.Index     := i;

              if i > 1 then
                 Previous^.ptr  := Current;
              Qry1.Next;
         end;
     Current^.ptr   := NIL;
     P_Help.Caption := '   추출된 자료를 출력합니다. ';
end;

{===============================================================================
                Linked List를 해제시키는 Procedrue.
================================================================================}
Procedure TM_KI3060C.Free_Mem;
var
     Temp1,Temp2 : TRec_Ptr;
begin
     Temp1 := Mem_Ptr;
     While Temp1^.Ptr <> NIL do
           begin
                Temp2 := Temp1^.ptr;
                Dispose( Temp1 );
                Temp1 := Temp2;
           end;
     Dispose( Temp1 );
end;

{===============================================================================
         Code에 대한 Single Linked List를 만드는 Porcedure.
 ===============================================================================}
Procedure TM_KI3060C.Set_CodeTable(var First : TCodePtr; CodeID : String );
var
   Cur, Prev : TCodePtr;
   i         : Integer;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT CODENO, CODENAME                                  ' );
     Qry1.Sql.Add( ' FROM   PYCCODE                                           ' );
     Qry1.Sql.Add( ' WHERE  CODEID = :CodeID                                  ' );
     Qry1.ParamByName('codeid').AsString := CodeID;
     Qry1.Open;

     if Qry1.Eof then
        begin
             First := Nil;
             Qry1.Close;
             System.Exit;
        end;

     For i := 1 to Qry1.RecordCount do
         begin
              Prev := Cur;
              New(Cur);
              if ( i = 1) then
                 First := Cur;

              Cur^.CodeNo     := Qry1.FieldByName('CodeNo').AsString;
              Cur^.CodeName   := Qry1.FieldByName('CodeName').AsString;

              if ( i > 1 ) then
                 Prev^.ptr  := Cur;
              Qry1.Next;
         end;

     Cur^.Ptr := Nil;
     Qry1.Close;
end;

{===============================================================================
         Code에 대한 Single Linked List를 해제시키는 Porcedure.
 ===============================================================================}
Procedure TM_KI3060C.Free_CodeTable(var First : TCodePtr );
var
     Temp1,Temp2 : TCodePtr;
begin
     Temp1 := First;
     While Temp1^.Ptr <> NIL do
           begin
                Temp2 := Temp1^.ptr;
                Dispose( Temp1 );
                Temp1 := Temp2;
           end;
     Dispose( Temp1 );
end;

{==============================================================================
         초기화를 수행하는 Procedure.
 ==============================================================================}
Procedure TM_KI3060C.SetUp;
begin
     P_Help.Caption := '   급여시스템에 접속 중입니다...';
     OraConnect;
     Application.ProcessMessages;

     CurDate             := fn_GetDateTimeStr;
     L_Date.Caption      := Copy(CurDate,1,4) + '-' + Copy(CurDate,5,2) + '-' +
                            Copy(CurDate,7,2);
     L_UserName.Caption  := PKorName+ '(' + Pempno + ')';
     Application.ProcessMessages;

     P_Help.Caption := '   BAND코드에 대한 테이블 작성 중...';
     Application.ProcessMessages;
     Set_CodeTable(CI112,'I112');

     ME_FromDate.Text   := Add_Months(Copy(CurDate,1,6),-1) + '16';
     ME_ToDate.Text     := Copy(CurDate,1,6) + '15';
     P_Help.Caption     := '';
end;

{==============================================================================
 ===================       Event Handlers      ================================
 ============================================================================== }

procedure TM_KI3060C.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

{
procedure TM_KI3060C.BB_ScreenClick(Sender: TObject);
begin
  Get_Records;
  if Success then
  begin
    //QRPrinter.OnPreview := View;
    S1_KI3060c.QReport.Preview;
    Free_Mem;
  end;
end;
}

procedure TM_KI3060C.BB_PtrSetUpClick(Sender: TObject);
begin
     PrinterSetUpDialog1.Execute;
end;

procedure TM_KI3060C.SP_FrDateClick(Sender: TObject);
begin
     Try
     Calendar := TCalendar.Create(Self);
     Calendar.ShowModal;
     ME_FromDate.Text := Calendar.DayCaption;
     Finally
     Calendar.Free;
     End;
end;

procedure TM_KI3060C.SP_ToDateClick(Sender: TObject);
begin
     Try
     Calendar := TCalendar.Create(Self);
     Calendar.ShowModal;
     ME_ToDate.Text := Calendar.DayCaption;
     Finally
     Calendar.Free;
     End;
end;

procedure TM_KI3060C.BB_RunClick(Sender: TObject);
begin
     if Check_All then
        begin
             if Success then
                Free_Mem;
             Get_Records;
             if Success then
                begin
                     S1_KI3060C := TS1_KI3060C.Create(Application);
                     PreviewForm := TPreviewForm.Create(Application);

                     if RB_Screen.Checked then
                        begin
                             //QRPrinter.OnPreView := View;
                             S1_KI3060C.QReport.PreView;
                        end
                     else
                        begin
                             S1_Ki3060C.user_preview := false;
                             S1_Ki3060C.QReport.Print;
                             S1_Ki3060C.free;
                             PreviewForm.free;
                        end;
                     Screen.Cursor := CrDefault;
                     P_Help.Caption := '';
                end;
        end;
end;

procedure TM_KI3060C.FormCreate(Sender: TObject);
begin
     ActiveFlag := True;
end;

procedure TM_KI3060C.FormActivate(Sender: TObject);
begin
     if ActiveFlag then
        SetUp;
     ActiveFlag := False;
end;

procedure TM_KI3060C.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if IDYes = Application.MessageBox('종료하시겠습니까?','[확인]',MB_YesNo+MB_ICONQUESTION) then
        begin
             if CI112 <> NIL then
                Free_CodeTable(CI112);

             Action := caFree;
        end
     else
        Action := caNone;
end;

end.
