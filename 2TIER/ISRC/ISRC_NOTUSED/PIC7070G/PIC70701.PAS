{ header
 -----------------------------------------------------------------------
  PROGRAM-NAME    : PIC7070G(�������� �λ�߷ɾ� ���)
  SYSTEM-NAME     : �����λ�
  SUBSYSTEM-NAME  : �λ�
  Programmer      : �ڱԼ�
  Version         : 30.00
  Date            : 1998.12.29
  Update Contents
   ����    ������     ������       ��������        ���ñٰ�
   1.00   1997.10.15  ������    �ű����α׷� ����  ó��������
  30.00   1998.12.29  �ڱԼ�    ����,���޼���      �ϳ����λ��簳��
  30.01   1999.12.31  ������         Y2k           �λ�߷� 6�ڸ� --> 8�ڸ� ũ�⺯��
  30.02   2000.10.17  �����   ��ü���� Logic����  �Ϻ��� �븮��û.
 ----------------------------------------------------------------------}

{ *********    1. ����������(����������� �Ϻ� ������ ����)   ************
  1. ������ ���������Ͽ����� ����� ����.
  2. Ư���μ��� ��ġ�� �μ��̵�.
     a) Ư�� �ι� ��ġ��  ��������.     ------| '��ġ'��ư������.
     b) ������ ���� �μ��̿��� ��������.------|
  3. ��ġ���� ���� �μ��� �λ�߷ɾ� ��Ͻ� �߷��� ���� �ʴ´�.

  *********    2. ���������              ********************************
  1. ������ ���������Ͽ����� ����� ����.
  2. Ư������ �μ������ÿ� ���������߷�.
     a) ������ �μ��ο�  ��������                 --------|
     b) �Ⱥθ� �ٸ��μ�  ��������                 --------| '��ġ'��ư��
     c) �������� ���μ��� ����ô� �μ��� ��������   -----|
  11 -- ���� ����.
  12 -- ���� ����.

  * andepcode----> ���α���
}

unit pic70701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Gauges, Mask, ExtCtrls, DBTables, Db,pass,timeftp,datelib,
  codelib, ComObj, kpaylib;

type
  Tpic7070gForm = class(TForm)
    Panel1: TPanel;
    L_userName: TLabel;
    L_CurDate: TLabel;
    Panel7: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel8: TPanel;
    Panel3: TPanel;
    E_annono: TMaskEdit;
    Panel9: TPanel;
    Panel11: TPanel;
    Panel6: TPanel;
    E_anfrdate: TMaskEdit;
    Panel5: TPanel;
    Gr: TGauge;
    Panel10: TPanel;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Run: TBitBtn;
    Helppanel: TPanel;
    P_Help: TLabel;
    Label1: TLabel;
    Qvari: TQuery;
    Database1: TDatabase;
    Qan: TQuery;
    Qrais: TQuery;
    Qmas: TQuery;
    Panel13: TPanel;
    Panel14: TPanel;
    regist: TLabel;
    Label3: TLabel;
    error: TLabel;
    Label5: TLabel;
    Panel12: TPanel;
    read: TLabel;
    Label4: TLabel;
    Qdept: TQuery;
    Qremd: TQuery;
    Panel15: TPanel;
    payclfr: TMaskEdit;
    payclto: TMaskEdit;
    Label2: TLabel;
    excel: TBitBtn;
    SaveDialog1: TSaveDialog;
    Qry_pihan: TQuery;
    Label6: TLabel;
    Qry_imsi: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BB_RunClick(Sender: TObject);
    procedure BB_CloseClick(Sender: TObject);
    procedure payclfrDblClick(Sender: TObject);
    procedure paycltoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_annonoChange(Sender: TObject);
    procedure an_gubun1Click(Sender: TObject);
    procedure excelClick(Sender: TObject);

  private
    { Private declarations }
     start : boolean;
     cnt : integer;
     err_cnt : integer;
     reg_cnt : integer;
     read_cnt : integer;
     err : system.text;
     procedure clear;
     procedure delete_pihanno;
     procedure insert_pihanno;
     procedure update_pihanba;
     procedure reg_work;
     procedure org_bal;
     procedure update_trgubun;
     procedure update_annoyn;
     function read_pycdept2(s1,s2 : string):Boolean;
     procedure read_pycdept1(s1,s2 : string);
     procedure E_Write(str : string);
     function  QDeptDisp(s1,s2 : String) : String;
  public
    { Public declarations }
     p_empno : string;
     pkorname : string;
     password : string;
     Homedir  : string;
     organdate : string;
     lastno : string;
     andate : string;
     time : string;
     gubun : integer;
     tmp_annono : string;
     tmp_anfrdate : string;
     Error_help : array [0..255] of char;
     function annono_check(s1 : string):string;
  end;

