object FM_UserPopup: TFM_UserPopup
  Left = 224
  Top = 138
  BorderStyle = bsSingle
  Caption = 'FM_UserPopup'
  ClientHeight = 373
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #49352#44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object SpeedButton1: TSpeedButton
    Left = 447
    Top = 8
    Width = 73
    Height = 22
    Caption = #44160#49353
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #49352#44404#47548
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Panel3: TPanel
    Left = 8
    Top = 8
    Width = 115
    Height = 22
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = #49324#50857#51088#47749
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #49352#44404#47548
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Grid1: TDBGrid
    Left = 8
    Top = 34
    Width = 512
    Height = 331
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = HANGEUL_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #49352#44404#47548
    TitleFont.Style = []
    OnDblClick = Grid1DblClick
    OnKeyPress = Grid1KeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'userid'
        Title.Alignment = taCenter
        Title.Caption = #49324#50857#51088' ID'
        Width = 63
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'username'
        Title.Alignment = taCenter
        Title.Caption = #49324#50857#51088#47749
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'content'
        Title.Alignment = taCenter
        Title.Caption = #49324#50857#51088' '#49444#47749
        Width = 305
        Visible = True
      end>
  end
  object ED1_username: TEdit
    Left = 123
    Top = 8
    Width = 318
    Height = 22
    AutoSize = False
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 300
    Top = 133
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 392
    Top = 128
  end
end
