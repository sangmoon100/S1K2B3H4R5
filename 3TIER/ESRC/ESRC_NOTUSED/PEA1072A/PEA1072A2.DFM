�
 TCODEFORM 0�  TPF0	TCodeFormCodeFormLeft'Top4BorderIconsbiSystemMenu
biMinimize BorderStylebsNoneCaption
[������ȸ]ClientHeight�ClientWidth�Color	clBtnFaceFont.CharsetHANGEUL_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name����ü
Font.Style 	Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���                     �           ���              ��������       �              �wwwp         ��w� ��       ��ww����      ��w{�������  ���w{������     �w{������       ww������       wwwww����       wp ww��         � p ��      wp�� ���      w{ ���        ww{���� ��      wp��������      7 w�������      S3�;;���    ����S 33��    ����S ��30    ����P��SP    ����  ��U P   ���������      ���������      ����������      �����������     �����������     ����������      �� ������      ������  ?�  �  �  ?�  >      �   �  �  �� �� �  �  �  �  �  �  �  �  �  �  �  �  �   �  �  �� ���OldCreateOrder	PositionpoScreenCenterScaledOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TOnGrDbGridRunGridLeft TopWidth�Height}CursorColor	clBtnFaceCtl3D
DataSourceDataSource1
FixedColor��� ImeName�ѱ��� �Է� �ý��� (IME 2000)OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgConfirmDeletedgCancelOnExit ParentCtl3DTabOrder TitleFont.CharsetHANGEUL_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.Name����üTitleFont.Style BarColor��� BarMultiColor��T BarFont.CharsetHANGEUL_CHARSETBarFont.ColorclNavyBarFont.Height�BarFont.Name������BarFont.StylefsBold BarStyle	tbsRaised	TitleSize	EvenColor��� OddColor��� WrappingAllowRowSizeIndicatorWidthList3DSortMarkRecordCountVisibleDefaultRowHeightFooterHeight Columns	AlignmenttaCenterExpanded	FieldNameEMPNOTitle.AlignmenttaCenterTitle.Caption���Title.Font.CharsetHANGEUL_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.Name����üTitle.Font.StylefsBold Width4Visible	 	AlignmenttaCenterExpanded	FieldNameKORNAMETitle.AlignmenttaCenterTitle.Caption����Title.Font.CharsetHANGEUL_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.Name����üTitle.Font.StylefsBold WidthNVisible	 	AlignmenttaCenterExpanded	FieldName	PAYCLNAMETitle.AlignmenttaCenterTitle.Caption��åTitle.Font.CharsetHANGEUL_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.Name����üTitle.Font.StylefsBold Visible	 	AlignmenttaCenterExpanded	FieldNameDEPTNAMETitle.AlignmenttaCenterTitle.Caption�μ���Title.Font.CharsetHANGEUL_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.Name����üTitle.Font.StylefsBold WidthPVisible	 Expanded	FieldNameprogTitle.Caption�������Title.Font.CharsetHANGEUL_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.Name����üTitle.Font.StylefsBold WidthHVisible	 Expanded	FieldNameRESULTSCRGRADETitle.Caption�������Title.Font.CharsetHANGEUL_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.Name����üTitle.Font.StylefsBold WidthBVisible	 Expanded	FieldName
FINALGRADETitle.Caption�������Title.Font.CharsetHANGEUL_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.Name����üTitle.Font.StylefsBold WidthCVisible	 Expanded	FieldNameNOWBANDTitle.Caption��BANDTitle.Font.CharsetHANGEUL_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.Name����üTitle.Font.StylefsBold WidthEVisible	 Expanded	FieldNameNEXTBANDTitle.Caption����BANDTitle.Font.CharsetHANGEUL_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.Name����üTitle.Font.StylefsBold Visible	 Expanded	FieldName
E1valconynTitle.Caption�������Title.Font.CharsetHANGEUL_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.Name����üTitle.Font.StylefsBold Width Visible	    TPanelPanel1Left Top Width�HeightAlignalTopTabOrder TLabelCodeKindLeftTopWidth[HeightCaption[ �� �� �� ȸ ]Font.CharsetHANGEUL_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name������
Font.StylefsBold 
ParentFont   TPanelPanel2Left Top�Width�Height(AlignalBottomTabOrder TOnFocusButton	BT_cancelLeft*TopWidthNHeightCaption�ݱ�Font.CharsetHANGEUL_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name������
Font.StylefsBold ModalResult
ParentFontTabOrder OnClickBT_cancelClick	BaseColorw}� 	MsgResult 	AlignmenttaCenter
TextLayouttlCenterGlyph.MarginDisableColorclWindowTextSelLineColor���    TMemoMemo1Left Top(Width�HeightiImeNameMicrosoft IME 2003Lines.StringsMemo1 TabOrderVisible  TDataSourceDataSource1DataSetTDS1Left Topq  TTMaxDataSetTDS1	FieldInfo 	ParamInfo SessionFM_Main.TMaxSession	BatchRows� LogWriteSQL.Strings<SELECT A.EMPNO, A.KORNAME, C.CODENAME PAYCLNAME, B.DEPTNAME,S       decode(A.E1valconyn, 'Y','��?�Ƣ���?��?','��?��?�Ƣ�') prog, A.E1valconyn , Y       Substr(F.RESULTSCRGRADE,1,1) RESULTSCRGRADE, Substr(F.FINALGRADE,1,1) FINALGRADE, [       (Select codename from pyccode where codeid = 'I112' and codeno = F.paycl)  NOWBAND, [       (Select codename from pyccode where codeid = 'I112' and codeno = F.npaycl) NEXTBAND LFROM  PEHREMAS A, PYCDEPT B, PYCCODE C, PYCCODE D, PYCCODE E, PEHEVHIS F    PWHERE  A.RABASDATE= '20121130'                                                  J  AND  A.RESTIYN  = 'Y'                                                   L  AND  A.DEPTCODE = B.DEPTCODE                                              L  AND  A.ORGNUM   = B.ORGNUM                                                J  AND  A.PAYCL    = C.CODENO(+) AND C.CODEID(+) = 'I112'                  J  AND  A.JOBGUN   = D.CODENO(+) AND D.CODEID(+) = 'I115'                  J  AND  A.PAYRA    = E.CODENO(+) AND E.CODEID(+) = 'I113'                  P  AND  A.empno    in  (select empno from petremas where rabasdate = '20121130')   AND  A.EMPNO    = F.EMPNO    AND  F.RABASYEAR = '2012'  XA_modService	UseMemoryLeftHTopr   