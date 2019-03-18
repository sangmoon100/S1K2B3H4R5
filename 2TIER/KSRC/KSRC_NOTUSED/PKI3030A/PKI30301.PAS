{* ======================= Program Header ======================================

 PROGRAM-NAME   : PKI3030A(운전 지원금 지급확인)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 지원금
 Programmer     : 이인환
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         이인환          최초개발본      설계명세서
   30.05      1999.09.15         leerk           연봉제도하에서는 호봉이 의미가 없습니다요.
============================================================================= *}

unit Pki30301;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, StdCtrls, Mask, ExtCtrls, NumCtrl, DB, DBTables,
  Gauges, numedit, Spin, Ora, MemDS, DBAccess, OraSmart, Func;

type
  TPayPtr = ^TPaytbl;
  TPaytbl = Record
     PayCl    : String[03];
     PayGr    : Real;
     ODAmt    : Real;
     ODTaxAmt : Real;
     Ptr      : TPayPtr;
  end;

  TRec_ptr  = ^TRec;
  TEdit_Ptr = ^TEdit;
  TNum_Ptr  = ^TNumberEdit;
  TME_Ptr   = ^TMaskEdit;
  TPanel_Ptr = ^TPanel;

  TFocusKind = ( Focusing, NoFocus , Disable );
  TFocusPos  = ( Front, Rear );
  TFieldPos  = ( NumberField, MaskField, EditField );

  TRec = Record
     EmpNO      : String[04];        { 사          번   }
     KorName    : String[12];        { 성          명   }
     PayCl      : String[03];        { 직          급   }
     PayGr      : Real;
     DrvKind    : String[01];        { 운전지원금구분   }
     DrvName    : String[20];        { 운전지원금구분명 }
     AppDate    : String[08];        { 신  청  일  자   }
     AppNo      : Integer;           { 신  청  횟  수   }
     DrvAmt     : Real;              { 신  청  금  액   }
     DrvTaxAmt  : Real;              { 과          세   }
     GiveAmt    : Real;              { 지  급  금  액   }
     ChGiveAmt  : Real;
     GiveYN     : String[01];        { 지  급  여  부   }
     ChGiveYN   : String[01];
     GiveDate   : String[08];        { 지  급  일  자   }
     ChGiveDate : String[08];
     LiceDate   : String[08];        { 면 허 취 득 일   }
     LiceGr     : String[20];        { 면  허  종  별   }
     LiceNo     : String[16];        { 면  허  번  호   }
     CarDate    : String[08];        { 차 량 구 입 일   }
     CarKind    : String[20];        { 차          종   }
     CarNo      : String[12];        { 차  량  번  호   }
     CarOwner   : String[04];        { 차량소유구분     }
     Index      : Integer;
     Prior      : TRec_Ptr;
     Next       : TRec_Ptr;
  End;

  { 화면의 Component들을 Acccess하기 위해 사용될 Record Type }

  TBuffer = Record
     P1   : TPanel_Ptr;
     P2   : TPanel_Ptr;
     P3   : TPanel_Ptr;
     P4   : TPanel_Ptr;
     P5   : TPanel_Ptr;
     P6   : TPanel_Ptr;
     NE   : TNum_Ptr;
     ME   : TME_Ptr;
     E    : TEdit_ptr;
     L    : ^TLabel;
  End;

  TM_KI3030A = class(TForm)
    P_Head: TPanel;
    L_UserName: TLabel;
    L_Date: TLabel;
    Button1: TButton;
    P_Key: TPanel;
    Label4: TLabel;
    Panel4: TPanel;
    CB_GiveYN: TComboBox;
    Panel5: TPanel;
    ME_FromDate: TMaskEdit;
    ME_ToDate: TMaskEdit;
    Panel96: TPanel;
    GB_Data: TGroupBox;
    L_CRB: TLabel;
    L_Number: TLabel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    P_11: TPanel;
    P_12: TPanel;
    P_13: TPanel;
    P_21: TPanel;
    P_22: TPanel;
    P_23: TPanel;
    P_31: TPanel;
    P_32: TPanel;
    P_33: TPanel;
    P_41: TPanel;
    P_42: TPanel;
    P_43: TPanel;
    P_51: TPanel;
    P_52: TPanel;
    P_53: TPanel;
    P_61: TPanel;
    P_62: TPanel;
    P_63: TPanel;
    P_71: TPanel;
    P_72: TPanel;
    P_73: TPanel;
    P_81: TPanel;
    P_82: TPanel;
    P_83: TPanel;
    P_91: TPanel;
    P_92: TPanel;
    P_93: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    P_14: TPanel;
    P_15: TPanel;
    P_24: TPanel;
    P_25: TPanel;
    P_34: TPanel;
    P_35: TPanel;
    P_44: TPanel;
    P_45: TPanel;
    P_54: TPanel;
    P_55: TPanel;
    P_64: TPanel;
    P_65: TPanel;
    P_74: TPanel;
    P_75: TPanel;
    P_84: TPanel;
    P_85: TPanel;
    P_94: TPanel;
    P_95: TPanel;
    Panel85: TPanel;
    E_18: TEdit;
    E_38: TEdit;
    E_48: TEdit;
    E_58: TEdit;
    E_68: TEdit;
    E_78: TEdit;
    E_88: TEdit;
    E_98: TEdit;
    E_28: TEdit;
    Panel6: TPanel;
    Panel8: TPanel;
    P_DrvAmtSum: TPanel;
    P_GiveAmtSum: TPanel;
    P_Button: TPanel;
    BB_Help: TBitBtn;
    BB_Close: TBitBtn;
    BB_AllAllow: TBitBtn;
    P_Help: TPanel;
    Panel9: TPanel;
    L_1: TLabel;
    L_2: TLabel;
    L_3: TLabel;
    L_4: TLabel;
    L_5: TLabel;
    L_6: TLabel;
    L_7: TLabel;
    L_8: TLabel;
    L_9: TLabel;
    ME_17: TMaskEdit;
    Panel7: TPanel;
    ME_27: TMaskEdit;
    ME_37: TMaskEdit;
    ME_47: TMaskEdit;
    ME_57: TMaskEdit;
    ME_67: TMaskEdit;
    ME_77: TMaskEdit;
    ME_87: TMaskEdit;
    ME_97: TMaskEdit;
    Gauge: TGauge;
    BB_AllCancel: TBitBtn;
    Panel10: TPanel;
    P_DrvKindName: TPanel;
    NE_16: TNumberEdit;
    NE_26: TNumberEdit;
    NE_36: TNumberEdit;
    NE_46: TNumberEdit;
    NE_56: TNumberEdit;
    NE_66: TNumberEdit;
    NE_76: TNumberEdit;
    NE_86: TNumberEdit;
    NE_96: TNumberEdit;
    SP_FromDate: TSpeedButton;
    SP_ToDate: TSpeedButton;
    SB_UpDown: TSpinButton;
    Panel1: TPanel;
    P_19: TPanel;
    P_29: TPanel;
    P_39: TPanel;
    P_49: TPanel;
    P_59: TPanel;
    P_69: TPanel;
    P_79: TPanel;
    P_89: TPanel;
    P_99: TPanel;
    P_DrvKind: TPanel;
    SB_DrvKind: TSpeedButton;
    BB_MarkY: TBitBtn;
    BB_MarkN: TBitBtn;
    BB_Save: TBitBtn;
    BB_Run: TBitBtn;
    PKHDRHIS: TOraTable;
    Pkmdrmas: TOraTable;
    Qry1: TOraQuery;
    Qry2: TOraQuery;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure BB_AllAllowClick(Sender: TObject);
    procedure BB_AllCancelClick(Sender: TObject);
    procedure SP_FromDateClick(Sender: TObject);
    procedure SP_ToDateClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BB_RunClick(Sender: TObject);
    procedure SB_UpDownUpClick(Sender: TObject);
    procedure SB_UpDownDownClick(Sender: TObject);
    procedure SB_DrvKindClick(Sender: TObject);
    procedure OnClickEvent(Sender: TObject);
    procedure CB_GiveYNDblClick(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure BB_MarkYClick(Sender: TObject);
    procedure BB_MarkNClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
  private
    { Private declarations }
    Get_RecordFlag  : Boolean;  { Query 결과의 성공 여부를 나타내는 Flag }
    ChangePermit    : Boolean;
    First,Cur,Last  : TRec_Ptr;
    CurFirst,CurLast,CurCurrent : TRec_Ptr;
    Triggered_Field : TFieldPos;
    ChangeFlag      : Boolean;
    CFlag           : Boolean;
    ActiveFlag      : Boolean;

  public
    { Public declarations }

    CurDate       : String[20];           {... 서버날짜                      ...}
    ErrorHelp     : Array[0..255] of Char;

    Function  Add_Months( Month : String ; N : Integer ) : String;
    Function  Check_BeforeLookUp : Boolean;
    Function  Check_Date( InDate : String ) : Boolean;
    Function  Make_DBLink ( Count : Integer ) : Integer;
    Function  Get_CurGiveAmtSum : String;
    Function  Check_MasterRecord ( EmpNo : String ) : Integer;
    Function  Decide_Delete_Update( CurRecord : TRec_Ptr) : Integer;
    Function  Insert_MasterRecord( CurRecord : TRec_Ptr ) : Boolean;
    Function  Check_MasterUpdate( CurRecord : TRec_Ptr )  : Boolean;
    Function  Update_MasterRecord( CurRecord : TRec_Ptr ) : Boolean;
    Function  Check_HistoryRecord ( CurRecord : TRec_Ptr  ) : Integer;
    Function  Insert_HistoryRecord ( CurRecord : TRec_Ptr  ) : Boolean;
    Function  Update_HistoryRecord ( CurRecord : TRec_Ptr  ) : Boolean;
    Function  Update_AppRecord( CurRecord : TRec_Ptr ) : Boolean;
    Function  Delete_HistoryRecord( CurRecord : TRec_Ptr ) : Boolean;
    Function  Delete_MasterRecord( CurRecord : TRec_Ptr ) : Boolean;
    Function  Cancel_HistoryRecord( CurRecord : TRec_Ptr ) : Boolean;
    Function  Cancel_MasterRecord1( CurRecord : TRec_Ptr ) : Boolean;
    Function  Cancel_MasterRecord2( CurRecord : TRec_Ptr ) : Boolean;
    Function  CanCel_AppRecord( CurRecord : TRec_Ptr ) : Boolean;

    Procedure Get_Records;
    Procedure Mapping;
    Procedure Free_DBLink ;
    Procedure Fill_FieldBuf( EndIndex : Integer ; Tag : TFocusPos );
    Procedure Clear_FieldBuf( StartIndex : Integer );
    Procedure Set_FieldAttr1( Dest : TNum_Ptr  ; FKind : TFocusKind );
    Procedure Set_FieldAttr2( Dest : TEdit_Ptr ; FKind : TFocusKind );
    Procedure Set_FieldAttr3( Dest : TME_Ptr ; FKind : TFocusKind );
    Procedure Set_FieldAttr4( Dest : TPanel_Ptr; Focus : TFocusKind );
    Procedure Process_KeyUp;
    Procedure Process_KeyDown;
    Procedure Process_OnClick( Sender : TObject );
    Procedure Get_InitialSumValue;
    Procedure Set_LineNumBer( i : Integer ; Kind : TFocusKind );
    Procedure Change_GiveYN;
    Procedure BatchSave;
    Procedure Mark_NtoY;
    Procedure BatchCancel;
    Procedure Mark_YtoN;
//    Procedure Set_PayTable;
    Procedure Free_PayTable;
    Procedure Set_ODAmts(PayCl : String; PayGr : Real; CarOwner : String;
                         var ODAmt : Real; var ODTaxAmt : Real);
    Procedure SetUp;
  end;

var
  M_KI3030A  : TM_KI3030A;
  FieldBuf   : Array[1..9] of TBuffer;
  PayPtr     : TPayPtr;
  DrvTaxAmt1 : Real;
  DrvTaxAmt2 : Real;

implementation

{$R *.DFM}

uses
   TimeFtp, Calen1, Pass, Pki30302;

{===============================================================================
 ======================  < User Define Functions >  ===========================
 ===============================================================================}

{===============================================================================
         기준월 + N 개월한 날짜를 구하는 함수.
 ===============================================================================}
Function TM_KI3030A.Add_Months( Month : String ; N : Integer ) : String;
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
         조회 전에 Data의 무결성을 Check하는 함수.
 ===============================================================================}
Function TM_KI3030A.Check_BeforeLookUp : Boolean;
var
   Tmp : String;
