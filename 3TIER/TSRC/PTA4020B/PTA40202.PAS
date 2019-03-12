unit PTA40202;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, StdCtrls, OnFocusButton, Grids, DBGridEh, OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit, Mask, Db,
  Tmax_DataSetText, OnEditCombo, Func;//, DRMUnit;

type
  TfrmReg = class(TForm)
    SF_Sub: TOnSchemeForm;
    ED_empno: TTMaxPersonPopupEdit;
    ED_dept: TOnWinPopupEdit;
    ED_Payra: TOnWinPopupEdit;
    DBGridEh1: TDBGridEh;
    ED_Eduname: TOnWinPopupEdit;
    OnFocusButton2: TOnFocusButton;
    OnFocusButton3: TOnFocusButton;
    OnFocusButton5: TOnFocusButton;
    OnFocusButton6: TOnFocusButton;
    ED_Grade: TOnWinPopupEdit;
    ED_Educoment: TOnWinPopupEdit;
    ED_Rabasdate: TMaskEdit;
    OnWinPopupEdit2: TOnWinPopupEdit;
    OnWinPopupEdit6: TOnWinPopupEdit;
    ED_Stime: TMaskEdit;
    OnWinPopupEdit7: TOnWinPopupEdit;
    ED_Etime: TMaskEdit;
    OnWinPopupEdit8: TOnWinPopupEdit;
    ED_Xtime: TMaskEdit;
    ED_Time: TOnWinPopupEdit;
    ED_Satper1: TOnWinPopupEdit;
    ED_Relate: TOnWinPopupEdit;
    ED_Coment: TOnWinPopupEdit;
    TDS_Grid1: TTMaxDataSet;
    TDS_dml: TTMaxDataSet;
    ED_gubun: TOnComboEdit;
    TDS_Sel: TTMaxDataSet;
    ED_Edugubun: TOnWinPopupEdit;
    ED_Satper: TMaskEdit;
    DS_Grid1: TDataSource;
    FileOpenDlg: TOpenDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    OnFocusButton7: TOnFocusButton;
    ED_cost: TOnWinPopupEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow;
    procedure OnFocusButton6Click(Sender: TObject);
    procedure OnFocusButton2Click(Sender: TObject);
    procedure ED_EdugubunInitPopup(Sender: TObject);
    procedure ED_EdugubunCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_StimeChange(Sender: TObject);
    procedure ED_EtimeChange(Sender: TObject);
    procedure ED_XtimeChange(Sender: TObject);
    procedure OnFocusButton3Click(Sender: TObject);
    procedure OnFocusButton5Click(Sender: TObject);
    procedure OnFocusButton7Click(Sender: TObject);
    procedure FileSave;
    procedure SaveData;
    procedure LabelClear;
    procedure ED_RabasdateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_StimeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_EtimeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_XtimeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_SatperKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function LPadStr(basestr : String; num : integer; padstr : String):string;
    procedure ED_empnoSelect(Sempno : String);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure ED_empnoExit(Sender: TObject);
  private
    { Private declarations }
    ReadCnt : integer;
  public
    { Public declarations }
  end;

type
 errFile = record
           errlog : array[1..300] of char;
           lfcr   : array[1..2]  of char;
end;

type
  AnFile = record
           empno       : string[4];
           korname     : string[12];
           gubun       : string[15];
           grade       : string[8];
           edugubun    : string[4];
           eduname     : string[100];
           educoment   : string[100];
           rabasdate   : string[8];
           stime       : string[4];
           etime       : string[4];
           xtime       : string[4];
           lectime     : string[4];
           leccost     : string[6];
           satper      : string[3];
           relate      : string[50];
           coment      : string[50];
end;

var
  frmReg: TfrmReg;
  F           : system.Text;
  Ef          : file of errFile;
  AData       : AnFile;
  ErrData     : errFile;
  HomeDir     : string;
  SaveKorname : string;
  S_empno     : string;
  S_rabasdate : string;
  S_Stime     : string;


implementation

uses PTA40201, PTA40203;
{$R *.DFM}

procedure TfrmReg.FormCreate(Sender: TObject);
begin
  DBGridEh1.RowsHeight := 22;
  FormShow;
end;

