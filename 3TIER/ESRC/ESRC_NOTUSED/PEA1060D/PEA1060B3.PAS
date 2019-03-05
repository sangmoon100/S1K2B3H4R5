unit pea1060b3;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, StdCtrls, ExtCtrls, pegradpanl, kpaylib, OnScheme;

type
  Tsub_Form3 = class(TForm)
    Label5: TLabel;
    Memo_Prjview: TMemo;
    Pa_Title: TPeJeonGrdPanel;
    SF_Main: TOnSchemeForm;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
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
   // LSeqno     : real;
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
     //Ltime   : string;
     fv_e1prjview : string;
begin
    // Ltime   := DM.GetOracleTime;

     if Trim(Memo_Prjview.Lines.Text) = '' then  //20050927 JSH수정
     begin
          MessageDlg('목표면담은 필수 입력항목입니다.',mtinformation,[mbOK],0);
          Exit;
     end;

{
     Param := VarArrayOf([replace(Memo_Prjview.Lines.Text,'''','`'),
                          Lrabasdate,
                          Lempno,
                          FloatToStr(LSeqno)
                         ]);

     SqlText := Format('UPDATE PEHREAIM_DET SET '+
                       '  e1prjopinon = ''%s''  '+
                       ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND seqno = ''%s''  ',
                       [Param[0],
                        // 키부분
                        Param[1],Param[2],Param[3]]);
}
     Param := VarArrayOf([replace(Memo_Prjview.Lines.Text,'''','`'),
                          Lrabasdate,
                          Lempno
                         ]);

     SqlText := Format('UPDATE PEHREAIM_PJT                             '+
                       '   SET e1prjopinon = ''%s''                     '+
                       ' WHERE rabasdate   = ''%s'' AND empno = ''%s''  ',
                       [Param[0],
                        // 키부분
                        Param[1],Param[2]]);

     //Edit1.Text := SqlText;
     DataModule_Tmax.Cupd_SQL := Sqltext;
     DataModule_Tmax.Cupd_Exec;

     if  not DataModule_Tmax.Cupd_ret then
     begin
          Messagedlg('APP-Server Error',mtError,[mbOK],0);
          Exit;
     end;
     MessageDlg('목표면담의견을 저장하였습니다.',mtinformation,[mbOK],0);
     close;
end;

procedure Tsub_Form3.Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
     if  ssleft in shift then
     begin
          Releasecapture;
          Self.Perform(WM_SYSCOMMAND, $F012, 0);
     end;
end;

end.