begin
     if not Check_Date(ME_FromDate.Text) then
        begin
             ME_FromDate.SetFocus;
             Result := False;
             System.Exit;
        end;

     if not Check_Date(ME_ToDate.Text) then
        begin
             ME_ToDate.SetFocus;
             Result := False;
             System.Exit;
        end;

     if (CB_GiveYN.Text <> '') then
        begin
             if (UpperCase(CB_GiveYN.Text) <> 'Y') AND (UpperCase(CB_GiveYN.Text) <> 'N') then
                begin
                     P_Help.Caption := '   유효한 값은 ''Y'' OR ''N''입니다...';
                     CB_GiveYN.SetFocus;
                     Result := False;
                     System.Exit;
                end;
        end;

     P_Help.Caption := '';
     Result := True;
end;

{===============================================================================
              날짜가 정확한 지를 점검하는 함수.
 ===============================================================================}
Function TM_KI3030A.Check_Date( InDate : String ) : Boolean;
var
   Temp   : Real;
begin
     if Length(InDate) <> 8 then
        begin
             P_Help.Caption := '   날짜를 8자리로 입력하십시요...';
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

{===============================================================================
       Record들의 Double Linked List를 만드는 함수.
       리턴 값은 생성된 노드(Node)의 갯수.
 ===============================================================================}
Function TM_KI3030A.Make_DBLink( Count : Integer ) : Integer;
var
  i : LongInt;
  Prev,Next,Cur : TRec_Ptr;
  A, B          : Real;
begin
     i    :=1;
     Prev := NIL;
     Cur  := NIL;
     Next := NIL;

     for i := 1 to Count do
         begin
              Try
              Prev        := Cur;
              Cur         := Next;
              New(Next);
              if i = 1 then
                 begin
                      First    := Next;
                      CurFirst := Next;
                 end;

              Next^.EmpNO      := Qry1.FieldByName('EmpNo').AsString;;
              Next^.KorName    := Qry1.FieldByName('KorName').AsString;
              Next^.PayCl      := Qry1.FieldByName('PayCl').AsString;
              Next^.PayGr      := Qry1.FieldByName('PayGr').AsFloat;
              Next^.CarOwner   := Qry1.FieldByName('CarOwner').AsString;
              Next^.AppDate    := Qry1.FieldByName('AppDate').AsString;
              Next^.AppNo      := Qry1.FieldByName('AppNo').AsInteger;
              Next^.DrvKind    := Qry1.FieldByName('DrvKind').AsString;
              Next^.DrvName    := Qry1.FieldByName('DrvName').AsString;
              if Next^.DrvKind <> '3' then begin
                 Next^.DrvAmt     := Qry1.FieldByName('DrvAmt').AsFloat;
                 Next^.DrvTaxAmt  := Qry1.FieldByName('DrvTaxAmt').AsFloat;
              end
              else
              begin // 자가 운전지원금을 가져온다.
                   Set_ODAmts(Qry1.FieldByName('PayCl').AsString,
                              Qry1.FieldByName('PayGr').AsFloat,
                              Qry1.FieldByName('CarOwner').AsString,A,B);
                   Next^.DrvAmt    := A;
                   Next^.DrvTaxAmt := B;
              end;

              Next^.GiveAmt    := Qry1.FieldByName('GiveAmt').AsFloat;
              Next^.ChGiveAmt  := Next^.GiveAmt;
              Next^.GiveYN     := Qry1.FieldByName('GiveYN').AsString;
              Next^.ChGiveYN   := Next^.GiveYN;
              Next^.GiveDate   := Qry1.FieldByName('GiveDate').AsString;
              Next^.ChGiveDate := Next^.GiveDate;
              Next^.LiceDate   := Qry1.FieldByName('LiceDate').AsString;
              Next^.LiceGr     := Qry1.FieldByName('LiceGr').AsString;
              Next^.LiceNo     := Qry1.FieldByName('LiceNO').AsString;
              Next^.CarDate    := Qry1.FieldByName('CarDate').AsString;
              Next^.CarKind    := Qry1.FieldByName('CarKind').AsString;
              Next^.CarNo      := Qry1.FieldByName('CarNo').AsString;
              Next^.Index      := i;

              Qry1.Next;

              if Prev <> NIL then
                 Prev^.Next  := Cur;

              if Cur <> NIL then
                 begin
                      Cur^.Prior  := Prev;
                      Cur^.Next   := Next;
                 end;

              Next^.Prior := Cur;
              Except On EOutofMemory  do
                     begin
                          Application.MessageBox('메모리가 부족합니다. 조회를 종료합니다.','확 인',MB_OK);
                          Result := i;
                     end;
              end;   { end try }
         end;      { end for }

         First^.Prior   := NIL;
         Next^.Next     := NIL;
         Last           := Next;
         Result         := Count;
end;

{===============================================================================
          변경된 신청금액과 지급예정금액의 합을 구하는 함수.
 ===============================================================================}
Function TM_KI3030A.Get_CurGiveAmtSum : String;
var
  Temp    : Real;
  Pointer : TRec_Ptr;
  i       : Integer;
begin
     Temp    := 0;
     Pointer := First;
     For i:= 1 to Last^.Index do begin
         if Pointer^.ChGiveYN = 'Y' then
            begin
                 Temp    := Temp + Pointer^.ChGiveAmt;
                 Pointer := Pointer^.Next;
            end
         else
             Pointer := Pointer^.Next;
     end;

     Result := FormatFloat( '#,##0', Temp );
end;

{===============================================================================
   운전지원금신청 레코드에 대한 마스터 레코드가 존재하는 지의 여부를 알려주는
   함수.
   리턴값이 1인 경우는 존재, 0인 경우는 존재하지 않음, =1 은 Query 실패의 경우를
   나타낸다.
================================================================================}
Function TM_KI3030A.Check_MasterRecord ( EmpNo : String ) : Integer;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT COUNT(*) FROM PKMDRMAS ' );
     Qry1.Sql.Add( ' WHERE  EmpNo = :pvar          ' );
     Qry1.ParamByName('Pvar').AsString := EmpNo;
     Qry1.Open;
     Result := Qry1.Fields[0].AsInteger;
     Qry1.Close;
end;

{===============================================================================
         운전지원금신청 레코드에 대한 마스터 레코드를 생성하는 함수
================================================================================}
Function TM_KI3030A.Insert_MasterRecord(CurRecord : TRec_Ptr) : Boolean;
begin
     PkmdrMas.Close;
     Try
     PkmdrMas.Open;
     PkmdrMas.Insert;
     PkmdrMas.FieldByName('EmpNo').AsString   := CurRecord^.EmpNo;
     PkmdrMas.FieldByName('KorName').AsString := CurRecord^.KorName;
     PkmdrMas.FieldByName('PayCl').AsString   := CurRecord^.PayCl;
     PkmdrMas.FieldByName('PayGr').AsFloat    := CurRecord^.PayGr;

     Case StrToInt(CurRecord^.DrvKind) of
          1 : PkmdrMas.FieldByName('LliDate').AsString := CurRecord^.ChGiveDate;
          2 : PkmdrMas.FieldByName('LtrDate').AsString := CurRecord^.ChGiveDate;
     end;

     Case StrToInt(CurRecord^.DrvKind) of
          1  : PkmdrMas.FieldByName('LiAppDate').AsString := CurRecord^.AppDate;
          2  : PkmdrMas.FieldByName('TrAppDate').AsString := CurRecord^.AppDate;
          3  : PkmdrMas.FieldByName('OdAppDate').AsString := CurRecord^.AppDate;
     end;

     Case StrToInt(CurRecord^.DrvKind) of
          1 :  PkmdrMas.FieldByName('LliAmt').AsFloat := CurRecord^.ChGiveAmt;
          2 :  PkmdrMas.FieldByName('LtrAmt').AsFloat := CurRecord^.ChGiveAmt;
     end;

     Case StrToInt(CurRecord^.DrvKind) of
          1 : PkmdrMas.FieldByName('LiSum').AsFloat := CurRecord^.ChGiveAmt;
          2 : PkmdrMas.FieldByName('TrSum').AsFloat := CurRecord^.ChGiveAmt;
     end;

     Case StrToInt (CurRecord^.DrvKind) of
          1 : PkmdrMas.FieldByName('LiAppYN').AsString  := 'Y';
          2 : PkmdrMas.FieldByName('TrAppYN').AsString  := 'Y';
          3 : PkmdrMas.FieldByName('OdAppYN').AsString  := 'Y';
     end;

     Case StrToInt (CurRecord^.DrvKind) of
          1 : PkmdrMas.FieldByName('LiAppNO').AsInteger := 1;
          2 : PkmdrMas.FieldByName('TrAppNO').AsInteger := 1;
          3 : PkmdrMas.FieldByName('ODAppNO').AsInteger := 1;
     end;

     PkmdrMas.FieldByName('CarDate').AsString  := CurRecord^.CarDate;
     PkmdrMas.FieldByName('CarKind').AsString  := CurRecord^.CarKind;
     PkmdrMas.FieldByName('CarNo').AsString    := CurRecord^.CarNo;
     PkmdrMas.FieldByName('LiceDate').AsString := CurRecord^.LiceDate;
     PkmdrMas.FieldByName('LiceGr').AsString   := CurRecord^.LiceGr;
     PkmdrMas.FieldByName('LiceNo').AsString   := CurRecord^.LiceNo;
     PkmdrMas.FieldByName('CarOwner').AsString := CurRecord^.CarOwner;
////
     PkmdrMas.FieldByName('writetime').AsString := copy(curdate,1,14);
     PkmdrMas.FieldByName('writeman').AsString := PEmpno ;
////
     PkmdrMas.Post;

     Except On E : EDataBaseError Do begin
            MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에 러',MB_OK or $0010);
            Result := False;
            SysTem.Exit;
     end;
     End;

     Result := True;
     PkmdrMas.Close;
end;

{===============================================================================
   운전지원금신청 레코드에 대해  마스터 레코드를 갱신해야할 지를 결정하는 함수.
================================================================================}
Function TM_KI3030A.Check_MasterUpdate(CurRecord : TRec_Ptr) : Boolean;
begin
  Qry1.Close;
  Qry1.Sql.Clear;
  Case StrToInt(CurRecord^.DrvKind) of
    1   : Qry1.Sql.Add( ' SELECT LLIDATE FROM PKMDRMAS  ' );
    2   : Qry1.Sql.Add( ' SELECT LTRDATE FROM PKMDRMAS  ' );
    3   : Qry1.Sql.Add( ' SELECT LODDATE FROM PKMDRMAS  ' );
  End;
  Qry1.Sql.Add( ' WHERE  EmpNO = :Pvar          ' );
  Qry1.ParamByName('Pvar').AsString := CurRecord^.EmpNo;
  Try
  Qry1.Open;
  Except On E : EDataBaseError Do
    begin
      MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에 러',MB_OK or $0010);
      Result := False;
      SysTem.Exit;
    end;
  End;

  if Qry1.Fields[0].AsString <> '' then
  begin
    if CurRecord^.ChGiveDate >= Qry1.Fields[0].AsString  then
       Result := True
    else
       Result := False;
  end
  else
      Result := True;
end;

{===============================================================================
         운전지원금신청 레코드에 대한 마스터 레코드를 갱신하는 함수
================================================================================}
Function TM_KI3030A.Update_MasterRecord(CurRecord : TRec_Ptr) : Boolean;
var
  Temp1 : Real;
  Temp2 : Integer;
