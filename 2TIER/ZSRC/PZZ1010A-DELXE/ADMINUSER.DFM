object FM_User: TFM_User
  Left = 233
  Top = 136
  BorderStyle = bsSingle
  Caption = 'FM_User'
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
      Width = 168
      Height = 13
      Caption = #9670' '#49324#50857#51088#48324' '#49324#50857#44428#54620' '#50676#46988
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = #49352#44404#47548
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 312
      Width = 140
      Height = 13
      Caption = #9670' '#49324#50857#44428#54620' '#49324#54637' '#51077#47141
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = #49352#44404#47548
      Font.Style = [fsBold]
      ParentFont = False
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
      object BT_Mod: TButton
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
        OnClick = BT_ModClick
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
    end
    object Grid1: TDBGrid
      Left = 24
      Top = 59
      Width = 849
      Height = 240
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
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
          FieldName = 'userid'
          Title.Alignment = taCenter
          Title.Caption = #49324#50857#51088' ID'
          Width = 81
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'username'
          Title.Alignment = taCenter
          Title.Caption = #49324#50857#51088#47749
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'content'
          Title.Alignment = taCenter
          Title.Caption = #49324#50857#51088' '#49444#47749
          Width = 597
          Visible = True
        end>
    end
    object ED_userid: TEdit
      Left = 121
      Top = 330
      Width = 752
      Height = 22
      AutoSize = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object ED_username: TEdit
      Left = 121
      Top = 356
      Width = 752
      Height = 22
      AutoSize = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object ED_content: TEdit
      Left = 121
      Top = 382
      Width = 752
      Height = 22
      AutoSize = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object ED1_username: TEdit
      Left = 121
      Top = 33
      Width = 752
      Height = 22
      AutoSize = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object Panel2: TPanel
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
      TabOrder = 6
    end
    object Panel3: TPanel
      Left = 24
      Top = 330
      Width = 96
      Height = 22
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = #49324#50857#51088' ID'
      Color = clSkyBlue
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #49352#44404#47548
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 7
    end
    object Panel4: TPanel
      Left = 24
      Top = 356
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
      TabOrder = 8
    end
    object Panel5: TPanel
      Left = 24
      Top = 382
      Width = 96
      Height = 22
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = #49324#50857#51088' '#49444#47749
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #49352#44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
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
