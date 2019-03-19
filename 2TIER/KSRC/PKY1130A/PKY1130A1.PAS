{-------------------------------------------------------------------------------
 PROGRAM-NAME   : PKY1130A(�İ��� �޿� �̷º���)
 SYSTEM-NAME    : �޿�
 SUBSYSTEM-NAME : �İ߿뿪��
 Programmer     : ������
 Version        : 1.00
 Date           : 2017.02.22
Update Contents
  ����    ������       ������  ���ñٰ�       ��������
  1.00    2017.02.22   ������  ���������     pkw2110g(�Ϲ��� ���޿��̷º���) ���α׷�ID ����
--------------------------------------------------------------------------------}

unit PKY1130A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, peoutlookbtn, pegradpanl, Db,
  DBTables, MemDS, DBAccess, Ora, Func;

type
  TFM_Main = class(TForm)
    P_Help: TPanel;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Panel1: TPanel;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    BBsave: TPeJeonOutLookBtn;
    BBclose: TPeJeonOutLookBtn;
    L_UserName: TLabel;
    L_Date: TLabel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel9: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    P_Count1: TPanel;
    P_WriteTime1: TPanel;
    P_PayDate1: TPanel;
    P_PayDate2: TPanel;
    P_WriteTime2: TPanel;
    P_Count2: TPanel;
    Label1: TLabel;
    Qry1: TOraQuery;
    procedure FormCreate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    ActiveFlag : Boolean ;
  public
    { Public declarations }
    curdate       : string;

    PayDate1      : String[06];
    PayDate2      : String[06];
    WriteTime1    : String[12];
    WriteTime2    : String[12];
    CheckValue    : Integer;
    ElapseTime    : LongInt;

     Procedure SetUp;
     Procedure Check_QryResult;
     Procedure Get_MaxDates;
     Function  Get_SysDate : String;
     Function  Check_History : Boolean;
     Function  Check_Counts : Boolean;
     Function  Check_DateValid( InDate : String ) : Boolean;

  end;

var
  FM_Main     : TFM_Main;
  sqlstr    : String;

implementation

uses  Pass;

{$R *.DFM}


{===============================================================================
    ���޿��ڷḦ �̷�ȭ�Ϸ� MOVE�ϱ� ���� ������Ȳ�� �����ϴ� ���ν���.

    CheckValue : 0 ->   �����޿���(���޿�,���޿��̷�)�� ��ȿ���� ���� ���.
    CheckValue : 1 ->  ( �����޿���(���޿�) - 1����)�ڷᰡ ���޿��̷�ȭ�Ͽ�
                       �����ϴ� ���,
    CheckValue : 2 ->  ( �����޿���(���޿�) - 1����)�ڷᰡ ���޿��̷�ȭ�Ͽ�
                       �������� �ʴ� ���,
    CheckValue : 3 ->  ����������(���޿�) = ����������(���޿��̷�) �̰�
                       Record count ���� ������ ���,
    CheckValue : 4 ->  ����������(���޿�) = ����������(���޿��̷�) ������
                       Record count ���� �������� �������,
    CheckValue : 5 ->  ����������(���޿�) < ����������(���޿��̷�) �� ���
================================================================================}

Procedure TFM_Main.Check_QryResult;
var
   tmp1,tmp2 : Real;
begin
  if not ( Check_DateValid( PayDate1 ) ) then
     begin
          CheckValue := 0;
          System.Exit;
     end
  else
      if not ( Check_DateValid( PayDate2 ) ) then
         begin
           if ( StrToInt( P_Count2.Caption ) = 0 ) then
               CheckValue := 1
           else
               CheckValue := 0;
           System.Exit;
         end;

  tmp1 := StrToFloat( PayDate1 );
  tmp2 := StrToFloat( PayDate2 );

  if tmp1 > tmp2 then
     begin
       if  Check_History then
           CheckValue := 1
       else
           CheckValue := 2;
     end
  else
     if tmp1 = tmp2 then
        begin
          if Check_Counts then
             CheckValue := 3
          else
             CheckValue := 4;
        end
     else
        CheckValue := 5;
end;

{==============================================================================
         Check_DateValid �Լ�.
 ==============================================================================}
Function TFM_Main.Check_DateValid( InDate : String ) : Boolean;
var
   Temp : Real;
   Buf  : String;
begin
     Buf := InDate;
     if Length(Buf) <> 6 then
        begin
           Result := False;
           System.Exit;
        end;

     Buf := Copy(Buf,1,4) + DateSeparator + Copy(Buf,5,2) + DateSeparator + '01' ;

     Try
     Temp := StrToDate( Buf );
     Except on EConvertError do
        begin
             Result := False;
             System.Exit;
        end;
     end;

     Result := True;

end;

{==============================================================================
         Check_History �Լ�.
 ==============================================================================}
