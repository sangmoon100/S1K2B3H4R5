unit PZX1011A;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, StdCtrls, Buttons, Db, MemDS, DBAccess, Ora, Pass, Func, Menus, Comobj,
  ComCtrls, jpeg, ExtCtrls, OnFocusButton;

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    SB_Help: TStatusBar;
    Panel1: TPanel;
    Label2: TLabel;
    OraQuery1: TOraQuery;
    L_hint1: TLabel;
    L_hint2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    BT_Close: TOnFocusButton;
    BT_Excel1: TOnFocusButton;
    BT_Excel2: TOnFocusButton;
    procedure BT_Excel1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBExcel2Click(Sender: TObject);
    procedure BT_CloseClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExcelExtract(ExcelQry : TOraQuery; SheetName : String); //dsa2000 Add 2018.12.
  public
    { Public declarations }
    GSGroupId : String[4];     //GroupId
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormShow(Sender: TObject);
begin
  SB_Help.Panels[1].Text :=' �����λ�ý��ۿ� �������Դϴ�...';

  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;

  OraConnect;

  with OraQuery1 do
  begin
       close;
       Sql.Clear;
       Sql.Text := 'select Groupid from pymenuuser              '+
                   ' where empno = '''+ Passemp(cmdline,1) +''' ';
       open;
       GSGroupID := Fields[0].AsString;
  end;

  if  (GSGroupid = 'G042') then
  begin
       BT_Excel1.Enabled := False;
       L_hint1.Enabled   := False;
  end
  else if  (GSGroupid = 'G052') or (GSGroupid = 'G053') or (GSGroupid = 'G062') then
  begin
       BT_Excel2.Enabled := False;
       L_hint2.Enabled   := False;
  end;
  //dsa2000 2017.02.08. �λ�����2 �׷� �߰��ϸ鼭 ���� ���� ���� ��. : �׷��߰��ø��� �ҽ� ������ �����ϱ� ����.  
  {else if not (GSGroupid = 'G001') or (GSGroupid = 'G011') then
  begin
       Showmessage('���α׷� ���� ������ �����ϴ�. ���α׷��� �����մϴ�.');
       BT_CloseClick(Sender);
  end; }

  SB_Help.Panels[1].Text :=' ';
end;

//��������
procedure TMainForm.ExcelExtract(ExcelQry : TOraQuery; SheetName : String);
var XL, XArr: Variant;
    i,j,k, vFieldsCount, v26, Cap1,Cap2,Cap3,Cap4,Cap5,Cap6,Cap7,Cap8 : integer;
    SavePlace: TBookmark;
begin
  if ExcelQry.RecordCount = 0 then
  begin
       ShowMessage('������ ������ �������� �ʽ��ϴ�');
       Exit;
  end;

  vFieldsCount := ExcelQry.Fields.Count;

  XArr := VarArrayCreate([1, vFieldsCount], VarVariant); //Gird ��½�
  try
      XL := CreateOLEObject('Excel.Application');
  except
      MessageDlg('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�.', MtWarning, [mbok], 0);
      Exit;
  end;

  XL.WorkBooks.Add; //���ο� ������ ����
  XL.Visible := false;
  XL.WorkSheets[1].Name := SheetName; //AqueryExcel.Caption;  //��Ʈ�� �ο�
  //XL.Range['A1'].value := L_QueryName.ValueCaption; //TITLE NAME ����
  XL.Range['A1'].font.Size := 15;

  for i := 1 to vFieldsCount do
  begin
       if (Trim(ExcelQry.Fields[i-1].FullName) = '���') or
          (Trim(ExcelQry.Fields[i-1].FullName) = '�� ��') or
          (Trim(ExcelQry.Fields[i-1].FullName) = '�����ȣ') then Cap1 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = '�μ����') then Cap2 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = '���۽ð�') then Cap3 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = '�����Ͻ�') then Cap4 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = '�ֹι�ȣ') then Cap5 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = '�����ڵ�') then Cap6 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = '���¹�ȣ') then Cap7 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = 'BAND(181231)') then Cap8 := i;
       
       XArr[i] := ExcelQry.Fields[i-1].FullName;
  end;

  v26 := Trunc(vFieldsCount/26);

  if (v26 > 0) then XL.Range['A1', CHR(64+v26) + CHR(64 + vFieldsCount-(26 * v26))+'1'].Value := XArr
  else              XL.Range['A1',               CHR(64 + vFieldsCount           )+'1'].Value := XArr;

  j := 1; //showmessage('26 * v26 : '+inttostr((26 * v26)));
  for i := 1 to vFieldsCount do
  begin
       if i >= 27 then
       begin
            XL.Range[CHR(64+j) + CHR(64 + i-(26 * j)) + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(64+j) + CHR(64 + i-(26 * j)) + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(64+j) + CHR(64 + i-(26 * j)) + '1'].font.Size           := 11;
            XL.Range[CHR(64+j) + CHR(64 + i-(26 * j)) + '1'].font.Bold           := True;
            
            if (i-26*j) > 25 then j := j + 1; //if (i-26*j) >25 then showmessage(inttostr(i-26*j));
       end
       else
       begin                      //A  ~
            XL.Range[CHR(64 + i)                      + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(64 + i)                      + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(64 + i)                      + '1'].font.Size           := 11;
            XL.Range[CHR(64 + i)                      + '1'].font.Bold           := True;
       end;
  end;

  //�˻��� �ڷḦ excel�� exportó�� ��Ų��.
  SavePlace := ExcelQry.GetBookmark;
  ExcelQry.DisableControls;
  ExcelQry.First;

  k := 1;
  for i := 1 to ExcelQry.RecordCount do
  begin
       for j := 1 to vFieldsCount do
       begin
            if  (j = Cap1) or (j = Cap2) or (j = Cap3) or (j = Cap4) or (j = Cap5) or (j = Cap6) or (j = Cap7) or (j = Cap8) then
                 XArr[j] := ''''+ExcelQry.Fields[j-1].AsString //���ڷ� ������ �����Ϳ� ' ���� �־��ֱ� ����.
            else XArr[j] := ExcelQry.Fields[j-1].AsString;
       end;

       if (v26 > 0) then XL.Range['A' + IntToStr(k+1), CHR(64+v26) + CHR(64 + vFieldsCount-(26 * v26))+ IntToStr(k+1)].Value := XArr
       else              XL.Range['A' + IntToStr(k+1),               CHR(64 + vFieldsCount           )+ IntToStr(k+1)].Value := XArr;

       inc(k);
       ExcelQry.Next;
  end;

  if (v26 > 0) then //and (vFieldsCount >= (26 * v26 + 1)) then            //HA ~
  begin
       XL.Range['A1', CHR(64+v26) + CHR(64 + vFieldsCount-(26 * v26)) + IntToStr(k)].Borders.LineStyle := 1;
       XL.Range['A2', CHR(64+v26) + CHR(64 + vFieldsCount-(26 * v26)) + IntToStr(k)].font.Size := 9;
       XL.Range['A1', CHR(64+v26) + CHR(64 + vFieldsCount-(26 * v26)) + IntToStr(k)].Select;
  end
  else                                   //A  ~
  begin
       XL.Range['A1', CHR(64 + vFieldsCount) + IntToStr(k)].Borders.LineStyle := 1;     //�׵θ����� �����.  1�� �Ǽ�
       XL.Range['A2', CHR(64 + vFieldsCount) + IntToStr(k)].font.Size := 9;
       //XL.Range['A1', CHR(64 + vFieldsCount) + IntToStr(k)].font.name := '����ü';
       //XL.Range['A2', CHR(64 + vFieldsCount) + IntToStr(k)].HorizontalAlignment := 1; //��������
       XL.Range['A1', CHR(64 + vFieldsCount) + IntToStr(k)].Select;                     //�ڷḦ ��� SELECT�� �� --�ϴ� ����:  AutoFit ó���ϱ� ���ؼ���
  end;

  XL.Selection.Columns.AutoFit;                   //�ڵ�����
  XL.Range['A1', 'A1'].HorizontalAlignment := 3;  //��� ����
  XL.Range['A1', 'A1'].Select;                    //���� Ŀ�� ��ġ��Ŵ
  XL.Visible := true;                             //Excel �ڷ� ������
  Screen.Cursor := crDefault;

  ExcelQry.GotoBookmark(SavePlace);
  ExcelQry.FreeBookmark(SavePlace);
  ExcelQry.EnableControls;
