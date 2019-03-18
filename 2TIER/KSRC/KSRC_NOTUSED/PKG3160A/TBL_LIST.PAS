{*******************************************************************************
p_deptcode.caption  :=  Get_deptName(tembon,ME_ORGNUM.Text,ME_DEPTCODE.Text);
Set_DeptTable;
Free_DeptTable;

p_bldcode.caption   :=  Get_BldName(ME_bldcode.Text);
Set_BldTable;
Free_BldTable;

p_dustate.caption   :=  Get_CodeName(CI114,ME_dustate.Text);
Set_CodeTable(CI114,'I114');
Free_CodeTable(CI114);

p_dukind.caption    :=  Get_DukindName(ME_dukind.Text,t_dufrtime,t_dutotime);
Set_DukindTable;
Free_DukindTable;
*******************************************************************************}

unit tbl_list;

interface

uses  DBtables,Forms;

Type
    TCodePtr = ^TCode;
    TCode = Record
        CodeNo   : String[05];  //코드번호
        CodeName : String[30];  //코드명
        Ptr      : TCodePtr;
    end;

    TDukindPtr = ^TDukind;
    TDukind = Record
        Dukind   : String[03];  //일용직 근무구분코드
        Dukindnm : String[12];  //근무구분명
        DuFrtime : String[04];  //기준시간fr
        DuTotime : String[04];  //기준시간to
        Ptr      : TDukindPtr;
    end;

    TBldPtr = ^TBld;
    TBld = Record
        BldCode   : String[05];  //근무지코드
        BldName   : String[30];  //근무지
        Ptr       : TBldPtr;
    end;

    TDeptPtr = ^TDept;
    TDept    = Record
        OrgNum   : String[03];   //차수
        DeptCode : String[06];   //부서코드
        DeptName : String[60];   //부서명
        BonCode  : String[06];   //본부코드
        PlaceCode : String[02];  //위치
        Ptr      : TDeptPtr;
    end;

var
    CI112        : TCodePtr;     //직급
    CI113        : TCodePtr;     //직위
    CI114        : TCodePtr;     //인사상태
    CI221        : TCodePtr;     //학력
    CK272        : TCodePtr;     //채용구분
    CK910        : TCodePtr;     //금융기관
    CK920        : TCodePtr;     //주기
    CI223        : TCodePtr;     //대학교명
    CI225        : TCodePtr;     //전공
    CI231        : TCodePtr;     //자격면허종류
    CI232        : TCodePtr;     //자격면허등급

    DeptFirst    : TDeptPtr;     //부서
    BldFirst     : TBldPtr;      //급여근무지
    DuKindFirst  : TDukindPtr;   //일용직근무구분

    Function  Get_CodeName(var Start : TCodePtr; CodeNo  : String ) : String;
    Procedure Set_CodeTable(var First : TCodePtr; CodeID : String );
    Procedure Free_CodeTable(var First : TCodePtr );

    Function  Get_BldName(BldCode :string) : String;
    Procedure Set_BldTable;
    Procedure Free_BldTable;

    Function  Get_DeptName(var Boncode:string;OrgNum, DeptCode : String ) : String;
    Procedure Set_DeptTable;
    Procedure Free_DeptTable;

    Function  Get_DuKindName(Dukind:string;var DuFrtime,DuToTime:string): String;
    Procedure Set_DukindTable;
    Procedure Free_DukindTable;

implementation

{======= Code 테이블에서 해당 코드값에 대한 코드명을 가져오는 함수.============}
Function Get_CodeName(var Start : TCodePtr; CodeNo  : String ) : String;
var
   Flag : Boolean;
   Cur  : TCodePtr;
begin
     Cur := Start;
     if Cur = NIL then
        begin
             Result := '';
             System.Exit;
        end;

     Flag := False;
     While (Cur^.Ptr <> Nil) do
           begin
                if Cur^.CodeNO = CodeNo then
                   begin
                        Flag := True;
                        System.Break;
                   end
                else   Cur := Cur^.Ptr;
           end;

     if Flag then
        Result := Cur^.CodeName
     else
        begin
             if Cur^.CodeNo = CodeNo then
                Result := Cur^.CodeName
             else      Result := '';
        end;
end;

{========부서 테이블에서 해당 코드값에 대한 코드명을 가져오는 함수.============}
Function Get_DeptName(var Boncode:string;OrgNum, DeptCode : String ) : String;
var
   Flag : Boolean;
   Cur  : TDeptPtr;