Function TFM_Main.Check_History : Boolean;
begin

     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT COUNT(*)                                                ' );
     Qry1.Sql.Add( ' FROM   PKMPYCALC                                                 ' );
     Qry1.Sql.Add( ' WHERE  paydate = :paydate                                      ' );
     Qry1.ParamByName('paydate').AsString := PayDate1;
     Qry1.Open;

     if Qry1.Fields[0].AsInteger > 0 then
         Result := True
     else
         Result := False;

     Qry1.Close;
end;

{==============================================================================
         Check_Counts �Լ�.
 ==============================================================================}
Function TFM_Main.Check_Counts : Boolean;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT PAYDATE, EMPNO                 ' );
     Qry1.Sql.Add( ' FROM   PKMPYCALC                       ' );
     Qry1.Sql.Add( ' where  paydate = :paydate              ' );
     Qry1.Sql.Add( ' MINUS                                 ' );
     Qry1.Sql.Add( ' SELECT PAYDATE, EMPNO                 ' );
     Qry1.Sql.Add( ' FROM   PKHPYHIS                        ' );
     Qry1.Sql.Add( ' where  paydate = :paydate              ' );
     Qry1.ParamByName('paydate').AsString := PayDate1;
     Qry1.Open;

     if Qry1.Eof then
        Result := True
     else
        Result := False;
     Qry1.Close;
end;

{==============================================================================
         Get_SysDate �Լ�.
 ==============================================================================}
Function TFM_Main.Get_SysDate : String;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHHMM'')  ' );
     Qry1.Sql.Add( ' FROM   DUAL                               ' );
     Qry1.Open;
     Result := Qry1.Fields[0].AsString;
end;



Procedure TFM_Main.SetUp;
begin
     P_Help.Caption := '   �޿��ý��ۿ� ���� ���Դϴ�...';
     OraConnect;

     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
     Qry1.Sql.Add('FROM DUAL ');
     Qry1.Open;
     CurDate := Qry1.FieldByName('D').AsString;
     Qry1.Close;

     L_Date.Caption := Copy(CurDate,1,4) + '-' + Copy(CurDate,5,2) + '-' +
                       Copy(CurDate,7,2) + '   ';

     L_UserName.Caption := PKorName+ '(' + Pempno + ')';

     if (Copy(Pempno,1,1) = 'D') or ((Copy(Pgrade,3,1) <= 'C') and (fn_YmanagerCheck))  then  //fn_YmanagerCheck -> Func.Pas Library�� ����.
     begin
          PeJeonGrdPanel1.Caption := '�İ��� �޿� �̷º���';
     end
     else
     begin
          MessageBox(handle,'�İ��� ������ �ܿ��� ������ �� �����ϴ�.','�� ��',MB_OK or $0030);
          Close;
     end;

     Get_MaxDates;

     P_Help.Caption := '   ���ʼ����� �Ϸ�Ǿ����ϴ�...';
end;

Procedure TFM_Main.Get_MaxDates;
begin
     P_Help.Caption := '  ���� DB�� ����� ������ �а� �ֽ��ϴ�...';
     Application.ProcessMessages;

     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' select a.paydate, a.writetime, count(*) ');
     Qry1.Sql.Add( ' from (SELECT  MAX(PAYDATE) paydate, max(writetime) writetime ');
     Qry1.Sql.Add( '        from pkmpycalc ) a, pkmpycalc b  ');
     Qry1.Sql.Add( '         where a.paydate = b.paydate');
     Qry1.Sql.Add( '  group by a.paydate, a.writetime   ');
     Qry1.Open;

     PayDate1    := Qry1.Fields[0].AsString;
     WriteTime1  := Qry1.Fields[1].AsString;
     P_Count1.Caption := FormatFloat( '#,##0' , Qry1.Fields[2].AsInteger );

     if Length(PayDate1) = 6  then
        P_PayDate1.Caption := Copy(PayDate1,1,4) + '-' + Copy(PayDate1,5,2)
     else
        P_PayDate1.Caption := PayDate1;


     if Length(WriteTime1) = 12 then
        begin
             P_WriteTime1.Caption := Copy(WriteTime1,1,4) + '-' + Copy(WriteTime1,5,2);
             P_WriteTime1.Caption := P_WriteTime1.Caption + '-' + Copy(WriteTime1,7,2) + '  ';
             P_WriteTime1.Caption := P_WriteTime1.Caption + Copy(WriteTime1,9,2) + ':';
             P_WriteTime1.Caption := P_WriteTime1.Caption + Copy(WriteTime1,11,2);
        end
     else
         P_WriteTime1.Caption := WriteTime1;

     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT  MAX(PAYDATE),                                 ' );
     Qry1.Sql.Add( '         MAX(NVL(WRITETIME,'' '')), COUNT(*)           ' );
     Qry1.Sql.Add( ' FROM    PKHPYHIS                                       ' );
     Qry1.Sql.Add( ' WHERE   PAYDATE = :paydate                             ' );
     Qry1.ParamByName('paydate').AsString := PayDate1;
     Qry1.Open;

     PayDate2    := Qry1.Fields[0].AsString;
     WriteTime2  := Qry1.Fields[1].AsString;
     P_Count2.Caption := FormatFloat( '#,##0' , Qry1.Fields[2].AsInteger );

     if Length(PayDate2) = 6  then
        P_PayDate2.Caption := Copy(PayDate2,1,4) + '-' + Copy(PayDate2,5,2)
     else
        P_PayDate2.Caption := PayDate2;


     if Length(WriteTime2) = 12 then
        begin
             P_WriteTime2.Caption := Copy(WriteTime2,1,4) + '-' + Copy(WriteTime2,5,2);
             P_WriteTime2.Caption := P_WriteTime2.Caption + '-' + Copy(WriteTime2,7,2) + '  ';
             P_WriteTime2.Caption := P_WriteTime2.Caption + Copy(WriteTime2,9,2) + ':';
             P_WriteTime2.Caption := p_WriteTime2.Caption + Copy(WriteTime2,11,2);
        end
     else
         P_WriteTime2.Caption := WriteTime2;

     Qry1.Close;

     P_Help.Caption := '';
