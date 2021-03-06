unit pea1060b3;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, StdCtrls, ExtCtrls, pegradpanl, kpaylib, OnScheme, Db,
  Tmax_DataSetText;

type
  Tsub_Form3 = class(TForm)
    Label5: TLabel;
    SF_Main: TOnSchemeForm;
    Pa_Title: TPeJeonGrdPanel;
    Memo_Prjview: TMemo;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
    DBSet10: TTMaxDataSet;
    procedure PeJeonOutLookBtn1Click(Sender: TObject);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    //Pwork      : string;
    //Pgubun     : integer;     // 1: 수정 , 2: 추가
    //Pework     : string;
    Lrabasdate : string;
    //Lfordate   : string;
    Lempno     : string;
    //Lwriteemp  : string;
    LSeqno     : real;
    //UpDateOk   : Boolean;
    //prjview_UpDate : Boolean;
    //gsLastConEv: String; //업무목표최종결재자 (1차 or 2차)
    //vDeptcode : String;
  end;

var
  sub_Form3: Tsub_Form3;

implementation
 uses Hinsa_TmaxDM, peDm;
{$R *.DFM}

procedure Tsub_Form3.PeJeonOutLookBtn1Click(Sender: TObject);
var
 Param   : OleVariant;
 sql,SqlText : string;
 Ltime   : string;
 fv_e1prjview : string;
begin
   Ltime   := DM.GetOracleTime;

   SqlText := ' Select count(*) from PEHREAIM_PJT '+
              ' WHERE rabasdate = '''+ Lrabasdate+''''+
              '   AND empno     = '''+ Lempno+'''' ;
   with DBSet10 do
   begin
      Close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;

      if RecordCount > 0 then
      begin
         if DBSet10.FieldByName('SEL_DATA').AsString = '0' then
         Begin
             SqlText := ' INSERT INTO PEHREAIM_PJT '+
                        ' select rabasdate, empno, deptcode, null, ''N'' '+
                        ' from pehremas  '+
                        ' where rabasdate = '''+ Lrabasdate+''' '+
                        '   and empno     = '''+ Lempno +'''';

             DataModule_Tmax.Cupd_SQL := Sqltext;
             DataModule_Tmax.Cupd_Exec;
             if not DataModule_Tmax.Cupd_ret then
             begin
                  Messagedlg('APP-Server Error',mtError,[mbOK],0);
                  Exit;
             end;
         End;
      end;
      close;
   end;

      Param := VarArrayOf([replace(Memo_Prjview.Lines.Text,'''','`'),
                           Lrabasdate,
                           Lempno
                          ]);

      SqlText := Format('UPDATE PEHREAIM_PJT SET '+
                        '  e1prjopinon = ''%s''  '+
                        ' WHERE rabasdate = ''%s'' AND empno = ''%s''  ',
                        [Param[0],
                         // 키부분
                         Param[1],Param[2]]);

   DataModule_Tmax.Cupd_SQL := Sqltext;
   DataModule_Tmax.Cupd_Exec;
   if not DataModule_Tmax.Cupd_ret then
   begin
        Messagedlg('APP-Server Error',mtError,[mbOK],0);
        Exit;
   end;
   MessageDlg('목표면담의견을 저장하였습니다.',mtinformation,[mbOK],0);
      //prjview_UpDate := True;
   //end;
   close;
end;

procedure Tsub_Form3.Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ssleft in shift then
  begin
    Releasecapture;
    Self.Perform(WM_SYSCOMMAND, $F012, 0);
  end;
end;

end.
