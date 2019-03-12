object FM_Query: TFM_Query
  Left = 159
  Top = 126
  BorderStyle = bsSingle
  Caption = 'FM_Query'
  ClientHeight = 512
  ClientWidth = 894
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #49352#44404#47548
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 12
  object PA_Program: TPanel
    Left = 0
    Top = 0
    Width = 894
    Height = 512
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 11
      Width = 173
      Height = 13
      Caption = #9670' '#49324#50857#51088#48324' '#51656#51032' '#51221#48372' '#50676#46988
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = #49352#44404#47548
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 280
      Width = 159
      Height = 13
      Caption = #9670' '#49324#50857#48324' '#51656#51032' '#51221#48372' '#51077#47141
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = #49352#44404#47548
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 240
      Top = 32
      Width = 23
      Height = 23
      Caption = #9660
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 522
      Top = 298
      Width = 24
      Height = 23
      Caption = #9660
      OnClick = SpeedButton2Click
    end
    object Panel1: TPanel
      Left = 0
      Top = 482
      Width = 894
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object BT_Find: TButton
        Left = 24
        Top = 0
        Width = 75
        Height = 25
        Caption = #44160#49353' &F'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #49352#44404#47548
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BT_FindClick
      end
      object BT_Add: TButton
        Left = 105
        Top = 0
        Width = 75
        Height = 25
        Caption = #52628#44032' &A'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #49352#44404#47548
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BT_AddClick
      end
      object BT_Save: TButton
        Left = 186
        Top = 0
        Width = 75
        Height = 25
        Caption = #51200#51109' &S'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #49352#44404#47548
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BT_SaveClick
      end
      object BT_Del: TButton
        Left = 267
        Top = 0
        Width = 75
        Height = 25
        Caption = #49325#51228' &D'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #49352#44404#47548
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BT_DelClick
      end
      object BT_FileSave: TButton
        Left = 366
        Top = 0
        Width = 139
        Height = 25
        Caption = #44160#49353' '#51204#52404' '#54028#51068' '#51200#51109
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #49352#44404#47548
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = BT_FileSaveClick
      end
    end
    object ED_content: TEdit
      Left = 121
      Top = 452
      Width = 752
      Height = 22
      AutoSize = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object Panel3: TPanel
      Left = 24
      Top = 33
      Width = 96
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
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 24
      Top = 298
      Width = 96
      Height = 22
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = #49324#50857#51088#47749
      Color = clSkyBlue
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #49352#44404#47548
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
    end
    object Panel5: TPanel
      Left = 24
      Top = 323
      Width = 96
      Height = 22
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = #44536#47353#47749
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #49352#44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object Panel6: TPanel
      Left = 24
      Top = 452
      Width = 96
      Height = 22
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = #49444'   '#47749
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #49352#44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object Panel7: TPanel
      Left = 269
      Top = 33
      Width = 96
      Height = 22
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = #49324#50857#51088' '#51656#51032#47749
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #49352#44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object ED1_queryname: TEdit
      Left = 366
      Top = 33
      Width = 507
      Height = 22
      AutoSize = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnKeyPress = ED1_querynameKeyPress
    end
    object ED_groupname: TEdit
      Left = 121
      Top = 323
      Width = 752
      Height = 22
      AutoSize = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 13
    end
    object Panel9: TPanel
      Left = 24
      Top = 348
      Width = 96
      Height = 22
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = #49324#50857#51088' '#51656#51032#47749
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #49352#44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object Panel10: TPanel
      Left = 24
      Top = 373
      Width = 96
      Height = 76
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = 'SQL '#47928#51109
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #49352#44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object Panel2: TPanel
      Left = 546
      Top = 298
      Width = 111
      Height = 22
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = #51068#47144#48264#54840
      Color = clSkyBlue
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #49352#44404#47548
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 9
    end
    object ED_seqno: TEdit
      Left = 663
      Top = 298
      Width = 210
      Height = 22
      Hint = #44536#47353#48264#54840'(2) + '#49324#50857#51088#51656#51032' '#48264#54840'(3)'
      AutoSize = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
    end
    object ED_queryname: TEdit
      Left = 121
      Top = 348
      Width = 752
      Height = 22
      AutoSize = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 14
    end
    object ED_usersql: TMemo
      Left = 121
      Top = 373
      Width = 752
      Height = 76
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object ED1_username: TEdit
      Left = 121
      Top = 33
      Width = 121
      Height = 22
      AutoSize = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object ED_username: TEdit
      Left = 121
      Top = 299
      Width = 400
      Height = 22
      AutoSize = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object Grid1: TDBGrid
      Left = 24
      Top = 61
      Width = 849
      Height = 209
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 17
      TitleFont.Charset = HANGEUL_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #49352#44404#47548
      TitleFont.Style = []
      OnDblClick = Grid1DblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'username'
          Title.Alignment = taCenter
          Title.Caption = #49324#50857#51088#47749
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'groupname'
          Title.Alignment = taCenter
          Title.Caption = #44536#47353#47749
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'queryname'
          Title.Alignment = taCenter
          Title.Caption = #49324#50857#51088' '#51656#51032#47749
          Width = 339
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'content'
          Title.Alignment = taCenter
          Title.Caption = #49444'  '#47749
          Width = 251
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 320
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 584
    Top = 136
  end
  object ADOSave2: TADOQuery
    Parameters = <>
    Left = 584
    Top = 200
  end
end