end;


procedure TFM_Main.FormCreate(Sender: TObject);
begin
   ActiveFlag := True;
end;

procedure TFM_Main.BBcloseClick(Sender: TObject);
begin
     close;
end;

procedure TFM_Main.BBsaveClick(Sender: TObject);
begin
  Check_QryResult;

  Case CheckValue of
    0 :
        P_Help.Caption := ' �İ��� ���޿��� ���޿��̷��� �������޿��� ��ȿ���� �ʽ��ϴ�.';
    1 :
        begin
            Qry1.Close;
            Qry1.Sql.Clear;
            Qry1.Sql.Add(' Insert into PKHPYHIS                        ');
            Qry1.Sql.Add(' Select * from  PKMPYCALC                     ');
            Qry1.Sql.Add(' Where paydate = :paydate                    ');
            Qry1.ParamByName('paydate').AsString := PayDate1;
            Qry1.ExecSQL ;
            Get_MaxDates;
            P_Help.Caption := '  ���޿������� ���������� �Ϸ�Ǿ����ϴ�. '
        end;
    2 :
        P_Help.Caption := '  (�����޿���(���޿�) - 1����)�ڷᰡ ���޿��̷�ȭ�Ͽ� �������� �ʽ��ϴ�.';
    3 :
        begin
             P_Help.Caption := '  ����������(���޿�) = ����������(���޿��̷�) �̰� Record�� ������ �����մϴ�.';
             if ( IDYes = Application.MessageBox('������ ������ �Ͻðڽ��ϱ�?','[Ȯ��]',MB_YesNo+MB_ICONQUESTION) ) then
                begin
                  Qry1.Close ;
                  Qry1.Sql.Clear;
                  Qry1.Sql.Add(' delete from PKHPYHIS                      ');
                  Qry1.Sql.Add(' where paydate = :paydate                  ');
                  Qry1.ParamByName('paydate').AsString := PayDate1;
                  Qry1.ExecSQL ;

                  Qry1.Close ;
                  Qry1.Sql.Clear;
                  Qry1.Sql.Add(' Insert into PKHPYHIS                      ');
                  Qry1.Sql.Add(' Select * from  PKMPYCALC                   ');
                  Qry1.Sql.Add(' Where paydate = :paydate                  ');
                  Qry1.ParamByName('paydate').AsString := PayDate1;
                  Qry1.ExecSQL ;

                  Get_MaxDates;
                  P_Help.Caption := '  ���޿������� ���������� �Ϸ�Ǿ����ϴ�. '
                end;
        end;
    4 :
        begin
             P_Help.Caption := '  ����������(���޿�) = ����������(���޿��̷�) ������ Record�� ������ �������� �ʽ��ϴ�.';
             //2015.10.28 jissi HR�� �������� ��û Record�� ������ �������� ������ �̷º����� �� �ֵ��� ����
             if ( IDYes = Application.MessageBox('������ ������ �Ͻðڽ��ϱ�?','[Ȯ��]',MB_YesNo+MB_ICONQUESTION) ) then
                begin
                  Qry1.Close ;
                  Qry1.Sql.Clear;
                  Qry1.Sql.Add(' delete from PKHPYHIS                      ');
                  Qry1.Sql.Add(' where paydate = :paydate                  ');
                  Qry1.ParamByName('paydate').AsString := PayDate1;
                  Qry1.ExecSQL ;

                  Qry1.Close ;
                  Qry1.Sql.Clear;
                  Qry1.Sql.Add(' Insert into PKHPYHIS                      ');
                  Qry1.Sql.Add(' Select * from  PKMPYCALC                   ');
                  Qry1.Sql.Add(' Where paydate = :paydate                  ');
                  Qry1.ParamByName('paydate').AsString := PayDate1;
                  Qry1.ExecSQL ;

                  Get_MaxDates;
                  P_Help.Caption := '  ���޿������� ���������� �Ϸ�Ǿ����ϴ�. '
                end;
        end;
    5 :
        P_Help.Caption := '  ����������(���޿�) < ����������(���޿��̷�) �� ��� ';
  end;

end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
     if ActiveFlag then
        setup;
     ActiveFlag := False;
end;

end.