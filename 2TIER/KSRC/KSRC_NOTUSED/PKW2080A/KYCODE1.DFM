�
 TFKYCODE1 0,  TPF0	TFkycode1Fkycode1Left� Top� BorderIcons BorderStylebsDialogClientHeightyClientWidthKColorclSilverFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivatePixelsPerInch`
TextHeight TDBGridcodeGridLeftTop7WidthFHeight=TabStopColorclWhite
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style ImeName�ѱ���(�ѱ�)OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclBlueTitleFont.Height�TitleFont.Name����üTitleFont.Style 
OnDblClickcodeGridDblClick
OnKeyPresscodeGridKeyPressColumnsExpanded	FieldNameCODENOTitle.AlignmenttaCenterTitle.Caption��   ��Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclBlueTitle.Font.Height�Title.Font.Name����üTitle.Font.Style WidthgVisible	 Expanded	FieldNameCODENAMETitle.AlignmenttaCenterTitle.Caption��   ��   ��Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclBlueTitle.Font.Height�Title.Font.Name����üTitle.Font.Style Width� Visible	    TBitBtnBBcloseLeft� TopWidthPHeightHint�ݱ�Caption Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style 
ParentFontParentShowHintShowHint	TabOrderTabStopOnClickBBcloseClickKindbkCancel  TBitBtnBBrunLeft|TopWidthPHeightHint�ڷἱ��Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style ModalResult
ParentFontParentShowHintShowHint	TabOrderTabStopOnClickcodeGridDblClick
Glyph.Data
�  �  BM�      v   (   $            h                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C3333333733333  33B$3333333s7�3333  34""C333337333333  3B""$33333s337�333  4"*""C3337�7�3333  2"��"C3337�s3333  :*3:"$3337�37�7�33  3�33�"C333s33333  3333:"$3333337�7�3  33333�"C33333333  33333:"$3333337�7�  333333�"C3333333  333333:"C3333337�  3333333�#3333333s  3333333:3333333373  333333333333333333  Layout
blGlyphTopMargin	NumGlyphsSpacing�	IsControl	  	TMaskEditCodenoLeft+TopWidth� HeightCharCaseecUpperCaseColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.Name����ü
Font.Style ImeName�ѱ���(�ѱ�)
ParentFontTabOrder 
OnKeyPressCodenoKeyPress  TBitBtnBBchkoutLeft*TopWidthPHeightHint�ڷ���ȸFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style 
ParentFontParentShowHintShowHint	TabOrderTabStopOnClickBBchkoutClick
Glyph.Data
j  f  BMf      v   (               �                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwww��p  wwwww ��   wwwww   p  wwwww ��   wwwww��p  wwwww��p  wwwww ��   wwwww       ��www��p   xw ��   p p ���p  wpw  ��   wpww   p  wpww��p  wpww ��   wpwwwwwww  wp  wwwww  wpwwwwwww  wp  wwwww  wwwwwwwwww  Layout
blGlyphTopMarginSpacing�	IsControl	  TRadioButtonRBcodeLeft� TopWidth)HeightHint��ȸ����Caption�ڵ�Checked	Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.Name����ü
Font.Style 
ParentFontParentShowHintShowHint	TabOrderTabStop	OnClickRBcodeClick  TRadioButtonRBnameLeft� TopWidth#HeightHint��ȸ����Caption��Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.Name����ü
Font.Style 
ParentFontParentShowHintShowHint	TabOrderOnClickRBcodeClick  TDataSourceDataSource1DataSet
QueryBcodeLeft� Top  	TOraQuery
QueryBcodeSQL.StringsSELECT PYCCODE."CODEID" ,  PYCCODE."CODENO" ,  PYCCODE."CODENAME", PYCCODE."CODEFNAME"FROM PYCCODE%WHERE ( PYCCODE."CODEID" = :lcode AND+               PYCCODE."CODENO" like :lno ) FetchAll	Left� Top	ParamDataDataType	ftUnknownNamelcode DataType	ftUnknownNamelno   TStringFieldQueryBcodeCODENO	FieldNameCODENOSize
  TStringFieldQueryBcodeCODENAME	FieldNameCODENAME  TStringFieldQueryBcodeCODEFNAME	FieldName	CODEFNAMESize    