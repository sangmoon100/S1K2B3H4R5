unit UPit1030;

interface

implementation

const
  clSELBRUSHCL: TColor = clActiveCaption;
  clSELFONTCL : TColor = clWhite;

  m_SEQNO        : Byte = 0;
  m_EMPNO        : Byte = 1;
  m_KORNAME      : Byte = 2;
  m_DUTYNO       : Byte = 3;
  m_JOBFIELD     : Byte = 4;
  m_JOBFIELDNM   : Byte = 5;
  m_DUTYKIND     : Byte = 6;
  m_DUTYKINDNM   : Byte = 7;
  m_DUTY         : Byte = 8;
  m_DUTYNM       : Byte = 9;
  m_FRDUTYDATE   : Byte = 10;
  m_TODUTYDATE   : Byte = 11;
  m_DUTYDATE     : Byte = 12;
  m_DUTYYY       : Byte = 13;
  m_DUTYMM       : Byte = 14;
  m_DUTYYYMM     : Byte = 15;
  m_DUTYTERMRATE : Byte = 16;
  m_DUTYTEXT     : Byte = 17;
  m_DUTYLEVEL    : Byte = 18;
  m_DUTYLEVELNM  : Byte = 19;
  m_PAYCL        : Byte = 20;
  m_PAYCLNM      : Byte = 21;
  m_MODE         : Byte = 22;

  m_SEQNO        : Byte = 0;
  m_EMPNO        : Byte = 1;
  m_KORNAME      : Byte = 2;
  m_DUTYNO       : Byte = 3;
  m_JOBFIELD     : Byte = 4;
  m_JOBFIELDNM   : Byte = 5;
  m_DUTYKIND     : Byte = 6;
  m_DUTYKINDNM   : Byte = 7;
  m_DUTY         : Byte = 8;
  m_DUTYNM       : Byte = 9;
  m_FRDUTYDATE   : Byte = 10;
  m_TODUTYDATE   : Byte = 11;
  m_DUTYDATE     : Byte = 12;
  m_DUTYYY       : Byte = 13;
  m_DUTYMM       : Byte = 14;
  m_DUTYYYMM     : Byte = 15;
  m_DUTYTERMRATE : Byte = 16;
  m_DUTYTEXT     : Byte = 17;
  m_DUTYLEVEL    : Byte = 18;
  m_DUTYLEVELNM  : Byte = 19;
  m_PAYCL        : Byte = 20;
  m_PAYCLNM      : Byte = 21;
  m_MODE         : Byte = 22;

  e_MAINID    : Byte = 0;
  e_MAINNAME  : Byte = 1;
  e_SUBID     : Byte = 2;
  e_SUBNM     : Byte = 3;
  e_DETID     : Byte = 4;
  e_DETNM     : Byte = 5;
  e_SKILLRATE : Byte = 6;
  e_USEYY     : Byte = 7;
  e_USEMM     : Byte = 8;
  e_USE       : Byte = 9;
  e_MODE      : Byte = 10;

  p_MAINID    : Byte = 0;
  p_MAINNAME  : Byte = 1;
  p_SUBID     : Byte = 2;
  p_SUBNM     : Byte = 3;
  p_DETID     : Byte = 4;
  p_DETNM     : Byte = 5;
  p_SKILLRATE : Byte = 6;
  p_USEYY     : Byte = 7;
  p_USEMM     : Byte = 8;
  p_USE       : Byte = 9;
  p_MODE      : Byte = 10;

procedure DeleteRow(yourStringGrid: TStringGrid; ARow: Integer);
var i: Integer;
begin
    with yourStringGrid do
    begin
        for i := ARow to RowCount-1 do
        begin
            Rows[i].Assign(Rows[i+1]);
            RowHeights[i] := RowHeights[i+1];
        end;
        if RowCount > 2  then
            RowCount := RowCount - 1;
        if Cells[0,1] <> '' then
            for i := 1 to RowCount -1 do
                Cells[0,i] := IntToStr(i);
    end;
end;

function replace(mSrc: String; const mFromSrc: String; const mToSrc: String): String;
var
  iPos, iLenOfFrom: Integer;
  sImsi: String;
begin
    sImsi := mSrc;
    mSrc  := '';
    iLenOfFrom := Length(mFromSrc);

    while Pos(mFromSrc,sImsi) > 0 do
    begin
        iPos  := Pos(mFromSrc,sImsi);
        mSrc  := mSrc + copy(sImsi,1,iPos-1) + mToSrc;
        sImsi := copy(sImsi,iPos+iLenOfFrom,Length(sImsi)-iPos-iLenOfFrom+1);
    end;
    replace := mSrc + sImsi;
end;


end.
 