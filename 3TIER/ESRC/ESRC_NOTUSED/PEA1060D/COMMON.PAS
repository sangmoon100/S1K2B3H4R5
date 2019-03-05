unit common;

interface

uses Windows, Messages, SysUtils, Classes, ExtCtrls, StdCtrls;

     function GetKoreanCharPos(letter:string; WishCnt: Integer): Integer;
     function SetTextIntoMemo(pStrings:TStrings; str:string; nCount:integer): TStrings;
     function SetSqlText(sRebasdate, sGubun, sSgubun:string):string;

implementation


// TQRMemo에서 LineFeed를 하기위한 Position을 추출한다.
function GetKoreanCharPos(letter:string; WishCnt: Integer): Integer;
var
     i, msb : integer;
begin
     msb := 0;
     if  System.Length(letter) < WishCnt then
     begin
          GetKoreanCharPos := -1;
          Exit;
     end;

     for  i := 1 to WishCnt do
          if (Integer(letter[i]) and Integer($80)) = Integer($80) then     Inc(msb);
     if  (msb mod 2) = 0 Then     GetKoreanCharPos := WishCnt
     else                         GetKoreanCharPos := WishCnt -1;
end;

function SetLineFeedPos(pStrings:TStrings;Str:string):string;
var
     LineFeedStr  : string;
     nLineFeedPos : integer;
begin
     LineFeedStr  := Str;
     nLineFeedPos := Pos(#13, Str);
     if  nLineFeedPos > 0 then
     begin
          while nLineFeedPos > 0 do
          begin
               PStrings.Add(Copy(LineFeedStr,1,nLineFeedPos-1));
               LineFeedStr  := Copy(LineFeedStr,nLineFeedPos+2,Length(LineFeedStr));
               nLineFeedPos := Pos(#13, LineFeedStr);
          end;
     end
     else
     begin
          pStrings.Add(LineFeedStr);
          LineFeedStr := ''
     end;
     Result := LineFeedStr;
end;

// TQRMemo에서 String을 분할하여 강제 LineFeed
function SetTextIntoMemo(pStrings:TStrings;
  str:string; nCount:integer): TStrings;
var
     LimitLineStr, ExtraStr:string;
     nPos: integer;
begin
     try
          LimitLineStr := Str;
          ExtraStr := Str;
          nPos := GetKoreanCharPos(Str, nCount);
          if  nPos > 0 then
          begin
               while nPos > 0 do
               begin
                    ExtraStr     := Copy(LimitLineStr,nPos+1,Length(LimitLineStr));
                    LimitLineStr := Copy(LimitLineStr, 1, nPos);
                    LimitLineStr := SetLineFeedPos(pStrings,LimitLineStr);
                    LimitLineStr := LimitLineStr + ExtraStr;
                    nPos         := GetKoreanCharPos(LimitLineStr, nCount);
               end;
               if  Length(LimitLineStr) > 0 then
                    LimitLineStr := SetLineFeedPos(pStrings,LimitLineStr);
          end
          else
          begin
               if  Length(LimitLineStr) > 0 then     LimitLineStr := SetLineFeedPos(pStrings,Str)
               else                                  LimitLineStr := '';
          end;
          pStrings.Add(LimitLineStr);
     finally
          Result := pStrings;
     end;
end;

function SetSqlText(sRebasdate, sGubun, sSgubun:string):string;
begin
     Result := Format('SELECT value1, value2, value3  '+
                      '  FROM pehrebas                '+
                      ' WHERE reyear = ''%s''         '+
                      '   and gubun  = ''%s''         '+
                      '   and sgubun = ''%s''         ',
                       [sRebasDate, sGubun, sSGubun]);
end;

end.

// TQRMemo에서 String을 분할하여 강제 LineFeed
function SetTextIntoMemo(pStrings:TStrings;
  str:string; nCount:integer): TStrings;
var
     sStr,tmpStr:string;
     nPos,nLineFeedPos: integer;
     IsLineFeed:Boolean;
begin
     IsLineFeed  := False;
     try
          tmpStr := str;
          nPos   := GetKoreanCharPos(tmpStr, nCount);
          if  nPos <= 0 then
          begin
               sStr :=tmpStr;
               nLineFeedPos := Pos(#13, sStr);
               while nLineFeedPos > 0 do
               begin
                    if  nLineFeedPos = 1 then
                    begin
                         sStr := Copy(sStr,3,Length(sStr));
                    end
                    else
                    begin
                         pStrings.Add(Copy(sStr,1,nLineFeedPos-1));
                         sStr := Copy(sStr,nLineFeedPos+2, Length(sStr));
                    end;
                    nLineFeedPos := Pos(#13, sStr);
               end;
               if  Length(Trim(sStr)) > 0 then     pStrings.Add(Trim(sStr))
               else                                pStrings.Add('');
          end
          else
          begin
               nLineFeedPos := 0;
               While (nPos > 0) or (nLineFeedPos > 0) do
               begin
                    if  nLineFeedPos > 0 then sStr :=tmpStr
                    else if  nPos    > 0 then sStr :=Copy(tmpStr, 1, nPos);
                    nLineFeedPos    := Pos(#13, sStr);
                    while nLineFeedPos > 0 do
                    begin
                         IsLineFeed   := True;
                         if  nLineFeedPos = 1 then
                         begin
                              sStr    := Copy(sStr,3,Length(sStr));
                         end
                         else
                         begin
                              pStrings.Add(Copy(sStr,1,nLineFeedPos-1));
                              sStr    := Copy(sStr,nLineFeedPos+2, Length(sStr));
                         end;
                         nLineFeedPos := Pos(#13, sStr);
                    end;
                    if  IsLineFeed then
                    begin
                         IsLineFeed := False;
                         tmpStr     := Trim(sStr) + Trim(Copy(tmpStr, nPos+1, Length(tmpStr)));
                    end
                    else
                    begin
                         pStrings.Add(Copy(tmpStr, 1, nPos));
                         tmpStr  := Trim(Copy(tmpStr, nPos+1, Length(tmpStr)));
                    end;
                    nPos         := GetKoreanCharPos(tmpStr, nCount);
                    nLineFeedPos := Pos(#13, tmpStr);
               end;
               if  Length(tmpStr) > 0 then     pStrings.Add(tmpStr)
               else                            pStrings.Add('');
          end;
     finally
          Result := pStrings;
     end;
end;