var
  pic7070gForm: Tpic7070gForm;
  annono, anseqno, anfrdate, ancode, andetcode,empno, korname, orgnum, deptcode : string;
  payra, paycl, trgubun ,dpdeptname,bdeptname,gu_paycl: string;
  borgnum, bdeptcode, bpaycl, bpayra, bextcode,bboncode,r_deptcode,anupdyn : string;
  textcode,tboncode : string;
  app : Variant;
implementation

{$R *.DFM}


procedure Tpic7070gForm.FormActivate(Sender: TObject);
begin
  HomeDir  := HomeDirOpen;
  p_empno  := PassEmp(cmdline,1);
  pkorname := PassEmp(cmdline,2);
  password := PassEmp(cmdline,3);

  reg_cnt := 0;
  err_cnt := 0;

  E_annono.SetFocus;
  P_Help.Caption := '���������������� �о���� �ֽ��ϴ� !!.';
  SendMessage(HelpPanel.handle,WM_PAINT,0,0);
end;

procedure Tpic7070gForm.FormPaint(Sender: TObject);
var
  CurDate, Currandate : String;
begin
 if start = True then begin
     start  := False;
     DataBase1.Params[0]  := 'SERVER NAME='+PassEmp(cmdline,13);
     DataBase1.Params[1]  := 'USER NAME='+PassEmp(cmdline,5);
     DataBase1.Params[19] := 'PASSWORD=' +PassEmp(cmdline,6);
     Application.Processmessages;
     Try
        Database1.Connected := True;
     EXCEPT ON E : EDataBaseError DO begin
         MessageBox(handle,Pchar(E.Message),'��  ��',MB_OK or $0010);
         halt(0);
       end;
     END;

     CurDate  := TimeDate(Qmas);
     L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
                           copy(CurDate,5,2)+'/'+
                           copy(CurDate,7,2);

     time := copy(Curdate,1,15);

//     if PassDialog(self,p_empno,pkorname,password) = False then halt(0);
     L_UserName.Caption := pkorname+'('+p_empno+')';

     with Qvari do
     begin
        close;
        sql.clear;                                // ����������
        sql.add('select value1 from pimvari where  gubun = ''00'' and sgubun= ''0001''  ');
        Open;
        Currandate := FieldByName('value1').AsString; // ������������= organdate

        close;
        sql.clear;                                // ���������������� �о�´�.
        sql.add('select value1 from pimvari where  gubun = ''C7'' and sgubun= ''0001''  ');
        Open;
        if trim(FieldByName('value1').AsString) = '' then
           MessageBox(0,'���������������� �������� �ʽ��ϴ� !!.','Ȯ ��',MB_OK or $0030)
        else begin
           organdate := FieldByName('value1').AsString; // ������������= organdate
           E_anfrdate.Text := Copy(andate,1,4) + Copy(andate,5,2) + Copy(andate,7,2);
        end;
        close;
     end;
     P_Help.Caption := '';
  end;
  if Currandate = organdate then
    gubun := 1  //��������.
  else
    gubun := 2; //��������
end;

procedure Tpic7070gForm.FormCreate(Sender: TObject);
begin
     start := True;
end;

procedure Tpic7070gForm.clear;
begin
          annono := '';   anseqno := ''; anfrdate := ''; ancode := ''; empno := '';
          korname := '';  orgnum := ''; deptcode := ''; payra := ''; paycl := '';
          bextcode := '';   bboncode := ''; trgubun := ''; gu_paycl := '';
          borgnum := ''; bdeptcode := ''; bpaycl := ''; bpayra := ''; anupdyn := '';
          r_deptcode := '';   dpdeptname := '';    bdeptname := '';
