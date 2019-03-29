object Fpie20703: TFpie20703
  Left = 6
  Top = 18
  Width = 787
  Height = 552
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  VertScrollBar.Position = 45
  AutoScroll = False
  Caption = 'Fpie20703'
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = '±¼¸²Ã¼'
  Font.Style = []
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 19
    Top = 14
  end
  object Query1: TQuery
    DatabaseName = 'dper'
    Left = 59
    Top = 14
  end
  object Query2: TQuery
    DatabaseName = 'dper'
    Left = 139
    Top = 14
  end
  object QReport: TQuickRep
    Dataset = Query1
    BeforePrint = QReportBeforePrint
    Page.Columns = 1
    Page.Orientation = poPortrait
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Page.PaperSize = A4
    object QRDetail: TQRBand
      Height = 944
      BandType = rbDetail
      Color = clWhite
      ForceNewPage = False
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      object QRShape1: TQRShape
        Left = 228
        Top = 59
        width = 297
        Height = 49
        Shape = qrsRectangle
      end
      object QRLabel1: TQRLabel
        Left = 262
        Top = 70
        Width = 234
        Height = 27
        Alignment = taCenter
        Caption = '¿¬±¸¼Ò ÀÎ·Â ÇöÈ²'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLdate: TQRLabel
        Left = 671
        Top = 173
        Width = 49
        Height = 13
        Caption = 'QRLdate'
        AlignToBand = False
      end
      object QRLaaak7: TQRShape
        Left = 5
        Top = 194
        width = 748
        Height = 696
        Shape = qrsRectangle
      end
      object QRShape3: TQRShape
        Left = 5
        Top = 272
        width = 747
        Height = 2
        Shape = qrsRectangle
      end
      object QRShape18: TQRShape
        Left = 58
        Top = 321
        width = 694
        Height = 4
        Shape = qrsHorLine
      end
      object QRShape19: TQRShape
        Left = 58
        Top = 366
        width = 694
        Height = 4
        Shape = qrsHorLine
      end
      object QRShape20: TQRShape
        Left = 58
        Top = 413
        width = 694
        Height = 4
        Shape = qrsHorLine
      end
      object QRShape23: TQRShape
        Left = 5
        Top = 558
        width = 747
        Height = 2
        Shape = qrsRectangle
      end
      object QRShape24: TQRShape
        Left = 60
        Top = 604
        width = 691
        Height = 4
        Shape = qrsHorLine
      end
      object QRShape25: TQRShape
        Left = 60
        Top = 651
        width = 691
        Height = 4
        Shape = qrsHorLine
      end
      object QRShape4: TQRShape
        Left = 58
        Top = 462
        width = 694
        Height = 4
        Shape = qrsHorLine
      end
      object QRShape5: TQRShape
        Left = 60
        Top = 697
        width = 691
        Height = 4
        Shape = qrsHorLine
      end
      object QRShape8: TQRShape
        Left = 5
        Top = 794
        width = 747
        Height = 2
        Shape = qrsRectangle
      end
      object QRShape9: TQRShape
        Left = 6
        Top = 841
        width = 747
        Height = 2
        Shape = qrsRectangle
      end
      object QRShape10: TQRShape
        Left = 122
        Top = 195
        width = 2
        Height = 695
        Shape = qrsRectangle
      end
      object QRLabel4: TQRLabel
        Left = 127
        Top = 247
        Width = 40
        Height = 13
        Caption = 'SM2±Þ'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel5: TQRLabel
        Left = 172
        Top = 247
        Width = 40
        Height = 13
        Caption = 'SM1±Þ'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel6: TQRLabel
        Left = 220
        Top = 247
        Width = 32
        Height = 13
        Caption = 'M2±Þ'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel8: TQRLabel
        Left = 304
        Top = 247
        Width = 32
        Height = 13
        Caption = 'S2±Þ'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel9: TQRLabel
        Left = 346
        Top = 247
        Width = 32
        Height = 13
        Caption = 'S1±Þ'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel10: TQRLabel
        Left = 389
        Top = 247
        Width = 32
        Height = 13
        Caption = 'J3±Þ'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel11: TQRLabel
        Left = 557
        Top = 246
        Width = 31
        Height = 13
        Caption = '¼Ò°è'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel14: TQRLabel
        Left = 688
        Top = 228
        Width = 16
        Height = 13
        Caption = '°è'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel15: TQRLabel
        Left = 719
        Top = 228
        Width = 31
        Height = 13
        Caption = 'ºñÀ²'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object QRLabel18: TQRLabel
        Left = 66
        Top = 291
        Width = 47
        Height = 13
        Alignment = taCenter
        Caption = '¹Ú  »ç'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRShape48: TQRShape
        Left = 57
        Top = 273
        width = 4
        Height = 238
        Shape = qrsVertLine
      end
      object A1: TQRLabel
        Left = 127
        Top = 291
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object A2: TQRLabel
        Left = 174
        Top = 291
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object A3: TQRLabel
        Left = 217
        Top = 291
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object A4: TQRLabel
        Left = 260
        Top = 291
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object A5: TQRLabel
        Left = 302
        Top = 291
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object A6: TQRLabel
        Left = 344
        Top = 291
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object A7: TQRLabel
        Left = 386
        Top = 291
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object A8: TQRLabel
        Left = 428
        Top = 291
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object A9: TQRLabel
        Left = 470
        Top = 291
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object A10: TQRLabel
        Left = 512
        Top = 291
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object A11: TQRLabel
        Left = 554
        Top = 291
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object A13: TQRLabel
        Left = 638
        Top = 291
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object A14: TQRLabel
        Left = 676
        Top = 291
        Width = 37
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object QRLabel2: TQRLabel
        Left = 35
        Top = 228
        Width = 63
        Height = 13
        Caption = '±¸    ºÐ'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRShape12: TQRShape
        Left = 124
        Top = 235
        width = 469
        Height = 4
        Shape = qrsHorLine
      end
      object QRLabel3: TQRLabel
        Left = 429
        Top = 247
        Width = 32
        Height = 13
        Caption = 'J2±Þ'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel41: TQRLabel
        Left = 472
        Top = 247
        Width = 32
        Height = 13
        Caption = 'J1±Þ'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel13: TQRLabel
        Left = 640
        Top = 228
        Width = 31
        Height = 13
        Caption = 'Çù·Â'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel12: TQRLabel
        Left = 66
        Top = 339
        Width = 47
        Height = 13
        Alignment = taCenter
        Caption = '¼®  »ç'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel16: TQRLabel
        Left = 66
        Top = 384
        Width = 47
        Height = 13
        Alignment = taCenter
        Caption = 'ÇÐ  »ç'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel17: TQRLabel
        Left = 60
        Top = 432
        Width = 61
        Height = 13
        Alignment = taCenter
        Caption = 'Àü¹®´ëÁ¹'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel19: TQRLabel
        Left = 66
        Top = 482
        Width = 47
        Height = 13
        Alignment = taCenter
        Caption = '°í  Á¹'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRShape21: TQRShape
        Left = 58
        Top = 510
        width = 694
        Height = 2
        Shape = qrsRectangle
      end
      object QRShape13: TQRShape
        Left = 60
        Top = 559
        width = 4
        Height = 186
        Shape = qrsVertLine
      end
      object QRLabel20: TQRLabel
        Left = 66
        Top = 579
        Width = 47
        Height = 13
        Alignment = taCenter
        Caption = '¼®  »ç'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel21: TQRLabel
        Left = 66
        Top = 624
        Width = 47
        Height = 13
        Alignment = taCenter
        Caption = 'ÇÐ  »ç'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel22: TQRLabel
        Left = 61
        Top = 667
        Width = 61
        Height = 13
        Alignment = taCenter
        Caption = 'Àü¹®´ëÁ¹'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object QRLabel23: TQRLabel
        Left = 62
        Top = 714
        Width = 47
        Height = 13
        Alignment = taCenter
        Caption = '°í  Á¹'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRShape7: TQRShape
        Left = 60
        Top = 744
        width = 691
        Height = 2
        Shape = qrsRectangle
      end
      object QRLabel7: TQRLabel
        Left = 261
        Top = 247
        Width = 32
        Height = 13
        Caption = 'M1±Þ'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel24: TQRLabel
        Left = 258
        Top = 208
        Width = 198
        Height = 13
        Caption = 'Á¤         ±Ô          Á÷'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel25: TQRLabel
        Left = 14
        Top = 291
        Width = 39
        Height = 13
        Alignment = taCenter
        Caption = '¿¬ ±¸'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel26: TQRLabel
        Left = 14
        Top = 311
        Width = 39
        Height = 13
        Alignment = taCenter
        Caption = 'ÀÎ ·Â'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel27: TQRLabel
        Left = 13
        Top = 579
        Width = 39
        Height = 13
        Alignment = taCenter
        Caption = 'Áö ¿ø'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel28: TQRLabel
        Left = 13
        Top = 599
        Width = 39
        Height = 13
        Alignment = taCenter
        Caption = 'ÀÎ ·Â'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel29: TQRLabel
        Left = 73
        Top = 527
        Width = 47
        Height = 13
        Alignment = taCenter
        Caption = '¼Ò  °è'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel30: TQRLabel
        Left = 69
        Top = 762
        Width = 47
        Height = 13
        Alignment = taCenter
        Caption = '¼Ò  °è'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel31: TQRLabel
        Left = 40
        Top = 810
        Width = 55
        Height = 13
        Alignment = taCenter
        Caption = 'ÃÑ   °è'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel32: TQRLabel
        Left = 40
        Top = 858
        Width = 55
        Height = 13
        Alignment = taCenter
        Caption = 'ºñ   À²'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object B1: TQRLabel
        Left = 127
        Top = 339
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object B2: TQRLabel
        Left = 174
        Top = 339
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object B3: TQRLabel
        Left = 217
        Top = 339
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object B4: TQRLabel
        Left = 260
        Top = 339
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object B5: TQRLabel
        Left = 302
        Top = 339
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object B6: TQRLabel
        Left = 344
        Top = 339
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object B7: TQRLabel
        Left = 386
        Top = 339
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object B8: TQRLabel
        Left = 428
        Top = 339
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object B9: TQRLabel
        Left = 470
        Top = 339
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object B10: TQRLabel
        Left = 512
        Top = 339
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object B11: TQRLabel
        Left = 554
        Top = 339
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object B13: TQRLabel
        Left = 638
        Top = 339
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object B14: TQRLabel
        Left = 676
        Top = 339
        Width = 37
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object C1: TQRLabel
        Left = 127
        Top = 383
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object C2: TQRLabel
        Left = 174
        Top = 383
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object C3: TQRLabel
        Left = 217
        Top = 383
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object C4: TQRLabel
        Left = 260
        Top = 383
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object C5: TQRLabel
        Left = 302
        Top = 383
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object C6: TQRLabel
        Left = 344
        Top = 383
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object C7: TQRLabel
        Left = 386
        Top = 383
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object C8: TQRLabel
        Left = 428
        Top = 383
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object C9: TQRLabel
        Left = 470
        Top = 383
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object C10: TQRLabel
        Left = 512
        Top = 383
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object C11: TQRLabel
        Left = 554
        Top = 383
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object C13: TQRLabel
        Left = 638
        Top = 383
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object C14: TQRLabel
        Left = 676
        Top = 383
        Width = 37
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object D1: TQRLabel
        Left = 127
        Top = 430
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object D2: TQRLabel
        Left = 174
        Top = 430
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object D3: TQRLabel
        Left = 217
        Top = 430
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object D4: TQRLabel
        Left = 260
        Top = 430
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object D5: TQRLabel
        Left = 302
        Top = 430
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object D6: TQRLabel
        Left = 344
        Top = 430
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object D7: TQRLabel
        Left = 386
        Top = 430
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object D8: TQRLabel
        Left = 428
        Top = 430
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object D9: TQRLabel
        Left = 470
        Top = 430
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object D10: TQRLabel
        Left = 512
        Top = 430
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object D11: TQRLabel
        Left = 554
        Top = 430
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object D13: TQRLabel
        Left = 638
        Top = 430
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object D14: TQRLabel
        Left = 676
        Top = 430
        Width = 37
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object E1: TQRLabel
        Left = 127
        Top = 478
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object E2: TQRLabel
        Left = 174
        Top = 478
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object E3: TQRLabel
        Left = 217
        Top = 478
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object E4: TQRLabel
        Left = 260
        Top = 478
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object E5: TQRLabel
        Left = 302
        Top = 478
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object E6: TQRLabel
        Left = 344
        Top = 478
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object E7: TQRLabel
        Left = 386
        Top = 478
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object E8: TQRLabel
        Left = 428
        Top = 478
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object E9: TQRLabel
        Left = 470
        Top = 478
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object E10: TQRLabel
        Left = 512
        Top = 478
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object E11: TQRLabel
        Left = 554
        Top = 478
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object E13: TQRLabel
        Left = 638
        Top = 478
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object E14: TQRLabel
        Left = 676
        Top = 478
        Width = 37
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object F1: TQRLabel
        Left = 127
        Top = 528
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object F2: TQRLabel
        Left = 174
        Top = 528
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object F3: TQRLabel
        Left = 217
        Top = 528
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object F4: TQRLabel
        Left = 260
        Top = 528
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object F5: TQRLabel
        Left = 302
        Top = 528
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object F6: TQRLabel
        Left = 344
        Top = 528
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object F7: TQRLabel
        Left = 386
        Top = 528
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object F8: TQRLabel
        Left = 428
        Top = 528
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object F9: TQRLabel
        Left = 470
        Top = 528
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object F10: TQRLabel
        Left = 512
        Top = 528
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object F11: TQRLabel
        Left = 554
        Top = 528
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object F13: TQRLabel
        Left = 638
        Top = 528
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object F14: TQRLabel
        Left = 676
        Top = 528
        Width = 37
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object G1: TQRLabel
        Left = 127
        Top = 575
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object G2: TQRLabel
        Left = 174
        Top = 575
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object G3: TQRLabel
        Left = 217
        Top = 575
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object G4: TQRLabel
        Left = 260
        Top = 575
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object G5: TQRLabel
        Left = 302
        Top = 575
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object G6: TQRLabel
        Left = 344
        Top = 575
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object G7: TQRLabel
        Left = 386
        Top = 575
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object G8: TQRLabel
        Left = 428
        Top = 575
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object G9: TQRLabel
        Left = 470
        Top = 575
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object G10: TQRLabel
        Left = 512
        Top = 575
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object G11: TQRLabel
        Left = 554
        Top = 575
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object G13: TQRLabel
        Left = 638
        Top = 575
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object G14: TQRLabel
        Left = 675
        Top = 575
        Width = 37
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object H1: TQRLabel
        Left = 127
        Top = 622
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object H2: TQRLabel
        Left = 174
        Top = 622
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object H3: TQRLabel
        Left = 217
        Top = 622
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object H4: TQRLabel
        Left = 260
        Top = 622
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object H5: TQRLabel
        Left = 302
        Top = 622
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object H6: TQRLabel
        Left = 344
        Top = 622
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object H7: TQRLabel
        Left = 386
        Top = 622
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object H8: TQRLabel
        Left = 428
        Top = 622
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object H9: TQRLabel
        Left = 470
        Top = 622
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object H10: TQRLabel
        Left = 512
        Top = 622
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object H11: TQRLabel
        Left = 554
        Top = 622
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object H13: TQRLabel
        Left = 638
        Top = 622
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object H14: TQRLabel
        Left = 675
        Top = 622
        Width = 37
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object I1: TQRLabel
        Left = 127
        Top = 668
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object I2: TQRLabel
        Left = 174
        Top = 668
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object I3: TQRLabel
        Left = 217
        Top = 668
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object I4: TQRLabel
        Left = 260
        Top = 668
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object I5: TQRLabel
        Left = 302
        Top = 668
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object I6: TQRLabel
        Left = 344
        Top = 668
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object I7: TQRLabel
        Left = 386
        Top = 668
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object I8: TQRLabel
        Left = 428
        Top = 668
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object I9: TQRLabel
        Left = 470
        Top = 668
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object I10: TQRLabel
        Left = 512
        Top = 668
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object I11: TQRLabel
        Left = 554
        Top = 668
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object I13: TQRLabel
        Left = 638
        Top = 668
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object I14: TQRLabel
        Left = 675
        Top = 668
        Width = 37
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object J1: TQRLabel
        Left = 127
        Top = 716
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object J2: TQRLabel
        Left = 174
        Top = 716
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object J3: TQRLabel
        Left = 217
        Top = 716
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object J4: TQRLabel
        Left = 260
        Top = 716
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object J5: TQRLabel
        Left = 302
        Top = 716
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object J6: TQRLabel
        Left = 344
        Top = 716
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object J7: TQRLabel
        Left = 386
        Top = 716
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object J8: TQRLabel
        Left = 428
        Top = 716
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object J9: TQRLabel
        Left = 470
        Top = 716
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object J10: TQRLabel
        Left = 512
        Top = 716
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object J11: TQRLabel
        Left = 554
        Top = 716
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object J13: TQRLabel
        Left = 638
        Top = 716
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object J14: TQRLabel
        Left = 675
        Top = 716
        Width = 37
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object K1: TQRLabel
        Left = 127
        Top = 764
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object K2: TQRLabel
        Left = 174
        Top = 764
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object K3: TQRLabel
        Left = 217
        Top = 764
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object K4: TQRLabel
        Left = 260
        Top = 764
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object K5: TQRLabel
        Left = 302
        Top = 764
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object K6: TQRLabel
        Left = 344
        Top = 764
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object K7: TQRLabel
        Left = 386
        Top = 764
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object K8: TQRLabel
        Left = 428
        Top = 764
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object K9: TQRLabel
        Left = 470
        Top = 764
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object K10: TQRLabel
        Left = 512
        Top = 764
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object K11: TQRLabel
        Left = 554
        Top = 764
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object K13: TQRLabel
        Left = 638
        Top = 764
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object K14: TQRLabel
        Left = 675
        Top = 764
        Width = 37
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object L1: TQRLabel
        Left = 127
        Top = 812
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object L2: TQRLabel
        Left = 174
        Top = 812
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object L3: TQRLabel
        Left = 217
        Top = 812
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object L4: TQRLabel
        Left = 260
        Top = 812
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object L5: TQRLabel
        Left = 302
        Top = 812
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object L6: TQRLabel
        Left = 344
        Top = 812
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object L7: TQRLabel
        Left = 386
        Top = 812
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object L8: TQRLabel
        Left = 428
        Top = 812
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object L9: TQRLabel
        Left = 470
        Top = 812
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object L10: TQRLabel
        Left = 512
        Top = 812
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object L11: TQRLabel
        Left = 554
        Top = 812
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object L13: TQRLabel
        Left = 638
        Top = 812
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object L14: TQRLabel
        Left = 675
        Top = 812
        Width = 37
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object M1: TQRLabel
        Left = 127
        Top = 860
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object M2: TQRLabel
        Left = 174
        Top = 860
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object M3: TQRLabel
        Left = 217
        Top = 860
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object M4: TQRLabel
        Left = 260
        Top = 860
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object M5: TQRLabel
        Left = 302
        Top = 860
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object M6: TQRLabel
        Left = 344
        Top = 860
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object M7: TQRLabel
        Left = 386
        Top = 860
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object M8: TQRLabel
        Left = 428
        Top = 860
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object M9: TQRLabel
        Left = 470
        Top = 860
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object M10: TQRLabel
        Left = 512
        Top = 860
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object M11: TQRLabel
        Left = 554
        Top = 860
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object M13: TQRLabel
        Left = 637
        Top = 860
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object QRLabel33: TQRLabel
        Left = 590
        Top = 173
        Width = 77
        Height = 13
        Caption = 'ÀÛ¼ºÀÏÀÚ : '
        AlignToBand = False
      end
      object QRLabel34: TQRLabel
        Left = 8
        Top = 173
        Width = 119
        Height = 13
        Caption = '[ÀÛ ¾÷ ³â ¿ù ] : '
        AlignToBand = False
      end
      object QRLjobym: TQRLabel
        Left = 127
        Top = 173
        Width = 56
        Height = 13
        Caption = 'QRLjobym'
        AlignToBand = False
      end
      object QRShape14: TQRShape
        Left = 168
        Top = 235
        width = 4
        Height = 654
        Shape = qrsVertLine
      end
      object QRShape15: TQRShape
        Left = 256
        Top = 235
        width = 4
        Height = 654
        Shape = qrsVertLine
      end
      object QRShape17: TQRShape
        Left = 340
        Top = 235
        width = 4
        Height = 654
        Shape = qrsVertLine
      end
      object QRShape38: TQRShape
        Left = 675
        Top = 195
        width = 2
        Height = 695
        Shape = qrsRectangle
      end
      object QRShape39: TQRShape
        Left = 466
        Top = 235
        width = 4
        Height = 654
        Shape = qrsVertLine
      end
      object QRShape40: TQRShape
        Left = 214
        Top = 235
        width = 4
        Height = 654
        Shape = qrsVertLine
      end
      object QRShape41: TQRShape
        Left = 550
        Top = 235
        width = 2
        Height = 655
        Shape = qrsRectangle
      end
      object QRShape42: TQRShape
        Left = 592
        Top = 195
        width = 2
        Height = 695
        Shape = qrsRectangle
      end
      object QRShape43: TQRShape
        Left = 714
        Top = 195
        width = 4
        Height = 694
        Shape = qrsVertLine
      end
      object QRShape2: TQRShape
        Left = 424
        Top = 235
        width = 4
        Height = 654
        Shape = qrsVertLine
      end
      object QRShape11: TQRShape
        Left = 382
        Top = 235
        width = 4
        Height = 654
        Shape = qrsVertLine
      end
      object QRShape6: TQRShape
        Left = 298
        Top = 235
        width = 4
        Height = 654
        Shape = qrsVertLine
      end
      object QRLremark: TQRLabel
        Left = 4
        Top = 900
        Width = 91
        Height = 13
        Enabled = False
        Caption = '¡Ø Æ¯Á¤Á÷Çö¿ø'
        AlignToBand = False
      end
      object QRShape16: TQRShape
        Left = 508
        Top = 235
        width = 4
        Height = 654
        Shape = qrsVertLine
      end
      object QRLabel35: TQRLabel
        Left = 515
        Top = 247
        Width = 31
        Height = 13
        Caption = 'Æ¯Á¤'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object M14: TQRLabel
        Left = 676
        Top = 860
        Width = 37
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object A15: TQRLabel
        Left = 713
        Top = 291
        Width = 38
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object B15: TQRLabel
        Left = 713
        Top = 339
        Width = 38
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object C15: TQRLabel
        Left = 713
        Top = 383
        Width = 38
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object D15: TQRLabel
        Left = 713
        Top = 430
        Width = 38
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object E15: TQRLabel
        Left = 713
        Top = 478
        Width = 38
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object F15: TQRLabel
        Left = 713
        Top = 528
        Width = 38
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object G15: TQRLabel
        Left = 713
        Top = 575
        Width = 38
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object H15: TQRLabel
        Left = 713
        Top = 622
        Width = 38
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object I15: TQRLabel
        Left = 713
        Top = 668
        Width = 38
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object J15: TQRLabel
        Left = 713
        Top = 716
        Width = 38
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object K15: TQRLabel
        Left = 713
        Top = 764
        Width = 38
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object L15: TQRLabel
        Left = 713
        Top = 812
        Width = 38
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
      object QRShape22: TQRShape
        Left = 634
        Top = 195
        width = 2
        Height = 695
        Shape = qrsRectangle
      end
      object QRLabel36: TQRLabel
        Left = 599
        Top = 228
        Width = 31
        Height = 13
        Caption = '°è¾à'
        AlignToBand = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = '±¼¸²Ã¼'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object A12: TQRLabel
        Left = 597
        Top = 291
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object B12: TQRLabel
        Left = 597
        Top = 339
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object C12: TQRLabel
        Left = 597
        Top = 383
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object D12: TQRLabel
        Left = 597
        Top = 430
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object E12: TQRLabel
        Left = 597
        Top = 478
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object F12: TQRLabel
        Left = 597
        Top = 528
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object G12: TQRLabel
        Left = 597
        Top = 575
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object H12: TQRLabel
        Left = 597
        Top = 622
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object I12: TQRLabel
        Left = 597
        Top = 668
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object J12: TQRLabel
        Left = 597
        Top = 716
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object K12: TQRLabel
        Left = 597
        Top = 764
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object L12: TQRLabel
        Left = 597
        Top = 812
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object M12: TQRLabel
        Left = 596
        Top = 860
        Width = 35
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99.99'
        AlignToBand = False
      end
      object M15: TQRLabel
        Left = 713
        Top = 860
        Width = 38
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '99.9'
        AlignToBand = False
        Transparent = True
      end
    end
    object QRBand1: TQRBand
      Height = 17
      BandType = rbTitle
      Color = clWhite
      ForceNewPage = False
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
    end
  end
end
