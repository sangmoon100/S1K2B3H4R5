unit UpitLib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls, Mask, Grids, DB, ComCtrls,
  peoutlookbtn, kpaylib;

  function  ReverseStr(mSrc: String): String;
  procedure fzSGAllClear(mStringGrid: TStringGrid);
  procedure fzSGInitialRow(mStringGrid: TStringGrid);
  procedure fzSGDeleteRow(mStringGrid: TStringGrid; ARow: Integer);
  procedure fzSGExchanges(AGrid: TStringGrid; Index1, Index2: Integer);
  function  fnSGLocate(mStringGrid: TStringGrid; mKey, mSch: String): Boolean;
  procedure fzSetOutLookBt(mPanel: TPanel; mOutLook: TPeJeonOutLookBtn; mGrayed: Boolean);
  function  Months_Between(mFrdate, mTodate: String): Integer;
  procedure fzSortGrid(Grid: TStringGrid);

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

  g_CHECK        : Byte = 0 ;
  g_SEQNO        : Byte = 1 ;
  g_KORNAME      : Byte = 2 ;
  g_EMPNO        : Byte = 3 ;
  g_ORGNUM       : Byte = 4 ;
  g_DEPTCODE     : Byte = 5 ;
  g_DEPTNAME     : Byte = 6 ;
  g_IMASPAYCL    : Byte = 7 ;
  g_IMASPAYCLNM  : Byte = 8 ;
  g_DUTYNO       : Byte = 9 ;
  g_JOBFIELD     : Byte = 10;
  g_JOBFIELDNM   : Byte = 11;
  g_DUTYKIND     : Byte = 12;
  g_DUTYKINDNM   : Byte = 13;
  g_DUTY         : Byte = 14;
  g_DUTYNM       : Byte = 15;
  g_DUTYTEXT     : Byte = 16;
  g_FRDUTYDATE   : Byte = 17;
  g_TODUTYDATE   : Byte = 18;
  g_DUTYTERM     : Byte = 19;
  g_DUTYTERMRATE : Byte = 20;
  g_DUTYYYMM     : Byte = 21;
  g_DUTYLEVEL    : Byte = 22;
  g_DUTYLEVELNM  : Byte = 23;
  g_PAYCL        : Byte = 24;
  g_PAYCLNM      : Byte = 25;
  g_EQIPCODE     : Byte = 26;
  g_EQIP         : Byte = 27;
  g_PROGCODE     : Byte = 28;
  g_PROG         : Byte = 29;
  g_LICKIND      : Byte = 30;
  g_LICE         : Byte = 31;
  g_SCHGRCODE    : Byte = 32;
  g_SCHGR        : Byte = 33;
  g_SCHCODE      : Byte = 34;
  g_SCHNM        : Byte = 35;
  g_MAJORCODE    : Byte = 36;
  g_MAJOR        : Byte = 37;
  g_TOEICSCORE   : Byte = 38;
  g_SEX          : Byte = 39;

implementation

function ReverseStr(mSrc: String): String;
var
  i: Integer;
  sTar: String;
begin
    sTar := mSrc;

    for i := 1 to Length(mSrc) do
        sTar[i] := Chr(256-Ord(mSrc[i]));
    ReverseStr := sTar;
end;

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

procedure fzSGAllClear(mStringGrid: TStringGrid);
var
  i, j: Integer;
begin
    with mStringGrid do
    begin
        for i := 0 to RowCount -1 do
            for j := 0 to ColCount -1 do
                Cells[j, i] := '';
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
        if RowCount > FixedRows+1  then
            RowCount := RowCount - 1;
    end;
end;

procedure fzSGExchanges(AGrid: TStringGrid; Index1, Index2: Integer);
var
  vTmpSG: TStringGrid;
begin
    vTmpSG := TStringGrid.Create(AGrid);
    vTmpSG.ColCount := AGrid.ColCount;
    vTmpSG.RowCount := 1;
    with AGrid do
    begin
        vTmpSG.Rows[0].Assign(Rows[Index1]);
        Rows[Index1].Assign(Rows[Index2]);
        Rows[Index2].Assign(vTmpSG.Rows[0]);
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

procedure fzSortGrid(Grid: TStringGrid);
var
  i, j: Integer;
  vTempSL: TStringList;
  vSrcSG, vTgtSG: TStringGrid;
begin
  TRY
    vTempSL := TStringList.Create;

    vSrcSG := TStringGrid.Create(Grid);
    vSrcSG.ColCount := Grid.ColCount;
    vSrcSG.RowCount := Grid.RowCount;

    vTgtSG := TStringGrid.Create(Grid);
    vTgtSG.ColCount := Grid.ColCount;
    vTgtSG.RowCount := Grid.RowCount;

    for i := 0 to Grid.RowCount -1 do
    begin
        vTempSL.Add(Grid.Cells[0,i] + Grid.Cells[2,i] +
                    Grid.Cells[4,i] + FormatFloat('00000000',i)); // Row 번호를 8자리로 지정함.
        vSrcSG.Rows[i].Assign(Grid.Rows[i]);
    end;

    vTempSL.Sort;

    for i := 0 to vTempSL.Count -1 do // Row 번호를 8자리로 지정함.
      vTgtSG.Rows[i].Assign(vSrcSG.Rows[strtoint(copy(vTempSL.Strings[i],length(vTempSL.Strings[i])-7,8))]);

    for i := 0 to vTempSL.Count -1 do // Row 번호를 8자리로 지정함.
      Grid.Rows[i].Assign(vTgtSG.Rows[i]);

  FINALLY
    vTempSL.Free;
    vSrcSG.Free;
    vTgtSG.Free;
  END;
end;

end.
