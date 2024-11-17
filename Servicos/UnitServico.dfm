object frmServico: TfrmServico
  Left = 0
  Top = 0
  Caption = 'Servicos'
  ClientHeight = 441
  ClientWidth = 624
  Color = clLightcoral
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 224
    Top = 32
    Width = 205
    Height = 25
    Caption = 'CADASTRAR SERVICOS'
    Color = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 48
    Top = 91
    Width = 108
    Height = 21
    Caption = 'Nome Servi'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 48
    Top = 160
    Width = 40
    Height = 21
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtNomeServico: TEdit
    Left = 48
    Top = 112
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object edtValorServico: TEdit
    Left = 48
    Top = 181
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object btnSalvarServico: TButton
    Left = 64
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnSalvarServicoClick
  end
  object DBGrid1: TDBGrid
    Left = 272
    Top = 181
    Width = 320
    Height = 120
    DataSource = DataSourceServico
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btnExcluirServico: TButton
    Left = 64
    Top = 276
    Width = 75
    Height = 25
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnExcluirServicoClick
  end
  object FDQueryServicos: TFDQuery
    Connection = FDConnectionServicos
    Left = 528
    Top = 112
  end
  object FDConnectionServicos: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Usuario\Documents\Embarcadero\trabalho\gleicia' +
        'nenails\DB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Left = 360
    Top = 120
  end
  object DataSourceServico: TDataSource
    DataSet = FDQueryServicos
    Left = 384
    Top = 208
  end
end