end;

procedure Tpic7070gForm.BB_RunClick(Sender: TObject);
begin
     //�߷ɹ�ȣ�� �����ϴ��� Ȯ��..
     if annono_check(E_annono.text) <> 'OK' then
     begin
            showmessage('�߷ɹ�ȣ�� �������� �ʽ��ϴ�.');
            system.exit;
     end;
     if E_anfrdate.text = '' then begin
         P_Help.Caption := '�߷����ڴ� �ʼ��Է»����Դϴ�!!.';
         system.exit;
     end;
     if (E_anfrdate.text <> tmp_anfrdate) or (E_annono.text <> tmp_annono) then
     begin
         read_cnt := 0;       reg_cnt := 0;
     end;
     P_Help.Caption := '�λ�߷�ȭ���� �����߷� �������ڷḦ �������Դϴ�!!.';
     delete_pihanno;  // �λ�߷�ȭ���� �����߷� �������ڷḦ �����Ѵ�.
     P_Help.Caption := '�λ�߷�ȭ�Ͽ� ���������߷��� ������Դϴ�. ';

     System.AssignFile(err,HomeDir+'\list\pic7070g.err');
     System.Rewrite(err);

     System.Writeln(err,' ******* �������� �λ�߷ɾȵ�� ���� ����Ʈ ******');
     System.Writeln(err,'');  System.Writeln(err,'');
     P_Help.Caption := '�λ�߷�ȭ�Ͽ� �߷ɻ����� ������Դϴ�!!.';
     SendMessage(helppanel.handle,WM_PAINT,0,0);

     if gubun = 1 then    //��������
        reg_work                // ����۾�
     else
     if gubun = 2 then  
     begin
        clear;
        org_bal;        // ��������߷ɵ��. (�߷��ĺμ�,����,����,����,ȣ��,�߷��� ����.
     end;

     System.Writeln(err,'');
     System.Writeln(err,'  �����Ǽ� : '+inttostr(read_cnt)+
                        '  ��ϰǼ� : '+inttostr(reg_cnt)+
                        '  �����Ǽ� : '+inttostr(Err_cnt));
     system.Close(err);
     P_Help.Caption := '';

     update_pihanba;   // �λ�߷ɱٰ�ȭ�ϼ���

     gr.Progress    := 0;
     read.caption := inttostr(read_cnt);
     regist.caption := inttostr(reg_cnt);
     error.caption := inttostr(err_cnt);

     P_Help.Caption := '�۾��� �Ϸ�Ǿ����ϴ� !!. (����ȭ�� : '+HomeDir+'\list\pic7070g.err)';
end;

procedure Tpic7070gForm.org_bal;
var
  cnt :integer;
  deptname, dpdeptname : string;
