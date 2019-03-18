unit pkg30803;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, DBTables, MemDS, DBAccess, Ora;

type
  TS2_KG3080B = class(TForm)
    Panel5: TPanel;
    P_RCount1: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    P_SumHH: TPanel;
    P_SumAmt: TPanel;
    P_AvgHH: TPanel;
    P_AvgAmt: TPanel;
    BB_Close: TBitBtn;
    Panel7: TPanel;
    P_RCount2: TPanel;
    P_ConAvgHH: TPanel;
    P_ConSumHH: TPanel;
    Panel10: TPanel;
    Bevel1: TBevel;
    Qry1: TOraQuery;
    procedure BB_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Get_Statistics;
  end;

var
  S2_KG3080B: TS2_KG3080B;

implementation

uses pkg30801;

{$R *.DFM}

Procedure TS2_KG3080B.Get_Statistics;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT COUNT(*),                                           ' );
     Qry1.Sql.Add( '        SUM( NIGHTHH + HOLIHH + GENEXT + HOLIEXT ),         ' );
     Qry1.Sql.Add( '        AVG( NIGHTHH + HOLIHH + GENEXT + HOLIEXT )          ' );
     Qry1.Sql.Add( ' FROM   PKHOTHIS                                            ' );
     Qry1.Sql.Add( ' WHERE  EMPNO    LIKE            ''' + M_KG3080B.E_EmpNo.Text    + '%' + ''' AND  ' );
     Qry1.Sql.Add( '        NVL(PAYCL,'' '')    LIKE ''' + M_KG3080B.E_PayCl.Text    + '%' + ''' AND  ' );
     Qry1.Sql.Add( '        NVL(OTKIND,''  '')  LIKE ''' + M_KG3080B.E_OtKind.Text   + '%' + ''' AND  ' );
     Qry1.Sql.Add( '        NVL(CONYN,'' '')    LIKE ''' + M_KG3080B.CB_ConYN.Text   + '%' + ''' AND  ' );
     Qry1.Sql.Add( '        NVL(DINNER,'' '')   LIKE ''' + M_KG3080B.CB_Dinner.Text  + '%' + ''' AND  ' );
     Qry1.Sql.Add( '        ( OVTMDATE >= :frDate AND OVTMDATE <= :toDate )      ' );
     Qry1.ParamByName('frdate').AsString := M_KG3080B.ME_FrDate.Text;
     Qry1.ParamByName('todate').AsString := M_KG3080B.ME_ToDate.Text;
     Qry1.Open;

     P_RCount1.Caption := FormatFloat( '#,##0', Qry1.Fields[0].AsFloat );
     P_SumHH.Caption   := FormatFloat( '#,##0', Qry1.Fields[1].AsFloat );
     P_AvgHH.Caption   := FormatFloat( '#,##0', Qry1.Fields[2].AsFloat );


     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT COUNT(*),                                           ' );
     Qry1.Sql.Add( '        SUM( NIGHTHH + HOLIHH + GENEXT + HOLIEXT ),         ' );
     Qry1.Sql.Add( '        AVG( NIGHTHH + HOLIHH + GENEXT + HOLIEXT ),         ' );
     Qry1.Sql.Add( '        SUM(OVTMAMT), AVG(OVTMAMT)                          ' );
     Qry1.Sql.Add( ' FROM   PKHOTHIS                                            ' );
     Qry1.Sql.Add( ' WHERE  EMPNO    LIKE            ''' + M_KG3080B.E_EmpNo.Text    + '%' + ''' AND  ' );
     Qry1.Sql.Add( '        NVL(PAYCL,'' '')    LIKE ''' + M_KG3080B.E_PayCl.Text    + '%' + ''' AND  ' );
     Qry1.Sql.Add( '        NVL(OTKIND,''  '')  LIKE ''' + M_KG3080B.E_OtKind.Text   + '%' + ''' AND  ' );
     Qry1.Sql.Add( '        UPPER(CONYN)        =    ''' + 'Y'                       +       ''' AND  ' );
     Qry1.Sql.Add( '        NVL(DINNER,'' '')   LIKE ''' + M_KG3080B.CB_Dinner.Text  + '%' + ''' AND  ' );
     Qry1.Sql.Add( '        ( OVTMDATE >= :frDate AND OVTMDATE <= :toDate )      ' );
     Qry1.ParamByName('frdate').AsString := M_KG3080B.ME_FrDate.Text;
     Qry1.ParamByName('todate').AsString := M_KG3080B.ME_ToDate.Text;
     Qry1.Open;

     P_RCount2.Caption  := FormatFloat('#,##0',Qry1.Fields[0].AsFloat);
     P_ConSumHH.Caption := FormatFloat('#,##0',Qry1.Fields[1].AsFloat);
     P_ConAvgHH.Caption := FormatFloat('#,##0',Qry1.Fields[2].AsFloat);
     P_SumAmt.Caption   := FormatFloat('#,##0',Qry1.Fields[3].AsFloat);
     P_AvgAmt.Caption   := FormatFloat('#,##0',Qry1.Fields[4].AsFloat);
     Qry1.Close;
end;

procedure TS2_KG3080B.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

end.
