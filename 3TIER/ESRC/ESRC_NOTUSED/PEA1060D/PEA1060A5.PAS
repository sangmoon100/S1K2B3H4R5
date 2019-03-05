unit PEA1060A5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, StdCtrls;

type
  Tsub_Form3 = class(TForm)
    Label5: TLabel;
    Memo_Prjview: TMemo;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
    Bt_Exit: TPeJeonOutLookBtn;
    procedure PeJeonOutLookBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
  if Memo_Prjview.Lines.Text <> '' then
    begin
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

      DataModule_Tmax.Cupd_SQL := Sqltext;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
      begin
        Messagedlg('APP-Server Error',mtError,[mbOK],0);
        Exit;
      end;
      MessageDlg('목표면담의견을 저장하였습니다.',mtinformation,[mbOK],0);
      prjview_UpDate := True;
    end;
end;

end.