begin
  with Qrais do
  begin
    close;
    sql.clear;
    sql.add(Format('SELECT empno,dporgnum,dpdeptcode,dppayra,trgubun '+
                   ' From pitremd '+
                   ' WHERE (remddate = ''%s'') and (annoyn = ''Y'') '+
                   '  AND RTrim(dpdeptcode,'' '' ) is not null '+
                   '  AND orgnum != dporgnum '+
                   ' ORDER BY empno ',[organdate]));
    open;
    if Qrais.Recordcount < 0 then
    begin
        P_Help.caption := ' ��������ȭ�Ͽ� �ڷᰡ �������� �ʽ��ϴ�!!.';
        system.exit;
    end;
    cnt := 0;
    First;
    While not Eof do
    begin
       clear;
       if Qrais.RecordCount <> cnt then
           Gr.Progress := (cnt * 100) div RecordCount else Gr.Progress := 100;

       SendMessage(panel3.handle,WM_PAINT,0,0);
       annono    := E_annono.text;                        // �߷ɹ�ȣ
       anfrdate  := E_anfrdate.text;                      // �߷���FROM
       andetcode := FieldByName('trgubun').asstring;      // ���α���.
       empno     := FieldByName('empno').asstring;        // ��  ��
       orgnum    := FieldByName('dporgnum').asstring;     // �߷��� ����
       deptcode  := FieldByName('dpdeptcode').asstring;   // �߷��� �μ�
       Payra     := Fieldbyname('dppayra').Asstring;      // �߷��� ��å
       if  Qdeptdisp(orgnum,deptcode) = '����' then
       begin
         inc(err_cnt);
         e_write('�μ��ڵ尡 �������� �ʽ��ϴ�!!');
         inc(cnt);
         inc(read_cnt);
         Qrais.next;
         continue;
       end;
       with Qmas do
       begin
         Close;
         Sql.clear;
         Sql.add('SELECT korname, paycl ,payra ,orgnum ,deptcode ');
         Sql.add('FROM pimpmas WHERE empno = :lempno ');
         ParamByname('lempno').Asstring := empno;
         Open;
         Korname   := fieldBYname('korname').Asstring;     // ��   ��
         Borgnum   := fieldbyname('orgnum').Asstring;      // �߷��� ����
         Bdeptcode := fieldbyname('deptcode').Asstring;    // �߷��� �μ�
         Bpaycl    := fieldbyname('paycl').Asstring;       // �߷��� BAND
         Bpayra    := fieldbyname('payra').Asstring;       // �߷��� ��å
         paycl     := fieldbyname('paycl').Asstring;       // �߷��� BAND
         Qmas.close;
       end;    // Qmas
       anupdyn   := 'N';                                // ��ſ���
       
       if (Bpaycl = 'E1') or (Bpaycl = 'H1') then                     // �߷ɱ���(��������) 1��.
       begin
         ancode    := '712';
         andetcode := '';
       end
       else
         ancode    := '211';
       With Qry_imsi do            //�ӵ������� ���۳�Ʈ�� Query�� ����.
       begin
         Close;
         ParamByName('p_orgnum').AsString := orgnum;
         ParamByName('p_deptcode').AsString := deptcode;
         Open;
         Deptname := FieldByName('deptname').AsString;
         Close;
         ParamByName('p_orgnum').AsString := Borgnum;
         ParamByName('p_deptcode').AsString := Bdeptcode;
         Open;
         DpDeptname := FieldByName('deptname').AsString;
       end;

       if Deptname = Dpdeptname then
       begin
         ancode    := '935';
         andetcode := '';
       end;
       inc(read_cnt);
       insert_pihanno;
       inc(cnt);
       Qrais.next;
    end;  // while
  end;  // Qrais
  Qrais.close;
end;

procedure Tpic7070gForm.reg_work;
begin
  With Qrais do
  begin
    close;
    sql.clear;
    sql.add(Format('select empno,dporgnum,paycl,dpdeptcode,dppayra,trgubun  from pitremd '+
                   'where (remddate = ''%s'' and pstate < ''60'') and (orgnum = dporgnum) '+
                   '  and (nvl(dporgnum,''  '') != ''  '')  and (annoyn = ''N'') and (confyn=''M'') '+  //���������� ǥ�� MOVE����.
                   '  and (paycl >= ''%s'' and paycl <= ''%s'') order by empno ',[organdate,payclfr.text,payclto.text]));
    open;
    if Recordcount < 0 then
    begin
      P_Help.caption := ' ��������ȭ�Ͽ� �ڷᰡ �������� �ʽ��ϴ�!!.';
      system.exit;
    end;
    cnt := 0;
    First;
    while not Eof do
    begin
       Clear;
       if Qrais.RecordCount <> cnt then
           Gr.Progress := (cnt * 100) div RecordCount else Gr.Progress := 100;
       SendMessage(panel5.handle,WM_PAINT,0,0);

       annono    := E_annono.text;                        // �߷ɹ�ȣ
       anfrdate  := E_anfrdate.text;                      // �߷���FROM
       gu_paycl  := fieldbyname('paycl').Asstring;        // ����.
       if (gu_paycl >= '11') and (gu_paycl <='45') then
         ancode   := '211'                                // �߷ɱ���(����)-������
       else
         ancode   := '712';                               // �߷ɱ���(�μ�����)

       empno     := FieldByName('empno').AsString;        // ��  ��
       orgnum    := FieldByName('dporgnum').AsString;     // �߷��� ����
       deptcode  := FieldByName('dpdeptcode').AsString;   // �߷��� �μ�
       payra     := FieldByName('dppayra').AsString;      // �߷��� ��å
       anupdyn   := 'N';                                  // ��ſ���
       with Qmas do
       begin
          close;
          sql.clear;
          sql.add(Format('select korname,orgnum,deptcode,paycl,payra, '+
                         'lancode,lannono,lanfrdate,lantodate from pimpmas '+
                         'where empno = ''%s'' and pstate < ''60''  ',[empno]));
          open;
          if Qmas.Recordcount <= 0 then begin
              inc(err_cnt);
              e_write('�λ縶���Ϳ�  �ش� �ڷᰡ �������� �ʽ��ϴ�!!');
          end;
          korname   := fieldBYname('korname').Asstring;     // ��   ��
          paycl     := fieldByName('paycl').asstring;       // �߷��� BAND
          borgnum   := fieldbyname('orgnum').Asstring;      // �߷��� ����
          bdeptcode := fieldbyname('deptcode').Asstring;    // �߷��� �μ�
          bpaycl    := fieldbyname('paycl').Asstring;       // �߷��� BAND
          bpayra    := fieldbyname('payra').Asstring;       // �߷��� ��å
          close;
       end;  //Qmas

