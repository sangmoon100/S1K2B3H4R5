unit Pit203040;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peextcombo, peoutlookbtn, ExtCtrls, StdCtrls, Mask, pebtnedit,
  PeJeonLabel, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, db,
  OnTmaxPersonEdit, OnShapeLabel, OnTmaxCodeEdit, OnTmaxDeptEdit,
  OnFocusButton, OnEditCombo, pegradpanl, OnEditMemo, Grids, DBGrids,
  OnGrDBGrid, ComCtrls, OnSkinBtn;

type
  TFm_SubForm4 = class(TForm)
    Panel1: TPanel;
    DS_go1: TDataSource;
    DS_go3: TDataSource;
    PageControl1: TPageControl;
    tab_1: TTabSheet;
    tab_2: TTabSheet;
    tab_3: TTabSheet;
    OnGrDbGrid1: TOnGrDbGrid;
    OnGrDbGrid2: TOnGrDbGrid;
    go_DbGrid: TOnGrDbGrid;
    DS_go2: TDataSource;
    Panel2: TPanel;
    bt_close: TOnSkinButton;
    Shape1: TShape;
    Shape2: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Shape3: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Shape4: TShape;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DbGridDblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure bt_closeClick(Sender: TObject);
  private
    { Private declarations }
    Start     : Boolean;
//    procedure come_data_display;
  public
    { Public declarations }
    SelForm   : TForm;
    procedure fzDataDisplay(FOrgnum, FDeptcode: String);
  end;

var
  Fm_SubForm4: TFm_SubForm4;

implementation

uses pit203000, pit203011, pit203020;

{$R *.DFM}

procedure TFm_SubForm4.FormCreate(Sender: TObject);
begin
  Start := True;
end;

procedure TFm_SubForm4.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caFree;
end;

procedure TFm_SubForm4.FormShow(Sender: TObject);
begin
  if Start then
  begin
    Start := not Start;
    Application.ProcessMessages;
    PageControl1.ActivePage := tab_1;
    self.Tag := 1;
    fzDataDisplay( MainForm.porgnum, MainForm.pDeptcode);
  end;
end;


procedure TFm_SubForm4.DbGridDblClick(Sender: TObject);
var
  sEmpno: String;
begin
  //제 1지망
  if PageControl1.ActivePage = tab_1 then
  begin
     if TComponent(Sender).Tag = 1 then
       sEmpno := MainForm.TDS_F1.FieldByName('사번').Asstring;

     if sEmpno = '' then  System.Exit;
  end ;
  //제 2지망
  if PageControl1.ActivePage = tab_2 then
  begin
     if TComponent(Sender).Tag = 1 then
       sEmpno := MainForm.TDS_F2.FieldByName('사번').Asstring;

     if sEmpno = '' then  System.Exit;
  end ;
  //제 3지망
  if PageControl1.ActivePage = tab_3 then
  begin
     if TComponent(Sender).Tag = 1 then
       sEmpno := MainForm.TDS_F3.FieldByName('사번').Asstring;

     if sEmpno = '' then  System.Exit;
  end ;


  Try
    SelForm := TFm_SubForm1.Create(nil);

    if Assigned(SelForm) then
    begin
      SelForm.Caption     := '사내인재 모집내역';
      if      PageControl1.ActivePage = tab_1 then SelForm.Tag := 1
      else if PageControl1.ActivePage = tab_2 then SelForm.Tag := 2
      else if PageControl1.ActivePage = tab_3 then SelForm.Tag := 3;

      SelForm.Position    := poScreenCenter;
      SelForm.BorderStyle := bsSingle;
      SelForm.ShowModal;
    end;

    if MainForm.gbChanged = True then
    begin
       //제 1지망
       if PageControl1.ActivePage = tab_1 then
       begin
          MainForm.TDS_F1.DisableControls;
          fzDataDisplay( MainForm.porgnum, MainForm.pDeptcode);
          MainForm.TDS_F1.Locate('사번', VararrayOf([sEmpno]), [loPartialKey]);
          MainForm.TDS_F1.EnableControls;
       end;
       //제 2지망
       if PageControl1.ActivePage = tab_2 then
       begin
          MainForm.TDS_F2.DisableControls;
          fzDataDisplay( MainForm.porgnum, MainForm.pDeptcode);
          MainForm.TDS_F2.Locate('사번', VararrayOf([sEmpno]), [loPartialKey]);
          MainForm.TDS_F2.EnableControls;
       end;
       //제 3지망
       if PageControl1.ActivePage = tab_3 then
       begin
          MainForm.TDS_F3.DisableControls;
          fzDataDisplay( MainForm.porgnum, MainForm.pDeptcode);
          MainForm.TDS_F3.Locate('사번',  VararrayOf([sEmpno]), [loPartialKey]);
