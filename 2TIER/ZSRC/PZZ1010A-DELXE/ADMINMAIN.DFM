object FM_Main: TFM_Main
  Left = 191
  Top = 122
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Active Query Builder '#44288#47532#51088' '#54532#47196#44536#47016
  ClientHeight = 599
  ClientWidth = 904
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #49352#44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object PA_BackWindow: TPanel
    Left = 3
    Top = 0
    Width = 938
    Height = 598
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object PA_Header: TPanel
      Left = 0
      Top = 0
      Width = 938
      Height = 64
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object FB_User: TButton
        Left = 332
        Top = 5
        Width = 160
        Height = 26
        Caption = #49324#50857#51088' '#44428#54620' '#44288#47532
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #49352#44404#47548
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = FB_UserClick
      end
      object FB_Table: TButton
        Left = 167
        Top = 5
        Width = 160
        Height = 26
        Caption = #53580#51060#48660' '#51221#48372' '#44288#47532
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #49352#44404#47548
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = FB_TableClick
      end
      object FB_Query: TButton
        Left = 3
        Top = 5
        Width = 160
        Height = 26
        Caption = #49324#50857#51088#51656#51032' '#51221#48372' '#44288#47532
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #49352#44404#47548
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = FB_QueryClick
      end
      object FB_Close: TButton
        Left = 804
        Top = 5
        Width = 90
        Height = 26
        Caption = #51333'  '#47308
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #49352#44404#47548
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = FB_CloseClick
      end
      object SL_Program: TPanel
        Left = 3
        Top = 35
        Width = 892
        Height = 27
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = '-- '#49324#50857#51088' '#44428#54620' '#44288#47532' --'
        Color = clActiveCaption
        Ctl3D = False
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #49352#44404#47548
        Font.Style = [fsBold]
        ParentBackground = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
    end
    object PA_Program: TPanel
      Left = 0
      Top = 64
      Width = 938
      Height = 510
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
    end
    object StBar_Help: TStatusBar
      Left = 0
      Top = 574
      Width = 938
      Height = 24
      Panels = <
        item
          Text = '  '#46020#50880#47568
          Width = 60
        end
        item
          Text = #49444#47749
          Width = 50
        end>
    end
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 584
    Top = 136
  end
end