{       if bpayra <> payra then
       begin                                                //����å != ��ġ��å
         if (gu_paycl >= '11') and (gu_paycl <= '45') then
             andetcode := '11' ;                            // ��������
       end
       else
       begin
          bdeptname  := Qdeptdisp(borgnum,bdeptcode);
          dpdeptname := Qdeptdisp(orgnum,deptcode);
          if bdeptname = dpdeptname then           //(������ == ��ġ����) AND (���ҼӸ� = ��ġ�ҼӸ�)
          begin
              with Qremd do
              begin
                 close;
                 sql.clear;
                 sql.add(Format('update pitremd set annoyn = ''R'' '+  //�������氡��.
                    'where remddate = ''%s'' and empno = ''%s'' ',[organdate,empno]));
                 execsql;
                 close;
                 inc(cnt);
                 inc(read_cnt);
                 Qrais.next;
                 continue;
              end;
          end;

          if (gu_paycl >= '11') and (gu_paycl <= '45') then
          begin
             read_pycdept1(borgnum,bdeptcode);     // �����μ�,�����ڵ带 �о�´�.
             bextcode := textcode;
             bboncode := tboncode;
             read_pycdept1(borgnum,bextcode);      // �����μ��� ���θ� ����.
             if bboncode <> tboncode then
                  bextcode := '';
             if bboncode = bdeptcode then
                  bboncode := '';
             if not(read_pycdept2(borgnum,bdeptcode)) then
             begin                                                 // ������,���μ���
                 if bextcode <> '' then
                 begin
                    if not read_pycdept2(borgnum,bextcode) then
                    begin                                          // ������,�������μ��ڵ��
                       if bboncode <> '' then  begin
                           read_pycdept2(borgnum,bboncode);        // ������,�����ڵ��
                       end;
                    end;
                  end;
             end;
             if (deptcode <> r_deptcode) then
                    andetcode := '11'      // ��������
             else   andetcode := '12';     // ��������
          end;  // �����߷� (������)
       end;    // �������� ��ġ������ �ٸ���
}
       // ���������� ����
       update_trgubun;   //trgubun �� ���α����ڵ� ����.
       inc(read_cnt);
       insert_pihanno;
       inc(cnt);
       Qrais.next;
    end;   //while
  end;  //Qrais

end;



// ��������,�μ��ڵ�� �����μ�,�����ڵ�

procedure Tpic7070gForm.read_pycdept1(s1,s2:string);
begin
   with Qdept do begin
      close;        sql.clear;
      sql.add(Format('select nvl(extcode,''ZZZZZZ'') extcode, nvl(boncode,''ZZZZZZ'') boncode from pycdept '+
                     'where orgnum = ''%s'' and deptcode = ''%s'' ',[s1,s2]));
      open;

      if Recordcount <= 0 then begin
          inc(err_cnt);
          e_write('���μ��� �����μ��� �����ڵ尡 �������� �ʽ��ϴ�!!.');
          system.exit;
      end;
      textcode := Fieldbyname('extcode').Asstring;
      tboncode := Fieldbyname('boncode').Asstring;
      close;
   end;
end;