//          MainForm.TDS_F3.Locate('EMPNO',  VararrayOf([gvTemp]), [loCaseInsensitive])
          MainForm.TDS_F3.EnableControls;
       end;

    end;

  Finally
    SelForm.Free;
  End;
end;

procedure TFm_SubForm4.fzDataDisplay(FOrgnum, FDeptcode: String);
var
  {Msg,} Tem : String;
    i : Integer;
    Field: TField;
const
    iIdx   : array[1..7] of integer = ( 1, 2, 7, 9, 11, 10, 38);//'01','02' ,'07' ,'09' , '11', '10' , '38' ];
begin
    Tem := '';
  // 우리부서에서 다른부서로 지원한 내역
    if PageControl1.ActivePage = tab_1 then
    begin
       Tem := '  SELECT                                                                                   '+
              '    NVL(a.empno,         '' '') empno,                                                     '+
              '    NVL(a.monum,         '' '') monum,                                                     '+
              '    NVL(a.korname,       '' '') korname,                                                   '+
              '    NVL(a.orgnum,        '' '') orgnum,                                                    '+
              '    NVL(a.deptcode,      '' '') deptcode,                                                  '+
              '    (select deptname from pycdept where deptcode = a.deptcode)  deptname,                  '+
              '    NVL(a.paycl,         '' '') paycl,                                                     '+
              '    (select codename from pyccode where codeid = ''I112'' and codeno = a.paycl) payclname, '+
              '    NVL(a.payra,         '' '') payra,                                                     '+
              '    (select codename from pyccode where codeid = ''I113'' and codeno = a.payra) payraname, '+
              '    a.appdate           ,                                                                  '+
              '    a.aftdeptcode1      ,                                                                  '+
              '    a.aftdeptcode2      ,                                                                  '+
              '    a.aftdeptcode3      ,                                                                  '+
              '    (select deptname from pycdept where deptcode = a.aftdeptcode1)  aftdeptname1,          '+
              '    (select deptname from pycdept where deptcode = a.aftdeptcode2)  aftdeptname2,          '+
              '    (select deptname from pycdept where deptcode = a.aftdeptcode3)  aftdeptname3,          '+
              '    NVL(a.motive1,       '' '') motive1,                                                   '+
              '    NVL(a.motive2,       '' '') motive2,                                                   '+
              '    NVL(a.motive3,       '' '') motive3,                                                   '+
              '    NVL(a.etcdesc1,      '' '') etcdesc1,                                                  '+
              '    NVL(a.etcdesc2,      '' '') etcdesc2,                                                  '+
              '    NVL(a.etcdesc3,      '' '') etcdesc3,                                                  '+
              '    NVL(a.aftconyn1,     '' '') aftconyn1,                                                 '+
              '    NVL(a.aftconyn2,     '' '') aftconyn2,                                                 '+
              '    NVL(a.aftconyn3,     '' '') aftconyn3,                                                 '+
              '    NVL(a.aftconempno1,  '' '') aftconempno1,                                              '+
              '    NVL(a.aftconempno2,  '' '') aftconempno2,                                              '+
              '    NVL(a.aftconempno3,  '' '') aftconempno3,                                              '+
              '    NVL(a.aftconkorname1, '' '') aftconkorname1,                                           '+
              '    NVL(a.aftconkorname2, '' '') aftconkorname2,                                           '+
              '    NVL(a.aftconkorname3, '' '') aftconkorname3,                                           '+
              '    NVL(a.aftcondate1,    '' '') aftcondate1,                                              '+
              '    NVL(a.aftcondate2,    '' '') aftcondate2,                                              '+
              '    NVL(a.aftcondate3,    '' '') aftcondate3,                                              '+
              '    NVL(a.state1,         '' '') state1,                                                   '+
              '    NVL(a.state2,         '' '') state2,                                                   '+
              '    NVL(a.state3,         '' '') state3,                                                   '+
              '    DECODE(a.state1,''1'',''대기중'',                                                      '+
              '                    ''2'',''검토중'',                                                      '+
              '                    ''3'',''처리완료'','' '') statename1,                                  '+
              '    DECODE(a.state2,''1'',''대기중'',                                                      '+
              '                    ''2'',''검토중'',                                                      '+
              '                    ''3'',''처리완료'','' '') statename2,                                  '+
              '    DECODE(a.state3,''1'',''대기중'',                                                      '+
              '                    ''2'',''검토중'',                                                      '+
              '                    ''3'',''처리완료'','' '') statename3,                                  '+
              '    NVL(a.statedate1,       '' '') statedate1,                                             '+
              '    NVL(a.statedate2,       '' '') statedate2,                                             '+
              '    NVL(a.statedate3,       '' '') statedate3                                              '+
              'FROM  pischnmas a                                                                          '+
      Format( 'WHERE a.orgnum = ''%s'' AND a.aftdeptcode1 = ''%s''                                        '+
              '  and a.monum  = ''%s''                                                                    '+
              '  and a.state1 in (''1'',''2'',''3'')                                                      ',
              [ FOrgnum, FDeptcode, MainForm.gsMonum ]);

       With MainForm.TDS_F1 do
       begin
          Close;
          ClearFieldInfo;
          AddField('사번'                 ,  ftString ,  4   );   //0
          AddField('공모차수'             ,  ftString ,  3   );
          AddField('성명'                 ,  ftString ,  12  );   //2
          AddField('조직차수'             ,  ftString ,  3   );
          AddField('부서코드'             ,  ftString ,  6   );
          AddField('부서명'               ,  ftString ,  60  );
          AddField('직급'                 ,  ftString ,  2   );
          AddField('직급명'               ,  ftString ,  20  );   //7
          AddField('직위'                 ,  ftString ,  3   );
          AddField('직위명'               ,  ftString ,  20  );   //9
          AddField('지원일'               ,  ftString ,  8  );    //10
          AddField('지원부서코드'         ,  ftString ,  6   );   //11
          AddField('지원부서코드2'        ,  ftString ,  6   );
          AddField('지원부서코드3'        ,  ftString ,  6   );
          AddField('지원부서명'           ,  ftString ,  60  );  //14
          AddField('지원부서명2'          ,  ftString ,  60  );
          AddField('지원부서명3'          ,  ftString ,  60  );
          AddField('지원동기'             ,  ftString , 2000 );
          AddField('지원동기2'            ,  ftString , 2000 );
          AddField('지원동기3'            ,  ftString , 2000 );
          AddField('지원기타사항'         ,  ftString , 2000 );
          AddField('지원기타사항2'        ,  ftString , 2000 );
          AddField('지원기타사항3'        ,  ftString , 2000 );
          AddField('지원부서결재여부'     ,  ftString ,  1   );
          AddField('지원부서결재여부2'    ,  ftString ,  1   );
          AddField('지원부서결재여부3'    ,  ftString ,  1   );
          AddField('AFTCONEMPNO1'         ,  ftString ,  4   );
          AddField('AFTCONEMPNO2'         ,  ftString ,  4   );
          AddField('AFTCONEMPNO3'         ,  ftString ,  4   );
          AddField('AFTCONKORNAME1'       ,  ftString ,  12  );
          AddField('AFTCONKORNAME2'       ,  ftString ,  12  );
          AddField('AFTCONKORNAME3'       ,  ftString ,  12  );
          AddField('AFTCONDATE1'          ,  ftString ,  8   );
          AddField('AFTCONDATE2'          ,  ftString ,  8   );
          AddField('AFTCONDATE3'          ,  ftString ,  8   );
          AddField('STATE'                ,  ftString ,  1   );
          AddField('STATE2'               ,  ftString ,  1   );
          AddField('STATE3'               ,  ftString ,  1   );
          AddField('처리상태'             ,  ftString ,  20  );  //38
          AddField('처리상태2'            ,  ftString ,  20  );
          AddField('처리상태3'            ,  ftString ,  20  );
          AddField('처리상태일'           ,  ftString ,  8   );
          AddField('처리상태일2'          ,  ftString ,  8   );
          AddField('처리상태일3'          ,  ftString ,  8   );

          Sql.Clear;
          Sql.Text := Tem;
      //    edit1.Text := Sql.Text;
          ServiceName := 'PIT2030A_SEL3';
          open;

          for i := 0 to FieldCount - 1 do
          begin
             Field := Fields[i];
             Field.Alignment := taCenter;
             case Field.Index of
              0 : begin
                     Field.DisplayWidth := 10;    //사원    0
                     Field.Alignment := taCenter;
                  end;
              2 : begin
                     Field.DisplayWidth := 12;    //성명    2
                     Field.Alignment := taCenter;
                  end;
              5 : begin
                     Field.DisplayWidth := 30;               //부서명
                     Field.Alignment := taLeftJustify;
                  end;
              7 : begin
                     Field.DisplayWidth := 20;    //직급명
                     Field.Alignment := taCenter;
                  end;
              9 : begin
                     Field.DisplayWidth := 20;    //직위명
                     Field.Alignment := taCenter;
                  end;

             10: begin
                     Field.DisplayWidth := 20;               //지원일
                     Field.EditMask := '9999/99/99;0;_' ;    //
                  end;
