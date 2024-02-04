object DatalinksDesignPage: TDatalinksDesignPage
  Tag = 1000
  Left = 0
  Top = 0
  Width = 546
  Height = 363
  HelpContext = 1000
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  ParentFont = False
  ParentShowHint = False
  ShowHint = True
  TabOrder = 0
  object Splitter1: TSplitter
    Left = 197
    Top = 0
    Height = 363
    ExplicitLeft = 206
    ExplicitTop = -8
    ExplicitHeight = 445
  end
  object Panel3: TPanel
    Left = 200
    Top = 0
    Width = 346
    Height = 363
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 58
      Height = 13
      Caption = '&Data source'
      FocusControl = cbDataSource
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 109
      Height = 13
      Caption = '&Unique identifier field(s)'
      FocusControl = cbKeyField
    end
    object Label3: TLabel
      Left = 24
      Top = 104
      Width = 106
      Height = 13
      Caption = '&Parent identifier field(s)'
      FocusControl = cbParentField
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 346
      Height = 17
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'Datalink properties'
      TabOrder = 0
    end
    object cbDataSource: TComboBox
      Tag = 1120
      Left = 24
      Top = 40
      Width = 145
      Height = 21
      Style = csDropDownList
      Enabled = False
      TabOrder = 1
      OnChange = cbDataSourceChange
      OnDropDown = cbDataSourceDropDown
    end
    object cbKeyField: TComboBox
      Tag = 1130
      Left = 24
      Top = 80
      Width = 145
      Height = 21
      Enabled = False
      TabOrder = 2
      OnChange = cbKeyFieldChange
      OnDropDown = cbKeyFieldDropDown
    end
    object cbParentField: TComboBox
      Tag = 1140
      Left = 24
      Top = 120
      Width = 145
      Height = 21
      Enabled = False
      TabOrder = 3
      OnChange = cbParentFieldChange
      OnDropDown = cbParentFieldDropDown
    end
    object chkCanExpand: TCheckBox
      Left = 24
      Top = 148
      Width = 217
      Height = 17
      Caption = 'Allow expansion and collapsing of nodes'
      TabOrder = 4
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 197
    Height = 363
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 197
      Height = 17
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      TabOrder = 0
      object btnAdd: TSpeedButton
        Left = 27
        Top = 2
        Width = 22
        Height = 14
        Hint = 'Add new datalink'
        Flat = True
        Glyph.Data = {
          B6000000424DB600000000000000760000002800000010000000080000000100
          0400000000004000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFF44FFFFFF77FFFFFF44FFFFFF77FFFF444444FF777777FF444444FF777
          777FFFF44FFFFFF77FFFFFF44FFFFFF77FFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        OnClick = btnAddClick
      end
      object btnMoveUp: TSpeedButton
        Left = 75
        Top = 2
        Width = 22
        Height = 14
        Hint = 'Move datalink one level up'
        Enabled = False
        Flat = True
        Glyph.Data = {
          B6000000424DB600000000000000760000002800000010000000080000000100
          0400000000004000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF4444444477777777F444444FF777777FFF4444FFFF77
          77FFFFF44FFFFFF77FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        OnClick = btnMoveUpClick
      end
      object btnMoveDown: TSpeedButton
        Left = 52
        Top = 2
        Width = 22
        Height = 14
        Hint = 'Move datalink one level down'
        Enabled = False
        Flat = True
        Glyph.Data = {
          B6000000424DB600000000000000760000002800000010000000080000000100
          0400000000004000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF44FFFFFF77FFFFF4444FFFF7777FFF444444FF777
          777F4444444477777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        OnClick = btnMoveDownClick
      end
      object btnDeleteLink: TSpeedButton
        Left = 153
        Top = 2
        Width = 21
        Height = 14
        Hint = 'Move datalink one level up'
        Enabled = False
        Flat = True
        Glyph.Data = {
          B6000000424DB600000000000000760000002800000010000000080000000100
          0400000000004000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFF44FFF44F77FFF77FF44F44FFF77F77FFFF444FFFFF777FFFFF444FFFFF7
          77FFFF44F44FFF77F77FF44FFF44F77FFF77FFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        OnClick = btnDeleteLinkClick
      end
      object btnIndent: TSpeedButton
        Left = 103
        Top = 2
        Width = 22
        Height = 14
        Hint = 'Indent datalink'
        Enabled = False
        Flat = True
        Glyph.Data = {
          C6000000424DC60000000000000076000000280000000A0000000A0000000100
          0400000000005000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
          0000FFFFFFFFFF000000FF0FFFFFFF0000000000F99999000000FF0FFFFFFF00
          0000FFFFFFFFFF0000009999999FFF000000FFFFFFFFFF0000009999999FFF00
          0000FFFFFFFFFF000000}
        OnClick = btnIndentClick
      end
      object btnOutdent: TSpeedButton
        Left = 126
        Top = 2
        Width = 22
        Height = 14
        Hint = 'Outdent datalink'
        Enabled = False
        Flat = True
        Glyph.Data = {
          C6000000424DC60000000000000076000000280000000A0000000A0000000100
          0400000000005000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
          0000FFFFFFFFFF000000FFFFFFF0FF00000099999F0000000000FFFFFFF0FF00
          0000FFFFFFFFFF000000FFF9999999000000FFFFFFFFFF000000FFF999999900
          0000FFFFFFFFFF000000}
        OnClick = btnOutdentClick
      end
    end
    object tvDatalinks: TTreeView
      Tag = 1110
      Left = 0
      Top = 17
      Width = 197
      Height = 346
      HelpContext = 1110
      Align = alClient
      DragMode = dmAutomatic
      HideSelection = False
      Images = ImageList1
      Indent = 23
      ReadOnly = True
      ShowButtons = False
      ShowRoot = False
      TabOrder = 1
      OnChange = tvDatalinksChange
      OnCollapsing = tvPreventCollapse
    end
  end
  object ImageList1: TImageList
    Left = 208
    Top = 16
    Bitmap = {
      494C010106000700040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840084000000840000008400000084000000840000008400
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000084
      8400008484000084840000848400008484000084840000848400008484008400
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      0000000000008400000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000084000000000000008400
      0000000000000000000000000000000000000000000000000000000000000084
      8400840000008400000084000000840000008400000084000000008484008400
      0000008484000000000000000000000000000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000000000000000000000
      0000000000000000000000000000840000008400000000000000000000000000
      0000000000008400000084000000000000000000000000000000848484008484
      8400C6C6C6000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400008484000084
      8400008484000084840000848400008484000084840084000000008484008400
      00000084840000000000000000000000000000848400C6C6C600008484000000
      0000000000000000000000000000C6C6C6008400000084000000840000008400
      0000840000008400000000848400000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      000084000000840000008400000084000000000000000000000084848400C6C6
      C6000000000000000000C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400840000008400
      0000840000008400000084000000840000000084840084000000008484008400
      0000008484000000000000000000000000000084840000000000008484000000
      0000C6C6C600C6C6C60000000000C6C6C60084000000C6C6C600C6C6C600C6C6
      C600C6C6C6008400000000848400000000000000000000000000000000000000
      0000000000000000000000000000840000008400000000000000000000000000
      000000000000840000008400000000000000000000000000000084848400C6C6
      C600C6C6C6000000000000000000C6C6C6000000000000000000000000008400
      000000000000000000000000000000000000000000000084840084000000C6C6
      C600C6C6C600C6C6C600C6C6C600840000000084840084000000008484008400
      00000084840000000000000000000000000000848400C6C6C600008484000000
      0000000000000000000000000000C6C6C6008400000084000000840000008400
      0000840000008400000000848400000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      000000000000840000000000000000000000000000000000000084848400C6C6
      C6000000000000000000C6C6C600C6C6C6000000000000000000000000000000
      0000840000000000000000000000000000000000000000848400840000008400
      0000840000008400000084000000840000000084840084000000008484008400
      0000008484000000000000000000000000000084840000000000008484000000
      0000C6C6C600C6C6C60000000000C6C6C60084000000C6C6C600C6C6C600C6C6
      C600000000008400000000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484000000000084000000840000008400
      000084000000840000000000000000000000000000000084840084000000C6C6
      C600C6C6C600C6C6C60000000000840000000084840084000000008484000084
      84000084840000000000000000000000000000848400C6C6C600008484000000
      0000000000000000000000000000C6C6C6008400000084000000840000008400
      0000840000008400000000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600000000000000000000000000C6C6C6000000000000000000000000000000
      0000840000000000000000000000000000000000000000848400840000008400
      0000840000008400000084000000840000000084840084000000008484008400
      0000008484000000000000000000000000000084840000000000008484000000
      0000C6C6C600C6C6C60000000000C6C6C60084000000C6C6C600C6C6C600C6C6
      C600C6C6C6008400000000848400000000000000000000000000000000000000
      0000000000000000000000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000848484000000000000000000000000008400
      000000000000000000000000000000000000000000000084840084000000C6C6
      C600C6C6C600C6C6C600C6C6C600840000000084840000848400008484000084
      84000084840000000000000000000000000000848400C6C6C600008484000000
      0000000000000000000000000000C6C6C6008400000084000000840000008400
      0000840000008400000000848400000000000000000000000000000000000000
      000000848400008484000084840000FFFF000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008400000000000000000000000000
      0000000000000000000000000000000000000000000000848400840000008400
      0000840000008400000084000000840000000084840084000000008484008400
      0000008484000000000000000000000000000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000000000000000000000
      0000008484000084840000FFFF00008484000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000008400
      0000000000000000000000000000000000000000000000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000000000000000000000000000848400C6C6C600008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C6008400000084000000840000008400
      0000840000008400000000848400000000000000000000000000000000000000
      0000000000000000000000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000000000000000000000000000000000000000848400840000008400
      0000840000008400000084000000840000000084840000000000000000000000
      0000000000000000000000000000000000000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000848400008484000084
      8400008484000084840000848400008484000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000
      FFFF800100000000FBFFBFFD00000000F9FFA8A50000000080FFAAAD00000000
      99FFA8AD000000009BFFBFFD000000009FFF8001000000009FFFFFFF00000000
      9FFFFFFF00000000FFFFFFFF00000000FFFFFFFFF807FFFFF87FFF8FF807FFFF
      E79FFFCFE007FFFFDF6BC0AFE0070001DE69C67F80071E01DC00CC7F80075201
      DE69C66F80071E01DF6BCC7780075209DFEFC00382071E01D86FCE7780075201
      C00FCE6F80071E01C00FE07F80070001C00FFFAF80071001E01FFFCF807F0001
      F87FFF8F807FFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object tmSetHelptext: TTimer
    Enabled = False
    Interval = 100
    Left = 247
    Top = 16
  end
end