function Tpic7070gForm.read_pycdept2(s1,s2 : string):Boolean;
begin
   read_pycdept2 := True;
   with Qdept do begin
       close;        sql.clear;
       sql.add('select orgnum,nvl(deptcode,''ZZZZZZ'')deptcode from pycdept ');
       sql.add('where  (borgnum = :lorgnum) and ');
       sql.add('       ((bdeptcode1 = :ldeptcode) or  (bdeptcode2 = :ldeptcode) or (bdeptcode3 = :ldeptcode)) ');
       Parambyname('Lorgnum').Asstring := s1;
       Parambyname('Ldeptcode').asstring := s2;
       open;
       if( Recordcount = 0 ) then begin
          inc(err_cnt);
          read_pycdept2 := False;
          e_write('���μ��� ������ �μ��� �������� �ʽ��ϴ�!!.');
          system.exit;
       end;
       r_deptcode := fieldbyname('deptcode').Asstring;
       if (r_deptcode = 'ZZZZZZ') then read_pycdept2 := False;
       close;
   end;
end;

procedure Tpic7070gForm.update_trgubun;
begin
  with Qremd do
  begin
    close;
    sql.clear;
    sql.add(Format('update pitremd set trgubun = ''%s'' where empno = ''%s'' '+
                   'and remddate =''%s'' ',[andetcode,empno,organdate]));
    execsql;
    close;
  end;
end;

function Tpic7070gForm.annono_check(s1 : string):string;
begin
     annono_check := 'OK';
     with Qan do begin
       close; sql.clear;
       sql.add(Format('select annono ,anlastno from pihanba '
               + 'where annono = ''%s'' ' ,[s1]));
       open;
       if recordcount > 0 then begin
          lastno := FieldByname('anlastno').ASstring;
       end
       else  begin
          P_Help.Caption := '�߷ɹ�ȣ�� �������� �ʽ��ϴ�.';
          annono_check := '';;
       end;
       close;
    end;
end;

procedure Tpic7070gForm.delete_pihanno;
begin
     read_cnt := 0;
     reg_cnt := 0;
     with Qan do begin
          close;  sql.clear;
          sql.add(Format('Delete from pihanno  ' +
                         'where annono = ''%s'' and anfrdate = ''%s'' ' ,[E_annono.text,E_anfrdate.text]));
          EXECSQL;
     end;
     Qan.close;
     p_help.caption := '';
end;

procedure Tpic7070gForm.Insert_pihanno;
begin
     lastno    := inttostr(strtoint(lastno) + 1);       // �Ϸù�ȣ
     anseqno   := kpaylib.lpad(lastno,4,'0');
     with Qan do
     begin
        close;
        sql.clear;
        sql.add('INSERT into pihanno (annono,anseqno,anfrdate,ancode,andetcode,empno,korname, ');
        sql.add('     orgnum,deptcode,payra,paycl, ');
        sql.add('     borgnum,bdeptcode,bpaycl,bpayra,anupdyn,writeemp,writetime )');
        sql.add('values( :tannono,:tanseqno,:tanfrdate,:tancode,:tandetcode,:tempno,:tkorname, ');
        sql.add('  :torgnum,:tdeptcode,:tpayra,:tpaycl, ');
        sql.add('  :tborgnum,:tbdeptcode,:tbpaycl,:tbpayra,:tanupdyn,:jobempno,:ttime)');
        parambyname('tannono').Asstring    := annono;
        parambyname('tanseqno').Asstring   := anseqno;
        parambyname('tanfrdate').Asstring  := anfrdate;
        parambyname('tancode').Asstring    := ancode;
        parambyname('tandetcode').Asstring := andetcode;
        parambyname('tempno').Asstring     := empno;
        parambyname('tkorname').Asstring   := korname;
        parambyname('torgnum').Asstring    := orgnum;
        parambyname('tdeptcode').Asstring  := deptcode;
        parambyname('tpayra').Asstring     := payra;
        parambyname('tpaycl').Asstring     := paycl;
        parambyname('tborgnum').Asstring   := borgnum;
        parambyname('tbdeptcode').Asstring := bdeptcode;
        parambyname('tbpaycl').Asstring    := bpaycl;
        parambyname('tbpayra').Asstring    := bpayra;
        parambyname('tanupdyn').Asstring   := anupdyn;
        parambyname('jobempno').Asstring   := p_empno;
        parambyname('ttime').Asstring      := time;
        EXECSQL;
        inc(reg_cnt);
        close;
     end;     //Qan