begin
     Cur := DeptFirst;

     if Cur = NIL then
        begin
            boncode := '';
            Result  := '';
            System.Exit;
        end;

     Flag := False;
     While Cur^.Ptr <> Nil do
     begin
         if (Cur^.OrgNum = OrgNum) AND (Cur^.DeptCode = DeptCode) then
         begin
             Flag := True;
             System.Break;
         end
         else   Cur := Cur^.Ptr;
     end;
     if Flag then
     begin
         boncode := Cur^.BonCode;
         Result  := Cur^.DeptName;
     end
     else
        begin
             if (Cur^.OrgNum = OrgNum) AND (Cur^.DeptCode = DeptCode) then
             begin
                 boncode := Cur^.BonCode;
                 Result  := Cur^.DeptName;
             end
             else
             begin
                 boncode := '';
                 Result  := '';
             end;
        end;
end;

{======근무구분 테이블에서 해당 코드값에 대한 코드명을 가져오는 함수.==========}
Function  Get_DuKindName(Dukind:string;var DuFrtime,DuToTime:string): String;
var
   Flag : Boolean;
   Cur  : TDukindPtr;
begin
     Cur := DukindFirst;
     if Cur = NIL then
        begin
             Result := '';
             System.Exit;
        end;

     Flag := False;
     While Cur^.Ptr <> Nil do
     begin
         if (Cur^.Dukind = Dukind) then
         begin
             Flag := True;
             System.Break;
         end
         else   Cur := Cur^.Ptr;
     end;

     if Flag then
     begin
         DuFrTime := Cur^.DuFrTime;
         DuToTime := Cur^.DuToTime;
         Result   := Cur^.Dukindnm;
     end
     else
        begin
             if (Cur^.Dukind = Dukind) then
             begin
                 DuFrTime := Cur^.DuFrTime;
                 DuToTime := Cur^.DuToTime;
                 Result   := Cur^.Dukindnm;
             end
             else
             begin
                 DuFrTime := '';
                 DuToTime := '';
                 Result   := '';
             end;
        end;
end;

{======= bld 테이블에서 해당 코드값에 대한 코드명을 가져오는 함수.=============}
Function Get_BldName(Bldcode:string) : String;
var
   Flag : Boolean;
   Cur  : TBldPtr;
begin
     Cur := BldFirst;
     if Cur = NIL then
        begin
             Result := '';
             System.Exit;
        end;

     Flag := False;
     While (Cur^.Ptr <> Nil) do
           begin
                if Cur^.Bldcode = Bldcode then
                   begin
                        Flag := True;
                        System.Break;
                   end
                else
                   Cur := Cur^.Ptr;
           end;

     if Flag then
        Result := Cur^.BldName
     else
        begin
             if Cur^.Bldcode = Bldcode then Result := Cur^.BldName
             else  Result := '';
        end;

end;
{======= Code에 대한 Single Linked List를 만드는 Porcedure.=====================}
Procedure Set_CodeTable(var First : TCodePtr; CodeID : String );
var
   Cur, Prev : TCodePtr;
   i         : Integer;
   Qry1      : Tquery;
begin
     Qry1 := TQuery.Create(application);
     Qry1.DataBaseName := 'dper';
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT CODENO, CODENAME                                  ' );
     Qry1.Sql.Add( ' FROM   PYCCODE                                           ' );
     Qry1.Sql.Add( ' WHERE  CODEID = :CodeID                                  ' );
     Qry1.ParamByName('codeid').AsString := CodeID;
     Qry1.Open;

     if Qry1.Eof then
        begin
             First := Nil;
             Qry1.Close;
             System.Exit;
        end;

     For i := 1 to Qry1.RecordCount do
         begin
              Prev := Cur;
              New(Cur);
              if ( i = 1) then
                 First := Cur;

              Cur^.CodeNo     := Qry1.FieldByName('CodeNo').AsString;
              Cur^.CodeName   := Qry1.FieldByName('CodeName').AsString;

              if ( i > 1 ) then
                 Prev^.ptr  := Cur;
              Qry1.Next;
         end;

     Cur^.Ptr := Nil;
     Qry1.Close;
     Qry1.Free;
end;
{======= Code에 대한 Single Linked List를 해제시키는 Porcedure.=================}
Procedure Free_CodeTable(var First : TCodePtr );
var
     Temp1,Temp2 : TCodePtr;
begin
     Temp1 := First;
     While Temp1^.Ptr <> NIL do
           begin
                Temp2 := Temp1^.ptr;
                Dispose( Temp1 );
                Temp1 := Temp2;
           end;
     Dispose( Temp1 );
end;
{======== 부서명에 대한 Single Linked List를 만드는 Porcedure.==================}
Procedure Set_DeptTable;
var
   Cur, Prev : TDeptPtr;
   i         : Integer;
   Qry1      : Tquery;
