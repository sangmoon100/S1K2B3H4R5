�
 TFM_CODEGEN 0�*  TPF0TFM_CodeGen
FM_CodeGenLeft� TopmActiveControlCB_CheckBorderStylebsSingleCaptionCode GeneratorClientHeight�ClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TLabelLabel1Left�Top2WidthtHeightCaption>�� ������ �ʵ��� ������� ��Ȯ�� �������� �ʰ� ����.(Ȯ�ο��)Font.CharsetANSI_CHARSET
Font.ColorclRedFont.Height�	Font.Name����ü
Font.Style 
ParentFont  TOnFocusButtonBT_CloseLeft!TopWidthdHeightCaption�� ��Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name����ü
Font.StylefsBold 
ParentFontTabOrder OnClickBT_CloseClick	BaseColor��� 	MsgResult 	AlignmenttaCenter
TextLayouttlCenterGlyph.MarginDisableColorclWindowTextSelLineColor���   TPageControlPageControl1LeftTopFWidth�Height�
ActivePage	TabSheet1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder 	TTabSheet	TabSheet1Caption
SQL Editor TOnMemo	E_SqlMemoLeftTopWidthxHeightuFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name������
Font.Style ImeNameMicrosoft IME 2003
ParentFontTabOrder 	AlignmenttaLeftJustifyReadOnlyEditDisableColor.BackColorclGrayEditDisableColor.TextColorclWhiteEditLabel.AlignmenttaCenterEditLabel.CaptionSQLEditLabel.WidthEditLabel.Color	clBtnFaceEditLabel.BorderColorclBlackEditLabel.Font.CharsetDEFAULT_CHARSETEditLabel.Font.ColorclWindowTextEditLabel.Font.Height�EditLabel.Font.Name������EditLabel.Font.Style EditLabel.Styleedit_lsSingleEditLabel.CaptionStyleedit_csNoneEditStyle.FocusColorclWindowEditStyle.KillColorclWindowEditStyle.BorderColorclBlackEditStyle.BorderHotColorclBlackEditStyle.BorderStyleedit_bsSingleEditStyle.BorderHotStyleedit_bsDblSingleEditStyle.ButtonStyleedit_bvsFlatEditStyle.Edgesedit_dgLeft
edit_dgTopedit_dgRightedit_dgBottom EditStyle.HotTrack	EditInputMode.IMEkindedit_hmHangulEditInputMode.EnglishOnlyLines.Strings-Select Nvl(        A.Empno      ,' ') Empno, /       Nvl(        A.Korname    ,' ') Korname, .       Nvl(        A.Orgnum     ,' ') Orgnum, /       Nvl(        A.Jobdept    ,' ') Jobdept, /       Nvl(        A.Boncode    ,' ') Boncode, /       Nvl(        B.Deptname   ,' ') Deptname "  From Pimpmas A, Pycdept B       ! Where A.Orgnum  = B.Orgnum      !   And A.Jobdept = B.Deptcode       And A.Pstate < '80'Q   And A.Orgnum = (Select Value1 From Pimvari Where Gubun='00' And Sgubun='0001') Order By Empno   TDBGridDBGrid1LeftTop}WidthxHeight� Ctl3D
DataSourceDataSource1ImeNameMicrosoft IME 2003Options	dgEditingdgAlwaysShowEditordgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExit ParentCtl3DTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    	TTabSheet	TabSheet2Caption	Tmax Code
ImageIndex TOnMemo
E_TmaxCodeLeftTopWidth2Height&Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name������
Font.Style ImeNameMicrosoft IME 2003
ParentFontTabOrder 	AlignmenttaLeftJustifyReadOnlyEditDisableColor.BackColorclGrayEditDisableColor.TextColorclWhiteEditLabel.AlignmenttaCenterEditLabel.CaptionTmaxEditLabel.Width(EditLabel.Color	clBtnFaceEditLabel.BorderColorclBlackEditLabel.Font.CharsetDEFAULT_CHARSETEditLabel.Font.ColorclWindowTextEditLabel.Font.Height�EditLabel.Font.Name������EditLabel.Font.Style EditLabel.Styleedit_lsSingleEditLabel.CaptionStyleedit_csNoneEditStyle.FocusColorclWindowEditStyle.KillColorclWindowEditStyle.BorderColorclBlackEditStyle.BorderHotColorclBlackEditStyle.BorderStyleedit_bsSingleEditStyle.BorderHotStyleedit_bsDblSingleEditStyle.ButtonStyleedit_bvsFlatEditStyle.Edgesedit_dgLeft
edit_dgTopedit_dgRightedit_dgBottom EditStyle.HotTrack	EditInputMode.IMEkindedit_hmHangulEditInputMode.EnglishOnlyLines.Strings
E_TmaxCode    	TTabSheet	TabSheet3CaptionDelphi Code
ImageIndex TOnMemo	E_DelCodeLeftTopWidth3Height&Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name������
Font.Style ImeNameMicrosoft IME 2003
ParentFontTabOrder 	AlignmenttaLeftJustifyReadOnlyEditDisableColor.BackColorclGrayEditDisableColor.TextColorclWhiteEditLabel.AlignmenttaCenterEditLabel.CaptionTmaxEditLabel.Width(EditLabel.Color	clBtnFaceEditLabel.BorderColorclBlackEditLabel.Font.CharsetDEFAULT_CHARSETEditLabel.Font.ColorclWindowTextEditLabel.Font.Height�EditLabel.Font.Name������EditLabel.Font.Style EditLabel.Styleedit_lsSingleEditLabel.CaptionStyleedit_csNoneEditStyle.FocusColorclWindowEditStyle.KillColorclWindowEditStyle.BorderColorclBlackEditStyle.BorderHotColorclBlackEditStyle.BorderStyleedit_bsSingleEditStyle.BorderHotStyleedit_bsDblSingleEditStyle.ButtonStyleedit_bvsFlatEditStyle.Edgesedit_dgLeft
edit_dgTopedit_dgRightedit_dgBottom EditStyle.HotTrack	EditInputMode.IMEkindedit_hmHangulEditInputMode.EnglishOnlyLines.Strings	E_DelCode     TOnEditE_ServiceNameLeftTop(Width� HeightFont.CharsetHANGEUL_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name����ü
Font.Style ImeNameMicrosoft IME 2003
ParentFontTabOrderTextPEZ1010A_sel1OnExitE_ServiceNameExit	AlignmenttaLeftJustifyAutoSizeReadOnlyEditDisableColor.BackColorclGrayEditDisableColor.TextColorclWhiteEditLabel.AlignmenttaCenterEditLabel.Caption	���� ��EditLabel.WidthPEditLabel.Color	clBtnFaceEditLabel.BorderColorclBlackEditLabel.Font.CharsetDEFAULT_CHARSETEditLabel.Font.ColorclWindowTextEditLabel.Font.Height�EditLabel.Font.Name������EditLabel.Font.StylefsBold EditLabel.Styleedit_lsSingleEditLabel.CaptionStyleedit_csNoneEditStyle.FocusColorclWindowEditStyle.KillColorclWindowEditStyle.BorderColorclBlackEditStyle.BorderHotColorclBlackEditStyle.BorderStyleedit_bsSingleEditStyle.BorderHotStyleedit_bsDblSingleEditStyle.ButtonStyleedit_bvsFlatEditStyle.Edgesedit_dgLeft
edit_dgTopedit_dgRightedit_dgBottom EditStyle.HotTrack	EditInputMode.IMEkindedit_hmHangulEditInputMode.EnglishOnly  TOnCheckBoxCB_CheckLeft{Top
WidthlHeightCursorChecked	CaptionSQL���� ����TabOrderTabStop	  TOnCheckBox	CB_SelectLeft�Top
Width|HeightCursorColorDisableFont��� CaptionDML ���� MakeEnabledTabOrderTabStop	  TOnCheckBoxCB_NvlLeft� Top
WidthxHeightCursorChecked	Caption�ʵ忡 NVLó����TabOrderTabStop	  TOnCheckBoxCB_OneLeftrTop
WidthmHeightCursorChecked	Caption��Ƽ Fetch����TabOrderTabStop	  TOnFocusButtonBT_SqlExcute1TagLeft	TopWidthdHeightCaptionSQL����Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name����ü
Font.StylefsBold 
ParentFontTabOrderOnClickBT_SqlExcute1Click	BaseColor��� 	MsgResult 	AlignmenttaCenter
TextLayouttlCenterGlyph.MarginDisableColorclWindowTextSelLineColor���   TOnComboEdit
E_ProgrmerLeft� Top(Width� HeightFont.CharsetHANGEUL_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name����ü
Font.Style ImeNameMicrosoft IME 2003
ParentFontTabOrderOnExitE_ServiceNameExit	AlignmenttaLeftJustifyAutoSizeIgnoreMaskBlankReadOnlyEditDisableColor.BackColorclGrayEditDisableColor.TextColorclWhiteEditLabel.AlignmenttaCenterEditLabel.Caption	������ ��EditLabel.WidthPEditLabel.Color	clBtnFaceEditLabel.BorderColorclBlackEditLabel.Font.CharsetDEFAULT_CHARSETEditLabel.Font.ColorclWindowTextEditLabel.Font.Height�EditLabel.Font.Name������EditLabel.Font.StylefsBold EditLabel.Styleedit_lsSingleEditLabel.CaptionStyleedit_csNoneEditStyle.FocusColorclWindowEditStyle.KillColorclWindowEditStyle.BorderColorclBlackEditStyle.BorderHotColorclBlackEditStyle.BorderStyleedit_bsSingleEditStyle.BorderHotStyleedit_bsDblSingleEditStyle.ButtonStyleedit_bvsSimpleEditStyle.Edgesedit_dgLeft
edit_dgTopedit_dgRightedit_dgBottom EditStyle.HotTrack	EditInputMode.IMEkindedit_hmHangulEditInputMode.EnglishOnlyEditComboStyle.ColorBar  @ EditComboStyle.ColorOdd	clBtnFaceEditComboStyle.ColorEven��� EditComboStyle.ColorsOddEvenEditComboStyle.Imageposlb_imageleftEditComboStyle.BarStyle
lb_bsColorEditComboStyle.BarFont.CharsetDEFAULT_CHARSETEditComboStyle.BarFont.ColorclWhiteEditComboStyle.BarFont.Height�EditComboStyle.BarFont.Name����üEditComboStyle.BarFont.Style EditComboStyle.List3DEditComboStyle.AlignmenttaLeftJustifyButtonGlyph.Bitmap.Data
�  �  BM�      6   (                �                   ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��                                                      ��  ��     ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ���      ��  ��     ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ���      ��  ��     ��� ��� ��� ��� ���     ��� ��� ��� ��� ���      ��  ��     ��� ��� ��� ���             ��� ��� ��� ���      ��  ��     ��� ��� ���                     ��� ��� ���      ��  ��     ��� ���                             ��� ���      ��  ��     ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ���      ��  ��     ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ���      ��  ��                                                      ��  ��      ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��      ��  ��      ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��      ��  ��                                                      ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �� ButtonColor	clBtnFaceButtonWidthDropDownItemHeight 	ItemIndex�Items.Strings����������������������������� ImmediatePopup  TDataSourceDataSource1DataSetQ_GridLeftXTop�  	TOraQueryQ_GridSQL.Strings0SELECT REPDATE, SCSEQ, EMPNO, KORNAME, SCHOOL,  5       SUBJECTNAME, APPYYYYMM, STYYYYMM, ENDYYYYMM,  3	   SEQNUM, LENDAMT, MONEXCAMT, EXCAMT, ODDEXCAMT, 2	    ENDYN, WRITETIME, WRITEMAN, REPKIND, BLENDAMT FROM PKHSCHIS 	FetchRows�FetchAll	LeftTop�  
TOnMemData	Mem_ParamIndexes SortOptions Left�Top TStringFieldMem_ParamFieldName	FieldName	FieldNameSize  TIntegerFieldMem_ParamFieldSize	FieldName	FieldSize  TStringFieldMem_ParamFieldType	FieldName	FieldTypeSize
   
TOnMemDataMem_DataIndexes SortOptions Left'Top TStringFieldMem_DataFieldName	FieldName	FieldNameSize  TIntegerFieldMem_DataFieldSize	FieldName	FieldSize  TStringFieldMem_DataFieldType	FieldName	FieldTypeSize
    