end;

procedure Tpic7070gForm.update_annoyn;     //�������� ����������.
begin
  try
    with Qrais do
    begin
      close;
      sql.Clear;
      sql.add(Format( 'update pitremd set annoyn = ''Y''  '+
              'where (remddate = ''%s'' and pstate < ''60'') '+
              '  and (nvl(dporgnum,''  '') != ''  '' ) and (annoyn = ''N'') '+
              '  and (paycl >= ''%s'' and paycl <= ''%s'') ',[organdate,payclfr.text,payclto.text]));
      execsql;
      close;
    end;
  Except
    MessageBox(0,' ����� �ڷᰡ �����ϴ�.','Ȯ ��',MB_OK or $0030);
    exit;
  end;
end;

procedure Tpic7070gForm.update_pihanba;
begin
  with Qvari do
  begin
    Close;
    sql.clear;
    sql.add(Format('UPDATE pihanba Set anlastno = ''%s'' '+
                   'where annono = ''%s'' ',[lastno,FormatMaskText('0000',E_annono.text)]));
    EXECSQL;
    Close;
  end;
  P_Help.Caption := '';
end;

procedure Tpic7070gForm.E_Write(str : string);
begin
  System.Writeln(err,'    '+'�����ȣ('+empno+')         =>'+str);
end;

procedure Tpic7070gForm.BB_CloseClick(Sender: TObject);
begin
    close;
end;


function Tpic7070gForm.QDeptDisp(s1,s2 : String) : String;
var
  str : string;
begin
  if trim(s1) = '' then
  begin
    QDeptDisp := '����';
    system.exit;
  end;
  Qdept.Close;
  Qdept.sql.clear;
  Qdept.sql.add('select DeptName from pycdept where orgnum=:lorgnum and deptcode = :ldept ');
  Qdept.Parambyname('lorgnum').AsString := Trim(s1);
  Qdept.Parambyname('ldept').AsString   := Trim(s2);
  Qdept.Open;
  if trim(Qdept.FieldByName('DeptName').AsString) = ''  then
    QdeptDisp := '����'
  else
    QdeptDisp := Qdept.FieldByName('DeptName').AsString;
  Qdept.close;
end;

procedure Tpic7070gForm.payclfrDblClick(Sender: TObject);
begin
  codeForm := TCodeForm.Create(self);
  Try
    case TComponent(Sender).Tag of
      1,2 : begin
	  codeForm.FormData  := 'BAND�ڵ� ����';
	  codeForm.DataVal1  := 'I112';
	  end;
    end;
    codeForm.ShowModal;
    if CodeForm.Code = '' then System.Exit;
    TmaskEdit(Sender).Text := CodeForm.Code;
    Finally
       codeForm.Free;
    END;

end;

procedure Tpic7070gForm.paycltoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F1  then
     if (TMaskEdit(Sender).Tag = 1) or
        (TMaskEdit(Sender).Tag = 2)  then payclfrDblClick(Sender);
end;

procedure Tpic7070gForm.E_annonoChange(Sender: TObject);
begin
    tmp_annono := E_annono.text;
    tmp_anfrdate := E_anfrdate.text;
end;

procedure Tpic7070gForm.an_gubun1Click(Sender: TObject);
begin
  Tradiobutton(sender).checked := True;
  gubun := TRadiobutton(sender).tag;
  if gubun = 1 then
  begin
     payclfr.Enabled  := True;
     payclto.Enabled  := True;
  end
  else
  if gubun = 2 then
  begin
     payclfr.Enabled  := False;
     payclto.Enabled  := False;
  end;
end;


procedure Tpic7070gForm.excelClick(Sender: TObject);
var
  Fexcel : textfile;
  Count  : String;
  ancode, andetcode, empno, korname, orgnum, deptcode, dpname, paycl, payra, borgnum, bdeptcode, bdpname, bpaycl, bpayra, anupdyn : string;