begin
     Qry1 := TQuery.Create(application);
     Qry1.DataBaseName := 'dper';
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT ORGNUM, DEPTCODE, DEPTNAME, BONCODE,PLACECODE ' );
     Qry1.Sql.Add( ' FROM   PYCDEPT                                       ' );
     Qry1.Open;

     if Qry1.Eof then
        begin
             DeptFirst := Nil;
             Qry1.Close;
             System.Exit;
        end;

     For i := 1 to Qry1.RecordCount do
         begin
              Prev := Cur;
              New(Cur);
              if ( i = 1) then
                 DeptFirst := Cur;

              Cur^.Orgnum     := Qry1.FieldByName('OrgNum').AsString;
              Cur^.DeptCode   := Qry1.FieldByName('DeptCode').AsString;
              Cur^.DeptName   := Qry1.FieldByName('DeptName').AsString;
            {  Cur^.BonName    := Qry1.FieldByName('DeptNa1').AsString;}
              Cur^.Boncode    := Qry1.FieldByName('Boncode').AsString;
              Cur^.PlaceCode  := Qry1.FieldByName('PlaceCode').AsString;

              if ( i > 1 ) then
                 Prev^.ptr  := Cur;
              Qry1.Next;
         end;

     Cur^.Ptr := Nil;
     Qry1.Close;
     Qry1.Free;
end;
{======= DeptCode에 대한 Single Linked List를 해제시키는 Porcedure.=============}
Procedure Free_DeptTable;
var
     Temp1,Temp2 : TDeptPtr;
begin
     Temp1 := DeptFirst;
     While Temp1^.Ptr <> NIL do
           begin
                Temp2 := Temp1^.ptr;
                Dispose( Temp1 );
                Temp1 := Temp2;
           end;
     Dispose( Temp1 );
end;

{======== 근무구분에 대한 Single Linked List를 만드는 Porcedure.==============}
Procedure Set_DukindTable;
var
   Cur, Prev : TDukindPtr;
   i         : Integer;
   Qry1      : Tquery;
begin
     Qry1 := TQuery.Create(application);
     Qry1.DataBaseName := 'dper';
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT DUKIND,DUKINDNM,DUFRTIME,DUTOTIME            ');
     Qry1.Sql.Add( ' FROM   PKCILBAS                                     ');
     Qry1.Open;

     if Qry1.Eof then
        begin
             DukindFirst := Nil;
             Qry1.Close;
             System.Exit;
        end;

     For i := 1 to Qry1.RecordCount do
         begin
              Prev := Cur;
              New(Cur);
              if ( i = 1) then
                 DukindFirst := Cur;

              Cur^.Dukind     := Qry1.FieldByName('Dukind').AsString;
              Cur^.Dukindnm   := Qry1.FieldByName('Dukindnm').AsString;
              Cur^.DuFrtime   := Qry1.FieldByName('DuFrtime').AsString;
              Cur^.DuTotime   := Qry1.FieldByName('DuTotime').AsString;

              if ( i > 1 ) then
                 Prev^.ptr  := Cur;
              Qry1.Next;
         end;

     Cur^.Ptr := Nil;
     Qry1.Close;
     Qry1.Free;
end;

{======= 근무구분에 대한 Single Linked List를 해제시키는 Porcedure.=============}
Procedure Free_DukindTable;
var
     Temp1,Temp2 : TDukindPtr;
begin
     Temp1 := DukindFirst;
     While Temp1^.Ptr <> NIL do
           begin
                Temp2 := Temp1^.ptr;
                Dispose( Temp1 );
                Temp1 := Temp2;
           end;
     Dispose( Temp1 );
end;


{======  Bld에 대한 Single Linked List를 만드는 Porcedure.======================}
Procedure Set_BldTable;
var
   Cur, Prev : TBldPtr;
   i         : Integer;
   Qry1      : Tquery;
begin
     Qry1  := Tquery.Create(application);
     Qry1.DataBaseName := 'dper';
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT BLDCODE, BLDNAME                                  ' );
     Qry1.Sql.Add( ' FROM   PKCPBLD                                           ' );
     Qry1.Open;

     if Qry1.Eof then
        begin
             BldFirst := Nil;
             Qry1.Close;
             System.Exit;
        end;

     For i := 1 to Qry1.RecordCount do
         begin
              Prev := Cur;
              New(Cur);
              if ( i = 1) then
                 BldFirst := Cur;

              Cur^.BldCode := Qry1.FieldByName('BldCode').AsString;
              Cur^.BldName := Qry1.FieldByName('BldName').AsString;

              if ( i > 1 ) then
                 Prev^.ptr  := Cur;
              Qry1.Next;
         end;

     Cur^.Ptr := Nil;
     Qry1.Close;
     Qry1.Free;
end;
{======= bld에 대한 Single Linked List를 해제시키는 Porcedure.==================}
Procedure Free_BldTable;
var
     Temp1,Temp2 : TBldPtr;
begin
     Temp1 := BldFirst;
     While Temp1^.Ptr <> NIL do
     begin
         Temp2 := Temp1^.ptr;
         Dispose( Temp1 );
         Temp1 := Temp2;
     end;
     Dispose( Temp1 );
end;

end.
