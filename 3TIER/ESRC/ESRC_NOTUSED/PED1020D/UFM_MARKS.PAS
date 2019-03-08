unit UFM_Marks;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, peoutlookbtn, Db;

type
  TFM_Marks = class(TForm)
    M_Marks: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    BB_Close: TPeJeonOutLookBtn;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
  public
    { Public declarations }
  end;

var
  FM_Marks: TFM_Marks;

implementation

{$R *.DFM}

uses
  Hinsa_TmaxDM, UDown_Sub1, UDown_Sub2, HSubForm;

procedure TFM_Marks.FormShow(Sender: TObject);
var
  ParamVariant : String;
  Temp_Self01  : String;
  Temp_Self02  : String;
  Temp_Good    : String;
  Temp_Bad     : String;
  Temp_Recmd   : String;
  Temp_Marks   : String;
begin
  if FM_Marks.Tag = 1 then
  begin
    ParamVariant := 'SELECT nvl(A.mark1, '' '') self01, nvl(A.mark2, '' '') self02,  ' +
                    '       nvl(B.mark1, '' '') good  , nvl(B.mark2, '' '') bad   ,  nvl(B.mark3, '' '') recmd   ' +
                    '  FROM ' +
                    '    (SELECT Mark1, Mark2, rabasdate ' +
                    '      FROM pesms ' +
                    '     WHERE rabasdate = '''+sRabasdate+'''   ' +
                    '       AND empno     = '''+FDown_Sub1.var_empno+''')A, ' +
                    '     (SELECT Mark1, Mark2, Mark3, rabasdate ' +
                    '        FROM pesmla ' +
                    '       WHERE rabasdate = '''+sRabasdate+''' ' +
                    '         AND empno     = '''+FDown_Sub1.var_empno+'''  ' +
                    '         AND eempno    = '''+FDown_Sub1.Pempno+''')B   ' +
                    ' WHERE B.rabasdate   = A.rabasdate(+) ';

    with DataModule_Tmax.TMaxDataSet_HInsa do
    begin
      Close;
      ServiceName := 'PET1020A_seli';
      ClearFieldInfo;
      ClearParamInfo;
      AddField('SELF01'   , ftString  ,  300 );
      AddField('SELF02'   , ftString  ,  300 );
      AddField('GOOD'     , ftString  ,  300 );
      AddField('BAD'      , ftString  ,  300 );
      AddField('RECMD'    , ftString  ,  300 );
      SQL.Text := ParamVariant;
      Open;

      Temp_Self01 := FieldByName('self01').AsString;
      if Temp_Self01 <> '' then
        while Pos(#10#10, Temp_Self01) > 0 do // ORACLE에 저장된 #10#10 을 #13#10 으로 변환
          Temp_Self01 := SearchAndReplace(Temp_Self01, #10#10, #13#10);

      Temp_Self02 := FieldByName('self02').AsString;
      if Temp_Self02 <> '' then
        while Pos(#10#10, Temp_Self02) > 0 do
          Temp_Self02 := SearchAndReplace(Temp_Self02, #10#10, #13#10);

      Temp_Good   := FieldByName('good').AsString;
      if Temp_Good <> '' then
        while Pos(#10#10, Temp_Good) > 0 do
          Temp_Good := SearchAndReplace(Temp_Good, #10#10, #13#10);

      Temp_Bad    := FieldByName('bad').AsString;
      if Temp_Bad <> '' then
        while Pos(#10#10, Temp_Bad) > 0 do
          Temp_Bad := SearchAndReplace(Temp_Bad, #10#10, #13#10);

      Temp_Recmd  := FieldByName('recmd').AsString;
      if Temp_Recmd <> '' then
        while Pos(#10#10, Temp_Recmd) > 0 do
          Temp_Recmd := SearchAndReplace(Temp_Recmd, #10#10, #13#10);

{
      M_Marks.Lines.Text := '※ 피평가자 종합의견 ※'                   + #13 +
                            '- 능력 또는 태도변화가 필요한 사항 -'      + #13 +
                            Temp_Self01                                 + #13#13 +
                            '----------------------------------------------------------------------' + #13+
                            '- 실행계획-'                               + #13 +
                            Temp_Self02                                 + #13#13#13 +
                            '======================================================================' + #13+
                            '※ 1차평가자 종합의견 ※'                  + #13 +
                            '- 전반적인 장점 -'                         + #13 +
                            Temp_Good                                   + #13#13 +
                            '----------------------------------------------------------------------' + #13+
                            '- 전반적인 약점 -'                         + #13 +
                            Temp_Bad                                    + #13#13 +
                            '----------------------------------------------------------------------' + #13+
                            '- 능력개발방안 추천 -'                     + #13 +
                            Temp_Recmd ;
}
      M_Marks.Lines.Text :=
                            '======================================================================' + #13+
                            '※ 피평가자 종합의견 ※'                   + #13 +
                            '======================================================================' + #13+
                            '-- 능력 또는 태도변화가 필요한 사항 ----------------------------------' + #13+
                            Temp_Self01                                 + #13#13 +
                            '-- 실행계획-----------------------------------------------------------' + #13+
                            Temp_Self02                                 + #13#13#13 +
                            '======================================================================' + #13+
                            '※ 1차평가자 종합의견 ※'                  + #13 +
                            '======================================================================' + #13+
                            '-- 전반적인 장점 -----------------------------------------------------' + #13+
                            Temp_Good                                   + #13#13 +
                            '-- 전반적인 약점 -----------------------------------------------------' + #13+
                            Temp_Bad                                    + #13#13 +
                            '-- 능력개발방안 추천 -------------------------------------------------' + #13+
                            Temp_Recmd ;
    end;
  end
  else
  begin
    ParamVariant := 'SELECT nvl(A.mark1,'' '') self01, nvl(A.mark2, '' '') self02,   ' +
                    '       nvl(B.mark1,'' '') good  , nvl(B.mark2, '' '') bad   ,   ' +
                    '       nvl(B.mark3,'' '') recmd , nvl(C.mark, '' '')  marks     ' +
                    '  FROM  ' +
                    '    (SELECT Mark1, Mark2, rabasdate ' +
                    '       FROM pesms ' +
                    '      WHERE rabasdate = '''+sRabasdate+''' ' +
                    '        AND empno     = '''+FDown_Sub2.var_empno+''')A, ' +
                    '    (SELECT Mark1, Mark2, Mark3, rabasdate ' +
                    '       FROM pesmla ' +
                    '      WHERE rabasdate = '''+sRabasdate+''' ' +
                    '        AND empno     = '''+FDown_Sub2.var_empno+''' ' +
                    '        AND eempno    = '''+FDown_Sub2.var_FistEmp+''')B, ' +
                    '    (SELECT Mark, rabasdate ' +
                    '       FROM pesmlb ' +
                    '      WHERE rabasdate = '''+sRabasdate+''' ' +
                    '        AND empno     = '''+FDown_Sub2.var_empno+''' ' +
                    '        AND eempno    = '''+FDown_Sub2.Pempno+''')C  ' +
                    '  WHERE C.rabasdate   = A.rabasdate(+)    ' +
                    '    AND C.rabasdate   = B.rabasdate(+) ';

    with DataModule_Tmax.TMaxDataSet_HInsa do
    begin
      Close;
      ServiceName := 'PET1020A_selj';
      ClearFieldInfo;
      ClearParamInfo;
      AddField('SELF01'   , ftString  ,  300 );
      AddField('SELF02'   , ftString  ,  300 );
      AddField('GOOD'     , ftString  ,  300 );
      AddField('BAD'      , ftString  ,  300 );
      AddField('RECMD'    , ftString  ,  300 );
      AddField('MARKS'    , ftString  ,  300 );
      SQL.Text := ParamVariant;
      Open;

      Temp_Self01 := FieldByName('self01').AsString;
      if Temp_Self01 <> '' then
        while Pos(#10#10, Temp_Self01) > 0 do // ORACLE에 저장된 #10#10 을 #13#10 으로 변환
          Temp_Self01 := SearchAndReplace(Temp_Self01, #10#10, #13#10);

      Temp_Self02 := FieldByName('self02').AsString;
      if Temp_Self02 <> '' then
        while Pos(#10#10, Temp_Self02) > 0 do
          Temp_Self02 := SearchAndReplace(Temp_Self02, #10#10, #13#10);

      Temp_Good   := FieldByName('good').AsString;
      if Temp_Good <> '' then
        while Pos(#10#10, Temp_Good) > 0 do
          Temp_Good := SearchAndReplace(Temp_Good, #10#10, #13#10);

      Temp_Bad    := FieldByName('bad').AsString;
      if Temp_Bad <> '' then
        while Pos(#10#10, Temp_Bad) > 0 do
          Temp_Bad := SearchAndReplace(Temp_Bad, #10#10, #13#10);

      Temp_Recmd  := FieldByName('recmd').AsString;
      if Temp_Recmd <> '' then
        while Pos(#10#10, Temp_Recmd) > 0 do
          Temp_Recmd := SearchAndReplace(Temp_Recmd, #10#10, #13#10);

      Temp_Marks  := FieldByName('marks').AsString;
      if Temp_Marks <> '' then
        while Pos(#10#10, Temp_Marks) > 0 do
          Temp_Marks := SearchAndReplace(Temp_Marks, #10#10, #13#10);

      M_Marks.Lines.Text := '※ 피평가자 종합의견 ※'                   + #13 +
                            '- 능력 또는 태도변화가 필요한 사항 -'      + #13 +
                            Temp_Self01                                 + #13#13 +
                            '----------------------------------------------------------------------' + #13+
                            '- 실행계획-'                               + #13 +
                            Temp_Self02                                 + #13#13#13 +
                            '======================================================================' + #13+
                            '※ 1차평가자 종합의견 ※'                  + #13 +
                            '- 전반적인 장점 -'                         + #13 +
                            Temp_Good                                   + #13#13 +
                            '----------------------------------------------------------------------' + #13+
                            '- 전반적인 약점 -'                         + #13 +
                            Temp_Bad                                    + #13#13 +
                            '----------------------------------------------------------------------' + #13+
                            '- 능력개발방안 추천 -'                     + #13 +
                            Temp_Recmd                                  + #13#13#13 +
                            '======================================================================' + #13+
                            '※ 2차 평가자 종합의견 ※'                 + #13 +
                            Temp_Marks ;
    end;
  end;
end;

function TFM_Marks.SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
var
  nPos,
  nLenLookFor : integer;
begin
  nPos        := Pos(sLookFor, sSrc);
  nLenLookFor := Length(sLookFor);
  while(nPos > 0)do
  begin
    Delete( sSrc, nPos, nLenLookFor );
    Insert( sReplaceWith, sSrc, nPos );
    nPos := Pos( sLookFor, sSrc );
  end;
  Result := sSrc;
end;

procedure TFM_Marks.BB_CloseClick(Sender: TObject);
begin
  modalresult := mrcancel;
end;

end.