//             14: begin
//                     Field.DisplayWidth := 30;               //부서명
//                     Field.Alignment := taLeftJustify;
//                  end;

             38: begin
                     Field.DisplayWidth := 10;    //처리상태
                     Field.Alignment := taCenter;
                  end;
             else
                Field.Visible := False;      // orgnum

             end;
          end;
       end;
   end else
    if PageControl1.ActivePage = tab_2 then
    begin
       Tem := '  SELECT                                                                                   '+
              '    NVL(a.empno,         '' '') empno,                                                     '+
              '    NVL(a.monum,         '' '') monum,                                                     '+
              '    NVL(a.korname,       '' '') korname,                                                   '+
              '    NVL(a.orgnum,        '' '') orgnum,                                                    '+
              '    NVL(a.deptcode,      '' '') deptcode,                                                  '+
              '    (select deptname from pycdept where deptcode = a.deptcode)  deptname,                  '+
              '    NVL(a.paycl,         '' '') paycl,                                                     '+
              '    (select codename from pyccode where codeid = ''I112'' and codeno = a.paycl) payclname, '+
              '    NVL(a.payra,         '' '') payra,                                                     '+
              '    (select codename from pyccode where codeid = ''I113'' and codeno = a.payra) payraname, '+
              '    a.appdate           ,                                                                  '+
              '    a.aftdeptcode1      ,                                                                  '+
              '    a.aftdeptcode2      ,                                                                  '+
              '    a.aftdeptcode3      ,                                                                  '+
              '    (select deptname from pycdept where deptcode = a.aftdeptcode1)  aftdeptname1,          '+
              '    (select deptname from pycdept where deptcode = a.aftdeptcode2)  aftdeptname2,          '+
              '    (select deptname from pycdept where deptcode = a.aftdeptcode3)  aftdeptname3,          '+
              '    NVL(a.motive1,       '' '') motive1,                                                   '+
              '    NVL(a.motive2,       '' '') motive2,                                                   '+
              '    NVL(a.motive3,       '' '') motive3,                                                   '+
              '    NVL(a.etcdesc1,      '' '') etcdesc1,                                                  '+
              '    NVL(a.etcdesc2,      '' '') etcdesc2,                                                  '+
              '    NVL(a.etcdesc3,      '' '') etcdesc3,                                                  '+
              '    NVL(a.aftconyn1,     '' '') aftconyn1,                                                 '+
              '    NVL(a.aftconyn2,     '' '') aftconyn2,                                                 '+
              '    NVL(a.aftconyn3,     '' '') aftconyn3,                                                 '+
              '    NVL(a.aftconempno1,  '' '') aftconempno1,                                              '+
              '    NVL(a.aftconempno2,  '' '') aftconempno2,                                              '+
              '    NVL(a.aftconempno3,  '' '') aftconempno3,                                              '+
              '    NVL(a.aftconkorname1, '' '') aftconkorname1,                                           '+
              '    NVL(a.aftconkorname2, '' '') aftconkorname2,                                           '+
              '    NVL(a.aftconkorname3, '' '') aftconkorname3,                                           '+
              '    NVL(a.aftcondate1,    '' '') aftcondate1,                                              '+
              '    NVL(a.aftcondate2,    '' '') aftcondate2,                                              '+
              '    NVL(a.aftcondate3,    '' '') aftcondate3,                                              '+
              '    NVL(a.state1,         '' '') state1,                                                   '+
              '    NVL(a.state2,         '' '') state2,                                                   '+
              '    NVL(a.state3,         '' '') state3,                                                   '+
              '    DECODE(a.state1,''1'',''대기중'',                                                      '+
              '                    ''2'',''검토중'',                                                      '+
              '                    ''3'',''처리완료'','' '') statename1,                                  '+
              '    DECODE(a.state2,''1'',''대기중'',                                                      '+
              '                    ''2'',''검토중'',                                                      '+
              '                    ''3'',''처리완료'','' '') statename2,                                  '+
              '    DECODE(a.state3,''1'',''대기중'',                                                      '+
              '                    ''2'',''검토중'',                                                      '+
              '                    ''3'',''처리완료'','' '') statename3,                                  '+
              '    NVL(a.statedate1,       '' '') statedate1,                                             '+
              '    NVL(a.statedate2,       '' '') statedate2,                                             '+
              '    NVL(a.statedate3,       '' '') statedate3                                              '+
              'FROM  pischnmas a                                                                          '+
      Format( 'WHERE a.orgnum = ''%s'' AND a.aftdeptcode2 = ''%s''                                        '+
              '  and a.monum  = ''%s''                                                                    '+
              '  and a.state2 in (''1'',''2'',''3'')                                                      '+
              '  and a.state1 = ''3'' and aftconyn1 = ''N''                                               ',
              [ FOrgnum, FDeptcode, MainForm.gsMonum ]);

       With MainForm.TDS_F2 do
       begin
          Close;
          ClearFieldInfo;
          AddField('사번'                 ,  ftString ,  4   );   //0
          AddField('공모차수'             ,  ftString ,  3   );
          AddField('성명'                 ,  ftString ,  12  );   //2
          AddField('조직차수'             ,  ftString ,  3   );
          AddField('부서코드'             ,  ftString ,  6   );
          AddField('부서명'               ,  ftString ,  60  );
          AddField('직급'                 ,  ftString ,  2   );
          AddField('직급명'               ,  ftString ,  20  );   //7
          AddField('직위'                 ,  ftString ,  3   );
          AddField('직위명'               ,  ftString ,  20  );   //9
          AddField('지원일'               ,  ftString ,  8  );    //10
          AddField('지원부서코드1'        ,  ftString ,  6   );
          AddField('지원부서코드'         ,  ftString ,  6   );
          AddField('지원부서코드3'        ,  ftString ,  6   );
          AddField('지원부서명1'          ,  ftString ,  60  );
          AddField('지원부서명'           ,  ftString ,  60  );   //15
          AddField('지원부서명3'          ,  ftString ,  60  );
          AddField('지원동기1'            ,  ftString , 2000 );
          AddField('지원동기'             ,  ftString , 2000 );
          AddField('지원동기3'            ,  ftString , 2000 );
          AddField('지원기타사항1'        ,  ftString , 2000 );
          AddField('지원기타사항'         ,  ftString , 2000 );
          AddField('지원기타사항3'        ,  ftString , 2000 );
          AddField('지원부서결재여부1'    ,  ftString ,  1   );
          AddField('지원부서결재여부'     ,  ftString ,  1   );
          AddField('지원부서결재여부3'    ,  ftString ,  1   );
          AddField('AFTCONEMPNO1'         ,  ftString ,  4   );
          AddField('AFTCONEMPNO2'         ,  ftString ,  4   );
          AddField('AFTCONEMPNO3'         ,  ftString ,  4   );
          AddField('AFTCONKORNAME1'       ,  ftString ,  12  );
          AddField('AFTCONKORNAME2'       ,  ftString ,  12  );
          AddField('AFTCONKORNAME3'       ,  ftString ,  12  );
          AddField('AFTCONDATE1'          ,  ftString ,  8   );
          AddField('AFTCONDATE2'          ,  ftString ,  8   );
          AddField('AFTCONDATE3'          ,  ftString ,  8   );
          AddField('STATE1'               ,  ftString ,  1   );
          AddField('STATE'                ,  ftString ,  1   );
          AddField('STATE3'               ,  ftString ,  1   );
          AddField('처리상태1'            ,  ftString ,  20  );
          AddField('처리상태'             ,  ftString ,  20  );  //39
          AddField('처리상태3'            ,  ftString ,  20  );
          AddField('처리상태일1'          ,  ftString ,  8   );
          AddField('처리상태일'           ,  ftString ,  8   );
          AddField('처리상태일3'          ,  ftString ,  8   );

          Sql.Clear;
          Sql.Text := Tem;
      //    edit1.Text := Sql.Text;
          ServiceName := 'PIT2030A_SEL3';
          open;

          for i := 0 to FieldCount - 1 do
          begin
             Field := Fields[i];
             Field.Alignment := taCenter;
             case Field.Index of
              0 : begin
                     Field.DisplayWidth := 10;    //사원    0
                     Field.Alignment := taCenter;
                  end;
              2 : begin
                     Field.DisplayWidth := 12;    //성명    2
                     Field.Alignment := taCenter;
                  end;
              5 : begin
                     Field.DisplayWidth := 30;               //부서명
                     Field.Alignment := taLeftJustify;
                  end;

              7 : begin
                     Field.DisplayWidth := 20;    //직급명
                     Field.Alignment := taCenter;
                  end;
              9 : begin
                     Field.DisplayWidth := 20;    //직위명
                     Field.Alignment := taCenter;
                  end;

             10: begin
                     Field.DisplayWidth := 20;               //지원일
                     Field.EditMask := '9999/99/99;0;_' ;    //
                  end;
