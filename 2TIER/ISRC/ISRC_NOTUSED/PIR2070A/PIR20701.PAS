unit PIR20701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo, StdCtrls,
  ComCtrls, OnFocusButton, ExtCtrls, OnEditBaseCtrl, OnScheme, OnShapeLabel,
  OnEditMemo, DBCtrls, Mask, jpeg, MemDS, DBAccess, Ora, Func;

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    OnEdit1: TOnEdit;
    Panel1: TPanel;
    BtClose: TOnFocusButton;
    BtPrev: TOnFocusButton;
    EdEmp: TOnEdit;
    BtNext: TOnFocusButton;
    BtSave: TOnFocusButton;
    BtBase: TOnFocusButton;
    Panel4: TPanel;
    DBEdit5: TDBEdit;
    Panel10: TPanel;
    DBEdit6: TDBEdit;
    Panel11: TPanel;
    DBEdit7: TDBEdit;
    Panel12: TPanel;
    DBEdit8: TDBEdit;
    Panel14: TPanel;
    DBEdit9: TDBEdit;
    Panel15: TPanel;
    DBEdit10: TDBEdit;
    Panel16: TPanel;
    DBEdit11: TDBEdit;
    Panel17: TPanel;
    Panel18: TPanel;
    DBEdit12: TDBEdit;
    BtIntro_1: TOnFocusButton;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Panel59: TPanel;
    Item2_1: TPanel;
    Item1_1: TPanel;
    Item3_1: TPanel;
    Item4_1: TPanel;
    Panel67: TPanel;
    DBMemo1: TDBMemo;
    DcPre1_1: TDBComboBox;
    DcPre2_1: TDBComboBox;
    DcPre3_1: TDBComboBox;
    DcPre4_1: TDBComboBox;
    Panel2: TPanel;
    Panel3: TPanel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Panel5: TPanel;
    Image1: TImage;
    Panel6: TPanel;
    Panel7: TPanel;
    DBEdit2: TDBEdit;
    Panel8: TPanel;
    DBEdit3: TDBEdit;
    Panel9: TPanel;
    DBEdit4: TDBEdit;
    OraQuery1: TOraQuery;
    OraQuery2: TOraQuery;
    DcPost1_1: TDBComboBox;
    DcPost2_1: TDBComboBox;
    DcPost3_1: TDBComboBox;
    DcPost4_1: TDBComboBox;
    Panel13: TPanel;
    DBEdit22: TDBEdit;
    Panel20: TPanel;
    DBEdit23: TDBEdit;
    Panel21: TPanel;
    DBEdit24: TDBEdit;
    Panel22: TPanel;
    DBEdit25: TDBEdit;
    Panel23: TPanel;
    DBEdit26: TDBEdit;
    Panel24: TPanel;
    DBEdit27: TDBEdit;
    Panel25: TPanel;
    DBEdit28: TDBEdit;
    Panel26: TPanel;
    Panel27: TPanel;
    DBEdit29: TDBEdit;
    BtIntro_2: TOnFocusButton;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    Panel29: TPanel;
    Image2: TImage;
    Panel30: TPanel;
    DBEdit37: TDBEdit;
    Panel31: TPanel;
    DBEdit38: TDBEdit;
    Panel32: TPanel;
    DBEdit39: TDBEdit;
    Panel33: TPanel;
    DBEdit40: TDBEdit;
    Panel34: TPanel;
    Item2_2: TPanel;
    Item1_2: TPanel;
    Item3_2: TPanel;
    Item4_2: TPanel;
    Panel39: TPanel;
    DBMemo2: TDBMemo;
    DcPre1_2: TDBComboBox;
    DcPre2_2: TDBComboBox;
    DcPre3_2: TDBComboBox;
    DcPre4_2: TDBComboBox;
    DcPost1_2: TDBComboBox;
    DcPost2_2: TDBComboBox;
    DcPost3_2: TDBComboBox;
    DcPost4_2: TDBComboBox;
    Panel42: TPanel;
    DBEdit43: TDBEdit;
    Panel43: TPanel;
    DBEdit44: TDBEdit;
    Panel44: TPanel;
    DBEdit45: TDBEdit;
    Panel45: TPanel;
    DBEdit46: TDBEdit;
    Panel46: TPanel;
    DBEdit47: TDBEdit;
    Panel47: TPanel;
    DBEdit48: TDBEdit;
    Panel48: TPanel;
    DBEdit49: TDBEdit;
    Panel49: TPanel;
    Panel50: TPanel;
    DBEdit50: TDBEdit;
    BtIntro_3: TOnFocusButton;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    Panel52: TPanel;
    Image3: TImage;
    Panel53: TPanel;
    DBEdit58: TDBEdit;
    Panel54: TPanel;
    DBEdit59: TDBEdit;
    Panel55: TPanel;
    DBEdit60: TDBEdit;
    Panel56: TPanel;
    DBEdit61: TDBEdit;
    Panel57: TPanel;
    Item2_3: TPanel;
    Item1_3: TPanel;
    Item3_3: TPanel;
    Item4_3: TPanel;
    Panel68: TPanel;
    DBMemo3: TDBMemo;
    DcPre1_3: TDBComboBox;
    DcPre2_3: TDBComboBox;
    DcPre3_3: TDBComboBox;
    DcPre4_3: TDBComboBox;
    DcPost1_3: TDBComboBox;
    DcPost2_3: TDBComboBox;
    DcPost3_3: TDBComboBox;
    DcPost4_3: TDBComboBox;
    Panel71: TPanel;
    DBEdit64: TDBEdit;
    Panel72: TPanel;
    DBEdit65: TDBEdit;
    Panel73: TPanel;
    DBEdit66: TDBEdit;
    Panel74: TPanel;
    DBEdit67: TDBEdit;
    Panel75: TPanel;
    DBEdit68: TDBEdit;
    Panel76: TPanel;
    DBEdit69: TDBEdit;
    Panel77: TPanel;
    DBEdit70: TDBEdit;
    Panel78: TPanel;
    Panel79: TPanel;
    DBEdit71: TDBEdit;
    BtIntro_4: TOnFocusButton;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    DBEdit77: TDBEdit;
    DBEdit78: TDBEdit;
    Panel81: TPanel;
    Image4: TImage;
    Panel82: TPanel;
    DBEdit79: TDBEdit;
    Panel83: TPanel;
    DBEdit80: TDBEdit;
    Panel84: TPanel;
    DBEdit81: TDBEdit;
    Panel85: TPanel;
    DBEdit82: TDBEdit;
    Panel86: TPanel;
    Item2_4: TPanel;
    Item1_4: TPanel;
    Item3_4: TPanel;
    Item4_4: TPanel;
    Panel91: TPanel;
    DBMemo4: TDBMemo;
    DcPre1_4: TDBComboBox;
    DcPre2_4: TDBComboBox;
    DcPre3_4: TDBComboBox;
    DcPre4_4: TDBComboBox;
    DcPost1_4: TDBComboBox;
    DcPost2_4: TDBComboBox;
    DcPost3_4: TDBComboBox;
    DcPost4_4: TDBComboBox;
    Panel94: TPanel;
    Panel95: TPanel;
    Panel96: TPanel;
    Panel40: TPanel;
    DBEdit41: TDBEdit;
    Panel41: TPanel;
    DBEdit42: TDBEdit;
    Panel97: TPanel;
    Panel98: TPanel;
    Panel99: TPanel;
    Panel69: TPanel;
    DBEdit62: TDBEdit;
    Panel70: TPanel;
    DBEdit63: TDBEdit;
    Panel100: TPanel;
    Panel101: TPanel;
    Panel102: TPanel;
    Panel92: TPanel;
    DBEdit83: TDBEdit;
    Panel93: TPanel;
    DBEdit84: TDBEdit;
    Panel103: TPanel;
    Panel104: TPanel;
    Panel105: TPanel;
    EdName: TOnEdit;
    BtRefresh: TOnFocusButton;
    CbSep: TOnComboEdit;
    CbGrp: TOnComboEdit;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    CbDate: TComboBox;
    DBEdit13: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit72: TDBEdit;
    OraQuery1FILEPHOTO_1: TStringField;
    OraQuery1RID_1: TFloatField;
    OraQuery1GRPSUB_1: TFloatField;
    OraQuery1FULLNAME_1: TStringField;
    OraQuery1YEAR_1: TStringField;
    OraQuery1DEPT_1: TStringField;
    OraQuery1REGNO_1: TStringField;
    OraQuery1MOBILE_1: TStringField;
    OraQuery1GRD1ID_1: TStringField;
    OraQuery1GRD1IDYY_1: TStringField;
    OraQuery1GRD1IDMM_1: TStringField;
    OraQuery1HIGHNAME_1: TStringField;
    OraQuery1UNIVNAME_1: TStringField;
    OraQuery1UNIVGRAD_1: TStringField;
    OraQuery1UNIVMAJOR_1: TStringField;
    OraQuery1UNIVSCORE_1: TStringField;
    OraQuery1GRD1NAME_1: TStringField;
    OraQuery1GRD1DAY_1: TStringField;
    OraQuery1GRD1MAJOR_1: TStringField;
    OraQuery1GRD1SCORE_1: TStringField;
    OraQuery1LEVELSC_1: TStringField;
    OraQuery1LEVELHN_1: TStringField;
    OraQuery1PRE_ITEM1_1: TStringField;
    OraQuery1POST_ITEM1_1: TStringField;
    OraQuery1PRE_ITEM2_1: TStringField;
    OraQuery1POST_ITEM2_1: TStringField;
    OraQuery1PRE_ITEM3_1: TStringField;
    OraQuery1POST_ITEM3_1: TStringField;
    OraQuery1PRE_ITEM4_1: TStringField;
    OraQuery1POST_ITEM4_1: TStringField;
    OraQuery1MEMO_1: TStringField;
    OraQuery1AVG_FIRST_1: TStringField;
    OraQuery1AVG_SECOND_1: TStringField;
    OraQuery1FILEPHOTO_2: TStringField;
    OraQuery1RID_2: TFloatField;
    OraQuery1GRPSUB_2: TFloatField;
    OraQuery1FULLNAME_2: TStringField;
    OraQuery1YEAR_2: TStringField;
    OraQuery1DEPT_2: TStringField;
    OraQuery1REGNO_2: TStringField;
    OraQuery1MOBILE_2: TStringField;
    OraQuery1GRD1ID_2: TStringField;
    OraQuery1GRD1IDYY_2: TStringField;
    OraQuery1GRD1IDMM_2: TStringField;
    OraQuery1HIGHNAME_2: TStringField;
    OraQuery1UNIVNAME_2: TStringField;
    OraQuery1UNIVGRAD_2: TStringField;
    OraQuery1UNIVMAJOR_2: TStringField;
    OraQuery1UNIVSCORE_2: TStringField;
    OraQuery1GRD1NAME_2: TStringField;
    OraQuery1GRD1DAY_2: TStringField;
    OraQuery1GRD1MAJOR_2: TStringField;
    OraQuery1GRD1SCORE_2: TStringField;
    OraQuery1LEVELSC_2: TStringField;
    OraQuery1LEVELHN_2: TStringField;
    OraQuery1PRE_ITEM1_2: TStringField;
    OraQuery1POST_ITEM1_2: TStringField;
    OraQuery1PRE_ITEM2_2: TStringField;
    OraQuery1POST_ITEM2_2: TStringField;
    OraQuery1PRE_ITEM3_2: TStringField;
    OraQuery1POST_ITEM3_2: TStringField;
    OraQuery1PRE_ITEM4_2: TStringField;
    OraQuery1POST_ITEM4_2: TStringField;
    OraQuery1MEMO_2: TStringField;
    OraQuery1AVG_FIRST_2: TStringField;
    OraQuery1AVG_SECOND_2: TStringField;
    OraQuery1FILEPHOTO_3: TStringField;
    OraQuery1RID_3: TFloatField;
    OraQuery1GRPSUB_3: TFloatField;
    OraQuery1FULLNAME_3: TStringField;
    OraQuery1YEAR_3: TStringField;
    OraQuery1DEPT_3: TStringField;
    OraQuery1REGNO_3: TStringField;
    OraQuery1MOBILE_3: TStringField;
    OraQuery1GRD1ID_3: TStringField;
    OraQuery1GRD1IDYY_3: TStringField;
    OraQuery1GRD1IDMM_3: TStringField;
    OraQuery1HIGHNAME_3: TStringField;
    OraQuery1UNIVNAME_3: TStringField;
    OraQuery1UNIVGRAD_3: TStringField;
    OraQuery1UNIVMAJOR_3: TStringField;
    OraQuery1UNIVSCORE_3: TStringField;
    OraQuery1GRD1NAME_3: TStringField;
    OraQuery1GRD1DAY_3: TStringField;
    OraQuery1GRD1MAJOR_3: TStringField;
    OraQuery1GRD1SCORE_3: TStringField;
    OraQuery1LEVELSC_3: TStringField;
    OraQuery1LEVELHN_3: TStringField;
    OraQuery1PRE_ITEM1_3: TStringField;
    OraQuery1POST_ITEM1_3: TStringField;
    OraQuery1PRE_ITEM2_3: TStringField;
    OraQuery1POST_ITEM2_3: TStringField;
    OraQuery1PRE_ITEM3_3: TStringField;
    OraQuery1POST_ITEM3_3: TStringField;
    OraQuery1PRE_ITEM4_3: TStringField;
    OraQuery1POST_ITEM4_3: TStringField;
    OraQuery1MEMO_3: TStringField;
    OraQuery1AVG_FIRST_3: TStringField;
    OraQuery1AVG_SECOND_3: TStringField;
    OraQuery1FILEPHOTO_4: TStringField;
    OraQuery1RID_4: TFloatField;
    OraQuery1GRPSUB_4: TFloatField;
    OraQuery1FULLNAME_4: TStringField;
    OraQuery1YEAR_4: TStringField;
    OraQuery1DEPT_4: TStringField;
    OraQuery1REGNO_4: TStringField;
    OraQuery1MOBILE_4: TStringField;
    OraQuery1GRD1ID_4: TStringField;
    OraQuery1GRD1IDYY_4: TStringField;
    OraQuery1GRD1IDMM_4: TStringField;
    OraQuery1HIGHNAME_4: TStringField;
    OraQuery1UNIVNAME_4: TStringField;
    OraQuery1UNIVGRAD_4: TStringField;
    OraQuery1UNIVMAJOR_4: TStringField;
    OraQuery1UNIVSCORE_42: TStringField;
    OraQuery1GRD1NAME_4: TStringField;
    OraQuery1GRD1DAY_4: TStringField;
    OraQuery1GRD1MAJOR_4: TStringField;
    OraQuery1GRD1SCORE_4: TStringField;
    OraQuery1LEVELSC_4: TStringField;
    OraQuery1LEVELHN_4: TStringField;
    OraQuery1PRE_ITEM1_4: TStringField;
    OraQuery1POST_ITEM1_4: TStringField;
    OraQuery1PRE_ITEM2_4: TStringField;
    OraQuery1POST_ITEM2_4: TStringField;
    OraQuery1PRE_ITEM3_4: TStringField;
    OraQuery1POST_ITEM3_4: TStringField;
    OraQuery1PRE_ITEM4_4: TStringField;
    OraQuery1POST_ITEM4_4: TStringField;
    OraQuery1MEMO_4: TStringField;
    OraQuery1AVG_FIRST_4: TStringField;
    OraQuery1AVG_SECOND_4: TStringField;
    OraQuery1INTJUDG_1: TStringField;
    OraQuery1INTJUDG_2: TStringField;
    OraQuery1INTJUDG_3: TStringField;
    OraQuery1INTJUDG_4: TStringField;
    procedure BtIntro_1Click(Sender: TObject);
    procedure BtIntro_2Click(Sender: TObject);
    procedure BtIntro_3Click(Sender: TObject);
    procedure BtIntro_4Click(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Query_View;
    procedure Photo_View;
    procedure Photo_Show(image : Timage; PathStr : String);
    function  QueryStateYN(rid : String) : Integer;
    procedure QueryInsert(rid : String; grpsub : String; DcPre1 : String; DcPost1 : String;
                          DcPre2 : String; DcPost2 : String; DcPre3 : String; DcPost3 : String;
                          DcPre4 : String; DcPost4 : String; memo : String);
    procedure QueryUpdate(rid : String; DcPre1 : String; DcPost1 : String;
                          DcPre2 : String; DcPost2 : String; DcPre3 : String; DcPost3 : String;
                          DcPre4 : String; DcPost4 : String; memo : String);
    function ScoreToInt(Score : String) : Integer;
    procedure IntroShow(BtIndex : Integer);
    procedure BtPrevClick(Sender: TObject);
    procedure BtNextClick(Sender: TObject);
    procedure BtBaseClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
    procedure BtRefreshClick(Sender: TObject);
    procedure EdEmpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DcPre2_1Change(Sender: TObject);
    procedure DcPre3_1Change(Sender: TObject);
    procedure DcPre4_1Change(Sender: TObject);
    procedure DcPre1_2Change(Sender: TObject);
    procedure DcPre2_2Change(Sender: TObject);
    procedure DcPre3_2Change(Sender: TObject);
    procedure DcPre4_2Change(Sender: TObject);
    procedure DcPre1_3Change(Sender: TObject);
    procedure DcPre2_3Change(Sender: TObject);
    procedure DcPre3_3Change(Sender: TObject);
    procedure DcPre4_3Change(Sender: TObject);
    procedure DcPre1_4Change(Sender: TObject);
    procedure DcPre2_4Change(Sender: TObject);
    procedure DcPre3_4Change(Sender: TObject);
    procedure DcPre4_4Change(Sender: TObject);
    procedure DcPre1_1Change(Sender: TObject);
    procedure CbSepChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  const rabasdate='20080501';
var
  MainForm: TMainForm;
  FL_Start : Boolean;
  ItvDate : String;

implementation

uses PIR20702, PIR20704;

{$R *.DFM}

procedure TMainForm.BtIntro_1Click(Sender: TObject);
begin
     IntroShow(1);
end;

procedure TMainForm.BtIntro_2Click(Sender: TObject);
begin
     IntroShow(2);
end;

procedure TMainForm.BtIntro_3Click(Sender: TObject);
begin
     IntroShow(3);
end;

procedure TMainForm.BtIntro_4Click(Sender: TObject);
begin
     IntroShow(4);
end;

procedure TMainForm.BtCloseClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.FormPaint(Sender: TObject);
     var
     FL_Rect : TRect;
begin
     if FL_Start then
     begin
         Self.Width  := 1024;
         Self.Height := 740;
         FL_Start    := False;
         SystemParametersInfo(SPI_GETWORKAREA, 0, @FL_Rect, 0);
         Self.SetBounds(FL_Rect.Top, FL_Rect.Left, Self.Width, Self.Height);
         SF_Main.Refresh;
         Application.ProcessMessages;

         OraConnect;
         With OraQuery2 do
         begin
              Close;
              SQL.Clear;
              SQL.ADD(' SELECT TO_CHAR(SYSDATE,''yyyymmdd'') sdate   ');
              SQL.ADD('   FROM dual                                  ');
              Open;
              ItvDate := FieldByName('sdate').AsString;

              Close;
              SQL.Clear;
              SQL.ADD(' SELECT DISTINCT(itvdate) itvdate           ');
              SQL.ADD('   FROM prectgrp                            ');
              SQL.ADD('  WHERE rabasdate = :v_rabasdate            ');

              ParamByName('v_rabasdate').AsString := rabasdate;
              Open;

              CbDate.Items.Clear;
              First;
              While Not Eof do
              begin
                   CbDate.Items.Add(FieldByName('itvdate').AsString);
                   Next;
              end;

              Close;
              SQL.Clear;
              SQL.ADD(' SELECT DISTINCT(sepno)                     ');
              SQL.ADD('   FROM prectins                            ');
              SQL.ADD('  WHERE rabasdate = :v_rabasdate            ');
              SQL.ADD('    AND empno     = :v_empno                ');

              ParamByName('v_rabasdate').AsString := rabasdate;
              ParamByName('v_empno'    ).AsString := Pempno;
              Open;

              First;
              CbSep.Items.Clear;
              While Not Eof do
              begin
                    CbSep.Items.Add(OraQuery2.FieldByName('sepno').AsString);
                    Next;
              end;
              CbSep.ItemIndex :=0;

              Close;
              SQL.Clear;
              SQL.ADD(' SELECT empno,                              ');
              SQL.ADD('        (SELECT korname FROM pimpmas        ');
              SQL.ADD('          WHERE empno = :v_empno) korname   ');
              SQL.ADD('   FROM prectins                            ');
              SQL.ADD('  WHERE rabasdate = :v_rabasdate            ');
              SQL.ADD('    AND empno     = :v_empno                ');

              ParamByName('v_rabasdate').AsString := rabasdate;
              ParamByName('v_empno'    ).AsString := Pempno;
              Open;
         end;

         // 권한 = 면접관(X)
         if (OraQuery2.RecordCount = 0) then
         begin
              if (Copy(Pgrade,2,1) = 'A') or (Copy(Pgrade,2,1) = 'B') then
              begin
                   CbSep.Items.Clear;
                   CbSep.Items.Add('1');
                   CbSep.Items.Add('2');
                   CbSep.Items.Add('3');

                   EdEmp.Enabled := True;
                   CbDate.Visible := True;
              end
              else begin
                   MessageBox(self.Handle,'등록된 면접관만 사용 가능합니다.' + #13 + #13 + '프로그램을 종료합니다.','종합인사',MB_ICONINFORMATION + mb_ok);
                   Close;
              end;
         end
         //권한 = 면접관(O)
         else if (OraQuery2.RecordCount > 0) then
         begin
              //권한 = A,B
              if ((Copy(Pgrade,2,1) = 'A') or (Copy(Pgrade,2,1) = 'B')) then
              begin
                   CbSep.Items.Clear;
                   CbSep.Items.Add('1');
                   CbSep.Items.Add('2');
                   CbSep.Items.Add('3');
                   
                   EdEmp.Enabled := True;
                   CbDate.Visible := True;
              end
              else begin
//                  EdEmp.Enabled := False;
//                  CbDate.Visible := False;
                  EdEmp.Enabled := False;
                  CbDate.Visible := True;
              end;

              EdEmp.Text  := OraQuery2.FieldByName('empno'  ).AsString;
              EdName.Text := OraQuery2.FieldByName('korname').AsString;
          end;

         Query_View;
         Photo_View;
     end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     FL_Start := True;
end;

procedure TMainForm.Query_View;
begin
     panel95.Caption  := '조정전'; panel95.Width := 46;
     panel98.Caption  := '조정전'; panel98.Width := 46;
     panel101.Caption := '조정전'; panel101.Width := 46;
     panel104.Caption := '조정전'; panel104.Width := 46;

     DcPre1_1.Width  := 45; DcPre1_1.DataField := 'PRE_ITEM1_1'; DcPost1_1.Visible := True;
     DcPre2_1.Width  := 45; DcPre2_1.DataField := 'PRE_ITEM2_1'; DcPost2_1.Visible := True;
     DcPre3_1.Width  := 45; DcPre3_1.DataField := 'PRE_ITEM3_1'; DcPost3_1.Visible := True;
     DcPre4_1.Width  := 45; DcPre4_1.DataField := 'PRE_ITEM4_1'; DcPost4_1.Visible := True;
     DcPre1_2.Width  := 45; DcPre1_2.DataField := 'PRE_ITEM1_2'; DcPost1_2.Visible := True;
     DcPre2_2.Width  := 45; DcPre2_2.DataField := 'PRE_ITEM2_2'; DcPost2_2.Visible := True;
     DcPre3_2.Width  := 45; DcPre3_2.DataField := 'PRE_ITEM3_2'; DcPost3_2.Visible := True;
     DcPre4_2.Width  := 45; DcPre4_2.DataField := 'PRE_ITEM3_2'; DcPost4_2.Visible := True;
     DcPre1_3.Width  := 45; DcPre1_3.DataField := 'PRE_ITEM1_3'; DcPost1_3.Visible := True;
     DcPre2_3.Width  := 45; DcPre2_3.DataField := 'PRE_ITEM2_3'; DcPost2_3.Visible := True;
     DcPre3_3.Width  := 45; DcPre3_3.DataField := 'PRE_ITEM3_3'; DcPost3_3.Visible := True;
     DcPre4_3.Width  := 45; DcPre4_3.DataField := 'PRE_ITEM4_3'; DcPost4_3.Visible := True;
     DcPre1_4.Width  := 45; DcPre1_4.DataField := 'PRE_ITEM1_4'; DcPost1_4.Visible := True;
     DcPre2_4.Width  := 45; DcPre2_4.DataField := 'PRE_ITEM2_4'; DcPost2_4.Visible := True;
     DcPre3_4.Width  := 45; DcPre3_4.DataField := 'PRE_ITEM3_4'; DcPost3_4.Visible := True;
     DcPre4_4.Width  := 45; DcPre4_4.DataField := 'PRE_ITEM4_4'; DcPost4_4.Visible := True;

     DcPre4_1.Clear;
     DcPre4_1.Items.Add('S');       DcPre4_1.Items.Add('A');
     DcPre4_1.Items.Add('B+');      DcPre4_1.Items.Add('B0');
     DcPre4_1.Items.Add('B-');      DcPre4_1.Items.Add('C');
     DcPre4_1.Items.Add('D');       DcPre4_1.Items.Add('N/A');
     DcPre4_2.Clear;
     DcPre4_2.Items.Add('S');       DcPre4_2.Items.Add('A');
     DcPre4_2.Items.Add('B+');      DcPre4_2.Items.Add('B0');
     DcPre4_2.Items.Add('B-');      DcPre4_2.Items.Add('C');
     DcPre4_2.Items.Add('D');       DcPre4_2.Items.Add('N/A');
     DcPre4_3.Clear;
     DcPre4_3.Items.Add('S');       DcPre4_3.Items.Add('A');
     DcPre4_3.Items.Add('B+');      DcPre4_3.Items.Add('B0');
     DcPre4_3.Items.Add('B-');      DcPre4_3.Items.Add('C');
     DcPre4_3.Items.Add('D');       DcPre4_3.Items.Add('N/A');
     DcPre4_4.Clear;
     DcPre4_4.Items.Add('S');       DcPre4_4.Items.Add('A');
     DcPre4_4.Items.Add('B+');      DcPre4_4.Items.Add('B0');
     DcPre4_4.Items.Add('B-');      DcPre4_4.Items.Add('C');
     DcPre4_4.Items.Add('D');       DcPre4_4.Items.Add('N/A');

     if CbSep.Text = '1' then
     begin
          Item1_1.Caption := '기획력 상황파악능력'; Item1_2.Caption := '기획력 상황파악능력';
          Item1_3.Caption := '기획력 상황파악능력'; Item1_4.Caption := '기획력 상황파악능력';
          Item2_1.Caption := '분석력 정보수집활용'; Item2_2.Caption := '분석력 정보수집활용';
          Item2_3.Caption := '분석력 정보수집활용'; Item2_4.Caption := '분석력 정보수집활용';
          Item3_1.Caption := '발표력 고객설득능력'; Item3_2.Caption := '발표력 고객설득능력';
          Item3_3.Caption := '발표력 고객설득능력'; Item3_4.Caption := '발표력 고객설득능력';
          Item4_1.Caption := '협상력 목표관리능력'; Item4_2.Caption := '협상력 목표관리능력';
          Item4_3.Caption := '협상력 목표관리능력'; Item4_4.Caption := '협상력 목표관리능력';
     end
     else if CbSep.Text = '2' then
     begin
          Item1_1.Caption := '전문성 전략적사고력'; Item1_2.Caption := '전문성 전략적사고력';
          Item1_3.Caption := '전문성 전략적사고력'; Item1_4.Caption := '전문성 전략적사고력';
          Item2_1.Caption := '추진력 상황주도능력'; Item2_2.Caption := '추진력 상황주도능력';
          Item2_3.Caption := '추진력 상황주도능력'; Item2_4.Caption := '추진력 상황주도능력';
          Item3_1.Caption := '조직성 업무협상능력'; Item3_2.Caption := '조직성 업무협상능력';
          Item3_3.Caption := '조직성 업무협상능력'; Item3_4.Caption := '조직성 업무협상능력';
          Item4_1.Caption := '면접자 역량수준총평'; Item4_2.Caption := '면접자 역량수준총평';
          Item4_3.Caption := '면접자 역량수준총평'; Item4_4.Caption := '면접자 역량수준총평';
     end
     else if CbSep.Text = '3' then
     begin
          Item1_1.Caption := '인 성   및  가치관'; Item2_1.Caption := '가능성 및 잠재력';
          Item3_1.Caption := '지원분야  적합성'; Item4_1.Caption := '채    용     판    단';
          Item1_2.Caption := '인 성   및   가치관'; Item2_2.Caption := '가능성 및 잠재력';
          Item3_2.Caption := '지원분야  적합성'; Item4_2.Caption := '채    용     판    단';
          Item1_3.Caption := '인 성   및  가치관'; Item2_3.Caption := '가능성 및 잠재력';
          Item3_3.Caption := '지원분야  적합성'; Item4_3.Caption := '채    용     판    단';
          Item1_4.Caption := '인 성   및  가치관'; Item2_4.Caption := '가능성 및 잠재력';
          Item3_4.Caption := '지원분야  적합성'; Item4_4.Caption := '채    용     판    단';

          panel95.Caption  := '평가등급'; panel95.Width  := 87;
          panel98.Caption  := '평가등급'; panel98.Width  := 87;
          panel101.Caption := '평가등급'; panel101.Width := 87;
          panel104.Caption := '평가등급'; panel104.Width := 87;

          DcPre1_1.Width  := 88; DcPre1_1.DataField := 'POST_ITEM1_1'; DcPost1_1.Visible := False;
          DcPre2_1.Width  := 88; DcPre2_1.DataField := 'POST_ITEM2_1'; DcPost2_1.Visible := False;
          DcPre3_1.Width  := 88; DcPre3_1.DataField := 'POST_ITEM3_1'; DcPost3_1.Visible := False;
          DcPre4_1.Width  := 88; DcPre4_1.DataField := 'INTJUDG_1';    DcPost4_1.Visible := False;
          DcPre1_2.Width  := 88; DcPre1_2.DataField := 'POST_ITEM1_2'; DcPost1_2.Visible := False;
          DcPre2_2.Width  := 88; DcPre2_2.DataField := 'POST_ITEM2_2'; DcPost2_2.Visible := False;
          DcPre3_2.Width  := 88; DcPre3_2.DataField := 'POST_ITEM3_2'; DcPost3_2.Visible := False;
          DcPre4_2.Width  := 88; DcPre4_2.DataField := 'INTJUDG_2';    DcPost4_2.Visible := False;
          DcPre1_3.Width  := 88; DcPre1_3.DataField := 'POST_ITEM1_3'; DcPost1_3.Visible := False;
          DcPre2_3.Width  := 88; DcPre2_3.DataField := 'POST_ITEM2_3'; DcPost2_3.Visible := False;
          DcPre3_3.Width  := 88; DcPre3_3.DataField := 'POST_ITEM3_3'; DcPost3_3.Visible := False;
          DcPre4_3.Width  := 88; DcPre4_3.DataField := 'INTJUDG_3';    DcPost4_3.Visible := False;
          DcPre1_4.Width  := 88; DcPre1_4.DataField := 'POST_ITEM1_4'; DcPost1_4.Visible := False;
          DcPre2_4.Width  := 88; DcPre2_4.DataField := 'POST_ITEM2_4'; DcPost2_4.Visible := False;
          DcPre3_4.Width  := 88; DcPre3_4.DataField := 'POST_ITEM3_4'; DcPost3_4.Visible := False;
          DcPre4_4.Width  := 88; DcPre4_4.DataField := 'INTJUDG_4';    DcPost4_4.Visible := False;

          DcPre4_1.Clear;                 DcPre4_1.Items.Add('적극채용');
          DcPre4_1.Items.Add('채용가능'); DcPre4_1.Items.Add('채용불가');
          DcPre4_2.Clear;                 DcPre4_2.Items.Add('적극채용');
          DcPre4_2.Items.Add('채용가능'); DcPre4_2.Items.Add('채용불가');
          DcPre4_3.Clear;                 DcPre4_3.Items.Add('적극채용');
          DcPre4_3.Items.Add('채용가능'); DcPre4_3.Items.Add('채용불가');
          DcPre4_4.Clear;                 DcPre4_4.Items.Add('적극채용');
          DcPre4_4.Items.Add('채용가능'); DcPre4_4.Items.Add('채용불가');
     end;

     With OraQuery1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('  SELECT max(decode(mod(a.cnt,4),1, a.filephoto  )) filephoto_1,                                                           ');
          SQL.Add('         max(decode(mod(a.cnt,4),1, a.rid)) rid_1,                                                                         ');
          SQL.Add('         max(decode(mod(a.cnt,4),1, a.grpsub)) grpsub_1,                                                                   ');
          SQL.Add('         max(decode(mod(a.cnt,4),1, a.fullname)) fullname_1,                                                               ');
          SQL.Add('         max(decode(mod(a.cnt,4),1, a.year)) year_1,                                                                       ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.dept)) dept_1,                                                                       ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.regno)) regno_1,                                                                     ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.mobile  )) mobile_1,                                                                 ');
          SQL.Add('         max(decode(mod(a.cnt,4),1, a.grd1id)) grd1id_1,                                                                   ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.grd1idyy)) grd1idyy_1,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.grd1idmm)) grd1idmm_1,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.highname  )) highname_1,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),1, a.univname)) univname_1,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.univgrad)) univgrad_1,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.univmajor)) univmajor_1,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.univscore  )) univscore_1,                                                           ');
          SQL.Add('         max(decode(mod(a.cnt,4),1, a.grd1name)) grd1name_1,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.grd1day)) grd1day_1,                                                                 ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.grd1major)) grd1major_1,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.grd1score)) grd1score_1,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),1, a.levelsc)) levelsc_1,                                                                 ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.levelhn)) levelhn_1,                                                                 ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.pre_item1)) pre_item1_1,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),1, a.post_item1)) post_item1_1,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.pre_item2)) pre_item2_1,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.post_item2)) post_item2_1,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.pre_item3  )) pre_item3_1,                                                           ');
          SQL.Add('         max(decode(mod(a.cnt,4),1, a.post_item3)) post_item3_1,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.pre_item4)) pre_item4_1,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.post_item4)) post_item4_1,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.memo)) memo_1,                                                                       ');
	  SQL.Add('         max(decode(mod(a.cnt,4),1, a.intjudg)) intjudg_1,                                                                 ');
          SQL.Add('         max(decode(mod(a.cnt,4),1, a.avg_first)) avg_first_1,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),1, a.avg_second)) avg_second_1,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.filephoto  )) filephoto_2,                                                           ');
          SQL.Add('         max(decode(mod(a.cnt,4),2, a.rid)) rid_2,                                                                         ');
          SQL.Add('         max(decode(mod(a.cnt,4),2, a.grpsub)) grpsub_2,                                                                   ');
          SQL.Add('         max(decode(mod(a.cnt,4),2, a.fullname)) fullname_2,                                                               ');
          SQL.Add('         max(decode(mod(a.cnt,4),2, a.year)) year_2,                                                                       ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.dept)) dept_2,                                                                       ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.regno)) regno_2,                                                                     ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.mobile  )) mobile_2,                                                                 ');
          SQL.Add('         max(decode(mod(a.cnt,4),2, a.grd1id)) grd1id_2,                                                                   ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.grd1idyy)) grd1idyy_2,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.grd1idmm)) grd1idmm_2,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.highname  )) highname_2,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),2, a.univname)) univname_2,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.univgrad)) univgrad_2,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.univmajor)) univmajor_2,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.univscore  )) univscore_2,                                                           ');
          SQL.Add('         max(decode(mod(a.cnt,4),2, a.grd1name)) grd1name_2,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.grd1day)) grd1day_2,                                                                 ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.grd1major)) grd1major_2,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.grd1score)) grd1score_2,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),2, a.levelsc)) levelsc_2,                                                                 ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.levelhn)) levelhn_2,                                                                 ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.pre_item1)) pre_item1_2,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),2, a.post_item1)) post_item1_2,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.pre_item2)) pre_item2_2,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.post_item2)) post_item2_2,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.pre_item3  )) pre_item3_2,                                                           ');
          SQL.Add('         max(decode(mod(a.cnt,4),2, a.post_item3)) post_item3_2,                                                           ');
          SQL.Add('         max(decode(mod(a.cnt,4),2, a.pre_item4)) pre_item4_2,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.post_item4)) post_item4_2,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.memo)) memo_2,                                                                       ');
	  SQL.Add('         max(decode(mod(a.cnt,4),2, a.intjudg)) intjudg_2,                                                                 ');
          SQL.Add('         max(decode(mod(a.cnt,4),2, a.avg_first)) avg_first_2,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),2, a.avg_second)) avg_second_2,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.filephoto  )) filephoto_3,                                                           ');
          SQL.Add('         max(decode(mod(a.cnt,4),3, a.rid)) rid_3,                                                                         ');
          SQL.Add('         max(decode(mod(a.cnt,4),3, a.grpsub)) grpsub_3,                                                                   ');
          SQL.Add('         max(decode(mod(a.cnt,4),3, a.fullname)) fullname_3,                                                               ');
          SQL.Add('         max(decode(mod(a.cnt,4),3, a.year)) year_3,                                                                       ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.dept)) dept_3,                                                                       ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.regno)) regno_3,                                                                     ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.mobile  )) mobile_3,                                                                 ');
          SQL.Add('         max(decode(mod(a.cnt,4),3, a.grd1id)) grd1id_3,                                                                   ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.grd1idyy)) grd1idyy_3,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.grd1idmm)) grd1idmm_3,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.highname  )) highname_3,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),3, a.univname)) univname_3,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.univgrad)) univgrad_3,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.univmajor)) univmajor_3,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.univscore  )) univscore_3,                                                           ');
          SQL.Add('         max(decode(mod(a.cnt,4),3, a.grd1name)) grd1name_3,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.grd1day)) grd1day_3,                                                                 ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.grd1major)) grd1major_3,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.grd1score)) grd1score_3,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),3, a.levelsc)) levelsc_3,                                                                 ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.levelhn)) levelhn_3,                                                                 ');
          SQL.Add('         max(decode(mod(a.cnt,4),3, a.pre_item1)) pre_item1_3,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),3, a.post_item1)) post_item1_3,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.pre_item2)) pre_item2_3,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.post_item2)) post_item2_3,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.pre_item3  )) pre_item3_3,                                                           ');
          SQL.Add('         max(decode(mod(a.cnt,4),3, a.post_item3)) post_item3_3,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.pre_item4)) pre_item4_3,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.post_item4)) post_item4_3,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.memo)) memo_3,                                                                       ');
	  SQL.Add('         max(decode(mod(a.cnt,4),3, a.intjudg)) intjudg_3,                                                                 ');
          SQL.Add('         max(decode(mod(a.cnt,4),3, a.avg_first)) avg_first_3,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),3, a.avg_second)) avg_second_3,                                                           ');
   	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.filephoto  )) filephoto_4,                                                           ');
          SQL.Add('         max(decode(mod(a.cnt,4),0, a.rid)) rid_4,                                                                         ');
          SQL.Add('         max(decode(mod(a.cnt,4),0, a.grpsub)) grpsub_4,                                                                   ');
          SQL.Add('         max(decode(mod(a.cnt,4),0, a.fullname)) fullname_4,                                                               ');
          SQL.Add('         max(decode(mod(a.cnt,4),0, a.year)) year_4,                                                                       ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.dept)) dept_4,                                                                       ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.regno)) regno_4,                                                                     ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.mobile  )) mobile_4,                                                                 ');
          SQL.Add('         max(decode(mod(a.cnt,4),0, a.grd1id)) grd1id_4,                                                                   ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.grd1idyy)) grd1idyy_4,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.grd1idmm)) grd1idmm_4,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.highname  )) highname_4,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),0, a.univname)) univname_4,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.univgrad)) univgrad_4,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.univmajor)) univmajor_4,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.univscore  )) univscore_4,                                                           ');
          SQL.Add('         max(decode(mod(a.cnt,4),0, a.grd1name)) grd1name_4,                                                               ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.grd1day)) grd1day_4,                                                                 ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.grd1major)) grd1major_4,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.grd1score)) grd1score_4,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),0, a.levelsc)) levelsc_4,                                                                 ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.levelhn)) levelhn_4,                                                                 ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.pre_item1)) pre_item1_4,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),0, a.post_item1)) post_item1_4,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.pre_item2)) pre_item2_4,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.post_item2)) post_item2_4,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.pre_item3  )) pre_item3_4,                                                           ');
          SQL.Add('         max(decode(mod(a.cnt,4),0, a.post_item3)) post_item3_4,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.pre_item4)) pre_item4_4,                                                             ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.post_item4)) post_item4_4,                                                           ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.memo)) memo_4,                                                                       ');
	  SQL.Add('         max(decode(mod(a.cnt,4),0, a.intjudg)) intjudg_4,                                                                 ');          
          SQL.Add('         max(decode(mod(a.cnt,4),0, a.avg_first)) avg_first_4,                                                             ');
          SQL.Add('         max(decode(mod(a.cnt,4),0, a.avg_second)) avg_second_4                                                            ');
          SQL.Add('    FROM (SELECT a.grpsub cnt, a.rid rid, a.grpsub grpsub,b.filephoto,b.fullname,                                          ');
 	  SQL.Add('    	            To_Char(101 - substr(b.regno,1,2)+To_Number(To_Char(sysdate,''yy''))) year,                               ');
          SQL.Add('                 b.dept,                                                                                                   ');
 	  SQL.Add('    	            substr(b.regno,1,6) || ''-'' || substr(b.regno,7,7) regno,                                                ');
	  SQL.Add('	            b.mobile,                                                                                                 ');
          SQL.Add('                 b.grd1id,                                                                                                 ');
          SQL.Add('                 b.grd1idyy,                                                                                               ');
          SQL.Add('                 b.grd1idmm,                                                                                               ');
          SQL.Add('                 DECODE(:v_sepno,''3'',b.highname) highname,                                                               ');
          SQL.Add('                 DECODE(:v_sepno,''3'',b.univname) univname,                                                               ');
          SQL.Add('                 DECODE(:v_sepno,''3'',b.univgrad) univgrad,                                                               ');
          SQL.Add('                 DECODE(:v_sepno,''3'',b.univmajor) univmajor,                                                             ');
          SQL.Add('                 DECODE(:v_sepno,''3'',To_Char(a.score)) univscore,                                                        ');
          SQL.Add('                 DECODE(:v_sepno,''3'',b.grd1name) grd1name,                                                               ');
          SQL.Add('                 DECODE(:v_sepno,''3'',b.grd1day) grd1day,                                                                 ');
          SQL.Add('                 DECODE(:v_sepno,''3'',b.grd1major) grd1major,                                                             ');
          SQL.Add('                 DECODE(:v_sepno,''3'',b.grd1score) grd1score,                                                             ');
          SQL.Add('                 DECODE(:v_sepno,''3'',a.levelsc) levelsc,                                                                 ');
          SQL.Add('                 DECODE(:v_sepno,''3'',a.levelhn) levelhn,                                                                 ');
	  SQL.Add('		    DECODE(c.pre_item1,'''','''',c.pre_item1) pre_item1,                                                      ');
          SQL.Add('                 DECODE(c.post_item1,'''','''',c.post_item1) post_item1,                                                   ');
          SQL.Add('                 DECODE(c.pre_item2,'''','''',c.pre_item2) pre_item2,                                                      ');
          SQL.Add('                 DECODE(c.post_item2,'''','''',c.post_item2) post_item2,                                                   ');
	  SQL.Add('		    DECODE(c.pre_item3,'''','''',c.pre_item3) pre_item3,                                                      ');
          SQL.Add('                 DECODE(c.post_item3,'''','''',c.post_item3) post_item3,                                                   ');
          SQL.Add('                 DECODE(c.pre_item4,'''','''',c.pre_item4) pre_item4,                                                      ');
          SQL.Add('                 DECODE(c.post_item4,'''','''',c.post_item4) post_item4,                                                   ');
	  SQL.Add('		    DECODE(:v_sepno,''1'','''',(SELECT Round(AVG(avg_first),1) FROM prectdet                                  ');
          SQL.Add('		                                WHERE rabasdate = :v_rabasdate                                                ');
          SQL.Add('		                                  AND rid       = a.rid)) avg_first,                                          ');
          SQL.Add('		    DECODE(:v_sepno,''1'','''',''2'','''',(SELECT Round(AVG(avg_second),1) FROM prectdet                      ');
          SQL.Add('		                                           WHERE rabasdate = :v_rabasdate                                     ');
          SQL.Add('		                                             AND rid       = a.rid)) avg_second,                              ');
          SQL.Add('		    DECODE(c.memo,'''','''',c.memo) memo,                                                                     ');
          SQL.Add('		    DECODE(c.sepno,''3'',c.intjudg,'''') intjudg                                                              ');
  	  SQL.Add('            FROM prectgrp a,                                                                                               ');
	  SQL.Add('         (SELECT b.rabasdate,b.rid,b.filephoto, b.fullname,                                                                ');
	  SQL.Add('	            DECODE(b.dept,''01'',''경영관리'',''02'',''영업'',''03'',''마케팅'',''04'',''기술'',''06'',''NI사업/영업'',               ');
	  SQL.Add('	                          ''07'',''법인/기업영업'',''08'',''법인기술'',''09'',''회계'',''10'',''컨텐츠사업'',                         ');
	  SQL.Add('		                  ''11'',''언론홍보'',''12'',''웹플래닝/마케팅'',''13'',''SI/NI'',''14'',''정책기획'',                        ');
	  SQL.Add('		                  ''15'',''교육기획'',''16'',''Web관련'',''17'',''HRD1(연수원운영)'',''18'',''HRD2(교육기획)'') dept,         ');
          SQL.Add('                 b.regno, b.mobile,                                                                                        ');
          SQL.Add('                 DECODE(b.grd1id,'''',''대졸'',''대학원졸'') grd1id,                                                       ');
          SQL.Add('                 DECODE(b.grd1id,'''',substr(b.univoutym,1,4),substr(b.grd1outym,1,4)) grd1idyy,                           ');
          SQL.Add('                 DECODE(b.grd1id,'''',substr(b.univoutym,5,2),substr(b.grd1outym,5,2)) grd1idmm,                           ');
          SQL.Add('                 b.highname,                                                                                               ');
          SQL.Add('                 b.univname,DECODE(b.admityn,''Y'',''Y'',''N'') univgrad,                                                  ');
          SQL.Add('                 (SELECT DECODE(b.univmajorname,e.codefname,e.codefname,b.univmajorname)                                   ');
          SQL.Add('                    FROM (SELECT codeno,codefname FROM pyccode WHERE codeid=''I225'') e                                    ');
          SQL.Add('                   WHERE b.UNIVMAJORID=e.codeno) univmajor,                                                                ');
          SQL.Add('                 b.univscore,                                                                                              ');
          SQL.Add('                 b.grd1name,DECODE(b.grd1grad,''1'',DECODE(b.grd1day,''1'',''주'',''야'')) grd1day,                        ');
          SQL.Add('                 (SELECT codefname FROM pyccode WHERE codeid=''I225'' AND codeno=b.grd1majorid) grd1major,                 ');
          SQL.Add('                 b.grd1score                                                                                               ');
          SQL.Add('            FROM prectmas b                                                                                                ');
          SQL.Add('           WHERE rabasdate = :v_rabasdate ) b,                                                                             ');
	  SQL.Add('	    (SELECT c.rabasdate,c.rid,c.grpmain,c.sepno,                                                                      ');
	  SQL.Add('	            c.pre_item1,c.post_item1,c.pre_item2,c.post_item2,c.pre_item3,c.post_item3,c.pre_item4,c.post_item4,      ');
	  SQL.Add('	            c.memo,c.intjudg                                                                                          ');
          SQL.Add('	       FROM prectdet c                                                                                                ');
          SQL.Add('	      WHERE c.rabasdate = :v_rabasdate                                                                                ');
          SQL.Add('	        AND c.grpmain   = :v_grpmain                                                                                  ');
          SQL.Add('	        AND c.sepno     = :v_sepno                                                                                    ');
          SQL.Add('	        AND c.empno     = :v_empno ) c                                                                                ');
	  SQL.Add('   WHERE a.rabasdate=b.rabasdate and a.rabasdate=c.rabasdate(+)                                                            ');
	  SQL.Add('     AND a.rid=b.rid and a.rid=c.rid(+)                                                                                    ');
	  SQL.Add('     AND a.rabasdate = :v_rabasdate                                                                                        ');
	  SQL.Add('     AND a.itvdate = :v_itvdate                                                                                            ');
          SQL.Add('     AND a.grpmain = :v_grpmain  ) a                                                                                       ');
          SQL.Add('   GROUP BY CEIL(cnt/4)                                                                                                    ');

          ParamByName('v_rabasdate').AsString := rabasdate;
          ParamByName('v_itvdate').AsString   := ItvDate;
          ParamByName('v_grpmain').AsString   := CbGrp.Text;
          ParamByName('v_empno').AsString     := EdEmp.Text;
          ParamByName('v_sepno').AsString     := CbSep.Text;

          Open;
     end;
end;

procedure TMainForm.Photo_View;
begin
     With OraQuery1 do
     begin
          Photo_Show(Image1,FieldByName('FILEPHOTO_1').AsString);
          Photo_Show(Image2,FieldByName('FILEPHOTO_2').AsString);
          Photo_Show(Image3,FieldByName('FILEPHOTO_3').AsString);
          Photo_Show(Image4,FieldByName('FILEPHOTO_4').AsString);
     end;
end;

procedure TMainForm.Photo_Show(Image : Timage; PathStr : String);
var
   iJPG      : TJPEGImage;
   iBMP      : TBitmap;
begin
     Image.Enabled := True;
     if fileexists('C:\insa\FilePhoto\' + Copy(PathStr,1,8) + '.JPG') then
     begin
          try
               iJPG := TJPEGImage.Create;
               iJPG.LoadFromFile('C:\insa\FilePhoto\' + Copy(PathStr,1,8) + '.JPG');
               Image.Picture.Assign(iJPG);
               iJPG.Free;
          except
               try
                    iBMP := TBitmap.Create;
                    iBMP.LoadFromFile('C:\insa\FilePhoto\' + Copy(PathStr,1,8) + '.JPG');
                    Image.Picture.Assign(iBmp);
                    iBMP.Free;
               except
                    Image.Enabled := False;
               end;
          end;
     end
     else Image.Picture := nil;
end;

procedure TMainForm.BtPrevClick(Sender: TObject);
begin
     OraQuery1.Prior;
     Photo_View;
end;

procedure TMainForm.BtNextClick(Sender: TObject);
begin
     OraQuery1.Next;
     Photo_View;
end;

procedure TMainForm.BtBaseClick(Sender: TObject);
begin
     TestPopup:=TTestPopup.Create(nil);
     TestPopup.Show;
end;

procedure TMainForm.BtSaveClick(Sender: TObject);
begin
     With OraQuery2 do
     begin
          if OraQuery1.FieldByName('rid_1').AsString <> '' then
          begin
               if QueryStateYN(OraQuery1.FieldByName('rid_1').AsString) = 0 then
               begin
                    if CbSep.Text = '3' then
                    begin
                         QueryInsert(OraQuery1.FieldByName('rid_1').AsString, OraQuery1.FieldByName('grpsub_1').AsString,
                                     '', DcPre1_1.Text, '', DcPre2_1.Text, '', DcPre3_1.Text, '', DcPre4_1.Text, DBMemo1.Text);
                    end
                    else begin
                         QueryInsert(OraQuery1.FieldByName('rid_1').AsString, OraQuery1.FieldByName('grpsub_1').AsString,
                                     DcPre1_1.Text, DcPost1_1.Text,
                                     DcPre2_1.Text, DcPost2_1.Text, DcPre3_1.Text, DcPost3_1.Text,
                                     DcPre4_1.Text, DcPost4_1.Text, DBMemo1.Text);
                    end;
               end
               else begin
                    if CbSep.Text = '3' then
                    begin
                         QueryUpdate(OraQuery1.FieldByName('rid_1').AsString,
                                     '',DcPre1_1.Text, '', DcPre2_1.Text, '', DcPre3_1.Text, '', DcPre4_1.Text, DBMemo1.Text);
                    end
                    else begin
                         QueryUpdate(OraQuery1.FieldByName('rid_1').AsString,
                                     DcPre1_1.Text, DcPost1_1.Text,
                                     DcPre2_1.Text, DcPost2_1.Text, DcPre3_1.Text, DcPost3_1.Text,
                                     DcPre4_1.Text, DcPost4_1.Text, DBMemo1.Text);
                    end;
               end;
          end;

          if OraQuery1.FieldByName('rid_2').AsString <> '' then
          begin
               if QueryStateYN(OraQuery1.FieldByName('rid_2').AsString) = 0 then
               begin
                    if CbSep.Text = '3' then
                    begin
                         QueryInsert(OraQuery1.FieldByName('rid_2').AsString, OraQuery1.FieldByName('grpsub_2').AsString,
                                     '', DcPre1_2.Text, '', DcPre2_2.Text, '', DcPre3_2.Text, '', DcPre4_2.Text, DBMemo2.Text);
                    end
                    else begin
                         QueryInsert(OraQuery1.FieldByName('rid_2').AsString, OraQuery1.FieldByName('grpsub_2').AsString,
                                     DcPre1_2.Text, DcPost1_2.Text,
                                     DcPre2_2.Text, DcPost2_2.Text, DcPre3_2.Text, DcPost3_2.Text,
                                     DcPre4_2.Text, DcPost4_2.Text, DBMemo2.Text);
                    end;
               end
               else begin
                    if CbSep.Text = '3' then
                    begin
                         QueryUpdate(OraQuery1.FieldByName('rid_2').AsString,
                                     '',DcPre1_2.Text, '', DcPre2_2.Text, '', DcPre3_2.Text, '', DcPre4_2.Text, DBMemo2.Text);
                    end
                    else begin
                         QueryUpdate(OraQuery1.FieldByName('rid_2').AsString,
                                     DcPre1_2.Text, DcPost1_2.Text,
                                     DcPre2_2.Text, DcPost2_2.Text, DcPre3_2.Text, DcPost3_2.Text,
                                     DcPre4_2.Text, DcPost4_2.Text, DBMemo2.Text);
                    end;
               end;
          end;

          if OraQuery1.FieldByName('rid_3').AsString <> '' then
          begin
               if QueryStateYN(OraQuery1.FieldByName('rid_3').AsString) = 0 then
               begin
                    if CbSep.Text = '3' then
                    begin
                         QueryInsert(OraQuery1.FieldByName('rid_3').AsString, OraQuery1.FieldByName('grpsub_3').AsString,
                                     '', DcPre1_3.Text, '', DcPre2_3.Text, '', DcPre3_3.Text, '', DcPre4_3.Text, DBMemo3.Text);
                    end
                    else begin
                         QueryInsert(OraQuery1.FieldByName('rid_3').AsString, OraQuery1.FieldByName('grpsub_3').AsString,
                                     DcPre1_3.Text, DcPost1_3.Text,
                                     DcPre2_3.Text, DcPost2_3.Text, DcPre3_3.Text, DcPost3_3.Text,
                                     DcPre4_3.Text, DcPost4_3.Text, DBMemo3.Text);
                    end;
               end
               else begin
                    if CbSep.Text = '3' then
                    begin
                         QueryUpdate(OraQuery1.FieldByName('rid_3').AsString,
                                     '',DcPre1_3.Text, '', DcPre2_3.Text, '', DcPre3_3.Text, '', DcPre4_3.Text, DBMemo3.Text);
                    end
                    else begin
                         QueryUpdate(OraQuery1.FieldByName('rid_3').AsString,
                                     DcPre1_3.Text, DcPost1_3.Text,
                                     DcPre2_3.Text, DcPost2_3.Text, DcPre3_3.Text, DcPost3_3.Text,
                                     DcPre4_3.Text, DcPost4_3.Text, DBMemo3.Text);
                    end;
               end;
          end;

          if OraQuery1.FieldByName('rid_4').AsString <> '' then
          begin
               if QueryStateYN(OraQuery1.FieldByName('rid_4').AsString) = 0 then
               begin
                    if CbSep.Text = '3' then
                    begin
                         QueryInsert(OraQuery1.FieldByName('rid_4').AsString, OraQuery1.FieldByName('grpsub_4').AsString,
                                     '', DcPre1_4.Text, '', DcPre2_4.Text, '', DcPre3_4.Text, '', DcPre4_4.Text, DBMemo4.Text);
                    end
                    else begin
                         QueryInsert(OraQuery1.FieldByName('rid_4').AsString, OraQuery1.FieldByName('grpsub_4').AsString,
                                     DcPre1_4.Text, DcPost1_4.Text,
                                     DcPre2_4.Text, DcPost2_4.Text, DcPre3_4.Text, DcPost3_4.Text,
                                     DcPre4_4.Text, DcPost4_4.Text, DBMemo4.Text);
                    end;
               end
               else begin
                    if CbSep.Text = '3' then
                    begin
                         QueryUpdate(OraQuery1.FieldByName('rid_4').AsString,
                                     '',DcPre1_4.Text, '', DcPre2_4.Text, '', DcPre3_4.Text, '', DcPre4_4.Text, DBMemo4.Text);
                    end
                    else begin
                         QueryUpdate(OraQuery1.FieldByName('rid_4').AsString,
                                     DcPre1_4.Text, DcPost1_4.Text,
                                     DcPre2_4.Text, DcPost2_4.Text, DcPre3_4.Text, DcPost3_4.Text,
                                     DcPre4_4.Text, DcPost4_4.Text, DBMemo4.Text);
                    end;
               end;
          end;
     end;

     MessageBox(self.Handle,'저장 되었습니다.','종합인사',MB_ICONINFORMATION + mb_ok);

     BtRefreshClick(self);
end;

function TMainForm.QueryStateYN(rid : String) : Integer;
begin
     With OraQuery2 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD('  SELECT 1 FROM prectdet                ');
          SQL.ADD('   WHERE rabasdate = :v_rabasdate       ');
          SQL.ADD('     AND rid       = :v_rid             ');
          SQL.ADD('     AND grpmain   = :v_grpmain         ');
          SQL.ADD('     AND sepno     = :v_sepno           ');
          SQL.ADD('     AND empno     = :v_empno           ');

          ParamByName('v_rabasdate').AsString := rabasdate;
          ParamByName('v_rid').AsString       := rid;
          ParamByName('v_grpmain').AsString   := CbGrp.Text;
          ParamByName('v_sepno').AsString      := CbSep.Text;
          ParamByName('v_empno').AsString      := EdEmp.Text;
          Open;

          if RecordCount=0 then Result := 0
          else                  Result := 1;
     end;
end;

procedure TMainForm.QueryInsert(rid : String; grpsub : String; DcPre1 : String; DcPost1 : String;
                                DcPre2 : String; DcPost2 : String; DcPre3 : String; DcPost3 : String;
                                DcPre4 : String; DcPost4 : String; memo : String);
var
   AvgInt : Integer;
begin
     With OraQuery2 do
     begin
          Close;
          SQL.Clear;

          SQL.ADD('  INSERT INTO prectdet(rabasdate, rid, grpmain, grpsub, sepno, empno,                                      ');
          SQL.ADD('                       pre_item1, post_item1, pre_item2, post_item2,                                       ');

     if CbSep.Text = '3' then
          SQL.ADD('                       pre_item3, post_item3, pre_item4, intjudg, memo, avg_first, avg_second)             ')
     else
          SQL.ADD('                       pre_item3, post_item3, pre_item4, post_item4, memo, avg_first, avg_second)          ');
          SQL.ADD('       VALUES (:v_rabasdate, :v_rid, :v_grpmain, :v_grpsub, :v_sepno,                                      ');
          SQL.ADD('               :v_empno, :v_pre_item1, :v_post_item1, :v_pre_item2, :v_post_item2,                         ');
          SQL.ADD('               :v_pre_item3, :v_post_item3, :v_pre_item4, :v_post_item4,                                   ');
          SQL.ADD('               :v_memo, round(:v_avg_first,1), round(:v_avg_second,1))                                     ');

          ParamByName('v_rabasdate').AsString  := rabasdate;
          ParamByName('v_rid').AsString        := rid;
          ParamByName('v_grpmain').AsString    := CbGrp.Text;
          ParamByName('v_grpsub').AsString     := grpsub;
          ParamByName('v_sepno').AsString      := CbSep.Text;
          ParamByName('v_empno').AsString      := EdEmp.Text;
          ParamByName('v_pre_item1').AsString  := DcPre1;
          ParamByName('v_post_item1').AsString := DcPost1;
          ParamByName('v_pre_item2').AsString  := DcPre2;
          ParamByName('v_post_item2').AsString := DcPost2;
          ParamByName('v_pre_item3').AsString  := DcPre3;
          ParamByName('v_post_item3').AsString := DcPost3;
          ParamByName('v_pre_item4').AsString  := DcPre4;
          ParamByName('v_post_item4').AsString := DcPost4;
          ParamByName('v_memo').AsString       := memo;

          if CbSep.Text = '3' then DcPost4 := '';
          
          AvgInt := 0;
          if (DcPost1 <> '') AND (DcPost1 <> 'N/A') then AvgInt := AvgInt + 1;
          if (DcPost2 <> '') AND (DcPost2 <> 'N/A') then AvgInt := AvgInt + 1;
          if (DcPost3 <> '') AND (DcPost3 <> 'N/A') then AvgInt := AvgInt + 1;
          if (DcPost4 <> '') AND (DcPost4 <> 'N/A') then AvgInt := AvgInt + 1;

          if CbSep.Text = '1' then
          begin
             if AvgInt = 0 then ParamByName('v_avg_first').AsString  := ''
             else               ParamByName('v_avg_first').AsString  := FloatToStr(RoundedReal((ScoreToInt(DcPost1)
                                                                                              + ScoreToInt(DcPost2)
                                                                                              + ScoreToInt(DcPost3)
                                                                                              + ScoreToInt(DcPost4)) / AvgInt,1));
          end;

          if CbSep.Text = '2' then
             if AvgInt = 0 then ParamByName('v_avg_second').AsString  := ''
             else               ParamByName('v_avg_second').AsString := FloatToStr(RoundedReal((ScoreToInt(DcPost1)
                                                                                  + ScoreToInt(DcPost2)
                                                                                  + ScoreToInt(DcPost3)
                                                                                  + ScoreToInt(DcPost4)) / AvgInt,1));

          ExecSql;
     end;
end;

procedure TMainForm.QueryUpdate(rid : String; DcPre1 : String; DcPost1 : String;
                                DcPre2 : String; DcPost2 : String; DcPre3 : String; DcPost3 : String;
                                DcPre4 : String; DcPost4 : String; memo : String);
var
   AvgInt : Integer;
begin
     With OraQuery2 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD('  UPDATE prectdet                           ');
          SQL.ADD('     SET pre_item1  = :v_pre_item1,         ');
          SQL.ADD('         post_item1 = :v_post_item1,        ');
          SQL.ADD('         pre_item2  = :v_pre_item2,         ');
          SQL.ADD('         post_item2 = :v_post_item2,        ');
          SQL.ADD('         pre_item3  = :v_pre_item3,         ');
          SQL.ADD('         post_item3 = :v_post_item3,        ');
          SQL.ADD('         pre_item4  = :v_pre_item4,         ');

     if CbSep.Text = '3' then
          SQL.ADD('         intjudg = :v_post_item4,           ')
     else
          SQL.ADD('         post_item4 = :v_post_item4,        ');
          SQL.ADD('         memo       = :v_memo,              ');
          SQL.ADD('         avg_first  = Round(:v_avg_first,1),');
          SQL.ADD('         avg_second = Round(:v_avg_second,1)');
          SQL.ADD('   WHERE rabasdate = :v_rabasdate           ');
          SQL.ADD('     AND rid       = :v_rid                 ');
          SQL.ADD('     AND grpmain   = :v_grpmain             ');
          SQL.ADD('     AND sepno     = :v_sepno               ');
          SQL.ADD('     AND empno     = :v_empno               ');

          ParamByName('v_rabasdate').AsString := rabasdate;
          ParamByName('v_rid').AsString       := rid;
          ParamByName('v_grpmain').AsString   := CbGrp.Text;
          ParamByName('v_sepno').AsString     := CbSep.Text;
          ParamByName('v_empno').AsString     := EdEmp.Text;
          ParamByName('v_pre_item1').AsString  := DcPre1;
          ParamByName('v_post_item1').AsString := DcPost1;
          ParamByName('v_pre_item2').AsString  := DcPre2;
          ParamByName('v_post_item2').AsString := DcPost2;
          ParamByName('v_pre_item3').AsString  := DcPre3;
          ParamByName('v_post_item3').AsString := DcPost3;
          ParamByName('v_pre_item4').AsString  := DcPre4;
          ParamByName('v_post_item4').AsString := DcPost4;
          ParamByName('v_memo').AsString       := memo;

          if CbSep.Text = '3' then DcPost4 := '';
          
          AvgInt := 0;
          if (DcPost1 <> '') AND (DcPost1 <> 'N/A') then AvgInt := AvgInt + 1;
          if (DcPost2 <> '') AND (DcPost2 <> 'N/A') then AvgInt := AvgInt + 1;
          if (DcPost3 <> '') AND (DcPost3 <> 'N/A') then AvgInt := AvgInt + 1;
          if (DcPost4 <> '') AND (DcPost4 <> 'N/A') then AvgInt := AvgInt + 1;

          if CbSep.Text = '1' then
             if AvgInt = 0 then ParamByName('v_avg_first').AsString  := ''
             else ParamByName('v_avg_first').AsString  := FloatToStr((ScoreToInt(DcPost1) + ScoreToInt(DcPost2) + ScoreToInt(DcPost3) +
                                                                 ScoreToInt(DcPost4)) / AvgInt);
          if CbSep.Text = '2' then
             if AvgInt = 0 then ParamByName('v_avg_second').AsString  := ''
             else ParamByName('v_avg_second').AsString := FloatToStr((ScoreToInt(DcPost1) + ScoreToInt(DcPost2) + ScoreToInt(DcPost3) +
                                                                  ScoreToInt(DcPost4)) / AvgInt);
                                                                  
          ExecSql;
     end;
end;

function TMainForm.ScoreToInt(Score : String) : Integer;
begin
     if Score = 'S'       then result := 100
     else if Score = 'A'  then result := 90
     else if Score = 'B+' then result := 85
     else if Score = 'B0' then result := 80
     else if Score = 'B-' then result := 75
     else if Score = 'C'  then result := 70
     else if Score = 'D'  then result := 60
     else                      result := 0;
end;

procedure TMainForm.IntroShow(BtIndex : Integer);
begin
     IntroPopup:=TIntroPopup.Create(nil);

     With OraQuery1 do
     begin
          Case BtIndex of
               1 :
                  begin
                       IntroPopup.Rid := OraQuery1.FieldByName('rid_1').AsString;
                       IntroPopup.SF_Main.Caption.Text := IntroPopup.SF_Main.Caption.Text + ' - ' + OraQuery1.FieldByName('fullname_1').AsString;
                  end;
               2 :
                  begin
                       IntroPopup.Rid := OraQuery1.FieldByName('rid_2').AsString;
                       IntroPopup.SF_Main.Caption.Text := IntroPopup.SF_Main.Caption.Text + ' - ' + OraQuery1.FieldByName('fullname_2').AsString;
                  end;
               3 :
                  begin
                       IntroPopup.Rid := OraQuery1.FieldByName('rid_3').AsString;
                       IntroPopup.SF_Main.Caption.Text := IntroPopup.SF_Main.Caption.Text + ' - ' + OraQuery1.FieldByName('fullname_3').AsString;
                  end;
               4 :
                  begin
                       IntroPopup.Rid := OraQuery1.FieldByName('rid_4').AsString;
                       IntroPopup.SF_Main.Caption.Text := IntroPopup.SF_Main.Caption.Text + ' - ' + OraQuery1.FieldByName('fullname_4').AsString;
                  end;
          end;
     end;

     IntroPopup.Pgrade := Pgrade;
     IntroPopup.Show;
end;
procedure TMainForm.BtRefreshClick(Sender: TObject);
var
   BmBefore : TBookMark;
begin
     if CbDate.Visible = True then ItvDate := CbDate.Text;

     BmBefore := OraQuery1.GetBookmark;
     Query_View;

     if OraQuery1.RecordCount > 0 then
     begin
          OraQuery1.GotoBookmark(BmBefore);
          Photo_View;
     end;
end;

procedure TMainForm.EdEmpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = 13 then BtRefreshClick(nil);
end;

procedure TMainForm.DcPre2_1Change(Sender: TObject);
begin
     DcPost2_1.ItemIndex := DcPre2_1.ItemIndex;
end;

procedure TMainForm.DcPre3_1Change(Sender: TObject);
begin
     DcPost3_1.ItemIndex := DcPre3_1.ItemIndex;
end;

procedure TMainForm.DcPre4_1Change(Sender: TObject);
begin
     DcPost4_1.ItemIndex := DcPre4_1.ItemIndex;
end;

procedure TMainForm.DcPre1_2Change(Sender: TObject);
begin
     DcPost1_2.ItemIndex := DcPre1_2.ItemIndex;
end;

procedure TMainForm.DcPre2_2Change(Sender: TObject);
begin
     DcPost2_2.ItemIndex := DcPre2_2.ItemIndex;
end;

procedure TMainForm.DcPre3_2Change(Sender: TObject);
begin
     DcPost3_2.ItemIndex := DcPre3_2.ItemIndex;
end;

procedure TMainForm.DcPre4_2Change(Sender: TObject);
begin
     DcPost4_2.ItemIndex := DcPre4_2.ItemIndex;
end;

procedure TMainForm.DcPre1_3Change(Sender: TObject);
begin
     DcPost1_3.ItemIndex := DcPre1_3.ItemIndex;
end;

procedure TMainForm.DcPre2_3Change(Sender: TObject);
begin
     DcPost2_3.ItemIndex := DcPre2_3.ItemIndex;
end;

procedure TMainForm.DcPre3_3Change(Sender: TObject);
begin
     DcPost3_3.ItemIndex := DcPre3_3.ItemIndex;
end;

procedure TMainForm.DcPre4_3Change(Sender: TObject);
begin
     DcPost4_3.ItemIndex := DcPre4_3.ItemIndex;
end;

procedure TMainForm.DcPre1_4Change(Sender: TObject);
begin
     DcPost1_4.ItemIndex := DcPre1_4.ItemIndex;
end;

procedure TMainForm.DcPre2_4Change(Sender: TObject);
begin
     DcPost2_4.ItemIndex := DcPre2_4.ItemIndex;
end;

procedure TMainForm.DcPre3_4Change(Sender: TObject);
begin
     DcPost3_4.ItemIndex := DcPre3_4.ItemIndex;
end;

procedure TMainForm.DcPre4_4Change(Sender: TObject);
begin
     DcPost4_4.ItemIndex := DcPre4_4.ItemIndex;
end;

procedure TMainForm.DcPre1_1Change(Sender: TObject);
begin
     DcPost1_1.ItemIndex := DcPre1_1.ItemIndex;
end;

procedure TMainForm.CbSepChange(Sender: TObject);
begin
     if NOT(Copy(Pgrade,2,1) = 'A') or (Pempno = '1821') then
     begin
          With OraQuery2 do
          begin
               Close;
               SQL.Clear;
               SQL.ADD(' SELECT DISTINCT(grpmain)                   ');
               SQL.ADD('   FROM prectins                            ');
               SQL.ADD('  WHERE rabasdate = :v_rabasdate            ');
               SQL.ADD('    AND sepno     = :v_sepno                ');
               SQL.ADD('    AND empno     = :v_empno                ');

               ParamByName('v_rabasdate').AsString := rabasdate;
               ParamByName('v_sepno'    ).AsString := CbSep.Text;
               ParamByName('v_empno'    ).AsString := Pempno;
               Open;

               First;
               CbGrp.Items.Clear;
               While Not Eof do
               begin
                     CbGrp.Items.Add(OraQuery2.FieldByName('grpmain').AsString);
                     Next;
               end;
               CbGrp.ItemIndex := 0;
          end;
     end;
end;

end.
