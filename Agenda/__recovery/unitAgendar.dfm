object frmCadAgenda: TfrmCadAgenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Agendar'
  ClientHeight = 441
  ClientWidth = 624
  Color = clLightpink
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClick = btnAgendarClick
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 240
    Top = 24
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
  object Cliente: TLabel
    Left = 41
    Top = 77
    Width = 46
    Height = 21
    Caption = 'Cliente'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 139
    Width = 51
    Height = 21
    Caption = 'Servi'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 41
    Top = 203
    Width = 24
    Height = 15
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object edtCliente: TEdit
    Left = 40
    Top = 104
    Width = 121
    Height = 23
    Color = clBisque
    TabOrder = 0
    OnChange = edtClienteChange
  end
  object cmbServico: TComboBox
    Left = 40
    Top = 160
    Width = 145
    Height = 23
    Color = clBisque
    TabOrder = 1
    Text = 'cmbServico'
    OnChange = cmbServicoChange
    Items.Strings = (
      'Unha x'
      'Unha y'
      'etc')
  end
  object DateTimePicker1: TDateTimePicker
    Left = 40
    Top = 224
    Width = 186
    Height = 23
    Date = 45606.000000000000000000
    Time = 0.489879537039087200
    Color = clBisque
    TabOrder = 2
  end
  object btnAgendar: TButton
    Left = 41
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnAgendarClick
  end
  object FDConnectionAgenda: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Usuario\Documents\Embarcadero\trabalho\gleicia' +
        'nenails\DB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Left = 336
    Top = 72
  end
  object FDQueryAgenda: TFDQuery
    Connection = FDConnectionAgenda
    SQL.Strings = (
      
        'FDQueryAgenda.SQL.Text := '#39'INSERT INTO AGENDAMENTOS (ID_CLIENTE,' +
        ' ID_SERVICO, DATAAGENDAMENTO) '#39' +'
      
        '                          '#39'VALUES (:ID_CLIENTE, :ID_SERVICO, :DA' +
        'TAAGENDAMENTO)'#39';'
      '')
    Left = 464
    Top = 64
  end
  object FDQueryCliente: TFDQuery
    Connection = FDConnectionAgenda
    SQL.Strings = (
      
        'INSERT INTO Clientes (Nome, Telefone, Email, DataCadastro) VALUE' +
        'S (:Nome, :Telefone, :Email, :DataCadastro)')
    Left = 448
    Top = 136
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        Name = 'TELEFONE'
        ParamType = ptInput
      end
      item
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        Name = 'DATACADASTRO'
        ParamType = ptInput
      end>
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 512
    Top = 216
  end
  object FDConnection1: TFDConnection
    Left = 384
    Top = 264
  end
end