begin

  if Trim(E_annono.Text) = '' then
  begin
    MessageBox(0,' �߷ɹ�ȣ�� �����ϴ�.','Ȯ ��',MB_OK or $0030);
    Exit;
  end;

  if Trim(E_anfrdate.Text) = '' then
  begin
    MessageBox(0,' �߷����ڰ� �����ϴ�.','Ȯ ��',MB_OK or $0030);
    Exit;
  end;

  With Qry_pihan do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT count(*) cnt FROM Pihanno '+
            ' WHERE annono = '''+E_annono.text+''' '+
            ' AND anfrdate = '''+E_anfrdate.text+''''+
            ' ORDER BY empno ');
    Open;
    Count :=  FieldByName('cnt').AsString;
  end;

  if Count <= '0' then
  begin
    MessageBox(0,' �ش� �߷ɹ�ȣ�� �߷ɳ�¥�� �����ϴ�.','Ȯ ��',MB_OK or $0030);
    exit;
  end;

  if saveDialog1.Execute then
  begin
    assignfile(Fexcel, SaveDialog1.FileName);
    rewrite(Fexcel);
    writeln(Fexcel, ',��,��,��,��,,��,��,��,��,��,��,��,��,Ȳ ');
    writeln(Fexcel, '');
    writeln(Fexcel, '[�߷ɹ�ȣ] ,:, '+Copy(E_annono.text,1,4)+'-'+Copy(E_annono.text,5,4)+
                   ',,[�߷�����],:, '+Copy(E_anfrdate.text,1,4)+'-'+Copy(E_anfrdate.text,5,2)+'-'+Copy(E_anfrdate.text,7,2)+', ');
    writeln(Fexcel, '');
    writeln(Fexcel, '�߷��ڵ�,���α���,���,�� ��,��ġ����,��ġ�μ�,��ġ�μ���,��ġBAND,��ġ��å,�߷�������,'+
                   '�߷����μ�,�߷����μ���,�߷���BAND,�߷�����å,���ſ��� ');
    with Qry_pihan do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT a.ancode, a.andetcode, a.empno, a.korname, a.orgnum, a.deptcode, b.deptname dpname, '+
              '       a.paycl, a.payra, a.borgnum, a.bdeptcode, c.deptname bdpname, a.bpaycl, a.bpayra, a.anupdyn '+
              ' FROM Pihanno a, pycdept b, pycdept c   '+
              ' WHERE a.orgnum = b.orgnum and a.deptcode=b.deptcode '+
              ' AND  a.borgnum= c.orgnum and a.bdeptcode=c.deptcode '+
              ' AND annono = '''+E_annono.text+''' '+
              ' AND anfrdate = '''+E_anfrdate.text+''''+
              ' ORDER BY empno ');
      Open;
      while not EOF do
      begin
        ancode    := FieldByName('ancode').AsString;
        andetcode := FieldByName('andetcode').AsString;
        empno     := FieldByName('empno').AsString;
        korname   := FieldByName('korname').AsString;
        orgnum    := FieldByName('orgnum').AsString;
        deptcode  := FieldByName('deptcode').AsString;
        dpname    := FieldByName('dpname').AsString;
        paycl     := FieldByName('paycl').AsString;
        payra     := FieldByName('payra').AsString;
        borgnum   := FieldByName('borgnum').AsString;
        bdeptcode := FieldByName('bdeptcode').AsString;
        bdpname   := FieldByName('bdpname').AsString;
        bpaycl    := FieldByName('bpaycl').AsString;
        bpayra    := FieldByName('bpayra').AsString;
        anupdyn   := FieldByName('anupdyn').AsString;
        writeln(Fexcel,ancode+','+andetcode+','+empno+','+korname+','+orgnum+','+deptcode+','+dpname+','+
                       paycl+','+payra+','+borgnum+','+bdeptcode+','+bdpname+','+bpaycl+','+bpayra+','+anupdyn );
        Next;
      end;
    end;
    closefile(Fexcel);
    app := CreateOleObject('Excel.Application');
    app.visible := true;
    app.workbooks.open(SaveDialog1.FileName);
  end
  else
  begin
    GR.progress := 00;
    P_Help.Caption := '�۾��� ��� �߽��ϴ�.';
    Application.ProcessMessages;
    exit;
  end;
end;

end.