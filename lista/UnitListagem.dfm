object frmListagem: TfrmListagem
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'frmListagem'
  ClientHeight = 441
  ClientWidth = 624
  Color = clLightcoral
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 288
    Top = 30
    Width = 79
    Height = 25
    Caption = 'AGENDA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 61
    Width = 553
    Height = 236
    Cursor = crHSplit
    Align = alCustom
    Anchors = [akLeft, akTop, akRight]
    BorderStyle = bsNone
    Color = clBlanchedalmond
    DataSource = DataSource1
    GradientEndColor = clBisque
    GradientStartColor = clBisque
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 520
    Top = 192
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Usuario\Documents\Embarcadero\trabalho\gleicia' +
        'nenails\DB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 576
    Top = 72
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 576
    Top = 16
  end
end
