unit UpitLib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls, Mask, Grids, DB, ComCtrls,
  peoutlookbtn, kpaylib;

  procedure fzSGInitialRow(mStringGrid: TStringGrid);
  procedure fzSGDeleteRow(mStringGrid: TStringGrid; ARow: Integer);
  function  fnSGLocate(mStringGrid: TStringGrid; mKey, mSch: String): Boolean;
  procedure fzSetOutLookBt(mPanel: TPanel; mOutLook: TPeJeonOutLookBtn; mGrayed: Boolean);
  function  Months_Between(mFrdate, mTodate: String): Integer;

const
  clSELBRUSHCL: TColor = clActiveCaption;
  clSELFONTCL : TColor = clWhite;

  m_SEQNO        : Byte = 0;
  m_FRDUTYDATE   : Byte = 1;
  m_TODUTYDATE   : Byte = 2;
  m_DUTYDATE     : Byte = 3;
  m_DUTYYY       : Byte = 4;
  m_DUTYMM       : Byte = 5;
  m_DUTYYYMM     : Byte = 6;
  m_EMPNO        : Byte = 7;
  m_KORNAME      : Byte = 8;
  m_DUTYNO       : Byte = 9;
  m_JOBFIELD     : Byte = 10;
  m_JOBFIELDNM   : Byte = 11;
  m_DUTYKIND     : Byte = 12;
  m_DUTYKINDNM   : Byte = 13;
  m_DUTY         : Byte = 14;
  m_DUTYNM       : Byte = 15;
  m_DUTYTERMRATE : Byte = 16;
  m_DUTYTEXT     : Byte = 17;
  m_DUTYLEVEL    : Byte = 18;
  m_DUTYLEVELNM  : Byte = 19;
  m_PAYCL        : Byte = 20;
  m_PAYCLNM      : Byte = 21;
  m_MODE         : Byte = 22;

  e_MAINID    : Byte = 0;
  e_MAINNM    : Byte = 1;
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
  p_MAINNM    : Byte = 1;
  p_SUBID     : Byte = 2;
  p_SUBNM     : Byte = 3;
  p_DETID     : Byte = 4;
  p_DETNM     : Byte = 5;
  p_SKILLRATE : Byte = 6;
  p_USEYY     : Byte = 7;
  p_USEMM     : Byte = 8;
  p_USE       : Byte = 9;
  p_MODE      : Byte = 10;

implementation

function fnSGLocate(mStringGrid: TStringGrid; mKey, mSch: String): Boolean;
var
  sKey, sSch: String;
  i, iKey: Integer;
  bFind: Boolean;
begin
    Result := False;
    with mStringGrid do
    begin
        iKey := StrToInt(mKey);
        sSch := replace(mSch,';','');

        for i := FixedRows to RowCount -1 do
        begin
            if Cells[iKey, i] = sSch then
            begin
                bFind := True;
                Break;
            end;
        end;

        if bFind then
        begin
            Row := i;
            Result := True;
        end;
    end;
end;

procedure fzSGInitialRow(mStringGrid: TStringGrid);
var
  i, j: Integer;
begin
  with mStringGrid do
    begin
      RowCount := FixedRows + 1;
      for i := FixedRows to RowCount -1 do
        begin
          for j := FixedCols to ColCount -1 do
              Cells[j, i] := '';
          RowHeights[i] := DefaultRowHeight;
        end;
    end;
end;

procedure fzSGDeleteRow(mStringGrid: TStringGrid; ARow: Integer);
var i: Integer;
begin
    with mStringGrid do
    begin
        for i := ARow to RowCount-1 do
        begin
            Rows[i].Assign(Rows[i+1]);
            RowHeights[i] := RowHeights[i+1];
        end;
        if RowCount > 1  then
            RowCount := RowCount - 1;
    end;
end;

procedure fzSetOutLookBt(mPanel: TPanel; mOutLook: TPeJeonOutLookBtn; mGrayed: Boolean);
begin
    if mGrayed then
    begin
        mPanel.Color        := $00F2F3F4;
        mOutLook.Grayed     := mGrayed;
        mOutLook.Font.Color := clNavy;
    end
    else
    begin
        //mPanel.Color        := $00E6E8EA;
        //mOutLook.Grayed     := mGrayed;
        //mOutLook.Font.Color := clPurple;
        mPanel.Color        := clActiveCaption;
        mOutLook.Grayed     := mGrayed;
        mOutLook.Font.Color := clWhite;
    end;
end;

function Months_Between(mFrdate, mTodate: String): Integer;
var
  iFyy, iFmm, iTyy, iTmm: Integer;
begin
    iTyy := StrToIntDef(copy(mTodate,1,4),0);
    iTmm := StrToIntDef(copy(mTodate,5,2),0);
    iFyy := StrToIntDef(copy(mFrdate,1,4),0);
    iFmm := StrToIntDef(copy(mFrdate,5,2),0);

    Result := (iTyy - iFyy) * 12 + (iTmm - iFmm);
end;

end.
