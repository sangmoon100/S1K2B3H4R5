�
 TFPKI30203 0?  TPF0
TFpki30203	Fpki30203Left� Top� Width�Height� ActiveControlDBGrid1Caption���ޱ�����ȸColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	
OnActivateFormActivatePixelsPerInch`
TextHeight TPanelPanel2Left Top(Width�Height}AlignalClientTabOrder  TDBGridDBGrid1LeftTopWidth�Height{AlignalClientColor��� 
DataSourceDataSource1Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name����
Font.Style ImeName�ѱ���(�ѱ�)OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclNavyTitleFont.Height�TitleFont.Name����üTitleFont.Style ColumnsExpanded	FieldNameDRVNAMEFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style Title.AlignmenttaCenterTitle.Caption
�����ݱ���Title.Color��� Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclPurpleTitle.Font.Height�Title.Font.Name����üTitle.Font.Style WidthuVisible	 	AlignmenttaCenterExpanded	FieldNameCODENAMEFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style Title.AlignmenttaCenterTitle.CaptionBANDfromTitle.Color��� Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclPurpleTitle.Font.Height�Title.Font.Name����üTitle.Font.Style Visible	 	AlignmenttaCenterExpanded	FieldName
CODENAME_1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style Title.AlignmenttaCenterTitle.CaptionBANDtoTitle.Color��� Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclPurpleTitle.Font.Height�Title.Font.Name����üTitle.Font.Style Width:Visible	 	AlignmenttaCenterExpanded	FieldName	DRVMAXCNTFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style Title.AlignmenttaCenterTitle.Caption����Ƚ��Title.Color��� Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclPurpleTitle.Font.Height�Title.Font.Name����üTitle.Font.Style Width<Visible	 Expanded	FieldNameDRVAMTFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style Title.AlignmenttaCenterTitle.Caption������Title.Color��� Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclPurpleTitle.Font.Height�Title.Font.Name����üTitle.Font.Style Visible	     TPanelPanel3Left Top� Width�Height,AlignalBottomTabOrder TBitBtnBBcloseLeft� TopWidth(Height(Caption�ݱ�Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style 
ParentFontTabOrder OnClickBBcloseClick
Glyph.Data
j  f  BMf      v   (               �                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwwwwwwww  ����������  ������x�  DDD ���DDD  wwt��Gww  wwt]P��Gww  wwt����Gww  wwt]P��Gww  wwt����Gww  wwt]P��Gww  wwt����Gww  wwt]P��Gww  wwt����Gww  wwt]P��Gww  wwt����Gww  wwtDDDDGww  wwwwwwwwww  wwwp  www  wwwp��www  wwwp  www  Layout
blGlyphTopMargin   TPanelPanel1Left Top Width�Height(AlignalTopTabOrder TPanelPanel29LeftmTopWidth� Height
BevelOuter	bvLoweredCaption���������� ���ޱ���ColorclNavyFont.CharsetHANGEUL_CHARSET
Font.ColorclWhiteFont.Height�	Font.Name����
Font.StylefsBold 
ParentFontTabOrder    TDataSourceDataSource1DataSetQuery1Left TopP  	TOraQueryQuery1SQL.Strings6select drvname,b.codename,c.codename,drvmaxcnt,drvamt $from pkcdrbas a,pyccode b,pyccode c 0where a.payclfr=b.codeno and a.payclto=c.codeno 'and b.codeid='I112' and c.codeid='I112' FetchAll	Left@TopP TStringFieldQuery1DRVNAME	FieldNameDRVNAMERequired	  TStringFieldQuery1CODENAME	FieldNameCODENAME  TStringFieldQuery1CODENAME_1	FieldName
CODENAME_1  TIntegerFieldQuery1DRVMAXCNT	FieldName	DRVMAXCNT  TIntegerFieldQuery1DRVAMT	FieldNameDRVAMT    