//             15: begin
//                     Field.DisplayWidth := 30;               //부서명
//                     Field.Alignment := taLeftJustify;
//                  end;
             39: begin
                     Field.DisplayWidth := 10;    //처리상태
                     Field.Alignment := taCenter;
                  end;
             else
                Field.Visible := False;      // orgnum

             end;
          end;
       end;
   end else
    if PageControl1.ActivePage = tab_3 then
    begin
      Tem := '  SELECT                                                                                   '+
              '    NVL(a.empno,         '' '') empno,                                                     '+
              '    NVL(a.monum,         '' '') monum,                                                     '+
              '    NVL(a.korname,       '' '') korname,                                                   '+
              '    NVL(a.orgnum,        '' '') orgnum,                                                    '+
              '    NVL(a.deptcode,      '' '') deptcode,                                                  '+
              '    (select deptname from pycdept where deptcode = a.deptcode)  deptname,                  '+
              '    NVL(a.paycl,         '' '') paycl,                                                     '+
              '    (select codename from pyccode where codeid = ''I112'' and codeno = a.paycl) payclname, '+
              '    NVL(a.payra,         '' '') payra,                                                     '+
              '    (select codename from pyccode where codeid = ''I113'' and codeno = a.payra) payraname, '+
              '    a.appdate           ,                                                                  '+
              '    a.aftdeptcode1      ,                                                                  '+
              '    a.aftdeptcode2      ,                                                                  '+
              '    a.aftdeptcode3      ,                                                                  '+
              '    (select deptname from pycdept where deptcode = a.aftdeptcode1)  aftdeptname1,          '+
              '    (select deptname from pycdept where deptcode = a.aftdeptcode2)  aftdeptname2,          '+
              '    (select deptname from pycdept where deptcode = a.aftdeptcode3)  aftdeptname3,          '+
              '    NVL(a.motive1,       '' '') motive1,                                                   '+
              '    NVL(a.motive2,       '' '') motive2,                                                   '+
              '    NVL(a.motive3,       '' '') motive3,                                                   '+
              '    NVL(a.etcdesc1,      '' '') etcdesc1,                                                  '+
              '    NVL(a.etcdesc2,      '' '') etcdesc2,                                                  '+
              '    NVL(a.etcdesc3,      '' '') etcdesc3,                                                  '+
              '    NVL(a.aftconyn1,     '' '') aftconyn1,                                                 '+
              '    NVL(a.aftconyn2,     '' '') aftconyn2,                                                 '+
              '    NVL(a.aftconyn3,     '' '') aftconyn3,                                                 '+
              '    NVL(a.aftconempno1,  '' '') aftconempno1,                                              '+
              '    NVL(a.aftconempno2,  '' '') aftconempno2,                                              '+
              '    NVL(a.aftconempno3,  '' '') aftconempno3,                                              '+
              '    NVL(a.aftconkorname1, '' '') aftconkorname1,                                           '+
              '    NVL(a.aftconkorname2, '' '') aftconkorname2,                                           '+
              '    NVL(a.aftconkorname3, '' '') aftconkorname3,                                           '+
              '    NVL(a.aftcondate1,    '' '') aftcondate1,                                              '+
              '    NVL(a.aftcondate2,    '' '') aftcondate2,                                              '+
              '    NVL(a.aftcondate3,    '' '') aftcondate3,                                              '+
              '    NVL(a.state1,         '' '') state1,                                                   '+
              '    NVL(a.state2,         '' '') state2,                                                   '+
              '    NVL(a.state3,         '' '') state3,                                                   '+
              '    DECODE(a.state1,''1'',''대기중'',                                                      '+
              '                    ''2'',''검토중'',                                                      '+
              '                    ''3'',''처리완료'','' '') statename1,                                  '+
              '    DECODE(a.state2,''1'',''대기중'',                                                      '+
              '                    ''2'',''검토중'',                                                      '+
              '                    ''3'',''처리완료'','' '') statename2,                                  '+
              '    DECODE(a.state3,''1'',''대기중'',                                                      '+
              '                    ''2'',''검토중'',                                                      '+
              '                    ''3'',''처리완료'','' '') statename3,                                  '+
              '    NVL(a.statedate1,       '' '') statedate1,                                             '+
              '    NVL(a.statedate2,       '' '') statedate2,                                             '+
              '    NVL(a.statedate3,       '' '') statedate3                                              '+
              'FROM  pischnmas a                                                                          '+
      Format( 'WHERE a.orgnum = ''%s'' AND a.aftdeptcode3 = ''%s''                                        '+
              '  and a.monum  = ''%s''                                                                    '+
              '  and a.state3 in (''1'',''2'',''3'')                                                      '+
              '  and a.state1 = ''3'' and aftconyn1 = ''N''                                               '+
              '  and a.state2 = ''3'' and aftconyn2 = ''N''                                               ',
              [ FOrgnum, FDeptcode, MainForm.gsMonum ]);

       With MainForm.TDS_F3 do
       begin
          Close;
          ClearFieldInfo;
          AddField('사번'                 ,  ftString ,  4   );   //0
          AddField('공모차수'             ,  ftString ,  3   );
          AddField('성명'                 ,  ftString ,  12  );   //2
          AddField('조직차수'             ,  ftString ,  3   );
          AddField('부서코드'             ,  ftString ,  6   );
          AddField('부서명'               ,  ftString ,  60  );
          AddField('직급'                 ,  ftString ,  2   );
          AddField('직급명'               ,  ftString ,  20  );   //7
          AddField('직위'                 ,  ftString ,  3   );
          AddField('직위명'               ,  ftString ,  20  );   //9
          AddField('지원일'               ,  ftString ,  8  );    //10
          AddField('지원부서코드1'        ,  ftString ,  6   );
          AddField('지원부서코드2'        ,  ftString ,  6   );
          AddField('지원부서코드'         ,  ftString ,  6   );
          AddField('지원부서명1'          ,  ftString ,  60  );
          AddField('지원부서명2'          ,  ftString ,  60  );
          AddField('지원부서명'           ,  ftString ,  60  );   //16
          AddField('지원동기1'            ,  ftString , 2000 );
          AddField('지원동기2'            ,  ftString , 2000 );
          AddField('지원동기'             ,  ftString , 2000 );
          AddField('지원기타사항1'        ,  ftString , 2000 );
          AddField('지원기타사항2'        ,  ftString , 2000 );
          AddField('지원기타사항'         ,  ftString , 2000 );
          AddField('지원부서결재여부1'    ,  ftString ,  1   );
          AddField('지원부서결재여부2'    ,  ftString ,  1   );
          AddField('지원부서결재여부'     ,  ftString ,  1   );
          AddField('AFTCONEMPNO1'         ,  ftString ,  4   );
          AddField('AFTCONEMPNO2'         ,  ftString ,  4   );
          AddField('AFTCONEMPNO3'         ,  ftString ,  4   );
          AddField('AFTCONKORNAME1'       ,  ftString ,  12  );
          AddField('AFTCONKORNAME2'       ,  ftString ,  12  );
          AddField('AFTCONKORNAME3'       ,  ftString ,  12  );
          AddField('AFTCONDATE1'          ,  ftString ,  8   );
          AddField('AFTCONDATE2'          ,  ftString ,  8   );
          AddField('AFTCONDATE3'          ,  ftString ,  8   );
          AddField('STATE1'               ,  ftString ,  1   );
          AddField('STATE2'               ,  ftString ,  1   );
          AddField('STATE'                ,  ftString ,  1   );
          AddField('처리상태1'            ,  ftString ,  20  );
          AddField('처리상태2'            ,  ftString ,  20  );
          AddField('처리상태'             ,  ftString ,  20  ); //40
          AddField('처리상태일1'          ,  ftString ,  8   );
          AddField('처리상태일2'          ,  ftString ,  8   );
          AddField('처리상태일'           ,  ftString ,  8   );

          Sql.Clear;
          Sql.Text := Tem;
      //    edit1.Text := Sql.Text;
          ServiceName := 'PIT2030A_SEL3';
          open;

          for i := 0 to FieldCount - 1 do
          begin
             Field := Fields[i];
             Field.Alignment := taCenter;
             case Field.Index of
              0 : begin
                     Field.DisplayWidth := 10;    //사원    0
                     Field.Alignment := taCenter;
                  end;
              2 : begin
                     Field.DisplayWidth := 12;    //성명    2
                     Field.Alignment := taCenter;
                  end;
              5 : begin
                     Field.DisplayWidth := 30;               //부서명
                     Field.Alignment := taLeftJustify;
                  end;

              7 : begin
                     Field.DisplayWidth := 20;    //직급명
                     Field.Alignment := taCenter;
                  end;
              9 : begin
                     Field.DisplayWidth := 20;    //직위명
                     Field.Alignment := taCenter;
                  end;

             10: begin
                     Field.DisplayWidth := 20;               //지원일
                     Field.EditMask := '9999/99/99;0;_' ;    //
                  end;
//             16: begin
//                     Field.DisplayWidth := 30;               //부서명
//                     Field.Alignment := taLeftJustify;
//                  end;
            40: begin
                     Field.DisplayWidth := 10;    //처리상태
                     Field.Alignment := taCenter;
                  end;
             else
                Field.Visible := False;      // orgnum

             end;
          end;
       end;
   end ;
end;

procedure TFm_SubForm4.PageControl1Change(Sender: TObject);
begin
   fzDataDisplay( MainForm.porgnum, MainForm.pDeptcode);
end;

procedure TFm_SubForm4.bt_closeClick(Sender: TObject);
begin
   Close;
end;

end.
