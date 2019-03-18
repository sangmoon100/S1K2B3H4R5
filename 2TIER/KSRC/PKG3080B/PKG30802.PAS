unit pkg30802;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, DBTables, Mask, MemDS, DBAccess, Ora;

type
  TS1_KG3080B = class(TForm)
    Panel5: TPanel;
    P_RealTerm: TPanel;
    Panel2: TPanel;
    P_OvtmDesc: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    L_ExtHH: TLabel;
    L_GenExt: TLabel;
    L_HoliExt: TLabel;
    L_NightHH: TLabel;
    L_HoliHH: TLabel;
    Panel9: TPanel;
    P_Total: TPanel;
    Panel12: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    L_ExtAmt: TLabel;
    L_NightAmt: TLabel;
    L_HoliAmt: TLabel;
    Label18: TLabel;
    L_ConEmp: TLabel;
    L_ConName: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    L_ConLEmp: TLabel;
    L_ConLName: TLabel;
    Label28: TLabel;
    BB_Close: TBitBtn;
    BB_Prior: TBitBtn;
    BB_Next: TBitBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    P_DeptName: TPanel;
    Panel10: TPanel;
    P_KorName: TPanel;
    P_EmpNO: TPanel;
    ME_Filter: TMaskEdit;
    Label26: TLabel;
    L_ConYN: TLabel;
    Qry1: TOraQuery;
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_PriorClick(Sender: TObject);
    procedure BB_NextClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Get_Record( OvtmDate, EmpNo, FrAppTime, FrRealTime : String );
  end;

var
  S1_KG3080B: TS1_KG3080B;

implementation

uses pkg30801;

{$R *.DFM}

{===============================================================================
 ====================  < User Define Procedure >  ==============================
 ===============================================================================}

