{ header
 ----------------------------------------------------------------------------
  PROGRAM-NAME    : pib4190C(������ ���)
  SYSTEM-NAME     : �����λ�����
  SUBSYSTEM-NAME  : �λ�
  Programmer      : kcj
  Version         : 1.01
  Date            : 1998.12.23
  Update Contents
    1.00    1998.11.1   ��â��                     �ű����α׷� ����   ó������
    1.01    1998.12.23  ������                     ������������ ����.
    1.02    2001.10.12  ������  �̼��� ��û      korage -> usaage �� ����
    1.03    2002.01.15  ������  �̼��� ��û      ����� �߰�.
    1.04    2002.05.07  ������  �̼��� ��û      �������� �߰�, ��ü��� ����
                                                   ����� ����, �μ�level �� ��� ��� ����
   30.06    2003.08.11  ���Կ�   �̼��� ��û       �����ϰ�쵵 deptna3 ������
   30.07    2003.08.18  ���Կ�   �ſ��� ��û       �����ڽ��� üũ�ڽ� ��ü(�������ð����ϰ� ����)
   30.07    2003.09.06  ���Կ�   ��ȿ���븮 ����   ��ü���� ���� ����(�ӵ��� �������ϱ� ����)
 ---------------------------------------------------------------------------}
unit pib41901;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Gauges, ExtCtrls, pass, datelib, timeftp, quickrpt, Db,
  Dept2Lib, Func, Comobj, jpeg ;

//  ������ ��¹� ���ڵ� ����1.
type PrnData1 = record
//   gubun      : string[1];
   no         : string[3];
   empno      : string[4];
   deptna1    : string[16];   //2001.01.10 shm 2�ڸ� ����.
   deptna2    : string[30];
   deptna3    : string[30];   //2002.01.15 shm insert
   korname    : string[8];
   age        : string[6];
   paycl      : string[10];
   payra      : string[10]; //2004.08.18 ���Կ� ���� �߰�
   pacldate   : string[8];
   orgempdate : string[8];
   lsch       : string[8];
   schcode    : array[0..2] of string[4];
   majcode    : array[0..2] of string[4];
   school     : array[0..2] of string[20];
   major      : array[0..2] of string[12];
   gray       : array[0..2] of string[6];
   doub       : string[6];  // ����
   deptlevel  : string[2];  //deptlevel �߰� shm
end;

type
  TMainForm = class(TForm)
    Panel19: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel11: TPanel;
    Panel2: TPanel;
    Label11: TLabel;
    Panel8: TPanel;
    Panel1: TPanel;
    Panel9: TPanel;
    Panel3: TPanel;
    Gr: TGauge;
    Panel10: TPanel;
    Panel5: TPanel;
    Bexit: TBitBtn;
    Bscreen: TBitBtn;
    Bprint: TBitBtn;
    hp: TPanel;
    helpDsr: TLabel;
    helpLabel: TLabel;
    Panel16: TPanel;
    deptcodefr: TEdit;
    deptcodeto: TEdit;
    Label3: TLabel;
    Panel4: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    cb_A1: TCheckBox;
    cb_A2: TCheckBox;
    cb_A3: TCheckBox;
    cb_A4: TCheckBox;
    Bexcel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BexitClick(Sender: TObject);
    procedure BscreenClick(Sender: TObject);
    procedure deptcodeDblClick(Sender: TObject);
    procedure deptcodefrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BexcelClick(Sender: TObject);
  private
    { Private declarations }
    P_empno,pkorname,password,pclass : string;
    start    : Boolean;
    oldfieldcode, deg :string ;
    procedure Assign_PrnData1(lank : integer);
    procedure Assign_Null(lank : integer);
//    procedure Assign_dept;
    function  Control_Process_Rtn : integer;
//    procedure Recordclear;  //2002.05.09 shm �߰�

  public
    { Public declarations }
    Rpt          : TQuickRep;
    tcount       : integer;
    workgubun    : integer;
    CurDate      : String;
    GsysDate     : String;
    payrachdate  : String;
    function IsBefCheckedCBox(cb_Tag : integer): Boolean;
  end;

var
  MainForm: TMainForm;
  HomeDir : string;
  HFile   : string;
  PrnD    : PrnData1;
  PrnF    : file of PrnData1;
  Boldline   : Boolean;  
//const
 // CodeFile: string = 'pib4190c.cod';
//  CodeId  : array[1..5] of string = ('I221','I225','I223','I112','I113');

implementation

