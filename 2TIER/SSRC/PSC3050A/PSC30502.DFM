�
 TFKYEMPNO 0_  TPF0	TFkyempnoFkyempnoLeft|TopBorderIcons BorderStylebsDialogCaption
�������ȸClientHeight�ClientWidthgColorclSilverFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSystem
Font.Style OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivatePixelsPerInch`
TextHeight TBitBtnBBrunLeftTopWidth8HeightHint�����ȸFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style 
ParentFontParentShowHintShowHint	TabOrderOnClick
BBrunClick
Glyph.Data
j  f  BMf      v   (               �                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwww��p  wwwww ��   wwwww   p  wwwww ��   wwwww��p  wwwww��p  wwwww ��   wwwww       ��www��p   xw ��   p p ���p  wpw  ��   wpww   p  wpww��p  wpww ��   wpwwwwwww  wp  wwwww  wpwwwwwww  wp  wwwww  wwwwwwwwww  LayoutblGlyphRight  TBitBtnBBcloseLeft|TopWidth;HeightHint�ݱ�Caption Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style 
ParentFontParentShowHintShowHint	TabOrderOnClickBBcloseClickKindbkCancel  TBitBtnBBchkoutLeft?TopWidth:HeightHint�������Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style 
ParentFontParentShowHintShowHint	TabOrderOnClickBBchkoutClick
Glyph.Data
j  f  BMf      v   (               �                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwwwwwwww  wwwwwwwwww  wwwwwwwwww  wwwwwwwww  wwp wwwwww  ww  wwwww  wp   wwwww  w    wwww  w  �  wwww  w 
z  www  w��w�  www  wzwwz  ww  wwwww�  ww  wwwwwz  w  wwwwww�  w  wwwwwwz  w  wwwwwww� w  wwwwwwwz w  wwwwwwww�w  wwwwwwwwww    TEditEempnoLeftTopWidthJHeightFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.Name����ü
Font.Style ImeName�ѱ���(�ѱ�)
ParentFontParentShowHintShowHintTabOrder 
OnKeyPressEempnoKeyPress  TDBGridDBGrid1LeftTop5Width`HeightL
DataSourceDSempnoFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style ImeName�ѱ���(�ѱ�)OptionsdgTitlesdgIndicator
dgColLines
dgRowLinesdgTabsdgRowSelectdgConfirmDeletedgCancelOnExit 
ParentFontTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclBlueTitleFont.Height�TitleFont.Name����üTitleFont.Style 
OnDblClickDBGrid1DblClick
OnKeyPressDBGrid1KeyPressColumns	AlignmenttaCenterExpanded	FieldNameEMPNOTitle.AlignmenttaCenterTitle.Caption�� ��Width*Visible	 	AlignmenttaCenterExpanded	FieldNameKORNAMETitle.AlignmenttaCenterTitle.Caption�� ��WidthAVisible	 	AlignmenttaCenterExpanded	FieldNameCORPNAMETitle.AlignmenttaCenterTitle.Captionȸ��Width-Visible	 	AlignmenttaCenterExpanded	FieldName	DIVSEQNUMTitle.AlignmenttaCenterTitle.Caption����Width!Visible	 	AlignmenttaCenterExpanded	FieldNamestclassNAMETitle.AlignmenttaCenterTitle.Caption�ֽı���WidthCVisible	 	AlignmenttaCenterExpanded	FieldNameCODENAMETitle.AlignmenttaCenterTitle.Caption��α��Width=Visible	    TRadioButtonRB1Left_TopWidth*HeightHint��ȸ��������Caption���Checked	ColorclSilverFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.Name����ü
Font.Style ParentColor
ParentFontParentShowHintShowHint	TabOrderTabStop	OnClickRB1Click  TRadioButtonRB2Left� TopWidth)HeightHint��ȸ��������Caption����ColorclSilverFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.Name����ü
Font.Style ParentColor
ParentFontParentShowHintShowHint	TabOrderOnClickRB1Click  TQueryQuery1OnCalcFieldsQuery1CalcFieldsDatabaseNamedperSQL.StringsESELECT EMPNO, KORNAME, CORPNAME, DIVSEQNUM, STCLASS, codename, stlorgFROM PSLMAS, pyccode,where codeid = 'K910' and stlorg = codeno(+) Left0Top�  TStringFieldQuery1EMPNO	FieldNameEMPNOOriginPSLMAS.EMPNOSize  TStringFieldQuery1KORNAME	FieldNameKORNAMEOriginPSLMAS.KORNAMESize  TStringFieldQuery1CORPNAME	FieldNameCORPNAMEOrigin"HPER.PSLMAS".CORPNAME  TFloatFieldQuery1DIVSEQNUM	FieldName	DIVSEQNUMOriginPSLMAS.DIVSEQNUM  TStringFieldQuery1STCLASS	FieldNameSTCLASSOriginPSLMAS.STCLASSVisibleSize  TStringFieldQuery1stclassNAME	FieldKindfkCalculated	FieldNamestclassNAME
Calculated	  TStringFieldQuery1CODENAME	FieldNameCODENAME  TStringFieldQuery1STLORG	FieldNameSTLORGVisibleSize   TDataSourceDSempnoDataSetQuery1LeftPTop�    