begin
  Temp1 := 0;
  Temp2 := 0;
  PkmdrMas.Close;
  Try
  PkmdrMas.Open;
  PkmdrMas.Filter := 'empno = '''+CurRecord^.EmpNo+'''';
  PkmdrMas.Filtered := True;
  {PkmdrMas.SetKey;
  PkmdrMas.FieldByName('EmpNo').AsString := CurRecord^.EmpNo;
  PkmdrMas.GotoKey;}


  case StrToInt(CurRecord^.DrvKind) of
    1  :
         begin
              if CurRecord^.AppDate <> PkmdrMas.FieldByName('LiAppDate').AsString then
                 Temp1 := PkmdrMas.FieldByName('LiSum').AsFloat + CurRecord^.ChGiveAmt
              else
                 Temp1 := PkmdrMas.FieldByName('LiSum').AsFloat;
         end;
    2  :
        begin
              if CurRecord^.AppDate <> PkmdrMas.FieldByName('TrAppDate').AsString then
                 Temp1 := PkmdrMas.FieldByName('TrSum').AsFloat + CurRecord^.ChGiveAmt
              else
                 Temp1 := PkmdrMas.FieldByName('TrSum').AsFloat;
         end;
  end;

  case StrToInt(CurRecord^.DrvKind) of
    1  :
         begin
              if CurRecord^.AppDate <> PkmdrMas.FieldByName('LiAppDate').AsString then
                 Temp2 := PkmdrMas.FieldByName('LiAppNO').AsInteger + 1
              else
                 Temp2 := PkmdrMas.FieldByName('LiAppNO').AsInteger;
         end;
    2  :
         begin
              if CurRecord^.AppDate <> PkmdrMas.FieldByName('TrAppDate').AsString then
                 Temp2 := PkmdrMas.FieldByName('TrAppNO').AsInteger + 1
              else
                 Temp2 := PkmdrMas.FieldByName('TrAppNO').AsInteger;
         end;
    3  :
         begin
              if CurRecord^.AppDate <> PkmdrMas.FieldByName('OdAppDate').AsString then
                 Temp2 := Pkmdrmas.FieldByName('OdAppNo').AsInteger + 1
              else
                 Temp2 := Pkmdrmas.FieldByName('OdAppNo').AsInteger;
         end;
  end;

  PkmdrMas.Edit;

  if StrToInt(CurRecord^.DrvKind) = 3 then
     PkmdrMas.FieldByName('Odcandate').AsString := '';

  case StrToInt (CurRecord^.DrvKind) of
     1   :  PkmdrMas.FieldByName('LiAppYN').AsString  := 'Y';
     2   :  PkmdrMas.FieldByName('TrAppYN').AsString  := 'Y';
     3   :  PkmdrMas.FieldByName('OdAppYN').AsString  := 'Y';
  end;

  case StrToInt (CurRecord^.DrvKind) of
     1   :  PkmdrMas.FieldByName('LiAppNO').AsInteger := Temp2;
     2   :  PkmdrMas.FieldByName('TrAppNO').AsInteger := Temp2;
     3   :  PkmdrMas.FieldByName('OdAppNO').AsInteger := Temp2;
  end;

  case StrToInt(CurRecord^.DrvKind) of
    1 :  PkmdrMas.FieldByName('LliDate').AsString := CurRecord^.ChGiveDate;
    2 :  PkmdrMas.FieldByName('LtrDate').AsString := CurRecord^.ChGiveDate;
  end;

  case StrToInt(CurRecord^.DrvKind) of
    1 :  PkmdrMas.FieldByName('LiAppDate').AsString := CurRecord^.AppDate;
    2 :  PkmdrMas.FieldByName('TrAppDate').AsString := CurRecord^.AppDate;
    3 :  PkmdrMas.FieldByName('OdAppDate').AsString := CurRecord^.AppDate;
  end;

  case StrToInt(CurRecord^.DrvKind) of
    1 :  PkmdrMas.FieldByName('LliAmt').AsFloat := CurRecord^.ChGiveAmt;
    2 :  PkmdrMas.FieldByName('LtrAmt').AsFloat := CurRecord^.ChGiveAmt;
  end;

  case StrToInt(CurRecord^.DrvKind) of
    1 :  PkmdrMas.FieldByName('LiSum').AsFloat := Temp1;
    2 :  PkmdrMas.FieldByName('TrSum').AsFloat := Temp1;
  end;

  PkmdrMas.FieldByName('writetime').AsString := copy(curdate,1,14);
  PkmdrMas.FieldByName('writeman').AsString := PEmpno ;

  PkmdrMas.Post;
  Except On E : EDataBaseError Do
    begin
         MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에 러',MB_OK or $0010);
         Result := False;
         SysTem.Exit;
    end;
  End;

  PkmdrMas.Close;
  Result := True;

end;

{===============================================================================
   운전지원금신청 레코드에 대한 이력 레코드가 존재하는 지의 여부를 알려주는
   함수.
   리턴값이 1인 경우는 존재, 0인 경우는 존재하지 않음, =1 은 Query 실패의 경우를
   나타낸다.
================================================================================}
Function TM_KI3030A.Check_HistoryRecord ( CurRecord : TRec_Ptr  ) : Integer;
begin
  Qry1.Close;
  Qry1.Sql.Clear;
  Qry1.Sql.Add( ' SELECT * FROM PKHDRHIS                      ' );
  Qry1.Sql.Add( ' WHERE  EmpNo = :Pvar1 AND DRVYYMM = :Pvar2  ' );
  Qry1.ParamByName('Pvar1').AsString := CurRecord^.EmpNo;
  Qry1.ParamByName('Pvar2').AsString := Copy( CurRecord^.ChGiveDate,1,6 );
  Try
  Qry1.Open;
  Except On E : EDataBaseError Do
    begin
      MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에 러',MB_OK or $0010);
      Result := -1;
      SysTem.Exit;
    end;
  End;

  Result := Qry1.RecordCount;
  Qry1.Close;
end;

{===============================================================================
         운전지원금신청 레코드에 대한 지급이력 레코드를 생성하는 함수.
================================================================================}
Function TM_KI3030A.Insert_HistoryRecord ( CurRecord : TRec_Ptr  ) : Boolean;
begin
  PkhdrHis.Close;
  Try
  PkhdrHis.Open;
  PkhdrHis.Insert;
  PkhdrHis.FieldByName('EmpNo').AsString   := CurRecord^.EmpNo;
  PkhdrHis.FieldByName('Drvyymm').AsString := Copy(CurRecord^.ChGiveDate,1,6);
  PkhdrHis.FieldByName('KorName').AsString := CurRecord^.KorName;

  if CurRecord^.DrvKind = '1' then
     PkhdrHis.FieldByName('LiAmt').AsFloat := CurRecord^.ChGiveAmt
  else
     PkhdrHis.FieldByName('LiAmt').AsFloat := 0;
  if CurRecord^.DrvKind = '2' then
     PkhdrHis.FieldByName('TrAmt').AsFloat := CurRecord^.ChGiveAmt
  else
     PkhdrHis.FieldByName('TrAmt').AsFloat := 0;

  PkhdrHis.FieldByName('DrvAmt').AsFloat      := CurRecord^.ChGiveAmt;
  PkhdrHis.FieldByName('DrvTaxAmt').AsFloat   := CurRecord^.DrvTaxAmt;
  PkhdrHis.FieldByName('WriteTime').AsString  := Copy(CurDate,1,14);
  PkhdrHis.FieldByName('WriteMan').AsString   := PEmpNo;

  PkhdrHis.Post;
  Except On E : EDataBaseError Do
    begin
      MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에 러',MB_OK or $0010);
      Result := False;
      SysTem.Exit;
    end;
  End;

  Result := True;
  PkhdrHis.Close;

end;


{===============================================================================
   운전지원금신청 레코드에 대한 지급이력 레코드를 갱신하는 함수
================================================================================}
Function TM_KI3030A.Update_HistoryRecord ( CurRecord : TRec_Ptr  ) : Boolean;
var
   LiAmt    : Real;
   TrAmt    : Real;
begin
  PkhdrHis.Close;
  Try
  PkhdrHis.Open;
  PkhdrHis.FilterSQL := 'empno = '''+CurRecord^.EmpNo+''' and '+
                        'drvyymm = '''+Copy(CurRecord^.ChGiveDate,1,6)+'''';
  PkhdrHis.Filtered := True;
  {PkhdrHis.SetKey;
  PkhdrHis.FieldByName('EmpNo').AsString   := CurRecord^.EmpNo;
  PkhdrHis.FieldByName('Drvyymm').AsString := Copy(CurRecord^.ChGiveDate,1,6);
  PkhdrHis.GotoKey;}
  LiAmt     := PkhdrHis.FieldByName('LiAmt').AsFloat;
  TrAmt     := PkhdrHis.FieldByName('TrAmt').AsFloat;

  PkhdrHis.Edit;
  case StrToInt(CurRecord^.DrvKind)  of
    1 :
         begin
              PkhdrHis.FieldByName('LiAmt').AsFloat  := CurRecord^.ChGiveAmt;
              if TrAmt > 0 then
                 begin
                      PkhdrHis.FieldByName('DrvAmt').AsFloat    := TrAmt      + CurRecord^.ChGiveAmt;
                      PkhdrHis.FieldByName('DrvTaxAmt').AsFloat := DrvTaxAmt2 + CurRecord^.DrvTaxAmt;
                 end
              else
                 begin
                      PkhdrHis.FieldByName('DrvAmt').AsFloat    := CurRecord^.ChGiveAmt;
                      PkhdrHis.FieldByName('DrvTaxAmt').AsFloat := CurRecord^.DrvTaxAmt;
                 end;
         end;
    2 :
         begin
              PkhdrHis.FieldByName('TrAmt').AsFloat := CurRecord^.ChGiveAmt;
              if LiAmt > 0 then
                 begin
                      PkhdrHis.FieldByName('DrvAmt').AsFloat    := LiAmt      + CurRecord^.ChGiveAmt;
                      PkhdrHis.FieldByName('DrvTaxAmt').AsFloat := DrvTaxAmt1 + CurRecord^.DrvTaxAmt;
                 end
              else
                 begin
                      PkhdrHis.FieldByName('DrvAmt').AsFloat    := CurRecord^.ChGiveAmt;
                      PkhdrHis.FieldByName('DrvTaxAmt').AsFloat := CurRecord^.DrvTaxAmt;
                 end;
         end;
  end;

  PkhdrHis.FieldByName('WriteTime').AsString  := Copy(CurDate,1,14);
  PkhdrHis.FieldByName('WriteMan').AsString   := PEmpNo;
  PkhdrHis.Post;

  Except On E : EDataBaseError Do
    begin
      MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에 러',MB_OK or $0010);
      Result := False;
      SysTem.Exit;
    end;
  End;

  PkhdrHis.Close;
  Result := True;
end;

{===============================================================================
         운전지원금신청 레코드를 갱신하는 함수
================================================================================}
Function TM_KI3030A.Update_AppRecord( CurRecord : TRec_Ptr ) : Boolean;
begin
  Qry1.Close;
  Qry1.Sql.Clear;
  Qry1.Sql.Add( ' UPDATE PKMDRAPP                                               ');
  Qry1.Sql.Add( ' SET    GIVEYN = :Pvar1, GIVEAMT = :Pvar2 , GIVEDATE = :Pvar3,  ');
  Qry1.Sql.Add( '        WRITETIME = :Writetime, WRITEMAN = :Writeman            ');
  Qry1.Sql.Add( ' WHERE  EmpNO = :Pvar4 AND DRVKIND = :Pvar5 ');
  Qry1.ParamByName('Pvar1').AsString  := CurRecord^.ChGiveYN;
  Qry1.ParamByName('Pvar2').AsFloat   := CurRecord^.ChGiveAmt;
  Qry1.ParamByName('Pvar3').AsString  := CurRecord^.ChGiveDate;
  Qry1.ParamByName('Pvar4').AsString  := CurRecord^.EmpNO;
  Qry1.ParamByName('Pvar5').AsString  := CurRecord^.DrvKind;
  Qry1.ParamByName('Writetime').AsString  :=  Copy(CurDate,1,14);
  Qry1.ParamByName('Writeman').AsString  := PEmpNo ;

  Try
  Qry1.ExecSql;
  Except On E : EDataBaseError Do
    begin
      MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에 러',MB_OK or $0010);
      Result := False;
      SysTem.Exit;
    end;
  End;

  Qry1.Close;
  Result := True;
end;

{===============================================================================
    지급이 취소된 레코드에 대해 해당 이력 레코드와 마스터 레코드를 삭제할지
    변경해야 할 지를 결정하는 함수.
    리턴 값 0은 실패,
    리턴 값 1은 모두 삭제,
    리년 값 2는 모두 갱신,
    리턴 값 3는 마스터 삭제,
    리턴 값 4는 마스터 갱신,
================================================================================}
Function TM_KI3030A.Decide_Delete_Update(CurRecord : TRec_Ptr) : Integer;
var
  Buf1 : Real;
  Buf2 : Real;
begin
  Buf1 := 0;
  Buf2 := 0;
  if (CurRecord^.DrvKind = '1') OR (CurRecord^.DrvKind ='2') then
  begin
  PkhdrHis.Close;
  Try
  PkhdrHis.Open;
  PkhdrHis.FilterSQL := 'empno = '''+CurRecord^.EmpNo+''' and '+
                        'drvyymm = '''+Copy(CurRecord^.GiveDate,1,6)+'''';
  PkhdrHis.Filtered := True;
  {PkhdrHis.Setkey;
  PkhdrHis.FieldByName('EmpNo').AsString    := CurRecord^.EmpNo;
  PkhdrHis.FieldByName('Drvyymm').AsString  := Copy(CurRecord^.GiveDate,1,6);
  PkhdrHis.GotoKey;}

  case StrToInt(CurRecord^.DrvKind) of
    1   : Buf1 := PkhdrHis.FieldByName('LiAmt').AsFloat;
    2   : Buf1 := PkhdrHis.FieldByName('TrAmt').AsFloat;
  end;

  Buf2 := PkhdrHis.FieldByName('DrvAmt').AsFloat;
  PkhdrHis.Close;
  Except On E : EDataBaseError Do
    begin
      MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에 러',MB_OK or $0010);
      Result := 0;
      SysTem.Exit;
    end;
  end;

  if Buf2 = Buf1 then
     Result := 1
  else
     Result := 2;
  end                        { End of IF }
  else
    begin
      PkmdrMas.Close;
      Try
      PkmdrMas.Open;
      PkmdrMas.FilterSQL := 'empno = '''+CurRecord^.EmpNo+'''';
      PkmdrMas.Filtered := True;
      {PkmdrMas.SetKey;
      PkmdrMas.FieldByName('EmpNO').AsString := CurRecord^.EmpNO ;
      PkmdrMas.GotoKey;}

      Buf1 := Buf1 + Pkmdrmas.FieldByName('LiSum').AsFloat;
      Buf1 := Buf1 + Pkmdrmas.FieldByName('TrSum').AsFloat;
      Buf1 := Buf1 + Pkmdrmas.FieldByName('OdSum').AsFloat;
      PkmdrMas.Close;

      Except On E : EDataBaseError Do
        begin
          MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에 러',MB_OK or $0010);
          Result := 0;
          SysTem.Exit;
        end;
     end;

      if Buf1 = 0 then
         Result := 3
      else
         Result := 4;
    end;

end;

{===============================================================================
         이력 레코드를 Delete시키는 함수.
================================================================================}
Function TM_KI3030A.Delete_HistoryRecord( CurRecord : TRec_Ptr ) : Boolean;
begin
  Qry1.Close;
  Qry1.Sql.Clear;
  Qry1.Sql.Add( ' DELETE FROM PKHDRHIS                       ' );
  Qry1.Sql.Add( ' WHERE  EMPNO = :Pvar1 AND DRVYYMM = :Pvar2 ' );
  Qry1.ParamByName('Pvar1').AsString := CurRecord^.EmpNo;
  Qry1.ParamByName('Pvar2').AsString := Copy( CurRecord^.GiveDate,1,6 );
  Try
  Qry1.ExecSql;
  Except On E : EDataBaseError Do
    begin
      MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에 러',MB_OK or $0010);
      Result := False;
      SysTem.Exit;
    end;
  End;

  Result := True;

end;

{===============================================================================
         마스터 레코드를 Delete시키는 함수.
================================================================================}
Function TM_KI3030A.Delete_MasterRecord( CurRecord : TRec_Ptr ) : Boolean;
begin
  Qry1.Close;
  Qry1.Sql.Clear;
  Qry1.Sql.Add( ' DELETE FROM PKMDRMAS ' );
  Qry1.Sql.Add( ' WHERE  EMPNO = :Pvar ' );
  Qry1.ParamByName('Pvar').AsString := CurRecord^.EmpNo;
  Try
  Qry1.ExecSql;
  Except On E : EDataBaseError Do
    begin
      MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에 러',MB_OK or $0010);
      Result := False;
      SysTem.Exit;
    end;
  End;

  Result := True;
end;

{===============================================================================
    이력 레코드를 취소시키는 함수.
================================================================================}
Function TM_KI3030A.Cancel_HistoryRecord( CurRecord : TRec_Ptr ) : Boolean;
var
  A1,A2 : Real;
  B1,B2 : Real;
begin
  if CurRecord^.Drvkind <> '3' then begin
     PkhdrHis.Close;
     Try
     PkhdrHis.Open;
     PkhdrHis.FilterSQL := 'empno = '''+CurRecord^.EmpNo+''' and '+
                           'drvyymm = '''+Copy(CurRecord^.GiveDate,1,6)+'''';
     PkhdrHis.Filtered := True;
     {PKhdrHis.SetKey;
     PkhdrHis.FieldByName('EmpNo').AsString   := CurRecord^.EmpNo;
     PkhdrHis.FieldByName('DrvYYMM').AsString := Copy(CurRecord^.GiveDate,1,6);
     PkhdrHis.GotoKey;}
     B1 := PkhdrHis.FieldByName('DrvAmt').AsFloat;
     B2 := PkhdrHis.FieldByName('DrvTaxAmt').AsFloat;

     Case StrToInt(CurRecord^.DrvKind) of
          1  : A1 := PkhdrHis.FieldByName('LiAmt').AsFloat;
          2  : A1 := PkhdrHis.FieldByName('TrAmt').AsFloat;
     end;
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT DRVTAXAMT FROM PKCDRBAS                 ' );
     Qry1.Sql.Add( ' WHERE  DRVKIND = ''' + CurRecord^.DrvKind + '''' );
     Qry1.Open;
     B1 := Qry1.FieldByName('DrvTaxAmt').AsFloat;
     Qry1.Close;

     PkhdrHis.Edit;
     Case StrToInt(CurRecord^.DrvKind) of
          1 :  PkhdrHis.FieldByName('LiAmt').AsFloat := 0;
          2 :  PkhdrHis.FieldByName('TrAmt').AsFloat := 0;
     end;
     PkhdrHis.FieldByName('DrvAmt').AsFloat    := B1 - A1;
     PkhdrHis.FieldByName('DrvTaxAmt').AsFloat := B2 - B1;
     PkhdrHis.FieldByName('WriteTime').AsString  := Copy(CurDate,1,14);
     PkhdrHis.FieldByName('WriteMan').AsString   := PEmpNo;
     PkhdrHis.Post;

     Except On E : EDataBaseError Do begin
            MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에 러',MB_OK or $0010);
            Result := False;
            SysTem.Exit;
     end;
     End;
     PkhdrHis.Close;
     Result := True;
  end
else
    Result := True;
end;

{===============================================================================
    마스터 레코드를 취소시키는 함수. ( 자가 운전 지원금이 아닌 경우 )
================================================================================}
Function TM_KI3030A.Cancel_MasterRecord1( CurRecord : TRec_Ptr ) : Boolean;
var
  Drvyymm : String;
  AidAmt  : Real;
  Temp    : Real;
  AppNo   : Integer;
begin
     Temp := 0;
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT MAX(DRVYYMM) FROM PKHDRHIS ' );
     Case StrToInt(CurRecord^.DrvKind) of
          1 : Qry1.Sql.Add( ' WHERE LIAMT > 0 AND EMPNO = :pvar ' ) ;
          2 : Qry1.Sql.Add( ' WHERE TRAMT > 0 AND EMPNO = :pvar ' ) ;
     end;
     Qry1.ParamByName('pvar').AsString := CurRecord^.EmpNo;
     Qry1.Open;
     Drvyymm := Qry1.Fields[0].AsString;
     Qry1.Close;

     PkhdrHis.Close;
     PkhdrHis.Open;
     PkhdrHis.FilterSQL := 'empno = '''+CurRecord^.EmpNo+''' and '+
                           'drvyymm = '''+Drvyymm+'''';
     PkhdrHis.Filtered := True;
     {PkhdrHis.SetKey;
     PkhdrHis.FieldByName('EmpNo').AsString   := CurRecord^.EmpNo;
     PkhdrHis.FieldByName('Drvyymm').AsString := Drvyymm;
     PkhdrHis.GotoKey;}

     Case StrToInt(CurRecord^.DrvKind) of
          1 : AidAmt := PkhdrHis.FieldByName('LiAmt').AsFloat;
          2 : AidAmt := PkhdrHis.FieldByName('TrAmt').AsFloat;
     end;
     PkhdrHis.Close;

     PkmDrMas.Close;
     PkmDrMas.Open;
     PkmdrMas.FilterSQL := 'empno = '''+CurRecord^.EmpNo+'''';
     PkmdrMas.Filtered := True;
     {PkmDrMas.SetKey;
     PkmDrMAs.FieldByName('EmpNo').AsString := CurRecord^.EmpNo;
     PkmDrMas.GotoKey;}

     Case StrToInt( CurRecord^.DrvKind ) of
          1 : Temp := PkmDrMas.FieldByName('LiSum').AsFloat;
          2 : Temp := PkmDrMas.FieldByName('TrSum').AsFloat;
     end;

     case StrToInt(CurRecord^.DrvKind) of
          1 : AppNo := PkmDrMas.FieldByName('LiAppNO').AsInteger;
          2 : AppNo := PkmDrMas.FieldByName('TrAppNo').AsInteger;
     End;

     PkmDrMas.Edit;

     Case StrToInt( CurRecord^.DrvKind ) of
          1 : PkmDrMas.FieldByName('LiAppYN').AsString := 'N';
          2 : PkmDrMas.FieldByName('TrAppYN').AsString := 'N';
     end;

     Case StrToInt(CurRecord^.DrvKind) of
          1 :
              begin
                   if CurRecord^.AppDate <> PkmdrMas.FieldByName('LiAppDate').AsString then
                      PkmDrMas.FieldByName('LiAppNO').AsInteger := AppNo - 1;
              end;
          2 :
              begin
                   if CurRecord^.AppDate <> PkmdrMas.FieldByName('TrAppDate').AsString then
                      PkmDrMas.FieldByName('TrAppNo').AsInteger := AppNo - 1;
              end;
     end;

     case StrToInt(CurRecord^.DrvKind) of
          1 : PkmDrMas.FieldByName('LliAmt').AsFloat := AidAmt;
          2 : PkmDrMas.FieldByName('LtrAmt').AsFloat := AidAmt;
     end;

     case StrToInt(CurRecord^.DrvKind) of
          1 : PkmDrMas.FieldByName('LliDate').AsString := Drvyymm;
          2 : PkmDrMas.FieldByName('LtrDate').AsString := Drvyymm;
     end;

     case StrToInt(CurRecord^.DrvKind) of
          1 : PkmDrMas.FieldByName('LiSum').AsFloat := PkmDrMas.FieldByName('LiSum').AsFloat - PkmDrMas.FieldByName('LLiAmt').AsFloat;
          2 : PkmDrMas.FieldByName('TrSum').AsFloat := PkmDrMas.FieldByName('TrSum').AsFloat - PkmDrMas.FieldByName('LTrAmt').AsFloat;
     end;

     PkmdrMas.FieldByName('writetime').AsString := copy(curdate,1,14);
     PkmdrMas.FieldByName('writeman').AsString := PEmpno ;

     PkmdrMas.Post;
     PkmdrMas.Close;
     Result := True;
end;

{===============================================================================
         마스터 레코드를 취소시키는 함수. (자가 운전 지원금인 경우 )
================================================================================}
Function TM_KI3030A.Cancel_MasterRecord2( CurRecord : TRec_Ptr ) : Boolean;
var
   AppNo : Integer;
begin
     PkmdrMas.Close;
     PkmdrMas.Open;
     PkmdrMas.FilterSQL := 'empno = '''+CurRecord^.EmpNo+'''';
     PkmdrMas.Filtered := True;
     {PkmdrMas.SetKey;
     PkmdrMas.FieldByName('EmpNo').AsString := CurRecord^.EmpNo;
     PkmdrMas.GotoKey;}
     AppNo := PkmdrMas.FieldByName('OdAppNo').AsInteger;
     PkmdrMas.Edit;
     if CurRecord^.AppDate <> Pkmdrmas.FieldByName('ODAppDate').AsString then
        PkmdrMas.FieldByName('OdAppNo').AsInteger := AppNo - 1;
     PkmdrMas.FieldByName('OdAppYN').AsString := 'N';
     PkmdrMas.FieldByName('writetime').AsString := copy(curdate,1,14);
     PkmdrMas.FieldByName('writeman').AsString := PEmpno ;
     PkmdrMas.Post;
     PkmdrMas.Close;
     Result := True;
end;

{===============================================================================
         신청 레코드를 취소시키는 함수.
================================================================================}
Function TM_KI3030A.CanCel_AppRecord( CurRecord : TRec_Ptr ) : Boolean;
begin
  Qry1.Close;
  Qry1.Sql.Clear;
  Qry1.Sql.Add( ' UPDATE PKMDRAPP                                               ');
  Qry1.Sql.Add( ' SET    GIVEYN = :Pvar1, GIVEAMT = :Pvar2 , GIVEDATE = :Pvar3,  ');
  Qry1.Sql.Add( '        WRITETIME = :Writetime, WRITEMAN  = :Writeman           ');
  Qry1.Sql.Add( ' WHERE  EmpNO  = :Pvar4 AND DRVKIND = :Pvar5 ');
  Qry1.ParamByName('Pvar1').AsString  := 'N';
  Qry1.ParamByName('Pvar2').AsInteger := 0;
  Qry1.ParamByName('Pvar3').AsString  := '';
  Qry1.ParamByName('Pvar4').AsString  := CurRecord^.EmpNO;
  Qry1.ParamByName('Pvar5').AsString  := CurRecord^.DrvKind;
  Qry1.ParamByName('Writetime').AsString  :=  Copy(CurDate,1,14);
  Qry1.ParamByName('Writeman').AsString  := PEmpNo ;

  Qry1.ExecSql;
  Qry1.Close;
  Result := True;
end;

{===============================================================================
 ======================  < User Define Procedures >  ===========================
 ===============================================================================}

{===============================================================================
              작업 조건에 맞는 Record를 얻는 Procedure.
 ===============================================================================}
Procedure TM_KI3030A.Get_Records;
var
  Count : Integer;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT EMPNO, KORNAME, APPDATE, APPNO, DRVAMT, GIVEAMT, GIVEDATE, GIVEYN, ' );
     Qry1.Sql.Add( '        A.LICEDATE, A.LICEGR , A.LICENO, A.CARDATE, A.CARKIND, A.CARNO,    ' );
     Qry1.Sql.Add( '        CAROWNER, A.DRVKIND,  PAYCL, PAYGR, DRVTAXAMT, DRVNAME             ' );
     Qry1.Sql.Add( ' FROM   PKMDRAPP A, PKCDRBAS B                                             ' );
     Qry1.Sql.Add( ' WHERE  (APPDATE >= :FromDate AND APPDATE <= :ToDate)  AND                 ' );
     Qry1.Sql.Add( '        (A.DRVKIND LIKE :drvkind AND A.DRVKIND = B.DRVKIND) AND            ' );
     Qry1.Sql.Add( '        NVL(UPPER(GIVEYN),'' '') LIKE :giveyn                              ' );
     Qry1.Sql.Add( '        AND  A.PAYCL BETWEEN PAYCLFR AND PAYCLTO                           ' );     
     Qry1.Sql.Add( ' ORDER BY EMPNO, APPDATE                                                   ' );
     Qry1.ParamByName('FromDate').AsString := ME_FromDate.Text;
     Qry1.ParamByName('ToDate').AsString   := ME_ToDate.Text;
     Qry1.ParamByName('drvkind').AsString  := P_DrvKind.Caption + '%';
     Qry1.ParamByName('giveyn').AsString   := CB_GiveYN.Text + '%';
     Qry1.Open;

     if not Qry1.Eof then
        begin
             Count := Qry1.RecordCount;
             if Count = Make_DBLink( Count ) then
                begin
                     if Count >= 9 then
                        begin
                             ChangePermit    := False;
                             Triggered_Field := EditField;
                             Fill_FieldBuf( 9 , Front );
                             ChangePermit    := True;
                        end
                     else
                        begin
                             ChangePermit    := False;
                             Triggered_Field := EditField;
                             Fill_FieldBuf( Count, Front );
                             Clear_FieldBuf( Count+1 );
                             ChangePermit    := True;
                        end;
                     Get_RecordFlag := True;
                end
             else
                begin
                     Free_DBLink;
                     ChangePermit := False;
                     Clear_FieldBuf(1);
                     ChangePermit   := True;
                     Get_RecordFlag := False;
                end;
             Qry1.Close;
     end
  else
     begin
          P_Help.Caption := '   해당되는 자료가 없습니다...';
          ChangePermit := False;
          Clear_FieldBuf(1);
          ChangePermit := True;
          Qry1.Close;
          Get_RecordFlag := False;
     end;
end;

{===============================================================================
        만들어진 Double Linked List를 Memory Pool로 되돌리는 프로시져
 ===============================================================================}
Procedure TM_KI3030A.Free_DBLink;
var
   Cur,Next : TRec_ptr;
begin
     Cur := First;

     While ( Cur^.Next <> NIL ) do
           begin
                Next := Cur^.Next;
                Dispose(Cur);
                Cur := Next;
           end;
     Dispose(Cur);
end;

{===============================================================================
      Query 결과로 얻어진 Record들을 화면에 표시해 주는 Procedure.
 ===============================================================================}
Procedure TM_KI3030A.Fill_FieldBuf( EndIndex : Integer ; Tag : TFocusPos  );
var
  Temp : TRec_Ptr;
     i : Integer;
  Buf  : String;
begin
     Temp := CurFirst;

     For i := 1 to EndIndex do
         begin
              FieldBuf[i].P1^.Caption    := Temp^.EmpNo;
              FieldBuf[i].P2^.Caption    := Temp^.KorName;
              Buf                        := Temp^.AppDate;
              FieldBuf[i].P3^.Caption    := Copy(Buf,1,4) + '-' + Copy(Buf,5,2) + '-' + Copy(Buf,7,2);
              FieldBuf[i].P4^.Caption    := IntToStr(Temp^.AppNo);
              FieldBuf[i].P5^.Caption    := FormatFloat('#,##0' , Temp^.DrvAmt);
              FieldBuf[i].P6^.Caption    := Temp^.DrvName;
              FieldBuf[i].NE^.Value      := Temp^.ChGiveAmt;
              FieldBuf[i].E^.Text        := Temp^.ChGiveYN;
              FieldBuf[i].ME^.EditMask   := '9999-99-99;0;_';
              FieldBuf[i].ME^.Text       := Temp^.ChGiveDate;
              FieldBuf[i].L^.Caption     := IntToStr(Temp^.Index);

              Set_FieldAttr1(FieldBuf[i].NE,NoFocus);
              Set_FieldAttr2(FieldBuf[i].E ,NoFocus);
              Set_FieldAttr3(FieldBuf[i].ME,NoFocus);
              Set_FieldAttr4(FieldBuf[i].P1,NoFocus);
              Set_FieldAttr4(FieldBuf[i].P2,NoFocus);
              Set_FieldAttr4(FieldBuf[i].P3,NoFocus);
              Set_FieldAttr4(FieldBuf[i].P4,NoFocus);
              Set_FieldAttr4(FieldBuf[i].P5,NoFocus);
              Set_FieldAttr4(FieldBuf[i].P6,NoFocus);
              Set_LineNumBer(i,NoFocus);

              if i = 1 then
                 CurFirst := Temp;

              if i = EndIndex then
                 CurLast := Temp;

              Temp := Temp^.Next;
     end;

     Case Tag of
        Front :
                begin
                     Set_FieldAttr1(FieldBuf[1].NE,Focusing);
                     Set_FieldAttr2(FieldBuf[1].E ,Focusing);
                     Set_FieldAttr3(FieldBuf[1].ME,Focusing);
                     Set_FieldAttr4(FieldBuf[1].P1,Focusing);
                     Set_FieldAttr4(FieldBuf[1].P2,Focusing);
                     Set_FieldAttr4(FieldBuf[1].P3,Focusing);
                     Set_FieldAttr4(FieldBuf[1].P4,Focusing);
                     Set_FieldAttr4(FieldBuf[1].P5,Focusing);
                     Set_FieldAttr4(FieldBuf[1].P6,Focusing);
                     Set_LineNumBer(1,Focusing);

                     Case Triggered_Field of
                          NumberField : FieldBuf[1].NE^.SetFocus;
                          MaskField   : FieldBuf[1].ME^.SetFocus;
                          EditField   : FieldBuf[1].E^.SetFocus;
                     end;

                     CurCurrent := CurFirst;
                end;
      Rear  :
                begin
                     Set_FieldAttr1(FieldBuf[EndIndex].NE,Focusing);
                     Set_FieldAttr2(FieldBuf[EndIndex].E ,Focusing);
                     Set_FieldAttr3(FieldBuf[EndIndex].ME,Focusing);
                     Set_FieldAttr4(FieldBuf[EndIndex].P1,Focusing);
                     Set_FieldAttr4(FieldBuf[EndIndex].P2,Focusing);
                     Set_FieldAttr4(FieldBuf[EndIndex].P3,Focusing);
                     Set_FieldAttr4(FieldBuf[EndIndex].P4,Focusing);
                     Set_FieldAttr4(FieldBuf[EndIndex].P5,Focusing);
                     Set_FieldAttr4(FieldBuf[EndIndex].P6,Focusing);
                     Set_LineNumBer(EndIndex,Focusing);

                     Case Triggered_Field of
                          NumberField : FieldBuf[EndIndex].NE^.SetFocus;
                          MaskField   : FieldBuf[EndIndex].ME^.SetFocus;
                          EditField   : FieldBuf[EndIndex].E^.SetFocus;
                     end;

                     CurCurrent  := CurLast;
                end;
     End;

     L_Number.Caption := IntToStr( CurCurrent^.Index ) + ' / ' + IntToStr( Last^.Index );
end;

{===============================================================================
                     Field를 Clear 시킨다.
 ===============================================================================}
Procedure TM_KI3030A.Clear_FieldBuf( StartIndex : Integer );
var
  i    : Integer;
begin
     For i := StartIndex to 9 do
         begin
              FieldBuf[i].P1^.Caption  := '';
              FieldBuf[i].P2^.Caption  := '';
              FieldBuf[i].P3^.Caption  := '';
              FieldBuf[i].P4^.Caption  := '';
              FieldBuf[i].P5^.Caption  := '';
              FieldBuf[i].P6^.Caption  := '';
              FieldBuf[i].NE^.Text     := '';
              FieldBuf[i].E^.Text      := '';
              FieldBuf[i].ME^.EditMask := '';
              FieldBuf[i].ME^.Text     := '';
              FieldBuf[i].L^.Caption  := '';

              Set_FieldAttr1(FieldBuf[i].NE,Disable);
              Set_FieldAttr2(FieldBuf[i].E ,Disable);
              Set_FieldAttr3(FieldBuf[i].ME,Disable);
              Set_FieldAttr4(FieldBuf[i].P1,Disable);
              Set_FieldAttr4(FieldBuf[i].P2,Disable);
              Set_FieldAttr4(FieldBuf[i].P3,Disable);
              Set_FieldAttr4(FieldBuf[i].P4,Disable);
              Set_FieldAttr4(FieldBuf[i].P5,Disable);
              Set_FieldAttr4(FieldBuf[i].P6,Disable);
              Set_LineNumBer(i,Disable);
    end;

    if StartIndex = 1 then
       L_Number.Caption := '';
end;

{===============================================================================
     레코드 필드에 상응하는 Component의 주소를 배열 FieldBuf에 저장하는
     Procedure.
 ===============================================================================}
Procedure TM_KI3030A.Mapping;
begin
     FieldBuf[1].P1 := Addr(P_11 );
     FieldBuf[1].P2 := Addr(P_12 );
     FieldBuf[1].P3 := Addr(P_13 );
     FieldBuf[1].P4 := Addr(P_14 );
     FieldBuf[1].P5 := Addr(P_15 );
     FieldBuf[1].P6 := Addr(P_19 );
     FieldBuf[1].NE := Addr(NE_16);
     FieldBuf[1].ME := Addr(ME_17);
     FieldBuf[1].E  := Addr(E_18 );
     FieldBuf[1].L  := Addr(L_1  );

     FieldBuf[2].P1 := Addr(P_21 );
     FieldBuf[2].P2 := Addr(P_22 );
     FieldBuf[2].P3 := Addr(P_23 );
     FieldBuf[2].P4 := Addr(P_24 );
     FieldBuf[2].P5 := Addr(P_25 );
     FieldBuf[2].P6 := Addr(P_29 );
     FieldBuf[2].NE := Addr(NE_26);
     FieldBuf[2].ME := Addr(ME_27);
     FieldBuf[2].E  := Addr(E_28 );
     FieldBuf[2].L  := Addr(L_2  );

     FieldBuf[3].P1 := Addr(P_31 );
     FieldBuf[3].P2 := Addr(P_32 );
     FieldBuf[3].P3 := Addr(P_33 );
     FieldBuf[3].P4 := Addr(P_34 );
     FieldBuf[3].P5 := Addr(P_35 );
     FieldBuf[3].P6 := Addr(P_39 );
     FieldBuf[3].NE := Addr(NE_36);
     FieldBuf[3].ME := Addr(ME_37);
     FieldBuf[3].E  := Addr(E_38 );
     FieldBuf[3].L  := Addr(L_3  );

     FieldBuf[4].P1 := Addr(P_41 );
     FieldBuf[4].P2 := Addr(P_42 );
     FieldBuf[4].P3 := Addr(P_43 );
     FieldBuf[4].P4 := Addr(P_44 );
     FieldBuf[4].P5 := Addr(P_45 );
     FieldBuf[4].P6 := Addr(P_49 );
     FieldBuf[4].NE := Addr(NE_46);
     FieldBuf[4].ME := Addr(ME_47);
     FieldBuf[4].E  := Addr(E_48 );
     FieldBuf[4].L  := Addr(L_4  );

     FieldBuf[5].P1 := Addr(P_51 );
     FieldBuf[5].P2 := Addr(P_52 );
     FieldBuf[5].P3 := Addr(P_53 );
     FieldBuf[5].P4 := Addr(P_54 );
     FieldBuf[5].P5 := Addr(P_55 );
     FieldBuf[5].P6 := Addr(P_59 );
     FieldBuf[5].NE := Addr(NE_56);
     FieldBuf[5].ME := Addr(ME_57);
     FieldBuf[5].E  := Addr(E_58 );
     FieldBuf[5].L  := Addr(L_5  );

     FieldBuf[6].P1 := Addr(P_61 );
     FieldBuf[6].P2 := Addr(P_62 );
     FieldBuf[6].P3 := Addr(P_63 );
     FieldBuf[6].P4 := Addr(P_64 );
     FieldBuf[6].P5 := Addr(P_65 );
     FieldBuf[6].P6 := Addr(P_69 );
     FieldBuf[6].NE := Addr(NE_66);
     FieldBuf[6].ME := Addr(ME_67);
     FieldBuf[6].E  := Addr(E_68 );
     FieldBuf[6].L  := Addr(L_6  );

     FieldBuf[7].P1 := Addr(P_71 );
     FieldBuf[7].P2 := Addr(P_72 );
     FieldBuf[7].P3 := Addr(P_73 );
     FieldBuf[7].P4 := Addr(P_74 );
     FieldBuf[7].P5 := Addr(P_75 );
     FieldBuf[7].P6 := Addr(P_79 );
     FieldBuf[7].NE := Addr(NE_76);
     FieldBuf[7].ME := Addr(ME_77);
     FieldBuf[7].E  := Addr(E_78 );
     FieldBuf[7].L  := Addr(L_7  );

     FieldBuf[8].P1 := Addr(P_81 );
     FieldBuf[8].P2 := Addr(P_82 );
     FieldBuf[8].P3 := Addr(P_83 );
     FieldBuf[8].P4 := Addr(P_84 );
     FieldBuf[8].P5 := Addr(P_85 );
     FieldBuf[8].P6 := Addr(P_89 );
     FieldBuf[8].NE := Addr(NE_86);
     FieldBuf[8].ME := Addr(ME_87);
     FieldBuf[8].E  := Addr(E_88 );
     FieldBuf[8].L  := Addr(L_8  );

     FieldBuf[9].P1 := Addr(P_91 );
     FieldBuf[9].P2 := Addr(P_92 );
     FieldBuf[9].P3 := Addr(P_93 );
     FieldBuf[9].P4 := Addr(P_94 );
     FieldBuf[9].P5 := Addr(P_95 );
     FieldBuf[9].P6 := Addr(P_99 );
     FieldBuf[9].NE := Addr(NE_96);
     FieldBuf[9].ME := Addr(ME_97);
     FieldBuf[9].E  := Addr(E_98 );
     FieldBuf[9].L  := Addr(L_9  );
end;

{===============================================================================
                   TNumberEdit Coponent의 속성을 지정한다.
 ===============================================================================}
Procedure TM_KI3030A.Set_FieldAttr1(  Dest : TNum_Ptr  ; FKind : TFocusKind );
begin
  Case Fkind of
       Focusing :
                  begin
                     Dest^.Color      := $0080FFFF;
                     Dest^.Enabled    := True;
                  end;
       NoFocus  :
                  begin
                     Dest^.Color      := ClWhite;
                     Dest^.Enabled    := True;
                  end;
      Disable  :
                  begin
                    Dest^.Color   := ClGray;
                    Dest^.Enabled := False;
                  end;
  end;  { End of case }
  SendMessage(Dest^.Handle,WM_PAINT,0,0);
end;

{===============================================================================
                   TEdit Coponent의 속성을 지정한다.
 ===============================================================================}
Procedure TM_KI3030A.Set_FieldAttr2(  Dest : TEdit_Ptr  ; FKind : TFocusKind );
begin
  Case Fkind of
       Focusing :
                  begin
                     Dest^.Color      := $0080FFFF;
                     Dest^.Enabled    := True;
                  end;
       NoFocus  :
                  begin
                     Dest^.Color      := ClWhite;
                     Dest^.Enabled    := True;
                  end;
      Disable  :
                  begin
                    Dest^.Color   := ClGray;
                    Dest^.Enabled := False;
                  end;
  end;  { End of case }
  SendMessage(Dest^.Handle,WM_PAINT,0,0);
end;

{===============================================================================
                   TMaskEdit Coponent의 속성을 지정한다.
 ===============================================================================}
Procedure TM_KI3030A.Set_FieldAttr3( Dest : TME_Ptr ; FKind : TFocusKind );
begin
  Case Fkind of
       Focusing :
                  begin
                     Dest^.Color      := $0080FFFF;
                     Dest^.Enabled    := True;
                  end;
       NoFocus  :
                  begin
                     Dest^.Color      := ClWhite;
                     Dest^.Enabled    := True;
                  end;
      Disable  :
                  begin
                    Dest^.Color   := ClGray;
                    Dest^.Enabled := False;
                  end;
  end;  { End of case }
  SendMessage(Dest^.Handle,WM_PAINT,0,0);
end;

{===============================================================================
          TPanel Coponent의 속성을 지정한다.
 ===============================================================================}
Procedure TM_KI3030A.Set_FieldAttr4( Dest : TPanel_Ptr; Focus : TFocusKind );
begin
  Case Focus of
       Focusing :
                  begin
                     Dest^.Color      := $0080FFFF;
                     Dest^.Enabled    := True;
                  end;
       NoFocus  :
                  begin
                     Dest^.Color      := ClWhite;
                     Dest^.Enabled    := True;
                  end;
      Disable  :
                  begin
                    Dest^.Color   := ClGray;
                    Dest^.Enabled := False;
                  end;
  end;  { End of case }
  SendMessage(Dest.handle,WM_PAINT,0,0);
end;

{===============================================================================
                   TLabel Coponent의 속성을 지정한다.
 ===============================================================================}
Procedure TM_KI3030A.Set_LineNumBer( i : Integer ; Kind : TFocusKind );
begin
  Case Kind of
    Focusing :
               begin
                 FieldBuf[i].L^.Font.Color := ClRed;
                 FieldBuf[i].L^.Font.Style := [FsBold];
               end;
    NoFocus  :
               begin
                 FieldBuf[i].L^.Font.Color := ClBlack;
                 FieldBuf[i].L^.Font.Style := [];
               end;
  End;
end;

{===============================================================================
       Up Key가 눌려 졌을 경우을 처리하는 Procedure.
 ===============================================================================}
Procedure TM_KI3030A.Process_KeyUp;
var
  i : Integer;
begin
  if CurCurrent^.Index = CurFirst^.Index  then
     begin
       if CurCurrent^.Index > First^.Index  then
           begin
             CurFirst := CurFirst^.Prior;
             ChangePermit := False;
             Fill_FieldBuf( 9 , Front );
             ChangePermit := True;
           end;
     end
  else
     begin
       CurCurrent       := CurCurrent^.Prior;
       i                := CurCurrent^.Index - CurFirst^.Index + 1;
       L_Number.Caption := IntToStr( CurCurrent^.Index ) + ' / ' + IntToStr( Last^.Index );

       Set_FieldAttr1(FieldBuf[i].NE,Focusing);
       Set_FieldAttr2(FieldBuf[i].E ,Focusing);
       Set_FieldAttr3(FieldBuf[i].ME,Focusing);
       Set_FieldAttr4(FieldBuf[i].P1,Focusing);
       Set_FieldAttr4(FieldBuf[i].P2,Focusing);
       Set_FieldAttr4(FieldBuf[i].P3,Focusing);
       Set_FieldAttr4(FieldBuf[i].P4,Focusing);
       Set_FieldAttr4(FieldBuf[i].P5,Focusing);
       Set_FieldAttr4(FieldBuf[i].P6,Focusing);
       Set_LineNumBer(i,Focusing);

       Set_FieldAttr1(FieldBuf[i+1].NE,NoFocus);
       Set_FieldAttr2(FieldBuf[i+1].E ,NoFocus);
       Set_FieldAttr3(FieldBuf[i+1].ME,NoFocus);
       Set_FieldAttr4(FieldBuf[i+1].P1,NoFocus);
       Set_FieldAttr4(FieldBuf[i+1].P2,NoFocus);
       Set_FieldAttr4(FieldBuf[i+1].P3,NoFocus);
       Set_FieldAttr4(FieldBuf[i+1].P4,NoFocus);
       Set_FieldAttr4(FieldBuf[i+1].P5,NoFocus);
       Set_FieldAttr4(FieldBuf[i+1].P6,NoFocus);
       Set_LineNumBer(i+1,NoFocus);

       Case Triggered_Field of
         NumberField : FieldBuf[i].NE^.SetFocus;
         MaskField   : FieldBuf[i].ME^.SetFocus;
         EditField   : FieldBuf[i].E^.SetFocus;
       end;

     end;
end;

{===============================================================================
       Down Key가 눌려 졌을 경우을 처리하는 Procedure.
 ===============================================================================}
Procedure TM_KI3030A.Process_KeyDown;
var
  i : Integer;
begin
  if  CurCurrent^.Index = CurLast^.Index  then
     begin
       if  CurCurrent^.Index < Last^.Index  then
           begin
             CurFirst     := CurFirst^.Next;
             ChangePermit := False;
             Fill_FieldBuf( 9 , Rear );
             ChangePermit := True;
           end;
     end
  else
     begin
       CurCurrent       := CurCurrent^.Next;
       i                := CurCurrent^.Index - CurFirst^.Index + 1;
       L_Number.Caption := IntToStr( CurCurrent^.Index ) + ' / ' + IntToStr( Last^.Index );

       Set_FieldAttr1(FieldBuf[i].NE,Focusing);
       Set_FieldAttr2(FieldBuf[i].E ,Focusing);
       Set_FieldAttr3(FieldBuf[i].ME,Focusing);
       Set_FieldAttr4(FieldBuf[i].P1,Focusing);
       Set_FieldAttr4(FieldBuf[i].P2,Focusing);
       Set_FieldAttr4(FieldBuf[i].P3,Focusing);
       Set_FieldAttr4(FieldBuf[i].P4,Focusing);
       Set_FieldAttr4(FieldBuf[i].P5,Focusing);
       Set_FieldAttr4(FieldBuf[i].P6,Focusing);
       Set_LineNumBer(i,Focusing);

       Set_FieldAttr1(FieldBuf[i-1].NE,NoFocus);
       Set_FieldAttr2(FieldBuf[i-1].E ,NoFocus);
       Set_FieldAttr3(FieldBuf[i-1].ME,NoFocus);
       Set_FieldAttr4(FieldBuf[i-1].P1,NoFocus);
       Set_FieldAttr4(FieldBuf[i-1].P2,NoFocus);
       Set_FieldAttr4(FieldBuf[i-1].P3,NoFocus);
       Set_FieldAttr4(FieldBuf[i-1].P4,NoFocus);
       Set_FieldAttr4(FieldBuf[i-1].P5,NoFocus);
       Set_FieldAttr4(FieldBuf[i-1].P6,NoFocus);
       Set_LineNumBer(i-1,NoFocus);

       Case Triggered_Field of
         NumberField : FieldBuf[i].NE^.SetFocus;
         MaskField   : FieldBuf[i].ME^.SetFocus;
         EditField   : FieldBuf[i].E^.SetFocus;
       end;
     end;
end;

{===============================================================================
                   Mouse OnClick Envent 처리
 ===============================================================================}
Procedure TM_KI3030A.Process_OnClick( Sender : TObject );
var
    i,j,k : integer;
begin

      if Copy(TComponent(Sender).Name,2,1) = '_' then
         j := 3
      else
         j := 4;

      i := StrToInt(Copy(TComponent(Sender).Name,j,1));

      {..... 새로운 Current Record임을 나타낸다.... }

      Set_FieldAttr1(FieldBuf[i].NE,Focusing);
      Set_FieldAttr2(FieldBuf[i].E ,Focusing);
      Set_FieldAttr3(FieldBuf[i].ME,Focusing);
      Set_FieldAttr4(FieldBuf[i].P1,Focusing);
      Set_FieldAttr4(FieldBuf[i].P2,Focusing);
      Set_FieldAttr4(FieldBuf[i].P3,Focusing);
      Set_FieldAttr4(FieldBuf[i].P4,Focusing);
      Set_FieldAttr4(FieldBuf[i].P5,Focusing);
      Set_FieldAttr4(FieldBuf[i].P6,Focusing);
      Set_LineNumBer(i,Focusing);

      {..... 현재 레코드의 상대적 위치를 구한다.........}

      j := CurCurrent^.Index - CurFirst^.Index + 1;

      {..... Current Record가 아님을 나타낸다..... }

      if i <> j then
      begin
           Set_FieldAttr1(FieldBuf[j].NE,NoFocus);
           Set_FieldAttr2(FieldBuf[j].E ,NoFocus);
           Set_FieldAttr3(FieldBuf[j].ME,NoFocus);
           Set_FieldAttr4(FieldBuf[j].P1,NoFocus);
           Set_FieldAttr4(FieldBuf[j].P2,NoFocus);
           Set_FieldAttr4(FieldBuf[j].P3,NoFocus);
           Set_FieldAttr4(FieldBuf[j].P4,NoFocus);
           Set_FieldAttr4(FieldBuf[j].P5,NoFocus);
           Set_FieldAttr4(FieldBuf[j].P6,NoFocus);
           Set_LineNumBer(j,NoFocus);
      end;

      {.....현재의 레코드을 가리키도록 Pointer를 조정......}

      if i > j  then
         begin
              for k := 1 to i - j do
                  CurCurrent := CurCurrent^.Next;
         end
      else
         if i < j then
         begin
              for k := 1 to j - i do
                  CurCurrent := CurCurrent^.Prior;
         end;

      L_Number.Caption := IntToStr(CurCurrent^.Index) + ' / ' + IntToStr(Last^.Index)
end;

{===============================================================================
          초기 신청금액과 지급예정금액의 합을 구하는 Procedure.
 ===============================================================================}
Procedure TM_KI3030A.Get_InitialSumValue;
var
  Tmp1,Tmp2 : Real;
  Pointer   : TRec_Ptr;
  i         : Integer;
begin
  Tmp1 := 0;
  Tmp2 := 0;
  Pointer := First;
  For i := 1 to Last^.Index do begin
      Tmp1 := Tmp1 + Pointer^.DrvAmt;
      if Pointer^.ChGiveYN = 'Y' then
         Tmp2 := Tmp2 + Pointer^.ChGiveAmt;
      Pointer := Pointer^.Next;
  end;

  P_DrvAmtSum.Caption  := FormatFloat('#,##0',Tmp1);
  P_GiveAmtSum.Caption := FormatFloat('#,##0',Tmp2);
end;

{===============================================================================
          Change_GiveYN Procedure.
 ===============================================================================}
Procedure TM_KI3030A.Change_GiveYN;
var
  i : Integer;
begin
     i := CurCurrent^.Index - CurFirst^.Index + 1;

     if FieldBuf[i].E^.Text = 'Y' then
        begin
             CurCurrent^.ChGiveYN   := 'N';
             CurCurrent^.ChGiveDate := '';
             CurCurrent^.ChGiveAmt  := 0;
             FieldBuf[i].E^.Text    := CurCurrent^.ChGiveYN;
             FieldBuf[i].ME^.Text   := CurCurrent^.ChGiveDate;
             FieldBuf[i].NE^.Value  := CurCurrent^.ChGiveAmt;
        end
     else
        begin
             CurCurrent^.ChGiveYN   := 'Y';
             CurCurrent^.ChGiveDate := Copy(CurDate,1,8);
             CurCurrent^.ChGiveAmt  := CurCurrent^.DrvAmt;
             FieldBuf[i].E^.Text    := CurCurrent^.ChGiveYN;
             FieldBuf[i].ME^.Text   := Copy(CurDate,1,8);
             FieldBuf[i].NE^.Value  := CurCurrent^.DrvAmt;
        end;
end;

{===============================================================================
          작업한 결과를 저장하는 Procedure
================================================================================}
Procedure TM_KI3030A.BatchSave;
var
  i        : Integer;
  Pointer  : TRec_Ptr;
  Flag     : Boolean;
begin

  P_Help.Caption := '';
  Gauge.Progress := 0 ;
  Gauge.MaxValue := Last^.Index;
  Gauge.Visible  := True;

  Pointer := First;
  Flag    := True;

  For i := 1 to Last^.Index do
      begin
           P_Help.Caption := ' 사번 : ' + Pointer^.EmpNO + ' 에대하여 처리 중 ';
           Gauge.Progress := i ;
           Application.ProcessMessages;

           if Pointer^.ChGiveYN = 'Y' then
              begin
                   Case Check_MasterRecord(Pointer^.EmpNo) of
                        0 :
                              Flag := Insert_MasterRecord(Pointer);
                        1 :
                              begin
                                   if Check_MasterUpdate( Pointer ) then
                                      Flag := Update_MasterRecord( Pointer )
                                   else
                                       begin
                                            Flag := False;
                                            System.Break;
                                       end;
                              end;
                       -1 :
                            begin
                                 Flag := False;
                                 System.Break;
                            end;
                   end;

                   if (Pointer^.DrvKind <> '3') AND Flag then
                      begin
                           Case Check_HistoryRecord(Pointer) of
                                0 :
                                       Flag := Insert_HistoryRecord(Pointer);
                                1 :
                                       Flag := Update_HistoryRecord(Pointer);
                               -1 :
                                    begin
                                         Flag := False;
                                         System.Break;
                                    end;
                           End;
                      end;

                  if Flag then
                     Flag := Update_AppRecord(Pointer)
                  else
                     begin
                          Flag := False;
                          System.Break;
                     end;

              end           { End of IF }
           else
              begin
                   Case Decide_Delete_UpDate(Pointer) of
                        0 :
                           begin
                                Flag := False;
                                System.Break;
                           end;
                        1 :
                            begin
                                 if Delete_HistoryRecord(Pointer) AND Delete_MasterRecord(Pointer) then
                                    Flag := Cancel_AppRecord(Pointer)
                                 else
                                     begin
                                          Flag := False;
                                          System.Break;
                                     end;
                            end;
                        2 :
                            begin
                                 if Cancel_HistoryRecord(Pointer) AND Cancel_MasterRecord1(Pointer) then
                                    Flag := Cancel_AppRecord(Pointer)
                                 else
                                    begin
                                         Flag := False;
                                         System.Break;
                                    end;
                            end;
                        3 :
                            if  Delete_MasterRecord (Pointer)  then
                                Flag := Cancel_AppRecord(Pointer)
                            else
                                begin
                                     Flag := False;
                                     System.Break;
                                end;
                        4 :
                            if  Cancel_MasterRecord2(Pointer)  then
                                Flag := Cancel_AppRecord(Pointer)
                            else
                                begin
                                     Flag := False;
                                     System.Break;
                                end;
                   End;   { End of Case }
              end;

      if not Flag then
         System.Break;
      Pointer := Pointer^.Next;
  end;  { End of For Loop }

  if Flag then
     Ora_Session.Commit
  else
     Ora_Session.RollBack;

  if Flag then
     begin
          Gauge.Visible  := False;
          P_HelP.Caption := ' ''일괄저장작업''이 성공적으로 수행되었습니다.';
     end
  else
     begin
          Gauge.Visible  := False;
          P_HelP.Caption := ' ''일괄저장작업''이 실패하였습니다.';
     end;

end;

{===============================================================================
    일괄지급취소를 수행하는 프로시져
 ===============================================================================}
Procedure TM_KI3030A.BatchCancel;
var
  Pointer  : TRec_ptr;
  Flag     : Boolean;
  i        : Integer;
begin

   P_Help.Caption := '';
   Gauge.Progress := 0 ;
   Gauge.MaxValue := Last^.Index;
   Gauge.Visible  := True;
   Pointer        := First;
   Flag           := True;

   For i := 1 to Last^.Index do
   begin

   P_Help.Caption := ' 사번 : ' + Pointer^.EmpNO + ' 에대하여 처리 중 ';
   Gauge.Progress := i ;
   Application.ProcessMessages;

   if Pointer^.ChGiveYN = 'N' then
   begin
   Ora_Session.StartTransaction;
   Case Decide_Delete_UpDate ( Pointer ) of
     0 :
        Flag := False;
     1 :
         begin
           if Delete_HistoryRecord(Pointer) AND Delete_MasterRecord(Pointer) then
              Flag := Cancel_AppRecord(Pointer)
           else
              Flag := False;
         end;
     2 :
         begin
          if Cancel_HistoryRecord(Pointer) AND Cancel_MasterRecord1(Pointer) then
             Flag := Cancel_AppRecord(Pointer)
          else
             Flag := False;
         end;
     3 :
         if  Delete_MasterRecord(Pointer)  then
             Flag := Cancel_AppRecord(Pointer)
         else
             Flag := False;
     4 :
         if  Cancel_MasterRecord2(Pointer)  then
             Flag := Cancel_AppRecord(Pointer)
         else
             Flag := False;
   End;   { End of Case }

   if Flag then
     Ora_Session.Commit
   else
     Ora_Session.RollBack;

   Pointer := Pointer^.Next;
   end     { End of IF }
   else
     Pointer := Pointer^.Next;

   end; { End of For Loop }

  if Flag then
     begin
          Gauge.Progress := 100;
          Gauge.Visible  := False;
          P_HelP.Caption := ' ''일괄지급취소작업''이 성공적으로 수행되었습니다.';
     end
  else
     begin
          Gauge.Visible  := False;
          P_HelP.Caption := ' ''일괄지급취소작업''이 실패하였습니다.'
     end;

end;

{===============================================================================
          일괄 지급을 수행하기 전에 일괄 지급 Marking을 하는 프로시져.
================================================================================}
Procedure TM_KI3030A.Mark_NtoY;
var
  i      : Integer;
  Cur    : TRec_Ptr;
begin
     Cur := First;
     For i := 1 to Last^.Index do
         begin
              Cur^.ChGiveYN   := 'Y';
              Cur^.ChGiveDate := Copy(CurDate,1,8);
              Cur^.ChGiveAmt  := Cur^.DrvAmt;
              Cur             := Cur^.Next;
         end;

     Cur := CurFirst;
     For i := 1 to (CurLast^.Index - CurFirst^.Index + 1) do begin
         FieldBuf[i].E^.Text    := 'Y';
         FieldBuf[i].ME^.Text   := Copy(CurDate,1,8);
         FieldBuf[i].NE^.Value  := Cur^.DrvAmt;
         Cur                    := Cur^.Next;
     end;
end;

{===============================================================================
          일괄 지급 취소을 수행하기 전에 일괄 지급 Marking을 하는 프로시져.
================================================================================}
Procedure TM_KI3030A.Mark_YtoN;
var
  i      : Integer;
  Cur    : TRec_Ptr;
begin
     Cur := First;

     For i := 1 to Last^.Index do
         begin
              Cur^.ChGiveYN   := 'N';
              Cur^.ChGiveDate := '';
              Cur^.ChGiveAmt  := 0;
              Cur             := Cur^.Next;
         end;

     Cur := CurFirst;
     For i := 1 to (CurLast^.Index - CurFirst^.Index + 1) do begin
         FieldBuf[i].E^.Text    := 'N';
         FieldBuf[i].ME^.Text   := '';
         FieldBuf[i].NE^.Value  := 0;
     end;
end;

{===============================================================================
         PayTable에 대한 Single Linked List를 만드는 Porcedure.
 1999.09.15 leerk
 연봉제도하에서는 호봉이 의미가 없습니다요.
=============================================================================== *
Procedure TM_KI3030A.Set_PayTable;
var
   Cur, Prev : TPayPtr;
   i         : Integer;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT PAYCL, PAYGR, ODAMT, ODTAXAMT                   ' );
     Qry1.Sql.Add( ' FROM   PKCPTBL                                         ' );
     Qry1.Sql.Add( ' WHERE  PAYNUM = (SELECT CPAYNUM FROM PKCPBAS)          ' );
     Qry1.Open;

     if Qry1.Eof then begin
        PayPtr := Nil;
        Qry1.Close;
        System.Exit;
     end;

     For i := 1 to Qry1.RecordCount do begin
         Prev := Cur;
         New(Cur);
         if i = 1 then
            PayPtr := Cur;

         Cur^.PayCl    := Qry1.FieldByName('PayCl').AsString;
         Cur^.PayGr    := Qry1.FieldByName('PayGr').AsFloat;
         Cur^.ODAmt    := Qry1.FieldByName('ODAmt').AsFloat;
         Cur^.ODTaxAmt := Qry1.FieldByName('ODTaxAmt').AsFloat;

         if i > 1 then
            Prev^.ptr  := Cur;
         Qry1.Next;
     end;

     Cur^.Ptr := Nil;
     Qry1.Close;
end;
 ===============================================================================}
 
{===============================================================================
         PayTable에 대한 Single Linked List를 해제시키는 Porcedure.
   30.05      1999.09.15         leerk           연봉제도하에서는 호봉이 의미가 없습니다요.
 ===============================================================================}
Procedure TM_KI3030A.Set_ODAmts(PayCl : String; PayGr : Real; CarOwner : String;
                                var ODAmt : Real; var ODTaxAmt : Real);
var
   Flag : Boolean;
   Cur  : TPayPtr;
begin
     Qry2.Close;
     Qry2.Sql.Clear;
     Qry2.Sql.Add( ' SELECT DRVAMT,DECODE (:carowner,''본인'',DRVTAXAMT,DRVAMT )  DRVTAXAMT ');
     Qry2.Sql.Add( ' FROM   PKCDRBAS                            ');
     Qry2.Sql.Add( ' WHERE  DRVKIND =''3''                      ');
     Qry2.Sql.Add( ' AND    :paycl BETWEEN PAYCLFR AND PAYCLTO  ');
     
     Qry2.ParamByName('CarOwner').AsString := CarOwner;
     Qry2.ParamByName('paycl').AsString := paycl;

     Qry2.Open;
     ODAmt     := Qry2.FieldByName('drvamt').Asfloat;
     ODtaxAmt  := Qry2.FieldByName('drvtaxamt').Asfloat;

     Qry2.Close;


{     Cur := PayPtr;
     if Cur = NIL then begin
        ODAmt    := -1;
        ODTaxAmt := -1;
        System.Exit;
     end;

     Flag := False;
     While Cur^.Ptr <> Nil do begin
           if (Cur^.PayCl = PayCl) AND (Cur^.PayGr = PayGr) then
              begin
                   Flag := True;
                   System.Break;
              end
           else
              Cur := Cur^.Ptr;
     end;

     if Flag then
        begin
             ODAmt := Cur^.ODAmt;
             if CarOwner = '본인' then
                ODTaxAmt := Cur^.ODTaxAmt
             else
                ODTaxAmt := Cur^.ODAmt;
        end
     else
        begin
             if (Cur^.PayCl = PayCl) AND (Cur^.PayGr = PayGr) then begin
                ODAmt := Cur^.ODAmt;
                if CarOwner = '본인' then
                   ODTaxAmt := Cur^.ODTaxAmt
                else
                   ODTaxAmt := Cur^.ODAmt;
             end
             else begin
                  ODAmt    := -1;
                  ODTaxAmt := -1;
             end;
        end;
        }
end;

{===============================================================================
         PayTable에 대한 Single Linked List를 해제시키는 Porcedure.
 ===============================================================================}
Procedure TM_KI3030A.Free_PayTable;
var
     Temp1,Temp2 : TPayPtr;
begin
     Temp1 := PayPtr;
     While Temp1^.Ptr <> NIL do begin
           Temp2 := Temp1^.ptr;
           Dispose(Temp1);
           Temp1 := Temp2;
     end;
     Dispose(Temp1);
end;

{==============================================================================
         초기화를 수행하는 Procedure.
 ==============================================================================}
Procedure TM_KI3030A.SetUp;
begin
     Get_RecordFlag   := False;
     L_1.Caption      := '';
     L_2.Caption      := '';
     L_3.Caption      := '';
     L_4.Caption      := '';
     L_5.Caption      := '';
     L_6.Caption      := '';
     L_7.Caption      := '';
     L_8.Caption      := '';
     L_9.Caption      := '';
     L_Number.Caption := '';

     P_Help.Caption := '   급여시스템에 접속 중입니다...';
     OraConnect;
     Application.ProcessMessages;

     CurDate             := fn_GetDateTimeStr;
     L_Date.Caption      := Copy(CurDate,1,4) + '-' + Copy(CurDate,5,2) + '-' +
                            Copy(CurDate,7,2);
     L_UserName.Caption  := PKorName+ '(' + Pempno + ')';
     Application.ProcessMessages;

     Mapping;
     Application.ProcessMessages;

     ME_FromDate.Text := Add_Months(Copy(CurDate,1,6),-1) + '16';
     ME_ToDate.Text   := Copy(CurDate,1,6) + '15';
     P_Help.Caption := '   급호테이블에서 자가운전지원금 항목을 읽고 있습니다...';
     Application.ProcessMessages;

//     Set_PayTable;

     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT * FROM PKCDRBAS ' );
     Qry1.Open;

     While not Qry1.Eof do begin
           if Qry1.FieldByName('Drvkind').AsString = '1' then begin
              DrvTaxAmt1 := Qry1.FieldByName('DrvTaxAmt').AsFloat;
              System.Break;
           end;
           Qry1.Next;
     end;

     Qry1.First;
     While not Qry1.Eof do begin
           if Qry1.FieldByName('Drvkind').AsString = '2' then begin
              DrvTaxAmt2 := Qry1.FieldByName('DrvTaxAmt').AsFloat;
              System.Break;
           end;
           Qry1.Next;
     end;
     Qry1.Close;

     P_Help.Caption := '';
end;

{==============================================================================
 ===================       Event Handlers      ================================
 ============================================================================== }
procedure TM_KI3030A.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

procedure TM_KI3030A.FormCreate(Sender: TObject);
begin
     ActiveFlag := True;
end;

procedure TM_KI3030A.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if IDYes = Application.MessageBox('종료하시겠습니까?','확 인',MB_YesNo) then
        begin
             if Get_RecordFlag then
                Free_DBLink;
             if PayPtr <> Nil then
                Free_PayTable;
             Action := caFree;
        end
     else
        Action := caNone;
end;

procedure TM_KI3030A.KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  Key = VK_DOWN  then
     begin
       Case TComponent( Sender ).Tag  of
         1,2,3,4,5,6,7,8,9 :
             Triggered_Field := NumBerField;   { NemberEdit Field에서 KeyEvent가 발생 }
         10,20,30,40,50,60,70,80,90 :
             Triggered_Field := MaskField;
         else
             Triggered_Field := EditField;
       end;
       Process_KeyDown;
     end
  else
     if Key = VK_UP then
       begin
         Case TComponent( Sender ).Tag  of
         1,2,3,4,5,6,7,8,9 :
             Triggered_Field := NumBerField;   { NemberEdit Field에서 KeyEvent가 발생 }
         10,20,30,40,50,60,70,80,90 :
             Triggered_Field := MaskField;
         else
             Triggered_Field := EditField;
         end;
         Process_KeyUp;
       end;

  if Key = VK_RETURN then
    begin
      Case TComponent( Sender ).Tag of
         1 : FieldBuf[1].ME^.SetFocus;
         2 : FieldBuf[2].ME^.SetFocus;
         3 : FieldBuf[3].ME^.SetFocus;
         4 : FieldBuf[4].ME^.SetFocus;
         5 : FieldBuf[5].ME^.SetFocus;
         6 : FieldBuf[6].ME^.SetFocus;
         7 : FieldBuf[7].ME^.SetFocus;
         8 : FieldBuf[8].ME^.SetFocus;
         9 : FieldBuf[9].ME^.SetFocus;
        10 : FieldBuf[1].E^.SetFocus;
        20 : FieldBuf[2].E^.SetFocus;
        30 : FieldBuf[3].E^.SetFocus;
        40 : FieldBuf[4].E^.SetFocus;
        50 : FieldBuf[5].E^.SetFocus;
        60 : FieldBuf[6].E^.SetFocus;
        70 : FieldBuf[7].E^.SetFocus;
        80 : FieldBuf[8].E^.SetFocus;
        90 : FieldBuf[9].E^.SetFocus;
       100 : FieldBuf[1].NE^.SetFocus;
       200 : FieldBuf[2].NE^.SetFocus;
       300 : FieldBuf[3].NE^.SetFocus;
       400 : FieldBuf[4].NE^.SetFocus;
       500 : FieldBuf[5].NE^.SetFocus;
       600 : FieldBuf[6].NE^.SetFocus;
       700 : FieldBuf[7].NE^.SetFocus;
       800 : FieldBuf[8].NE^.SetFocus;
       900 : FieldBuf[9].NE^.SetFocus;
      end; { End of Case }
   end; { End of IF }

   if Key = VK_Space  then
     begin
          Change_GiveYN;
          ChangeFlag := True;
          P_GiveAmtSum.Caption := Get_CurGiveAmtSum;
     end;

end;


procedure TM_KI3030A.BB_AllAllowClick(Sender: TObject);
var
   Msg : PChar;
begin
     Msg := '조회된 모든 자료에 대해 지급여부를 ''Y''로 표시합니다. ' +
            '일괄지급작업을 하시겠습니까?';
     if IDYes = Application.MessageBox(Msg,'작업안내',MB_YesNo) then
        begin
             Mark_NtoY;
             P_GiveAmtSum.Caption := Get_CurGiveAmtSum;
             //BatchSave;
             //tmp := P_Help.Caption;
             //Get_Records;
        end;
end;

procedure TM_KI3030A.BB_AllCancelClick(Sender: TObject);
var
   Msg : PChar;
begin
     Msg := '조회된 모든 자료에 대해 지급여부를 ''N''로 표시합니다. ' +
            '일괄취소작업을 하시겠습니까?';
     if IDYes = Application.MessageBox(Msg,'작업안내',MB_YesNo) then
        begin
             Mark_YtoN;
             P_GiveAmtSum.Caption := Get_CurGiveAmtSum;
             //BatchCancel;
        end;
end;

procedure TM_KI3030A.SP_FromDateClick(Sender: TObject);
begin
     Try
     Calendar := TCalendar.Create(Self);
     Calendar.ShowModal;
     ME_FromDate.Text := Calendar.DayCaption;
     Finally
     Calendar.Free;
     End;
end;

procedure TM_KI3030A.SP_ToDateClick(Sender: TObject);
begin
     Try
     Calendar := TCalendar.Create(Self);
     Calendar.ShowModal;
     ME_ToDate.Text := Calendar.DayCaption;
     Finally
     Calendar.Free;
     End;
end;

procedure TM_KI3030A.FormActivate(Sender: TObject);
begin
     if ActiveFlag then
        SetUp;
     ActiveFlag := False;
end;

procedure TM_KI3030A.BB_RunClick(Sender: TObject);
begin
     if Check_BeforeLookUp then
        begin
             if Get_RecordFlag then
                Free_DBLink;
             Get_Records;

             if Get_RecordFlag then
                begin
                     Get_InitialSumValue;
                     BB_AllAllow.Enabled    := True;
                     BB_AllCancel.Enabled   := True;
                     SB_UpDown.Enabled      := True;
                end
             else
                begin
                     P_DrvAmtSum.Caption    := '';
                     P_GiveAmtSum.Caption   := '';
                     BB_AllAllow.Enabled    := False;
                     BB_AllCancel.Enabled   := False;
                     SB_UpDown.Enabled      := False;
                end;
        end;
end;

procedure TM_KI3030A.SB_UpDownUpClick(Sender: TObject);
begin
     Process_KeyUp;
end;

procedure TM_KI3030A.SB_UpDownDownClick(Sender: TObject);
begin
     Process_KeyDown;
end;

procedure TM_KI3030A.SB_DrvKindClick(Sender: TObject);
begin
     Try
     S1_KI3030A := TS1_KI3030A.Create(Self);
     S1_KI3030A.ShowModal;
     P_DrvKind.Caption     := S1_KI3030A.DrvKind;
//     P_PayClFr.Caption     := S1_KI3030A.PayCl;
     P_DrvKindName.Caption := S1_KI3030A.DrvName;
     Finally
     S1_KI3030A.Free;
     End;
end;

procedure TM_KI3030A.OnClickEvent(Sender: TObject);
begin
     Process_OnClick(Sender);
end;

procedure TM_KI3030A.CB_GiveYNDblClick(Sender: TObject);
begin
     if UpperCase(CB_GiveYN.Text) = '' then
        CB_GiveYn.Text := 'N'
     else
        begin
             if UpperCase(CB_GiveYN.Text) = 'N' then
                CB_GiveYN.Text := 'Y'
             else
                CB_GiveYN.Text := '';
        end;
end;

procedure TM_KI3030A.DblClickEvent(Sender: TObject);
begin
     Change_GiveYN;
     ChangeFlag := True;
     P_GiveAmtSum.Caption := Get_CurGiveAmtSum;
end;

procedure TM_KI3030A.BB_MarkYClick(Sender: TObject);
var
  i : Integer;
begin
     i := CurCurrent^.Index - CurFirst^.Index + 1;

     CurCurrent^.ChGiveYN   := 'Y';
     CurCurrent^.ChGiveDate := Copy(CurDate,1,8);
     CurCurrent^.ChGiveAmt  := CurCurrent^.DrvAmt;
     FieldBuf[i].E^.Text    := CurCurrent^.ChGiveYN;
     FieldBuf[i].ME^.Text   := Copy(CurDate,1,8);
     FieldBuf[i].NE^.Value  := CurCurrent^.DrvAmt;

     ChangeFlag             := True;
     P_GiveAmtSum.Caption   := Get_CurGiveAmtSum;
     Process_KeyDown;
end;

procedure TM_KI3030A.BB_MarkNClick(Sender: TObject);
var
  i : Integer;
begin
     i := CurCurrent^.Index - CurFirst^.Index + 1;

     CurCurrent^.ChGiveYN   := 'N';
     CurCurrent^.ChGiveDate := '';
     CurCurrent^.ChGiveAmt  := 0;
     FieldBuf[i].E^.Text    := CurCurrent^.ChGiveYN;
     FieldBuf[i].ME^.Text   := CurCurrent^.ChGiveDate;
     FieldBuf[i].NE^.Value  := CurCurrent^.ChGiveAmt;

     ChangeFlag             := True;
     P_GiveAmtSum.Caption   := Get_CurGiveAmtSum;
     Process_KeyDown;
end;

procedure TM_KI3030A.BB_SaveClick(Sender: TObject);
var
   Msg : PChar;
begin
     Msg := '조회된 모든 자료에 대해 일괄저장작업을 시작합니다. ' +
            ' 작업을 시작할까요?';
     if IDYes = Application.MessageBox(Msg,'작업안내',MB_YesNo) then
        begin
             BatchSave;
        end;
end;

end.