{===============================================================================
          Current Record의 상세 내역을 가져오기 위한 프로시져.
================================================================================}
Procedure TS1_KG3080B.Get_Record( OvtmDate, EmpNo, FrAppTime, FrRealTime : String );
var
   StrBuf1 : String;
   StrBuf2 : String;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT ORGNUM, DEPTCODE, EMPNO, KORNAME,                   ' );
     Qry1.Sql.Add( '        OVTMDESC, FRREALTIME, TOREALTIME, EXTHH, NIGHTHH,   ' );
     Qry1.Sql.Add( '        HOLIHH, GENEXT, HOLIEXT, EXTAMT, NIGHTAMT, HOLIAMT, ' );
     Qry1.Sql.Add( '        OVTMHH, OVTMAMT, CONYN, CONEMP, CONLEMP             ' );
     Qry1.Sql.Add( ' FROM   PKHOTHIS                                            ' );
     Qry1.Sql.Add( ' WHERE  OVTMDATE = :ovtmdate AND EMPNO = :empno AND         ' );
     Qry1.Sql.Add( '        NVL(FRAPPTIME,''@'')  = :frapptime      AND         ' );
     Qry1.Sql.Add( '        NVL(FRREALTIME,''@'') = :frrealtime                 ' );
     Qry1.ParamByName('ovtmdate').AsString   := ovtmdate;
     Qry1.ParamByName('empno').AsString      := empno;
     if FrAppTime = '' then
        FrAppTime := '@';
     Qry1.ParamByName('frapptime').AsString  := frapptime ;
     if FrRealTime = '' then
        FrRealTime := '@';
     Qry1.ParamByName('frrealtime').AsString := frrealtime;
     Qry1.Open;

     {..... Query 결과를 화면에 Display 한다....}

     P_DeptName.Caption := M_KG3080B.Get_DeptName(Qry1.FieldByName('OrgNum').AsString,
                                                  Qry1.FieldByName('DeptCode').AsString);
     P_EmpNo.Caption    := Qry1.FieldByName('EmpNo').AsString;
     P_KorName.Caption  := Qry1.FieldByName('KorName').AsString;
     ME_Filter.EditMask := '9999-99-99 99:99;0;_';
     ME_Filter.Text     := Qry1.FieldByName('FrRealTime').AsString;
     ME_Filter.EditMask := '9999-99-99 99:99;1;_';
     StrBuf1            := ME_Filter.Text;
     ME_Filter.EditMask := '9999-99-99 99:99;0;_';
     ME_Filter.Text     := Qry1.FieldByName('ToRealTime').AsString;
     ME_Filter.EditMask := '9999-99-99 99:99;1;_';
     StrBuf2            := ME_Filter.Text;

     P_RealTerm.Caption := StrBuf1 + ' ∼ ' + StrBuf2;
     P_OvtmDesc.Caption := Qry1.FieldByName('OvtmDesc').AsString;
     L_ExtHH.Caption    := Qry1.FieldByName('ExtHH').AsString   + ' 시간';
     L_NightHH.Caption  := Qry1.FieldByName('NightHH').AsString + ' 시간';
     L_HoliHH.Caption   := Qry1.FieldByName('HoliHH').AsString  + ' 시간';
     L_GenExt.Caption   := Qry1.FieldByName('GenExt').AsString  + ' 시간';
     L_HoliExt.Caption  := Qry1.FieldByName('HoliExt').AsString + ' 시간';
     L_ExtAmt.Caption   := FormatFloat('#,##0',Qry1.FieldByName('ExtAmt').AsFloat);
     L_NightAmt.Caption := FormatFloat('#,##0',Qry1.FieldByName('NightAmt').AsFloat);
     L_HoliAmt.Caption  := FormatFloat('#,##0',Qry1.FieldByName('HoliAmt').AsFloat);

     P_ToTal.Caption    := Qry1.FieldByName('OvtmHH').AsString + ' 시간 : '  +
                           FormatFloat('#,##0',Qry1.FieldByName('OvtmAmt').AsFloat);
     L_ConEmp.Caption   := Qry1.FieldByName('ConEmp').AsString;
     L_ConName.Caption  := M_KG3080B.Get_KorName(Qry1.FieldByName('ConEmp').AsString);
     L_ConLEmp.Caption  := Qry1.FieldByName('ConLEmp').AsString;
     L_ConLName.Caption := M_KG3080B.Get_KorName(Qry1.FieldByName('ConLEmp').AsString);
     L_ConYN.Caption    := Qry1.FieldByName('ConYN').AsString;

     Qry1.Close;
end;

procedure TS1_KG3080B.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

procedure TS1_KG3080B.BB_PriorClick(Sender: TObject);
var
   OvtmDate   : String;
   EmpNo      : String;
   FrAppTime  : String;
   FrRealTime : String;
begin
     M_KG3080B.Qry2.Prior;
     OvtmDate   := M_KG3080B.Qry2.FieldByName('OvtmDate').AsString;
     EmpNo      := M_KG3080B.Qry2.FieldByName('EmpNo').AsString;
     FrAppTime  := M_KG3080B.Qry2.FieldByName('FrAppTime').AsString;
     FrRealTime := M_KG3080B.Qry2.FieldByName('FrRealTime').AsString;
     Get_Record(OvtmDate,EmpNo,FrAppTime,FrRealTime );
end;

procedure TS1_KG3080B.BB_NextClick(Sender: TObject);
var
   OvtmDate  : String;
   EmpNo     : String;
   FrAppTime : String;
   FrRealTime : String;
begin
     M_KG3080B.Qry2.Next;
     OvtmDate   := M_KG3080B.Qry2.FieldByName('OvtmDate').AsString;
     EmpNo      := M_KG3080B.Qry2.FieldByName('EmpNo').AsString;
     FrAppTime  := M_KG3080B.Qry2.FieldByName('FrAppTime').AsString;
     FrRealTime := M_KG3080B.Qry2.FieldByName('FrRealTime').AsString;
     Get_Record(OvtmDate,EmpNo,FrAppTime,FrRealTime );
end;

end.