end;



procedure TMainForm.BT_Excel1Click(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,Cap_empno: integer;
    SavePlace: TBookmark;
begin
  SB_Help.Panels[1].Text :=' ���� ��ȯ�� �ڷḦ �˻����Դϴ�.';

  with OraQuery1 do
  begin
       close; Sql.Clear;
       Sql.Add('Select A.Empno ���,  A.Korname ����,  A.Juminid �ֹι�ȣ, Pstateyn ��������, Func_Codename(''I114'',A.Pstate) �λ����,       ');
       Sql.Add('       A.Empdate �����Ի���,  A.Orgempdate SKB�Ի���,  Retcont �޴���, Skemail Sk�׷����,                                     ');
       Sql.Add('      (Select Deptname From Pycdept Where Orgnum=B.Orgnum And Deptcode=Rpad(B.Sectcode ,5,''0'')) �ι��� ,                     ');
       Sql.Add('       Rpad(B.Sectcode ,5,''0'') �ι��ڵ�,                                                                                     ');
       Sql.Add('      (Select Deptname From Pycdept Where Orgnum=B.Orgnum And Deptcode=Rpad(B.Fieldcode,5,''0'')) "��/���θ�",                 ');
       Sql.Add('       Rpad(B.Fieldcode,5,''0'') "��/�����ڵ�",  B.Deptname �μ���,  A.Deptcode �μ��ڵ�,                                      ');
       Sql.Add('      (Select Deptname From Pycdept Where Orgnum=A.Orgnum And Deptcode= A.Jobdept) �ٹ��μ���, A.Jobdept �ٹ��μ��ڵ�,         ');
       Sql.Add('       Func_Codename(''I113'',Payra)    ��å,      A.Payra    ��å�ڵ�,                                                        ');
       Sql.Add('       Func_Codename(''I113'',JobPayra) �ٹ���å,  A.JobPayra �ٹ���å�ڵ�,                                                    ');
       Sql.Add('       Func_Codename(''I160'',Jobplace) �ٹ���,    Func_Codename(''I115'',Jobgun) ����,                                        ');
       Sql.Add('       Func_Codename(''I112'',Paycl)    Band��,    A.Paycl Band�ڵ�,                     A.Paycldate Band������,               ');

       Sql.Add('      (Select Listagg(Info,'' �� '') Within Group(Order By Annono)                                                             ');   //2018.12.05. ����|�⹫|�İ�_������� �߰� dsa2000
       Sql.Add('        From (Select Empno, Annono, Ancode, Andetcode, Func_Deptname(Orgnum,Addeptcode)||''(''||Addeptcode||'')'' Info         ');
       Sql.Add('                From Pihanno M                                                                                                 ');
       Sql.Add('               Where Anupdyn= ''Y''                                                                                            ');
       Sql.Add('                 And Orgnum = Func_Orgnum                                                                                      ');
       Sql.Add('                 And Ancode In (''233'', ''234'')                                                                              ');
       Sql.Add('                 And Nvl(Antodate, ''99999999'') >= To_Char(Sysdate, ''YYYYMMDD'')                                             ');
       Sql.Add('                 And Not Exists(Select 1 From Pihanno B Where M.Empno  = B.Empno                                               ');
       Sql.Add('                                                          And B.Anupdyn= ''Y''                                                 ');
       Sql.Add('                                                          And M.Anfrdate < B.Anfrdate                                          ');
       Sql.Add('                                                          And B.Ancode = Decode(M.Ancode,''233'',''238'',''234'', ''235'','''')');
       Sql.Add('                                                          And B.Orgnum = Func_Orgnum                                           ');
       Sql.Add('                                                          And Nvl(M.Addeptcode,'' '')= Nvl(B.Addeptcode,'' '')                 ');
       Sql.Add('                                                          And Nvl(M.Adpayra,'' '')= Nvl(B.Adpayra,'' ''))    )                 ');
       Sql.Add('       Where Empno= A.Empno Group By Empno) "����|�⹫_�μ�",                                                                  ');
       Sql.Add('      (Select Listagg(Info,'' �� '') Within Group(Order By Annono)                                                             ');   //2018.12.05. ����|�⹫|�İ�_������� �߰� dsa2000
       Sql.Add('        From (Select Empno, Annono, Ancode, Andetcode, Func_Codename(''I113'',M.Adpayra)||''(''||Adpayra||'')'' Info           ');
       Sql.Add('                From Pihanno M                                                                                                 ');
       Sql.Add('               Where Anupdyn= ''Y''                                                                                            ');
       Sql.Add('                 And Orgnum = Func_Orgnum                                                                                      ');
       Sql.Add('                 And Ancode In (''233'', ''234'')                                                                              ');
       Sql.Add('                 And Nvl(Antodate, ''99999999'') >= To_Char(Sysdate, ''YYYYMMDD'')                                             ');
       Sql.Add('                 And Not Exists(Select 1 From Pihanno B Where M.Empno  = B.Empno                                               ');
       Sql.Add('                                                          And B.Anupdyn= ''Y''                                                 ');
       Sql.Add('                                                          And M.Anfrdate < B.Anfrdate                                          ');
       Sql.Add('                                                          And B.Ancode = Decode(M.Ancode,''233'',''238'',''234'', ''235'','''')');
       Sql.Add('                                                          And B.Orgnum = Func_Orgnum                                           ');
       Sql.Add('                                                          And Nvl(M.Addeptcode,'' '')= Nvl(B.Addeptcode,'' '')                 ');
       Sql.Add('                                                          And Nvl(M.Adpayra,'' '')= Nvl(B.Adpayra,'' ''))    )                 ');
       Sql.Add('       Where Empno= A.Empno Group By Empno) "����|�⹫_��å",                                                                  ');

       Sql.Add('      (Select Listagg(Info,'' �� '') Within Group(Order By Annono)                                                             ');   //2018.12.05. ����|�⹫|�İ�_������� �߰� dsa2000
       Sql.Add('        From (Select Empno, Annono, Ancode, Func_Deptname(Orgnum,Addeptcode)||''(''||Nvl(Addeptcode,''�׷��İ�'')||'')'' Info  ');
       Sql.Add('                From Pihanno M                                                                                                 ');
       Sql.Add('               Where Anupdyn= ''Y''                                                                                            ');
       Sql.Add('                 And Orgnum = Func_Orgnum                                                                                      ');
       Sql.Add('                 And Ancode In (''411'', ''412'')                                                                              ');
       Sql.Add('                 And Nvl(Antodate, ''99999999'') >= To_Char(Sysdate, ''YYYYMMDD'')                                             ');
       Sql.Add('                 And Not Exists(Select 1 From Pihanno B Where M.Empno  = B.Empno                                               ');
       Sql.Add('                                                          And B.Anupdyn= ''Y''                                                 ');
       Sql.Add('                                                          And M.Anfrdate < B.Anfrdate                                          ');
       Sql.Add('                                                          And B.Ancode = Decode(M.Ancode,''411'',''414'',''412'', ''414'','''')');
       Sql.Add('                                                          And B.Orgnum = Func_Orgnum                                           ');
       Sql.Add('                                                          And Nvl(M.Addeptcode,'' '')= Nvl(B.Addeptcode,'' '')                 ');
       Sql.Add('                                                          And Nvl(M.Adpayra,'' '')= Nvl(B.Adpayra,'' ''))    )                 ');
       Sql.Add('       Where Empno= A.Empno Group By Empno) "�İ�_�μ�",                                                                       ');

       Sql.Add('      (Select Listagg(Info,'' �� '') Within Group(Order By Annono)                                                             ');   //2018.12.05. ����|�⹫|�İ�_������� �߰� dsa2000
       Sql.Add('        From (Select Empno, Annono, Ancode, Func_Deptname(Orgnum,Addeptcode)||''(''||Nvl(Addeptcode,''�׷��İ�'')||'')'' Info  ');
       Sql.Add('                From Pihanno M                                                                                                 ');
       Sql.Add('               Where Anupdyn= ''Y''                                                                                            ');
       Sql.Add('                 And Orgnum = Func_Orgnum                                                                                      ');
       Sql.Add('                 And Ancode In (''411'', ''412'')                                                                              ');
       Sql.Add('                 And Nvl(Antodate, ''99999999'') >= To_Char(Sysdate, ''YYYYMMDD'')                                             ');
       Sql.Add('                 And Not Exists(Select 1 From Pihanno B Where M.Empno  = B.Empno                                               ');
       Sql.Add('                                                          And B.Anupdyn= ''Y''                                                 ');
       Sql.Add('                                                          And M.Anfrdate < B.Anfrdate                                          ');
       Sql.Add('                                                          And B.Ancode = Decode(M.Ancode,''411'',''414'',''412'', ''414'','''')');
       Sql.Add('                                                          And B.Orgnum = Func_Orgnum                                           ');
       Sql.Add('                                                          And Nvl(M.Addeptcode,'' '')= Nvl(B.Addeptcode,'' '')                 ');
       Sql.Add('                                                          And Nvl(M.Adpayra,'' '')= Nvl(B.Adpayra,'' ''))    )                 ');
       Sql.Add('       Where Empno= A.Empno Group By Empno) "�İ�_��å",                                                                       ');

       //2019.01.  2019��1�� ������ BANDü�躯������ 20181231������ BAND���� ���� ������� ���� dsa2000
       sql.Add('       His.Paycl181231                                                                    "BAND(181231)",                      ');
       sql.Add('      (Select CODENAME from PYCCODE where CODEID = ''I112'' And Codeno = His.Paycl181231) "BAND��(181231)",                    ');
       sql.Add('       His.Cpaycldate181231                                                               "BAND�°���(181231)",                ');
       sql.Add('       His.Paycldate181231                                                                "BAND������(181231)",                ');
       sql.Add('       His.PayclYMD181231                                                                 "��BAND�ٹ��Ⱓ(181231)"             ');
       Sql.Add('  from pimpmas a, pycdept b,                                                                                                   ');
       sql.Add('       (Select Empno,                                                                                                          ');
       sql.Add('               Paycl Paycl181231,                                                                                              ');
       sql.Add('               Cpaycldate Cpaycldate181231,                                                                                    ');
       sql.Add('               Paycldate  Paycldate181231,                                                                                     ');
       sql.Add('               Payclyy||''��''||Payclmm||''��''||Paycldd||''��'' PayclYMD181231                                                ');
       sql.Add('         From Pimpmas_Hint M                                                                                                   ');
       sql.Add('        Where Workdate=''20181231'' ) His                                                                                      ');
       Sql.Add(' where A.pstate < ''80''                                                                                                       ');
       Sql.Add('   and A.ORGNUM = B.ORGNUM   And A.deptcode = b.deptcode                                                                       ');
       sql.Add('   and a.Empno = His.Empno(+)                                                                                                  '); //~2019.01.  2019�� ������ BANDü�躯������
       {Sql.Add('  from pimpmas a, pycdept b                                                                                                   ');
       Sql.Add(' where A.pstate < ''80''                                                                                                       ');
       Sql.Add('   and A.ORGNUM = B.ORGNUM   And A.deptcode = b.deptcode                                                                       '); }
       
       //�λ���� �� HR������ ������ ��Ÿ �η¿� ���� �ӿ� ���� �˻� ���� 2014.02.03 ������M��û
       //if  not ((GSGroupid = 'G001') or (GSGroupid ='G002') or (GSGroupid = 'G011') or (GSGroupid = 'G062')) then
       if  not ((GSGroupid = 'G001') or (GSGroupid ='G002') or (GSGroupid = 'G011') or (GSGroupid = 'G012') or (GSGroupid = 'G062')) then //DSA2000 2017.02.08 �λ�����2 �׷� �߰�
       Sql.Add('   and A.empno not like ''M%''                 ');

       Sql.Add(' order by A.Deptcode, A.payra, A.paycl, A.empno');  //edit1.text := sql.text;       
       open;
  end;

  if OraQuery1.RecordCount < 1 then
  begin
       SB_Help.Panels[1].Text :='';
       showmessage('���� ��ȯ�� �ڷᰡ �����ϴ�.');
       exit;
  end;

   ExcelExtract(OraQuery1,BT_Excel1.Caption); //2018.12. Add

   SB_Help.Panels[1].Text := '����Ϸ�';
end;

procedure TMainForm.BBExcel2Click(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,Cap_empno: integer;
    SavePlace: TBookmark;
begin
  SB_Help.Panels[1].Text :=' ���� ��ȯ�� �ڷḦ �˻����Դϴ�.';

  with OraQuery1 do
  begin
       close;
       Sql.Clear;
       Sql.Add('Select A.empno ���,  A.korname ����,  substr(A.juminid,1,7)||''*******'' �ֹι�ȣ,                                 ');
       Sql.Add('      (Select codename from pyccode where codeid = ''I114'' and codeno  = A.pstate  ) �λ����, pstateyn   ��������,');
       Sql.Add('      (Select deptname from pycdept where orgnum = A.orgnum and deptcode= A.deptcode) �μ���  , A.deptcode �μ��ڵ�,');
       Sql.Add('      (Select codename from pyccode where codeid = ''I113'' and codeno  = A.payra   ) ��å    , A.payra    ��å�ڵ�,');
       Sql.Add('       A.Empdate �����Ի���, A.orgempdate �Ի���,                                                                   ');
       Sql.Add('      (Select codename from pyccode where codeid = ''I160'' and codeno  = A.jobplace) �ٹ���,	  	            ');
       Sql.Add('      (Select codename from pyccode where codeid = ''I115'' and codeno  = A.jobgun  ) ����,                         ');
       //2017.01.05 jissi SR-1701-0225 HR��� ����� P762 �ӿ��� ���� �����/���¹�ȣ ��ȸ�ǵ��� ����
       //Sql.Add('      (Select codename from pyccode where codeid = ''K910'' and codeno  = b.PAYBANK ) ����,     b.PAYBANK  �����ڵ�,');
       //Sql.Add('       b.PAYACNT "�� �� �� ȣ", retcont �޴���                                                                      ');
       Sql.Add('       decode(substr(A.empno,1,1),''M''                                                                             ');
       Sql.Add('                                 ,(Select codename from pyccode where codeid = ''K910''                             ');
       Sql.Add('                                      and codeno  = (Select PAYBANK from pkzmpmas where empno=A.empno))             ');
       Sql.Add('                                 ,(Select codename from pyccode where codeid = ''K910'' and codeno=b.PAYBANK)) ����,');
       Sql.Add('       decode(substr(A.empno,1,1),''M''                                                                             ');
       Sql.Add('                                 ,(Select PAYBANK  from pkzmpmas where empno = A.empno)                             ');
       Sql.Add('                                 ,b.PAYBANK)  �����ڵ�,                                                             ');
       Sql.Add('       decode(substr(A.empno,1,1),''M''                                                                             ');
       Sql.Add('                                 ,(Select payacnt  from pkzmpmas where empno = A.empno)                             ');
       Sql.Add('                                 ,b.PAYACNT) "���¹�ȣ",retcont �޴���,A.offitel ������ȣ                           ');
       Sql.Add('  from pimpmas a, pkmpmas b                                                                                         ');
       Sql.Add(' where A.pstate < ''80''                                                                                            ');
       Sql.Add('   and A.empno  = b.empno(+)                                                                                        ');
       
       //�λ���� �� HR������ ������ ��Ÿ �η¿� ���� �ӿ� ���� �˻� ���� 2014.02.03 ������M��û
       //if  not ((GSGroupid = 'G001') or (GSGroupid ='G002') or (GSGroupid = 'G011') or (GSGroupid = 'G062')) then
       if  not ((GSGroupid = 'G001') or (GSGroupid ='G002') or (GSGroupid = 'G011') or (GSGroupid = 'G012') or (GSGroupid = 'G062')) then //DSA2000 2017.02.08 �λ�����2 �׷� �߰�
       Sql.Add('   and A.empno not like ''M%''                                                                                      ');
       Sql.Add(' order by A.payra, A.paycl, A.empno                                                                                 ');
       open;
  end;
  if OraQuery1.RecordCount < 1 then
  begin
       SB_Help.Panels[1].Text :='';
       showmessage('���� ��ȯ�� �ڷᰡ �����ϴ�.');
       exit;
  end;

  ExcelExtract(OraQuery1,BT_Excel2.Caption); //2018.12. Add

  SB_Help.Panels[1].Text := '';
end;

procedure TMainForm.BT_CloseClick(Sender: TObject);
begin
  Close;
end;


end.