procedure TfrmReg.FormShow;
begin
     with TDS_Grid1 do
     begin
          ServiceName := 'PTA4020B_sel1';
          Close;
          SQL.Clear;
          Sql.Add('select rabasym,                                           ');
          Sql.Add('       empno,                                             ');
          Sql.Add('       korname,                                           ');
          Sql.Add('       (select deptname from pycdept                      ');
          Sql.Add('         where orgnum=(select value1                      ');
          Sql.Add('                         from pimvari                     ');
          Sql.Add('                        where gubun=''00''                ');
          Sql.Add('                          and sgubun=''0001'')            ');
          Sql.Add('           and deptcode=(select deptcode                  ');
          Sql.Add('                           from pimpmas                   ');
          Sql.Add('                          where empno=a.empno)) deptname, ');
          Sql.Add('       (select codename from pyccode                      ');
          Sql.Add('         where codeid=''I113''                            ');
          Sql.Add('           and codeno=(select payra                       ');
          Sql.Add('                          from pimpmas                    ');
          Sql.Add('                         where empno=a.empno)) codefname, ');
          Sql.Add('       gubun,                                             ');
          Sql.Add('       grade,                                             ');
          Sql.Add('       edugubun,                                          ');
          Sql.Add('       eduname,                                           ');
          Sql.Add('       educoment,                                         ');
          Sql.Add('       rabasdate,                                         ');
          Sql.Add('       stime,                                             ');
          Sql.Add('       etime,                                             ');
          Sql.Add('       xtime,                                             ');
          Sql.Add('       lectime,                                           ');
          Sql.Add('       leccost,                                           ');
          Sql.Add('       satper,                                            ');
          Sql.Add('       logemp,                                            ');
          Sql.Add('       relate,                                            ');
          Sql.Add('       coment,                                            ');
          Sql.Add('       giveyn                                             ');
          Sql.Add('  from pedulhis a                                         ');
          if  copy(ED_empno.Text,1,4) <> '' then
          begin
             Sql.Add(' where a.empno  = ''' + copy(ED_empno.Text,1,4) + '''  ');
             if ED_Edugubun.Text <> '' then
                Sql.Add(' and a.edugubun = ''' + copy(ED_Edugubun.Text,1,4) + '''');
          end;
          Sql.Add(' order by a.rabasdate desc,a.empno                        ');

//          EDIT1.TEXT := SQL.TEXT;
          ClearFieldInfo;
          AddField('RABASYM'  , ftString,   6);
          AddField('EMPNO'    , ftString,   4);
          AddField('KORNAME'  , ftString,  12);
          AddField('DEPTNAME' , ftString,  60);
          AddField('CODEFNAME', ftString,  30);
          AddField('GUBUN'    , ftString,  15);
          AddField('GRADE'    , ftString,   8);
          AddField('EDUGUBUN' , ftString,   4);
          AddField('EDUNAME'  , ftString, 100);
          AddField('EDUCOMENT', ftString, 100);
          AddField('RABASDATE', ftString,   8);
          AddField('STIME'    , ftString,   4);
          AddField('ETIME'    , ftString,   4);
          AddField('XTIME'    , ftString,   4);
          AddField('LECTIME'  , ftFloat,    4);
          AddField('LECCOST'  , ftFloat,    6);
          AddField('SATPER'   , ftFloat,    3);
          AddField('LOGEMP'   , ftString,   4);
          AddField('RELATE'   , ftString,  50);
          AddField('COMENT'   , ftString,  50);
          AddField('GIVEYN'   , ftString,   1);

          Open;
          TFloatField(FieldByName('LECTIME')).DisplayFormat := '###.0';
          TFloatField(FieldByName('LECCOST')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('SATPER')).DisplayFormat  := '0.0'  ;
          TStringField(FieldByName('STIME')).EditMask       := '!90:00;0;_';
          TStringField(FieldByName('ETIME')).EditMask       := '!90:00;0;_';
          TStringField(FieldByName('XTIME')).EditMask       := '!90:00;0;_';
          TStringField(FieldByName('RABASDATE')).EditMask   := '!0000-00-00;0;_';


          if TDS_Grid1.RecordCount = 0 then
          begin
               OnFocusButton2.Caption := '저장';
               //OnFocusButton5.Enabled := False;
          end;

     end;
     S_empno     := '';
     S_rabasdate := '';
     S_Stime     := '';
end;

procedure TfrmReg.OnFocusButton6Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmReg.OnFocusButton2Click(Sender: TObject);
begin
     if ED_empno.Text = '' then
     begin
          Application.MessageBox('사원을 입력해주세요.','미입력',MB_OK);
          Exit;
     end;

     if ED_dept.Text = '' then
     begin
          Application.MessageBox('사원을 선택해주세요.','미선택',MB_OK);
          Exit;
     end;

     if ED_Edugubun.Text = '' then
     begin
          Application.MessageBox('교육유형을 입력해주세요.','미입력',MB_OK);
          Exit;
     end;

     if ED_Eduname.Text = '' then
     begin
          Application.MessageBox('과정명을 입력해주세요.','미입력',MB_OK);
          Exit;
     end;

     if ED_Rabasdate.Text = '' then
     begin
          Application.MessageBox('날짜를 입력해주세요.','미입력',MB_OK);
          Exit;
     end;

     if ED_Stime.Text = '' then
     begin
          Application.MessageBox('시작시간을 입력해주세요.','미입력',MB_OK);
          Exit;
     end;

     if ED_Etime.Text = '' then
     begin
          Application.MessageBox('종료시간을 입력해주세요.','미입력',MB_OK);
          Exit;
     end;

     if ED_cost.Text = '' then
     begin
          Application.MessageBox('단가를 입력해주세요.','미입력',MB_OK);
          Exit;
     end;

     if ED_Xtime.Text = '' then
     begin
          ED_Xtime.Text := '0000';
     end;

     if ED_Satper.Text = '' then
     begin
          Application.MessageBox('만족도를 입력해주세요.','미입력',MB_OK);
          Exit;
     end;

     if StrToFloat(ED_Satper.Text) > 5 then
     begin
          Application.MessageBox('만족도는 5를 넘지 않습니다.','오류',MB_OK);
          Exit;
     end;

     if OnFocusButton2.Caption = '저장' then
     begin
          with TDS_dml do
          begin
               ServiceName := 'PTA4020B_sel1';
               Close;
               SQL.Clear;
               Sql.Add('select rabasym, empno,                                    ');
               Sql.Add('       korname,                                           ');
               Sql.Add('       (select deptname from pycdept                      ');
               Sql.Add('         where orgnum=(select value1                      ');
               Sql.Add('                         from pimvari                     ');
               Sql.Add('                        where gubun=''00''                ');
               Sql.Add('                          and sgubun=''0001'')            ');
               Sql.Add('           and deptcode=(select deptcode                  ');
               Sql.Add('                           from pimpmas                   ');
               Sql.Add('                          where empno=a.empno)) deptname, ');
               Sql.Add('        (select codename from pyccode                     ');
               Sql.Add('          where codeid=''I113''                           ');
               Sql.Add('            and codeno=(select payra                      ');
               Sql.Add('                          from pimpmas                    ');
               Sql.Add('                         where empno=a.empno)) codefname, ');
               Sql.Add('       gubun,grade, edugubun, eduname, educoment,         ');
               Sql.Add('       rabasdate, stime, etime, xtime, lectime, leccost,  ');
               Sql.Add('       satper, logemp, relate, coment, giveyn             ');
               Sql.Add('  from pedulhis a                                         ');
               Sql.Add(' where a.rabasdate = ''' + ED_Rabasdate.Text + '''        ');
               Sql.Add('   and a.stime     = ''' + ED_Stime.Text     + '''        ');
               Sql.Add('   and a.empno     = ''' + copy(ED_empno.Text,1,4)+ '''   ');

               ClearFieldInfo;
               AddField('RABASYM'  , ftString,   6);
               AddField('EMPNO'    , ftString,   4);
               AddField('KORNAME'  , ftString,  12);
               AddField('DEPTNAME' , ftString,  60);
               AddField('CODEFNAME', ftString,  30);
               AddField('GUBUN'    , ftString,  15);
               AddField('GRADE'    , ftString,   8);
               AddField('EDUGUBUN' , ftString,   4);
               AddField('EDUNAME'  , ftString, 100);
               AddField('EDUCOMENT', ftString, 100);
               AddField('RABASDATE', ftString,   8);
               AddField('STIME'    , ftString,   4);
               AddField('ETIME'    , ftString,   4);
               AddField('XTIME'    , ftString,   4);
               AddField('LECTIME'  , ftFloat,    4);
               AddField('LECCOST'  , ftFloat,    6);
               AddField('SATPER'   , ftFloat,    3);
               AddField('LOGEMP'   , ftString,   4);
               AddField('RELATE'   , ftString,  50);
               AddField('COMENT'   , ftString,  50);
               AddField('GIVEYN'   , ftString,   1);

               Open;

               if recordcount <> 0 then
               begin
                    Application.MessageBox('이미 등록된 강의이력 입니다.','중복',MB_OK);
                    Exit;
               end;

               ServiceName := 'PTA4020B_dml';
               Close;
               SQL.Clear;
               Sql.Text := Format('insert into pedulhis                                        '+
                                  '      (empno, korname, gubun, grade,                        '+
                                  '       edugubun, eduname, educoment, rabasdate,             '+
                                  '       stime, etime, xtime, lectime, leccost, satper,       '+
                                  '       logemp, relate, coment, giveyn,                      '+
                                  '       writeman, writedate)                                 '+
                                  'values (''%s'',''%s'',''%s'',''%s'',                        '+
                                  '        ''%s'',''%s'',''%s'',''%s'',                        '+
                                  '        ''%s'',''%s'',''%s'',''%f'',''%f'', ''%f'',         '+
                                  '        ''%s'',''%s'',''%s'',''N'',                         '+
                                  '        ''%s'',To_Char(sysdate,''yyyy-mm-dd hh24:mi:ss''))  '+
                                  '', [ED_empno.empno,
                                       ED_empno.korname,
                                       ED_gubun.Text,
                                       ED_Grade.Text,

                                       Copy(ED_Edugubun.text,1,4),
                                       ED_Eduname.text,
                                       ED_Educoment.Text,
                                       ED_Rabasdate.Text,

                                       ED_Stime.text,
                                       ED_Etime.text,
                                       ED_Xtime.Text,
                                       StrToFloat(ED_Time.text),
                                       StrToFloat(ED_cost.text),
                                       StrToFloat(ED_Satper.Text),

                                       frmMain.FG_empno,
                                       ED_Relate.Text,
                                       ED_Coment.Text,

                                       frmMain.FG_empno]);

               ClearFieldInfo;

               if not Execute then
               begin
                    Application.MessageBox('강의이력 등록에 실패했습니다.','작업실패',MB_OK);
                    Exit;
               end;

               //OnFocusButton5.Enabled := False;
               FormShow;
          end;
     end
     else
     begin
          if TDS_Grid1.FieldByName('giveyn').AsString = 'Y' then
          begin
               Application.MessageBox('지급확정된 자료는 수정할 수 없습니다.','작업실패',MB_OK);
               Exit;
          end;
          with TDS_dml do
          begin
               ServiceName := 'PTA4020B_dml';
               Close;
               SQL.Clear;
               Sql.Text := Format('delete from pedulhis       '+
                                  ' where rabasdate = ''%s''  '+
                                  '   and stime     = ''%s''  '+
                                  '   and empno     = ''%s''  '
                                  ,     [ S_Rabasdate,
                                          S_Stime,
                                          S_empno          ]  );

               if not Execute then
               begin
                    Application.MessageBox('강의이력 수정에 실패했습니다.','작업실패',MB_OK);
                    Exit;
               end;

               ServiceName := 'PTA4020B_dml';
               Close;
               SQL.Clear;
               Sql.Text := Format('insert into pedulhis                                        '+
                                  '      (empno, korname, gubun, grade,                        '+
                                  '       edugubun, eduname, educoment, rabasdate,             '+
                                  '       stime, etime, xtime, lectime, leccost, satper,       '+
                                  '       logemp, relate, coment, giveyn,                      '+
                                  '       writeman, writedate)                                 '+
                                  'values (''%s'',''%s'',''%s'',''%s'',                        '+
                                  '        ''%s'',''%s'',''%s'',''%s'',                        '+
                                  '        ''%s'',''%s'',''%s'',''%f'',''%f'', ''%f'',         '+
                                  '        ''%s'',''%s'',''%s'',''N'',                         '+
                                  '        ''%s'',To_Char(sysdate,''yyyy-mm-dd hh24:mi:ss''))  '+
                                  '', [Copy(ED_empno.Text,1,4),
                                       Copy(ED_empno.Text,8,Length(ed_empno.text)),
                                       ED_gubun.Text,
                                       ED_Grade.Text,
                                       Copy(ED_Edugubun.text,1,4),
                                       ED_Eduname.text,
                                       ED_Educoment.Text,
                                       ED_Rabasdate.Text,
                                       ED_Stime.text,
                                       ED_Etime.text,
                                       ED_Xtime.Text,
                                       StrToFloat(ED_Time.text),
                                       StrToFloat(ED_cost.text),
                                       StrToFloat(ED_Satper.Text),
                                       frmMain.FG_empno,
                                       ED_Relate.Text,
                                       ED_Coment.Text,
                                       frmMain.FG_empno]);

               if not Execute then
               begin
                    Application.MessageBox('강의이력 수정에 실패했습니다.','작업실패',MB_OK);
                    Exit;
               end;

               //OnFocusButton2.Enabled := False;
               //OnFocusButton5.Enabled := False;
               OnFocusButton2.Caption := '저장';
               LabelClear;
               FormShow;
          end;
     end;
end;

procedure TfrmReg.ED_EdugubunInitPopup(Sender: TObject);
begin
     CForm.Edit          := TOnWinPopupEdit(Sender);
     TOnWinPopupEdit(Sender).PopupControl := CForm ;
end;

procedure TfrmReg.ED_EdugubunCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
     if CForm.Code <> '' then
     begin
          ED_Edugubun.Text          := CForm.Code + ' - ' + CForm.CodeName;
     end;
end;

procedure TfrmReg.ED_StimeChange(Sender: TObject);
var
   Stime : Integer;
   Etime : Integer;
   Xtime : Integer;
begin
     if (Trim(Copy(ED_Stime.Text,1,2)) = '') or (Trim(Copy(ED_Stime.Text,3,2)) = '')  then
          Stime := 0
     else Stime := (StrToInt(Trim(Copy(ED_Stime.Text,1,2))) * 60) + StrToInt(Trim(Copy(ED_Stime.Text,3,2)));

     if (Trim(Copy(ED_Etime.Text,1,2)) = '') or (Trim(Copy(ED_Etime.Text,3,2)) = '') then
          Etime := 0
     else Etime := (StrToInt(Trim(Copy(ED_Etime.Text,1,2))) * 60) + StrToInt(Trim(Copy(ED_Etime.Text,3,2)));

     if (Trim(Copy(ED_Xtime.Text,1,2)) = '') or (Trim(Copy(ED_Xtime.Text,3,2)) = '') then
          Xtime := 0
     else Xtime := (StrToInt(Trim(Copy(ED_Xtime.Text,1,2))) * 60) + StrToInt(Trim(Copy(ED_Xtime.Text,3,2)));

     if (Etime > 0) and (Etime-Stime-Xtime>0)  then
          ED_Time.Text := FloatToStr(RoundedReal((Etime - Stime - Xtime) / 60,1))
     else ED_Time.Text := '0';
end;

procedure TfrmReg.ED_EtimeChange(Sender: TObject);
var
   Stime : Integer;
   Etime : Integer;
   Xtime : Integer;
begin
     if (Trim(Copy(ED_Stime.Text,1,2)) = '') or (Trim(Copy(ED_Stime.Text,3,2)) = '')  then
          Stime := 0
     else Stime := (StrToInt(Trim(Copy(ED_Stime.Text,1,2))) * 60) + StrToInt(Trim(Copy(ED_Stime.Text,3,2)));

     if (Trim(Copy(ED_Etime.Text,1,2)) = '') or (Trim(Copy(ED_Etime.Text,3,2)) = '') then
          Etime := 0
     else Etime := (StrToInt(Trim(Copy(ED_Etime.Text,1,2))) * 60) + StrToInt(Trim(Copy(ED_Etime.Text,3,2)));

     if (Trim(Copy(ED_Xtime.Text,1,2)) = '') or (Trim(Copy(ED_Xtime.Text,3,2)) = '') then
          Xtime := 0
     else Xtime := (StrToInt(Trim(Copy(ED_Xtime.Text,1,2))) * 60) + StrToInt(Trim(Copy(ED_Xtime.Text,3,2)));

     if (Etime > 0) and (Etime-Stime-Xtime>0)  then
          ED_Time.Text := FloatToStr(RoundedReal((Etime - Stime - Xtime) / 60,1))
     else ED_Time.Text := '0';
end;

procedure TfrmReg.ED_XtimeChange(Sender: TObject);
var
   Stime : Integer;
   Etime : Integer;
   Xtime : Integer;
begin
     if (Trim(Copy(ED_Stime.Text,1,2)) = '') or (Trim(Copy(ED_Stime.Text,3,2)) = '')  then
          Stime := 0
     else Stime := (StrToInt(Trim(Copy(ED_Stime.Text,1,2))) * 60) + StrToInt(Trim(Copy(ED_Stime.Text,3,2)));

     if (Trim(Copy(ED_Etime.Text,1,2)) = '') or (Trim(Copy(ED_Etime.Text,3,2)) = '') then
          Etime := 0
     else Etime := (StrToInt(Trim(Copy(ED_Etime.Text,1,2))) * 60) + StrToInt(Trim(Copy(ED_Etime.Text,3,2)));

     if (Trim(Copy(ED_Xtime.Text,1,2)) = '') or (Trim(Copy(ED_Xtime.Text,3,2)) = '') then
          Xtime := 0
     else Xtime := (StrToInt(Trim(Copy(ED_Xtime.Text,1,2))) * 60) + StrToInt(Trim(Copy(ED_Xtime.Text,3,2)));

     if (Etime > 0) and (Etime-Stime-Xtime>0)  then
          ED_Time.Text := FloatToStr(RoundedReal((Etime - Stime - Xtime) / 60,1))
     else ED_Time.Text := '0';
end;

procedure TfrmReg.LabelClear;
begin
     ED_empno.Text     := '';
     ED_gubun.Text     := '';
     ED_dept.Text      := '';
     ED_payra.Text     := '';
     ED_grade.Text     := '';
     ED_edugubun.Text  := '';
     ED_Eduname.Text   := '';
     ED_Educoment.Text := '';
     ED_Rabasdate.Text := '';
     ED_Stime.Text     := '';
     ED_Etime.Text     := '';
     ED_Xtime.Text     := '';
     ED_Time.Text      := '';
     ED_cost.Text      := '';
     ED_Satper.Text    := '';
     ED_Relate.Text    := '';
     ED_Coment.Text    := '';
end;

procedure TfrmReg.OnFocusButton3Click(Sender: TObject);
begin
     LabelClear;

     FormShow;
     OnFocusButton2.Caption := '저장';
//     OnFocusButton5.Enabled := False;
     ED_empno.SetFocus;
end;

procedure TfrmReg.OnFocusButton5Click(Sender: TObject);
begin
     if TDS_Grid1.FieldByName('giveyn').AsString = 'Y' then
     begin
          Application.MessageBox('지급확정된 자료는 삭제할 수 없습니다.','작업실패',MB_OK);
          Exit;
     end;
     if MessageDlg('해당자료를 삭제하시겠습니까?', mtInformation, [mbYes, mbNo], 0) = mrNo then Exit;

     with TDS_dml do
     begin
          ServiceName := 'PTA4020B_dml';
          Close;
          SQL.Clear;
          Sql.Text := Format('delete from pedulhis                     '+
                             ' where rabasdate = ''%s''                '+
                             '   and stime     = ''%s''                '+
                             '   and empno     = ''%s''                '
                             ,[ED_Rabasdate.Text, ED_Stime.Text, copy(ED_empno.Text,1,4)]);

          if not Execute then
          begin
               Application.MessageBox('삭제에 실패했습니다.','작업실패',MB_OK);
               Exit;
          end;

          LabelClear;
          FormShow;
     end;
end;

procedure TfrmReg.OnFocusButton7Click(Sender: TObject);
begin
  FileOpenDlg.Execute;

  if FileOpenDlg.FileName <> '' then
  begin
    FileSave;
    FormShow;
  end;
end;

procedure TfrmReg.FileSave;
var
  Stime,Etime,Xtime : Real;
  lectime           : String;
  i,ErrDatacnt      : integer;
  str,ErrDatatext   : string;
  MA                : array [1..13] of string;
  CsvFile           : array[0..255] of Char; //PCSS 복호화 작업

  procedure setArray(Str:WideString);  //배열 선언.
  var
    i, Cnt : Integer;
    S : String;
  begin
    for i := 1 to 13 do
             MA[i] := '';
  // 1262,경영일반,1007,2008년 상반기 경력입문교육                    ,교육,                20080214,0800,0900,0000,50000, 5.00,기결재-HR인력-,비고
  // 1    2        3    4                          5    6        7    8    9    10     11   12             13
  // 엑셀에서 csv 저장시 빈칸은 스페이스 한번 눌러준다.
    Cnt := 1;
    S := '';
    for i := 1 to Length(Str) do  //wideString 문장의 총 갯수.
    begin
      if Copy(Str,i,1) = ',' then
      begin
        MA[Cnt] := S;
        Inc(Cnt);
        S := '';
            if Cnt > 13 then
            begin
              MessageDlg('CSV 파일의 크기가 잘못되었습니다. ' + #13 +
                         '확인 후 다시 실행하십시요..' + #13 +
                         '시스템을 강제적으로 종료합니다.' ,mtError, [mbOK],0);
              Application.Terminate;
            end;
      end
      else
        S := S + Copy(Str,i,1);  // 누적저장.

        if i = Length(Str) Then  //마지막 처리.
          MA[Cnt] := S;
    end;
  end;

begin  //본문 시작.
  if FileExists(FileOpenDlg.FileName) = False then begin
     MessageBox(handle,'화일이 있는지 확인 하십시오..','에  러',MB_OK or $0020);
     System.Exit;
  end;

  //DRMUnit.pas 참조... : PCSS 에 의한 엑셀파일 암호화 파일 Control...
  //fnEncryptFileChorus(OraTable1PCFILE.Text);//DRM 암호화...
  StrCopy(CsvFile, PChar(FileOpenDlg.FileName));
//  fnDecryptFileChorus(CsvFile);  //DRM Excel 파일 복호화 작업....dsa2000  2006.07.  추가...

  System.AssignFile(F,CsvFile);   //System.AssignFile(F,FileOpenDlg.FileName);
  System.Reset(F);

  i           := 0 ;
  ErrdataText := '';
  Errdatacnt  := 0 ;
  while not Eof(F) do
  begin
       inc(i);
       Readln(F,str);
       setArray(str);
       if Length(MA[1]) = 4 then
       begin
           ED_empnoSelect(MA[1]);
           if Savekorname <> '' then
           begin
             Adata.empno      := MA[ 1];
             Adata.korname    := Savekorname;
             Adata.gubun      := MA[ 2];

             if  TDS_Sel.Fieldbyname('CPDATE').asString <> '' then
                 Adata.grade      := '사내강사'
             else
                 Adata.grade      := '강사';

             Adata.edugubun   := MA[ 3];
             Adata.eduname    := MA[ 4];
             Adata.educoment  := MA[ 5];
             Adata.rabasdate  := MA[ 6];
             Adata.stime      := LPadStr(MA[ 7],4,'0');
             Adata.etime      := LPadStr(MA[ 8],4,'0');
             Adata.xtime      := LPadStr(MA[ 9],4,'0');
             stime            := StrToFloat(copy(Adata.stime,1,2))*60 + StrToFloat(copy(Adata.stime,3,2));
             etime            := StrToFloat(copy(Adata.etime,1,2))*60 + StrToFloat(copy(Adata.etime,3,2));
             xtime            := StrToFloat(copy(Adata.xtime,1,2))*60 + StrToFloat(copy(Adata.xtime,3,2));
             lectime          := FloatToStr(RoundedReal((Etime - Stime - Xtime) / 60,1));
             Adata.lectime    := lectime;
             Adata.leccost    := MA[10];
             Adata.satper     := MA[11];
             Adata.relate     := MA[12];
             Adata.coment     := MA[13];

             SaveData;
           end
           else
           begin
              Errdatatext       := Errdatatext + MA[1] + ',';
              Errdatacnt        := Errdatacnt  + 1;
           end;
       end
       else
       begin
           Errdatatext       := Errdatatext + MA[1] + ',';
           Errdatacnt        := Errdatacnt  + 1;
       end;

       if Errdatacnt > 0 then
       begin
           MessageDlg(ErrdataText+ #13 +'위 사번이 정확하지 않습니다.' + #13    + #13 + '위의 ' +
                      inttostr(Errdatacnt) +'개의 자료는 정확치 않아 저장하지 않았습니다.',mtError, [mbOK],0)
       end;
  end;

  ReadCnt := i;
  System.Close(F);
  if ReadCnt <= 0 then begin
     MessageBox(handle,'화일에 데이타가 없습니다..','확 인',MB_OK or $0030);
     system.Exit;
  end;

end;

procedure TfrmReg.ED_empnoSelect(Sempno : String);
begin
     SaveKorname := '';

     with TDS_Sel do
     begin
          ServiceName := 'PTA4010B_sel1';
          Close;
          SQL.Clear;
          Sql.Text := Format('select a.EMPNO EMPNO,                                                        '+
                             '       a.KORNAME KORNAME,                                                    '+
                             '       (select deptname from pycdept                                         '+
                             '         where orgnum   = a.orgnum                                           '+
                             '           and deptcode = a.deptcode) DEPTNAME,                              '+
                             '       (select codename from pyccode                                         '+
                             '         where codeid = ''I113''                                             '+
                             '           and codeno = a.payra) CODEFNAME,                                  '+
                             '       nvl((select CPDATE from pedulect where empno=a.empno),'''') CPDATE,   '+
                             '       nvl((select GUBUN  from pedulect where empno=a.empno),'''') GUBUN     '+
                             '  from pimpmas a                                                             '+
                             ' Where a.empno  = ''%s''                                                     '+
                             '   and a.pstate < 80                                                         '+
                             ' order by a.empno                                                            '+
                             '', [Sempno]);

          ClearFieldInfo;
          AddField('EMPNO'    , ftString,  4);
          AddField('KORNAME'  , ftString, 12);
          AddField('DEPTNAME' , ftString, 60);
          AddField('CODEFNAME', ftString, 30);
          AddField('CPDATE'   , ftString,  8);
          AddField('GUBUN'    , ftString, 15);

          Open;

          SaveKorname   := FieldByName('KORNAME').AsString;
          ED_Payra.Text := FieldByName('CODEFNAME').AsString;
          ED_dept.Text  := FieldByName('DEPTNAME').AsString;
          if   FieldByName('CPDATE').AsString <> '' then  ED_Grade.Text := '사내강사'
          else                                            ED_Grade.Text := '강사';
     end;
end;

function TfrmReg.LPadStr(basestr:string; num:integer; padstr:string) : string;
var
   i : integer;
   m : String;
begin
   m := '';
   if Length(basestr) < num then
      for i := 1 to num - Length(basestr) do
      begin
        m := padstr + m;
      end;
   ReSult := m + basestr;
end;

// 데이타를 저장한다............................................................
procedure TfrmReg.SaveData;
var SMsg : String;
begin
   with TDS_dml do
   begin
        ServiceName := 'PTA4020B_dml';
        Close;
        SQL.Clear;
        SQL.Text := Format('insert into pedulhis                                   '+
                           '     (empno, korname, gubun, grade, edugubun, eduname, '+
                           '      educoment,rabasdate, stime, etime,xtime,         '+
                           '      lectime, leccost, satper, relate, logemp, coment,'+
                           '      giveyn, writeman, writedate)                     '+
                           '  values                                               '+
                           '(''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',            '+
                           ' ''%s'',''%s'',''%s'',''%s'',''%s'',                   '+
                           ' ''%f'',''%f'',''%f'',''%s'',''%s'',''%s'',''N'',      '+
                           ' ''%s'',To_Char(sysdate,''yyyy-mm-dd hh24:mi:ss''))    '
                            ,[Adata.empno,
                              Adata.korname,
                              Adata.gubun,
                              Adata.grade,
                              Adata.edugubun,
                              Adata.eduname,

                              Adata.educoment,
                              Adata.rabasdate,
                              Adata.stime,
                              Adata.etime,
                              Adata.xtime,

                              StrtoFloat(Adata.lectime),
                              StrtoFloat(Adata.leccost),
                              StrtoFloat(Adata.satper),
                              Adata.relate,
                              frmMain.FG_empno,
                              Adata.coment,
                              frmMain.FG_empno]);
//          edit1.text := sql.text;

        if not Execute then
        begin
          SMsg := Adata.empno+'('+Adata.korname+') 저장에 실패했습니다.' ;
          Application.Messagebox(Pchar(SMsg), '작업안내',Mb_Ok+Mb_Iconwarning);
          Exit;
        end;


   end;
end;

procedure TfrmReg.ED_RabasdateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=VK_RETURN then ED_Stime.SetFocus;
end;

procedure TfrmReg.ED_StimeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=VK_RETURN then ED_Etime.SetFocus;
end;

procedure TfrmReg.ED_EtimeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=VK_RETURN then ED_Xtime.SetFocus;
end;

procedure TfrmReg.ED_XtimeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=VK_RETURN then ED_Relate.SetFocus;
end;

procedure TfrmReg.ED_SatperKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=VK_RETURN then ED_Coment.SetFocus;
end;

procedure TfrmReg.DBGridEh1DblClick(Sender: TObject);
begin
     if TDS_Grid1.RecordCount<=0 then exit;


     with TDS_Grid1 do
     begin
          S_empno           := FieldByName('empno').AsString;
          S_rabasdate       := FieldByName('rabasdate').AsString;
          S_Stime           := FieldByName('stime').AsString;

          Ed_empno.Text     := FieldByName('empno').AsString + ' - ' + FieldByName('korname').AsString;
          ED_gubun.Text     := FieldByName('gubun').AsString;
          Ed_dept.Text      := FieldByName('deptname').AsString;
          Ed_payra.Text     := FieldByName('codefname').AsString;
          ED_grade.Text     := FieldByName('grade').AsString;
          ED_edugubun.Text  := FieldByName('edugubun').AsString;
          ED_Eduname.Text   := FieldByName('eduname').AsString;
          ED_Educoment.Text := FieldByName('educoment').AsString;
          ED_Rabasdate.Text := FieldByName('rabasdate').AsString;
          ED_Stime.Text     := FieldByName('stime').AsString;
          ED_Etime.Text     := FieldByName('etime').AsString;
          ED_Xtime.Text     := FieldByName('xtime').AsString;
          ED_Time.Text      := FieldByName('lectime').AsString;
          ED_cost.Text      := FieldByName('leccost').AsString;
          ED_Satper.Text    := FieldByName('satper').AsString;
          ED_Relate.Text    := FieldByName('relate').AsString;
          ED_Coment.Text    := FieldByName('coment').AsString;
     end;

     OnFocusButton2.Caption := '수정';
     OnFocusButton5.Enabled := True;

     ED_edugubun.SetFocus;
end;

procedure TfrmReg.ED_empnoExit(Sender: TObject);
begin
     ED_empnoSelect(ED_empno.empno);
     FormShow;
end;

end.