uses pib41902,pib41904,pib41903;
{$R *.DFM}

// ���� ���õ� ���׵�...........................................................
procedure TMainForm.FormCreate(Sender: TObject);
begin
  start   := True;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  HomeDir  := HomeDirOpen;
  p_empno  := PassEmp(cmdline,1);
  pkorname := PassEmp(cmdline,2);
  password := PassEmp(cmdline,3);
  Pclass   := PassEmp(cmdline,4);
  Helpdsr.Caption := '';
  cb_A1.Checked := False;
  cb_A2.Checked := False;
  cb_A3.Checked := False;
  cb_A4.Checked := False;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  if start = True then begin
     start := False;
     OraConnect;
     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);
     {
     cdata.DataBase1.Params[0]  := 'SERVER NAME='+PassEmp(cmdline,13);
     CData.DataBase1.Params[1]  := 'USER NAME='+PassEmp(cmdline,5);
     CData.DataBase1.Params[19] := 'PASSWORD=' +PassEmp(cmdline,6);
     Application.Processmessages;
     Try
         CData.Database1.Connected := True;
     EXCEPT ON E : EDataBaseError DO begin
         MessageBox(handle,Pchar(E.Message),'��  ��',MB_OK or $0010);
         halt(0);
       end;
     END; }
     CurDate     := fn_GetDateStr;//TimeDate(Cdata.Ora_Qvari);
     Gsysdate    := copy(CurDate,1,4)+
                    copy(CurDate,6,2)+
                    copy(CurDate,9,2);
     payrachdate := CData.payrachdateSelect('00','0001');
     //L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
     //                      copy(CurDate,5,2)+'/'+
     //                      copy(CurDate,7,2);
     L_CurDate.Caption := fn_GetDateStr;
     //if PassDialog(MainForm,p_empno,pkorname,password) = False then halt(0);
     L_UserName.Caption := pkorname+'('+p_empno+')';

     //����� ����...
//     HelpDsr.Caption := '�ڵ�ȭ���� �޴����Դϴ� !!.(��ø� ��ٸ�����.)';
//     SendMessage(hp.handle,WM_PAINT,0,0);
//     MakeCodeFile(CData.Qvari,codeFile,codeid);

//     HelpDsr.Caption := '';
//     HFile := 'Pib4190c.tmp';
  end;
//  RadioButton1Click(Radiobutton2);         2002.05.08 shm 
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//   if FileExists(HomeDir+'\list\'+HFile) = True then begin
//      DeleteFile(PChar(HomeDir+'\list\'+HFile));
//   end;
//   if FileExists(HomeDir+'\list\pib4190c.cod') = True then begin
//      DeleteFile(PChar(HomeDir+'\list\pib4190c.cod'));
//   end;
end;

procedure TMainForm.BexitClick(Sender: TObject);
begin
     close;
end;

//  ȭ��/������� ����Ÿ�� �����ش�.............................................
procedure TMainForm.BscreenClick(Sender: TObject);
begin
  HelpDsr.Caption := '�ش� ����Ÿ�� �������Դϴ�.';
  SendMessage(Hp.handle,WM_PAINT,0,0);
  if (not cb_A1.checked) and (not cb_A2.checked) and (not cb_A3.checked) and (not cb_A4.checked) then
  begin
     MessageBox(0,'�۾������� �����Ͻʽÿ�!!.','��  ��',MB_OK or $0030);
     system.exit;
  end;
//  if Control_Process_Rtn = 0 then begin   ///////////////////////////////
//     MessageBox(0,'�ش��ڷᰡ �����ϴ� !!.','��  ��',MB_OK or $0030);
//     system.exit;
//  end;
  // ȭ������ ����Ÿ�� ������..
//  Bscreen.Enabled := False;    2002.05.07 shm
//  BPrint.Enabled  := False;
  if TBitBtn(Sender).Name = 'Bscreen' then begin
      Rpt := PrnForm1;
      Rpt.Preview;
  end;
  // �����ͷ� ����Ÿ�� ������.
  if TBitBtn(Sender).Name = 'Bprint' then begin
     Rpt := PrnForm1;
     Rpt.Print;
     Bscreen.Enabled := True;
     BPrint.Enabled  := True;
  end;
  Application.ProcessMessages;
  HelpDsr.Caption := '�۾��� �Ϸ�Ǿ����ϴ�..';
end;


{...............................................................................
 �۾�ó�� - RTN
...............................................................................}
{...............................................................................
  ������ ó�� - RTN
...............................................................................}
function TMainForm.Control_Process_Rtn : integer;
var
  i,lank,pcnt : integer;
