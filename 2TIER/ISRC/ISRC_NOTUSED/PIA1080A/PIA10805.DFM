�
 TUPDEPTFORM 0|  TPF0TUpDeptForm
UpDeptFormLeft!Top� BorderIconsbiSystemMenu BorderStylebsSingleCaption�μ��ڵ� ����ClientHeight�ClientWidthAColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.Name����ü
Font.Style OldCreateOrder	PositionpoScreenCenterOnCreate
FormCreateOnPaint	FormPaintPixelsPerInch`
TextHeight 
TJeonPanel
JeonPanel1Left Top WidthAHeight,AlignalTop
BevelInnerbvRaisedColor��� InColorclGray	LineColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name����ü
Font.Style 
ParentFontTabOrder  TPanelPanel1Left	TopWidthMHeight
BevelInnerbvRaised
BevelOuter	bvLoweredCaption�μ��ڵ�Color�ح TabOrder   	TMaskEditdeptTagLeftXTop
Width8HeightAutoSizeColorclWhiteImeNameMicrosoft IME 2003	MaxLengthTabOrder
OnKeyPresscodeGridKeyPress  TPanelPanel3Left� TopWidthMHeight
BevelInnerbvRaised
BevelOuter	bvLoweredCaption�� �� ��Color�ح TabOrder  THanEditdeptnmLeft� Top
Width� HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name����ü
Font.Style ImeNameMicrosoft IME 2003
ParentFontTabOrder
OnKeyPresscodeGridKeyPress   
TJeonPanel
JeonPanel2Left TopoWidthAHeight1AlignalBottom
BevelInnerbvRaised
BevelOuter	bvLoweredColor��� InColorclGray	LineColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name����ü
Font.Style 
ParentFontTabOrder 	JeonShapeBrunLeftTopWidth1Height!Caption�� ��Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name����ü
Font.Style Color�� 
ParentFontOnClick	BrunClick  	JeonShapeBselLeftETopWidth1Height!Caption�� ��Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name����ü
Font.Style Color�� 
ParentFontOnClick	BselClick  	JeonShapeBexitLeftTopWidth1Height!Caption�� ��Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name����ü
Font.Style Color�� 
ParentFontOnClick
BexitClick   
TJeonPanel
JeonPanel3Left Top,WidthAHeightCAlignalClient
BevelOuterbvNoneColor��� InColorclGray	LineColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name����ü
Font.Style 
ParentFontTabOrder TDBGridcodeGridLeft Top WidthAHeightCTabStopAlignalClientBorderStylebsNoneColor��� Ctl3D
DataSourceDataSource1
FixedColor�� ImeNameMicrosoft IME 2003OptionsdgTitlesdgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit ParentCtl3DTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.Name����üTitleFont.Style OnDrawDataCellcodeGridDrawDataCell
OnDblClickcodeGridDblClick
OnKeyPresscodeGridKeyPress   TDataSourceDataSource1DataSetQDeptLeft�Top<  	TOraQueryQDeptSQL.Strings!SELECT ORGNUM,DEPTCODE,DEPTNAME, 6            FIELDCODE,DEPTNA1,DEPTNA2,DEPTNA3,ChanModeFROM PYCDEPTRWHERE ( (DEPTCODE like :Ldeptcode AND ORGNUM = :Lorg  AND DEPTNA1 like :ldeptnm ) U       OR  (DEPTCODE like :Ldeptcode AND ORGNUM = :Lorg  AND DEPTNA2 like :ldeptnm ) V       OR  (DEPTCODE like :Ldeptcode AND ORGNUM = :Lorg  AND DEPTNA3 like :ldeptnm ) ) LeftHTop� 	ParamDataDataType	ftUnknownName	Ldeptcode DataType	ftUnknownNameLorg DataType	ftUnknownNameldeptnm   TStringFieldQDeptDEPTCODEDisplayLabel	 �μ��ڵ�DisplayWidth	FieldNameDEPTCODESize  TStringFieldQDeptDEPTNAMEDisplayLabel	 �� �� ��DisplayWidthE	FieldNameDEPTNAMESize<  TStringFieldQDeptCHANMODEDisplayLabel	 ��������DisplayWidth
	FieldNameCHANMODESize  TStringFieldQDeptORGNUMDisplayLabel	 ��������DisplayWidth	FieldNameORGNUMVisibleSize    