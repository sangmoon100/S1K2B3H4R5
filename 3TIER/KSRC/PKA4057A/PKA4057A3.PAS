unit PKA4057A3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, ExtCtrls, Db, Tmax_DataSetText,func,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditMemo, OnShapeLabel, PDownLoad, Pass,
  Tmax_DmlSet, Tmax_session, OnLineLabel, OnScheme;

type
  TFM_subMain = class(TForm)
    SF_Main: TOnSchemeForm;
    PA_MainPanel: TPanel;
    Label12: TLabel;
    Label11: TLabel;
    Shape2: TShape;
    OnSectionLabel3: TOnSectionLabel;
    Label1: TLabel;
    Shape101: TShape;
    SL_Yearly_Cnt: TOnShapeLabel;
    Label64: TLabel;
    Shape8: TShape;
    SL_Yearlyplan_Cnt: TOnShapeLabel;
    Label8: TLabel;
    Shape9: TShape;
    SL_Used_Yearly_Cnt: TOnShapeLabel;
    Label9: TLabel;
    Shape10: TShape;
    SL_Unused_Yearly_Cnt: TOnShapeLabel;
    Label10: TLabel;
    Label2: TLabel;
    BT_Next: TOnFocusButton;
    QR_com: TTMaxDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_NextClick(Sender: TObject);
  private
    { Private declarations }
    GSHomeDir  : string;
  public
    { Public declarations }
    
  end;

var
  FM_subMain: TFM_subMain;

implementation
uses
  pka4057a1;

{$R *.DFM}




procedure TFM_subMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFM_subMain.BT_NextClick(Sender: TObject);
begin
    //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
    //if (fm_main.FG_Empno <> fm_main.ED_empno.empno) then
    if (fm_main.FG_Empno <> fm_main.GV_empno) then
    begin
        if(Application.MessageBox('본인 연차고지일수만 고지완료 할 수 있습니다.','[알림]',
                        MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK) then exit;
    end
    else
    begin
        if(fm_main.SL_Notice_Yn.LabelCaption<>'Y')and
          (strtofloat(fm_main.SL_Yearly_Cnt.LabelCaption) > 0)  then
        begin
        {2014.06.24.hjku.   이명노M 요청으로 삭제..
            if(strtofloat(SL_Unused_Yearly_Cnt.LabelCaption) <= 0) then
            begin
               //2014.06.03.hjku. 문구수정요청... 이명노 M 요청
               //MessageDlg('이미 연차 사용목표를 달성하였습니다.', mtInformation, [mbOK], 0);

               MessageDlg('금년도 미사용 연차휴가 사용계획이 등록(제출) 완료되었습니다.'+#13+
                          '[연차휴가 사용일 변경은 ''연차휴가 사용/변경'' 메뉴에서 변경 가능]', mtInformation, [mbOK], 0);
            end;
         }
            with QR_com do
            begin
                ServiceName := 'PKA4040A_dml';
                Close;
                SQL.Clear;
                SQL.Add('UPDATE PKYEARLT                                           ');
                SQL.Add('SET NOTICE_YN   =''Y'',                                   ');
                SQL.Add('    NOTICEEMPNO = ''' + fm_main.FG_empno + ''',                   ');
                SQL.Add('    NOTICETIME  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')   ');
                SQL.Add(' WHERE yearly_yy = '''+fm_main.FG_yy+'''                             ');
                //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
                //SQL.Add('   AND empno = '''+fm_main.ED_empno.empno+'''                        ');
                SQL.Add('   AND empno = '''+fm_main.GV_empno+'''                        ');
                //2014.06.10.hjku. 확인한 데이타는 업데이트 하지 않게.. 이명노M 요청
                SQL.Add('   AND nvl(NOTICE_YN,''N'') <> ''Y''                                    ');

                //memo1.text := sql.text;

                try
                     Execute
                except
                     Exit;
                end;
            end;
        end;
        fm_main.PL_Get_pkyearlt(fm_main.FG_yy,fm_main.GV_empno);
    end;

    close;
end;

end.