begin
{  oldFieldCode := '';
  with CData.Qmain do begin
     close; sql.clear;
     sql.Add('select  aa.org, aa.dept, aa.field, cc.empno sabun, cc.adpayrayn, cc.deptlevel '+  //deptlevel �߰� shm
             'from  (select orgnum org, deptcode dept, fieldcode field '+
             '        from pycdept                                      '+
             '       where chanmode <> ''3'' ');
//    1999.1.19  �����  ������������ ����.
//if workgubun = 1 then  // ���� �̻� (�Ⱦ� 2002.05.07 shm)
//     sql.Add('       where deptlevel = ''B0'' ');   // ���� �̻� 2002.01.01 shm
//     sql.Add('       where deptlevel in (''A0'',''B0'',''C0'')  ');   // �Ǵ���  ---------
//if workgubun = 2 then  // ����
//     sql.Add('       where deptlevel = ''C0'' ');   // ����    2002.01.01 shm
//     sql.Add('       where deptlevel = ''D0'' ');     // ������

//if workgubun = 4 then                                 // ���    2002.01.14 shm
//     sql.Add('       where deptlevel = ''C0'' ');   // ����    2002.01.01 shm
//     sql.Add('       where deptlevel = ''E0'' ');
//if workgubun = 5 then                                 // ������  2002.01.14 shm
//     sql.Add('       where deptlevel = ''C0'' ');
//if workgubun = 6 then                                 // ������  2002.05.07 shm
//     sql.Add('       where deptlevel in (''C0'',''D0'',''E0'') '); //����+����+���

//if workgubun = 3 then  // ��ü
//     sql.Add('       where deptlevel in (''B0'',''C0'') ');  // �Ǵ��� + ����
//     sql.Add('       where deptlevel in (''A0'',''B0'',''C0'',''D0'',''E0'') ');  // �����̻� + ����
//     sql.Add('         and chanmode != ''3'' '+
            // by shm

// ���Կ� ����
       sql.Add('       and existon = ''1''                                        '+
               '       and orgnum = (select value1 from pimvari                   '+
               '                       where gubun = ''00'' and sgubun = ''0001'')'+
               '       and deptcode between '''+deptcodefr.Text+'''               '+
               '                          and '''+deptcodeto.Text+''') aa,        '+
               '     (select  empno, orgnum, deptcode                             '+
               '        from  pimpmas                                             '+
               '       where  pstate < ''60''  and payra in (');  // pstate '10' ���� '60'���� ����
       if cb_A1.Checked then
       begin
         sql.Add('''0A''');  // �ι�/����
       end;
       if cb_A2.Checked then
       begin
         if IsBefCheckedCBox(2) then
           sql.Add(',''16'',''18'',''19''')  // ��/����/��/��/������
         else
           sql.Add('''16'',''18'',''19''')  // ��/����/��/��/������
       end;
       if cb_A3.Checked then
       begin
         if IsBefCheckedCBox(3) then
           sql.Add(',''2C''')  // ����
         else
           sql.Add('''2C''')
       end;
       if cb_A4.Checked then
       begin
         if IsBefCheckedCBox(4) then
           sql.Add(',''4C''')  // ���
         else
           sql.Add('''4C''')
       end;
//  1.01    1998.12.23  ������  ������������ ����.
//          1999.1.19   �����  ������������ ����. (�Ǵ��忡 '0' �߰�)

//if workgubun = 1 then  // �Ǵ���
//     sql.Add('       where  substr(payra,1,1) in (''0'',''1'',''2'',''3'') ');
//if workgubun = 2 then  // ������
//     sql.Add('       where  substr(payra,1,1) in (''4'',''5'') ');
//if workgubun = 5 then  // ������   2002.05.07 SHM �߰�
//     sql.Add('       where  substr(payra,1,1) in (''2'',''4'') ');
//if workgubun = 6 then  // ������   2002.05.07 SHM �߰�
//     sql.Add('       where  substr(payra,1,1) in (''2'',''4'') ');
//if workgubun = 4 then  // ���
//     sql.Add('       where  substr(payra,1,2) in (''4C'') ');
//if workgubun = 3 then  // �Ǵ��� + ����
//     sql.Add('       where  substr(payra,1,1) in (''0'',''1'',''2'',''3'',''4'',''5'') ');

//          1999.1.19   �����  ������������ ����.
     sql.Add('         ) and  payrayn = ''Y'' ' + // ���ӿ��ΰ� 'Y'�� ���� �߰�
//             '         and  payra   <> ''4C'' '+       //2002.01.01 shm
             '         and  deptcode between '''+deptcodefr.Text+''' '+
             '                           and '''+deptcodeto.Text+''') bb, ');
     sql.Add('         (SELECT ORGNUM, DEPTCODE, EMPNO, ADPAYRAYN, deptlevel '); //deptlevel �߰� shm
     sql.Add('          FROM PIHORGA ');                       // ������
     sql.Add('          WHERE ORGNUM = (SELECT VALUE1 ');      // ���� ��������
     sql.Add('                          FROM PIMVARI ');
     sql.Add('                          WHERE GUBUN = ''00'' AND SGUBUN = ''0001'') ');
     sql.Add('          AND ORGYM =  (SELECT VALUE1 ');        // ������ �����������
     sql.Add('                        FROM PIMVARI ');
     sql.Add('                        WHERE GUBUN = ''B2'' AND SGUBUN = ''0000'') ');
     sql.Add('          AND GUBUN = ''0'' ');                  // ������ ���
     sql.Add('          AND PAYRAYN = ''Y'') CC ');            // ���ӿ���
     sql.Add('where aa.dept  = bb.deptcode '+
             '  and aa.org   = bb.orgnum '+
             '  and aa.dept  = cc.deptcode '+
             '  and aa.org   = cc.orgnum ');
      Open;
      tcount := RecordCount;
      Result := RecordCount;
      if RecordCount = 0 then begin
         close;  system.exit;
      end;
      System.AssignFile(PrnF,HomeDir+'\list\'+HFile);
      System.ReWrite(PrnF);
      pcnt := 1;  lank := 1;   first;
      while not Eof do begin
         if lank = recordcount then Gr.Progress := 100
         else Gr.Progress := (lank*100) div recordcount;
         SendMessage(Panel3.handle,WM_PAINT,0,0);

         Assign_dept;               // �μ��� assign
// kcj ����ó�� catv��������� ����
         Assign_Null(lank);    // file������ null assign , ����
         if not((FieldByName('sabun').AsString = '') and
               (CData.Qmain.FieldByName('dept').AsString <> 'KA100'))  then
              Assign_PrnData1(lank); // file������ assign

         System.Write(PrnF,PrnD);
         Next;
         inc(pcnt); inc(lank);
      end;
      close; system.close(PrnF); Gr.Progress := 0;
  end;  // with
end;

procedure TMainForm.Assign_dept;
begin
 with CData.Qmain do begin
   // �μ�
   PrnD.deptlevel       := FieldByName('deptlevel').AsString;
  //   PrnD.deptna1    := '';
   PrnD.deptna2    := CData.DeptnaDisp(FieldByName('org').AsString,
                                       FieldByName('dept').AsString);
// if (workgubun = 4) or (workgubun = 3) or (workgubun = 6) then      //2001.01.15 shm  1.03
   PrnD.deptna3    := CData.Deptna3Disp(FieldByName('org').AsString,  //2002.05.07 shm  1.04
                                       FieldByName('dept').AsString);

   if trim(oldFieldcode) <> trim(FieldByName('field').AsString) then
   begin
      PrnD.deptna1    := CData.DeptnaDisp(FieldByName('org').AsString,
                                            FieldByName('field').AsString);
      oldFieldcode    := FieldByName('field').AsString
   end
 end; }{with}
end;

// ������ ����Ÿ�� �ӽú����� �Ҵ��Ѵ�..........................................
procedure TMainForm.Assign_PrnData1(lank : integer);
var
   key : string;
begin
 // ������ ���
{ if CData.Qmain.FieldByName('adpayrayn').AsString = 'Y' then
      PrnD.doub := '�� ��'
 else
      PrnD.doub := '';
 key := Cdata.Qmain.FieldByName('sabun').AsString ;

// ������� fetch
 with CData.QRais do begin
     close; sql.clear;
     sql.add('select empno,korname, orgnum, deptcode, fieldcode, cpaycldate, orgempdate,'+
             '       paycl, payra, nvl(cpaycldate,cardate) paycleyear,lschdeg, '+
             '       lschcode,lmajorcode,lschgrym,lschnm, '+
             '       unicode,unimajor,unigrym,usaage '+  //korage->usaaage �� ���� shm 2001.10.12
             'from   pimpmas '+
             'where  empno = '''+key+'''');
     open;

   PrnD.no         := FormatFloat('###',lank);
   PrnD.empno      := FieldByName('empno').AsString;
   PrnD.korname    := FieldByName('korname').AsString;
//   PrnD.age        := '('+FieldByName('korage').AsString+'��)';
   PrnD.age        := '('+FieldByName('usaage').AsString+'��)';
   PrnD.paycl      := CodeDisp(CData.Qvari,'I112',FieldByName('paycl').AsString,codefile);
   PrnD.payra      := CodeDisp(CData.Qvari,'I113',FieldByName('payra').AsString,codefile);  //���Կ� ���� �߰�
   PrnD.orgempdate := Copy(FieldByName('orgempdate').AsString,3,2)+'.'+  //2002.01.14 shm �̼��� ��û.
                      Copy(FieldByName('orgempdate').AsString,5,2)+'.'+
                      Copy(FieldByName('orgempdate').AsString,7,2);

   PrnD.pacldate   := Copy(FieldByName('paycleyear').AsString,3,2)+'.'+
                      Copy(FieldByName('paycleyear').AsString,5,2)+'.'+
                      Copy(FieldByName('paycleyear').AsString,7,2);
   if Trim(PrnD.pacldate) = '..' then
      PrnD.pacldate := '';
   deg  := trim(FieldByName('lschdeg').Asstring);
   if CodeDisp(CData.Qvari,'I221',deg,codefile) = '��������' then
     PrnD.lsch       := '����'
   else
     PrnD.lsch       := CodeDisp(CData.Qvari,'I221',deg,codefile);
   // �б�
   if (trim(FieldByName('lschdeg').Asstring) <= '39') then  //�������� �̸�
   begin
       PrnD.school[0]    := FieldByName('lschnm').AsString;
       PrnD.major[0]     := '';
       PrnD.gray[0]      := copy(FieldByName('lschgrym').AsString,3,2)+'.'+
                            copy(FieldByName('lschgrym').AsString,5,2);
   end
   else                                                // �������� �̻��̸�
       select_pimscho(PrnD.empno,deg) ;
 end;} {with}
end;
// ������ ����Ÿ�� �ӽú����� �Ҵ��Ѵ�...����..................................
procedure TMainForm.Assign_Null(lank : integer);
var i : integer;
begin
  { PrnD.no         := FormatFloat('###',lank);
   PrnD.empno      := '';
   PrnD.korname    := '�� ��';
   PrnD.age        := '';
   PrnD.paycl      := '';
   PrnD.pacldate   := '';
   PrnD.orgempdate := '';
   PrnD.lsch       := '';
   PrnD.doub       := '';

   // �б�
   for i := 0 to 2 do begin
      PrnD.school[i]    := '';
      PrnD.major[i]     := '';
      PrnD.gray[i]      := '';
   end; }
end;

procedure TMainForm.deptcodeDblClick(Sender: TObject);
begin
     Fdept2lib := TFdept2lib.Create(Self);
     Try
       Fdept2lib.ShowModal;
       If Fdept2lib.GIcloseChk = 0 then  begin
          if TEdit(Sender).Tag = 1 then
             deptcodefr.Text := Fdept2lib.GSdeptcode
          else
             deptcodeto.Text := Fdept2lib.GSdeptcode
       end; // If
     Finally
       Fdept2lib.Free;
     end;
end;

procedure TMainForm.deptcodefrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F1 then deptcodeDblClick(Sender);
end;

function TMainForm.IsBefCheckedCBox(cb_Tag : integer):Boolean;
//���Կ� �߰� ���� �޺��ڽ��� üũ���� üũ
var
  i : integer;
  cbTemp : TComponent;
begin
  Result := False;
  for i := 1 to cb_Tag do
  begin
    cbTemp:=FindComponent('cb_A'+IntToStr(cb_Tag-i));
    if Assigned(cbTemp) and (cbTemp is TCheckBox) then
    begin
      if (cbTemp as TCheckBox).Checked then
      begin
        Result := True;
        Exit;
      end;
   end;
  end;
end;

procedure TMainForm.BexcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,l: integer;
    iRoopCnt :integer;
    SavePlace: TBookmark;
    title,subSQL : String;
    tmp_empdate, tmp_school, tmp_major, tmp_gray : String;
    Tempstream : TMemoryStream;
    iJPG       : TJPEGImage;
    iBMP       : TBitmap;
    Dir, BMPFileName: String;
begin
  if (not cb_A1.checked) and (not cb_A2.checked) and (not cb_A3.checked) and (not cb_A4.checked) then
  begin
     MessageBox(0,'�۾������� �����Ͻʽÿ�!!.','��  ��',MB_OK or $0030);
     system.exit;
  end;

  with CData.Ora_Excel do
  begin
    subSQL := 'payra in (';
    if Mainform.Gsysdate < Mainform.payrachdate then
    begin
        if cb_A1.Checked then
        begin
          subSQL := subSQL +'''12''';  // �ι���
        end;
        if cb_A2.Checked then
        begin
          if MainForm.IsBefCheckedCBox(2) then
            subSQL := subSQL +',''14'''  // ������
          else
            subSQL := subSQL +'''14''';  // ������
        end;
        if cb_A3.Checked then
        begin
          if IsBefCheckedCBox(3) then
            subSQL := subSQL + ',''16'',''19'''  // ��/������
          else
            subSQL := subSQL +'''16'',''19''';   // ��/������
        end;
        if cb_A4.Checked then
        begin
          if MainForm.IsBefCheckedCBox(4) then
           subSQL := subSQL + ',''2C'',''2C5'''  // ����,PL
          else
           subSQL := subSQL + '''2C'',''2C5''';  // ����,PL
        end;
    end
    else
    begin
        if cb_A1.Checked then
        begin
             subSQL := subSQL +'''A51'',''A61'',''A65''';  // �ι���, ����, Ʈ���̺���
        end;
        if cb_A2.Checked then
        begin
          if IsBefCheckedCBox(2) then
            subSQL := subSQL +',''A71'''  // ����
          else
            subSQL := subSQL +'''A71''';  // ����
        end;
        if cb_A3.Checked then
        begin
          if IsBefCheckedCBox(3) then
            subSQL := subSQL + ',''A81'',''A84'',''A91'''  // ������,�׷���,���
          else
            subSQL := subSQL +'''A81'',''A84'',''A91''';   // ������,�׷���,���
        end;
        if cb_A4.Checked then
        begin
          if IsBefCheckedCBox(4) then
           subSQL := subSQL + ',''C11'',''C51'',''C12'',''C20'''  // ����,PL,é����,��������
          else
           subSQL := subSQL + '''C11'',''C51'',''C12'') or (jobpayra =''C20'' ';  // ����,PL,é����,��������
        end;
    end;

    subSQL := subSQL + ')';
    if cb_A4.Checked then
      subSQL := '(' + subSQL + ')';
    subSQL := 'and ' +  subSQL;
    Close;
    SQL.Clear;
    SQL.Add('select COUNT(empno) Cnt from pimpmas  where pstate <''80'' ');
    SQL.Add(subSQL);
    Open;
    //orgRecCnt := FieldByName('cnt').AsInteger;
    Close;
    SQL.Clear;

    SQL.Add('select A.empno,A.korname,B.deptname,B.deptna3, C.photo,                '+
            '       (select codename from pyccode                                   '+
            '         where codeid=''I112''                                         '+
            '          and codeno =a.paycl)  payclnm,                               '+
            '       (select codename from pyccode                                   '+
            '         where codeid=''I113''                                         '+
            '          and codeno =a.payra) payranm,                                '+
            '       A.orgempdate,nvl(cpaycldate,cardate) paycldate,A.usaage         '+
            '  from pimpmas A, pycdept B, cimphot C                                 '+
            'where A.orgnum   = B.orgnum                                            '+
            '  and A.deptcode = B.deptcode                                          '+
            '  and A.empno    = C.empno                                             '+
            '  and A.pstate   < ''60''                                              ');
    SQL.Add(SubSQL);
    SQL.Add(' order by A.deptcode');

    Open;
  end;

  if CData.Ora_Excel.RecordCount < 1 then
  begin
    showmessage('���� ��ȯ�� �ڷᰡ �����ϴ�.');
    exit;
  end
  else
  begin

    helpDsr.Caption := 'Excel�� ��ġ�Ǿ� �ִ��� �˻��ϰ� �ֽ��ϴ�.';

    XArr := VarArrayCreate([1, 10], VarVariant);
    try
      XL := CreateOLEObject('Excel.Application');
    except
      MessageDlg('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�.', MtWarning, [mbok], 0);
      helpDsr.caption := '';
      Exit;
    end;

  end;

  helpDsr.caption := '�ڷḦ ��ȯ�ϰ� �ֽ��ϴ�.';
  XL.WorkBooks.Add; //���ο� ������ ����
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '��å�� ���';  //��Ʈ�� �ο�
  XL.WorkSheets[2].Delete;
  //XL.WorkSheets[3].Delete;
  XL.Range['A1:J2'].Merge;               //�� ����

  {if work1.checked then
    title := work1.Caption
  else if work2.checked then
    title := work2.Caption
  else if work3.checked then
    title := work3.Caption
  else if work4.checked then
    title := work4.Caption; }
  if cb_A1.Checked then
  begin
    title := title + '�ι���/����' ;
  end;
  if cb_A2.Checked then
  begin
     if IsBefCheckedCBox(2) then
       title := title + '/����'
     else
       title := title + '����';
  end;
  if cb_A3.Checked then
  begin
    if MainForm.IsBefCheckedCBox(3) then
      title := title + '/������/�׷���/���'
    else
      title := title + '������/�׷���/���'
  end;
  if cb_A4.Checked then
  begin
    if IsBefCheckedCBox(4) then
      title := title + '/����'
    else
      title := title + '����';
  end;

  //TITLE NAME ����
  XL.Range['A1'].value  := title + ' ���';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //�÷��� ����_����Ÿ�̺� ����
  XArr[ 1]  := 'No'     ;
  XArr[ 2]  := '�μ���' ;
  XArr[ 3]  := '����'   ;
  XArr[ 4]  := '��å'   ;
  XArr[ 5]  := '�Ի���' ;
  XArr[ 6]  := '����'   ;
  XArr[ 7]  := '�б���' ;
  XArr[ 8]  := '������' ;
  XArr[ 9]  := '����'   ;
  XArr[10]  := '����'   ;

  XL.Range['A3' , 'J3'].Value := XArr;
  k := 3;
  for i := 1 to 10 do
  begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;
  //XL.Range['A3:B3'].Merge;               //�� ����

  //�˻��� �ڷḦ excel�� exportó�� ��Ų��.
  SavePlace := CData.Ora_Excel.GetBookmark;
  CData.Ora_Excel.DisableControls;
  CData.Ora_Excel.First;

  with CData.Ora_Excel do
  begin
    for i := 1 to  RecordCount do
    begin
      XArr[ 1]  := IntToStr(i);
      XArr[ 2]  := FieldByName('deptname').AsString {+ #13#10 +
                   FieldByName('deptna3').AsString};
      XArr[ 3]  := FieldByName('korname').AsString + #13#10 +
                   '(' + FieldByName('usaage').AsString+ '��)';
      XArr[ 4]  := FieldByName('payranm').AsString;
      tmp_empdate  := Copy(FieldByName('orgempdate').AsString,3,2)+'.'+
                      Copy(FieldByName('orgempdate').AsString,5,2)+'.'+
                      Copy(FieldByName('orgempdate').AsString,7,2);
      if FieldByName('paycldate').AsString <> '' then
      begin
        tmp_empdate := tmp_empdate + #13#10 +
                       Copy(FieldByName('paycldate').AsString,3,2)+'.'+
                       Copy(FieldByName('paycldate').AsString,5,2)+'.'+
                       Copy(FieldByName('paycldate').AsString,7,2);
      end;
      XArr[ 5]  := tmp_empdate;

      iRoopCnt := 0;
      with CData.Ora_Query2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select A.empno,A.schgr,decode(D.codename,''��������'',''����'',D.codename) schgrNM, A.schcode, '+
                '       B.codename schcodename, A.majorcode,           '+
                '       C.codename majorcodename, A.schtoym            '+
                ' from pimscho A,pyccode B, pyccode C, pyccode D       '+
                ' where (A.schgr = D.codeno and D.codeid =''I221'')    '+
                '   and (A.schcode = B.codeno and B.codeid =''I223'')  '+
                '   and (A.majorcode = C.codeno and C.codeid =''I225'')'+
                '   and A.empno = ''' + CData.Ora_Excel.FieldByName('empno').AsString + ''''+
                'order by A.schgr desc');
        Open;

        while not EOF do
        begin
          iRoopCnt := iRoopCnt + 1;
          case iRoopCnt of
             1: begin
                  XArr[ 6]   := FieldByName('schgrNM').AsString;
                  tmp_school := FieldByName('schcodename').AsString;
                  tmp_major  := FieldByName('majorcodename').AsString;
                  tmp_gray   := Copy(FieldByName('schtoym').AsString,3,2)+'.'+
                                Copy(FieldByName('schtoym').AsString,5,2);
                end;
             2: begin
                  tmp_school := tmp_school + #13#10 + FieldByName('schcodename').AsString;
                  tmp_major  := tmp_major + #13#10 + FieldByName('majorcodename').AsString;
                  tmp_gray   := tmp_gray + #13#10 +
                                Copy(FieldByName('schtoym').AsString,3,2)+'.'+
                                Copy(FieldByName('schtoym').AsString,5,2);
                end;
             3: begin
                  tmp_school := tmp_school + #13#10 + FieldByName('schcodename').AsString;
                  tmp_major  := tmp_major + #13#10 + FieldByName('majorcodename').AsString;
                  tmp_gray   := tmp_gray + #13#10 +
                                Copy(FieldByName('schtoym').AsString,3,2)+'.'+
                                Copy(FieldByName('schtoym').AsString,5,2);
                end;
          end;
          Next;
        end;
      end;
      XArr[ 7]  := tmp_school;
      XArr[ 8]  := tmp_major;
      XArr[ 9]  := tmp_gray;

      {TBLOBField(FieldByName('photo')).SaveToStream(Tempstream);
      Tempstream.Position := 0;
      iJPG.LoadFromStream(Tempstream);}

      XL.Range['A' + IntToStr(k+1), 'J' + IntToStr(k+1)].Value := XArr;

      Dir := 'c:\insa\list\';
      BMPFileName := Dir + Trim(FieldByName('empno').AsString) + '.jpg';
      TGraphicField(FieldByName('photo')).SaveToFile(BMPFileName);
      XL.Range['J' + IntToStr(k+1), 'J' + IntToStr(k+1)].Select;
      XL.ActiveSheet.Pictures.Insert(BMPFileName).Select;
      XL.Selection.ShapeRange.Width := 75;
      XL.Selection.ShapeRange.Height := 80;
      XL.Selection.ShapeRange.left := XL.ActiveSheet.Range['J' + IntToStr(k+1), 'J' + IntToStr(k+1)].left + 2;
      XL.Selection.ShapeRange.top := XL.ActiveSheet.Range['J' + IntToStr(k+1), 'J' + IntToStr(k+1)].top + 2;

      inc(k);
      Next;
    end;
  end;

  //���⼭ ���ʹ� EXPORT�� EXCEL�ڷḦ ���ڰ� �ٹ̴� �κ��Դϴ�.
  XL.Range['A1', 'J' + IntToStr(k)].Borders.LineStyle   := 1;  //�׵θ����� �����.  1�� �Ǽ�
  XL.Range['A1', 'J' + IntToStr(k)].Borders.Weight      := 2;  //�׵θ��� �α� ����  2�� ����α�, 3�� ���� �β���
  XL.Range['A1', 'J' + IntToStr(k)].Borders.ColorIndex  := 1;  //�׵θ��� ������  1�� ������
  XL.Range['A1', 'J' + IntToStr(k)].font.name := '���� ���';//'����ü';
  XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //��� ����
  XL.Range['A3', 'J' + IntToStr(k)].font.Size           := 9;
  XL.Range['A5', 'J' + IntToStr(k)].HorizontalAlignment := 1;  //��������
  //XL.Range['J4', 'J' + IntToStr(k)].HorizontalAlignment := 1;  //��������
  //XL.Range['K4', 'V' + IntToStr(k)].HorizontalAlignment := 2;  //��������
  XL.Range['A1', 'J' + IntToStr(k)].Select;                    //�ڷḦ ��� SELECT�� �� --�ϴ� ����:  AutoFit ó���ϱ� ���ؼ���
  XL.Selection.Columns.AutoFit;                                //�ڵ�����
  XL.Range['A4', 'J' + IntToStr(k)].Select;
  XL.Selection.Columns.RowHeight := 86;
  XL.Range['J' + IntToStr(k), 'J' + IntToStr(k)].Select;
  XL.Selection.Columns.ColumnWidth := 12;
  XL.Range['A4', 'A4'].Select;                                 //A4���� Ŀ�� ��ġ��Ŵ
  XL.Visible := true;                                          //�����ڷ� ������
  Screen.Cursor := crDefault;
  CData.Ora_Excel.GotoBookmark(SavePlace);
  CData.Ora_Excel.FreeBookmark(SavePlace);
  CData.Ora_Excel.EnableControls;
  helpDsr.caption := '';

  //G_Progress.Progress := 0;
  CData.Ora_Excel.Close;
  helpDsr.Caption := '�۾��� �Ϸ�Ǿ����ϴ�.';
end;

end.
