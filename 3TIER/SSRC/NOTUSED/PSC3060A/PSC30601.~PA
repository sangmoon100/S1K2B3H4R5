unit PSC30601;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, TmaxFunc,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  OnLineLabel, OnInsaCommon, OnEditBtnCtrl, OnTmaxPersonEdit, OnDBGrid, OnEditMemo,
  OnScheme, OnShapeLabel, OnFocusButton, Tmax_session;

type
  TFpsc30601 = class(TForm)
    Panel_Body: TPanel;
    DbGrid1: TOnGrDbGrid;
    DbGrid2: TOnGrDbGrid;
    Shape3: TShape;
    P_stlamtTOT: TOnNumberEdit;
    OnSectionLabel2: TOnSectionLabel;
    P_stisumTOT: TOnNumberEdit;
    P_stirisumTOT: TOnNumberEdit;
    P_stiramtTOT: TOnNumberEdit;
    TDS_Grid1: TTMaxDataSet;
    TDS_Grid2: TTMaxDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    E_exdesc: TOnEdit;
    Shape4: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    P_payra: TOnEdit;
    P_payraNAME: TOnEdit;
    P_deptcode: TOnEdit;
    P_deptcodeNAME: TOnEdit;
    SF_Main: TOnSchemeForm;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    StatusBar1: TStatusBar;
    Panel_Button: TPanel;
    BB_Close: TOnFocusButton;
    TMaxSession: TTMaxSession;
    TDS1: TTMaxDataSet;
    E_empno: TTMaxPersonPopupEdit;
    BB_DedScr: TOnFocusButton;
    procedure FormPaint(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure BB_DedScrClick(Sender: TObject);
    procedure BB_CloseClick(Sender: TObject);
    procedure E_empnoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Empno         : String[04];   { 사번                                           }
    KorName       : String[12];   { 성명                                           }
    PassWord      : String[10];   { 패스워드                                       }
    Grade         : String[10];   { 사용등급                                       }

    corpname,stclass,stlorg : string;
    divseqnum : integer;

    procedure Open_Grid1;
    procedure Open_Grid2;
  end;

var
  Fpsc30601: TFpsc30601;

implementation

uses  PSC30602;

{$R *.DFM}

procedure TFpsc30601.FormPaint(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  StatusBar1.Panels[1].Text := '인사 시스템에 접속 중입니다...';

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////

  StatusBar1.Panels[1].Text := '';

//--> Start
  Empno          := HInsa_Param(cmdline,1);
  Korname        := HInsa_Param(cmdline,2);
  Password       := HInsa_Param(cmdline,3);

  StatusBar1.Panels[1].Text := '초기자료를 설정하고 있습니다. 잠시만 기다려 주십시요..';

  if copy(Empno,1,1) = 'D' then
  begin
     E_empno.Enabled     := true;
//     E_empno.ButtonWidth := 24;
  end
  else
  begin
     E_empno.Text   := Empno;
     Open_Grid1;
  end;
end;

procedure TFpsc30601.Open_Grid1;
var
  Paramstr : String;
begin
  E_empno.PL_get_singledata;

  P_Payra.Text        := E_empno.payra;
  P_PayraName.Text    := E_empno.payraname;
  P_deptcode.Text     := E_empno.deptcode;
  P_deptcodename.Text := E_empno.deptname;

  Paramstr :=  'SELECT  '+
               ' nvl(        corpname        ,'' ''),        '+
               ' nvl(to_char(divseqnum      ),''0''),        '+
               ' nvl(        stclass         ,'' ''),        '+
               ' nvl(        stlorg          ,'' ''),        '+
               ' nvl(  decode(stclass,                       '+
               '              ''1'',''사주우선'',            '+
               '              ''2'',''사주실권'',            '+
               '              ''3'',''주주우선'',            '+
               '              ''4'',''주주우선(예탁)'',      '+
               '              ''5'',''주주우선(비예탁)'',    '+
               '              '' ''),'' '') stclass_name,    '+
               ' nvl(        codename     , '' '') stlorg_name, '+
               ' nvl(        stldate      , '' '') stldate,   '+
               ' nvl(        stlamt       ,    0   ),        '+
               ' nvl(        stisum       ,    0   ),        '+
               ' nvl(        stirisum     ,    0   ),        '+
               ' nvl(        stiramt      ,    0   )         '+
               'from   pslmas a, pyccode b                   '+
               'where  empno = '''+E_empno.empno+'''         '+
               'and    (codeid(+) = ''K910'' and stlorg = codeno(+)) '+
               'order  by corpname desc, divseqnum desc, stclass ';

  with TDS_Grid1 do
    begin
      ServiceName := 'PSC3060A_sel1';
      Close;
      Sql.Clear;
      Sql.Add(Paramstr);

      ClearFieldInfo;
      AddField('CORPNAME'    , ftString,  20);
      AddField('DIVSEQNUM'   , ftString,  3);
      AddField('STCLASS'     , ftString,  1);
      AddField('STLORG'      , ftString,  3);
      AddField('STCLASS_NAME', ftString,  16);
      AddField('STLORG_NAME' , ftString,  20);
      AddField('STLDATE'     , ftString,  8);
      AddField('STLAMT'      , ftInteger, 9);
      AddField('STISUM'      , ftInteger, 9);
      AddField('STIRISUM'    , ftInteger, 9);
      AddField('STIRAMT'     , ftInteger, 9);
      Open;

      DataSource1.OnDataChange := Nil;
      FieldByName('DIVSEQNUM').Alignment := taCenter;

      FieldByName('STLDATE').EditMask :=  '!9999/99/99;0;_';
      TFloatField(FieldByName('STLAMT')).DisplayFormat   := '#,##0';
      TFloatField(FieldByName('STISUM')).DisplayFormat   := '#,##0';
      TFloatField(FieldByName('STIRISUM')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('STIRAMT')).DisplayFormat  := '#,##0';

      DataSource1.OnDataChange := DataSource1DataChange;
    end;

  if TDS_Grid1.Eof then
    begin
      MessageDlg('귀하는 우리사주 대부내역이 없습니다.',mtInformation, [mbOk], 0);
      TDS_Grid1.Close;
      Fpsc30601.Close;
    end;

  Paramstr :=  'SELECT  '+
               ' nvl(to_char( sum(stlamt)    ),''0'') sum_stlamt  , '+
               ' nvl(to_char( sum(stisum)    ),''0'') sum_stisum  , '+
               ' nvl(to_char( sum(stirisum)  ),''0'') sum_stirisum, '+
               ' nvl(to_char( sum(stiramt)   ),''0'') sum_stiramt   '+
               'from    pslmas                                      '+
               'where   empno = '''+E_empno.Empno+'''                '+
               'group by empno';

  with TDS1 do
    begin
      ServiceName :='PSC3060A_sel3';
      Close;
      Sql.Clear;
      Sql.Add(Paramstr);
      ClearFieldInfo;
      AddField('SUM_STLAMT'   , ftInteger   ,  9  );
      AddField('SUM_STISUM'   , ftInteger   ,  9  );
      AddField('SUM_STIRISUM' , ftInteger   ,  9  );
      AddField('SUM_STIRAMT'  , ftInteger   ,  9  );
      Open;
    end;

  P_stlamtTOT.Value   :=  TDS1.FieldByName('sum_stlamt').AsFloat;
  P_stisumTOT.Value   :=  TDS1.FieldByName('sum_stisum').AsFloat;
  P_stirisumTOT.Value :=  TDS1.FieldByName('sum_stirisum').AsFloat;
  P_stiramtTOT.Value  :=  TDS1.FieldByName('sum_stiramt').AsFloat;
  TDS1.Close;

end;

{==============================================================================
          Open_Grid2 Procedure.
 ==============================================================================}
procedure TFpsc30601.Open_Grid2;
var
  Paramstr : String;
begin
  Paramstr :=  'SELECT  '+
                ' nvl(        exdate          ,'' ''), '+
                ' nvl(        exiamt          ,  0  ), '+
                ' nvl(to_char(exicnt         ),''0''), '+
                ' nvl(        exspyn          ,'' ''), '+
                ' nvl(to_char(exspint1       ),''0''), '+
                ' nvl(to_char(exspint2       ),''0''), '+
                ' nvl(        exmdate         ,'' ''), '+
                ' nvl(        excpamt         ,  0  ), '+
                ' nvl(        cpdedyn         ,'' ''), '+
                ' nvl(        exdedamt        ,  0  ), '+
                ' nvl(        exyn            ,'' ''), '+
                ' nvl(        exdesc          ,'' ''), '+
                ' nvl(        to_char(stirate)||'' %'' ,'' '') stirate, '+
                ' nvl(        decode(excpcs,''1'',''정기'',''2'',''중도'','' ''),'' '') excpcs '+
                 ' from   psemhis a, pshlbas b ' +
          format(' where  a.corpname = ''%s'' ',[corpname])  +
          format(' and    a.divseqnum = %d    ',[divseqnum]) +
          format(' and    a.stclass = ''%s''  ',[stclass])   +
          format(' and    a.stlorg  = ''%s''  ',[stlorg])    +
          format(' and    b.corpname = ''%s'' ',[corpname])  +
          format(' and    b.divseqnum = %d    ',[divseqnum]) +
          format(' and    b.stclass = ''%s''  ',[stclass])   +
          format(' and    b.stlorg  = ''%s''  ',[stlorg])    +
          format(' and    empno = ''%s''    ',[e_empno.empno])+
                 ' order by exdate desc ';

  with TDS_Grid2 do
    begin
      ServiceName := 'PSC3060A_sel2';
      Close;
      Sql.Clear;
      Sql.Add(Paramstr);

      ClearFieldInfo;
      AddField('EXDATE'  , ftString,  8);
      AddField('EXIAMT'  , ftInteger, 6);
      AddField('EXICNT'  , ftInteger, 2);
      AddField('EXSPYN'  , ftString,  1);
      AddField('EXSPINT1', ftInteger, 6);
      AddField('EXSPINT2', ftInteger, 6);
      AddField('EXMDATE' , ftString,  8);
      AddField('EXCPAMT' , ftInteger, 9);
      AddField('CPDEDYN' , ftString,  1);
      AddField('EXDEDAMT', ftInteger, 9);
      AddField('EXYN'    , ftString,  1);
      AddField('EXDESC'  , ftString,  100);
      AddField('STIRATE' , ftString,  42);
      AddField('EXCPCS'  , ftString,  4);

      Open;

      DataSource2.OnDataChange := Nil;
      FieldByName('STIRATE').Alignment := taRightJustify;
      FieldByName('EXMDATE').Alignment := taCenter;      
      FieldByName('EXDATE').EditMask   := '!9999/99;0;_';
      FieldByName('EXMDATE').EditMask  := '!9999/99/99;0;_';
      TFloatField(FieldByName('EXIAMT')).DisplayFormat    := '#,##0';
      TFloatField(FieldByName('EXCPAMT')).DisplayFormat   := '#,##0';
      TFloatField(FieldByName('EXDEDAMT')).DisplayFormat  := '#,##0';
      DataSource2.OnDataChange := DataSource2DataChange;
    end;

  StatusBar1.Panels[1].Text := '자료에 대한 조회가 완료되었습니다...';
     
end;


procedure TFpsc30601.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if not TDS_Grid1.eof then
    begin
      corpname  := TDS_Grid1.FieldByName('corpname').AsString;
      divseqnum := TDS_Grid1.FieldByName('divseqnum').AsInteger;
      stclass   := TDS_Grid1.FieldByName('stclass').AsString;
      stlorg    := TDS_Grid1.FieldByName('stlorg').AsString;
      Open_Grid2;
    end;   

end;

procedure TFpsc30601.DataSource2DataChange(Sender: TObject; Field: TField);
begin
  E_Exdesc.Text := TDS_Grid2.FieldByName('exdesc').AsString;
end;

procedure TFpsc30601.BB_DedScrClick(Sender: TObject);
begin
  Try
    Fpsc30602          := TFpsc30602.Create(self);
    Fpsc30602.empno    := E_empno.empno ;
    Fpsc30602.ShowModal;
  Finally
    Fpsc30602.Free;
  End;

end;

procedure TFpsc30601.BB_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFpsc30601.E_empnoChange(Sender: TObject);
begin
  if length(E_empno.text) = 4 then
     Open_Grid1;
end;

end.
