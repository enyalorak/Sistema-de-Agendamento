unit UnitAgendar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.ExtCtrls;

type
  TfrmCadAgenda = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    edtCliente: TEdit;
    cmbServico: TComboBox;
    btnAgendar: TButton;
    FDQueryAgenda: TFDQuery;
    FDConnectionAgenda: TFDConnection;
    FDQueryCliente: TFDQuery;
    Timer1: TTimer;
    FDConnection1: TFDConnection;
    procedure btnAgendarClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbServicoChange(Sender: TObject);
  private
    procedure VerificarClienteNoBD;
    procedure CarregarClientes(Sender: TObject);
    procedure CarregarServicos;
  public
  end;

var
  frmCadAgenda: TfrmCadAgenda;

implementation

{$R *.dfm}

procedure TfrmCadAgenda.CarregarClientes(Sender: TObject);
begin
  FDQueryCliente.SQL.Text := 'SELECT * FROM CLIENTES';
  FDQueryCliente.Open;
end;

procedure TfrmCadAgenda.cmbServicoChange(Sender: TObject);
begin
  FDQueryAgenda.Close;
  FDQueryAgenda.SQL.Text := 'SELECT PRECO, ID_SERVICO FROM SERVICOS WHERE NOMESERVICO = :NOMESERVICO';
  FDQueryAgenda.ParamByName('NOMESERVICO').AsString := cmbServico.Text;
  FDQueryAgenda.Open;

  if not FDQueryAgenda.IsEmpty then
  begin
    ShowMessage('Valor do serviço selecionado: ' + FDQueryAgenda.FieldByName('PRECO').AsString);

  end;
end;

procedure TfrmCadAgenda.VerificarClienteNoBD;
begin
  FDQueryCliente.Close;
  FDQueryCliente.SQL.Text := 'SELECT * FROM CLIENTES WHERE NOME = :NOME';
  FDQueryCliente.ParamByName('NOME').AsString := edtCliente.Text;
  FDQueryCliente.Open;

  if FDQueryCliente.IsEmpty then
  begin
    ShowMessage('Cliente não encontrado. Por favor, cadastre o cliente.');

  end;
end;

procedure TfrmCadAgenda.btnAgendarClick(Sender: TObject);
var
  SelectedIDServico: Integer;
  ValorServico: Currency;
begin
  if edtCliente.Text = '' then
  begin
    ShowMessage('Por favor, insira o nome do cliente.');
    Exit;
  end;

  VerificarClienteNoBD;

  if not FDQueryCliente.IsEmpty then
  begin
    // pegar o ID_SERVICO e valor do ComboBox
    SelectedIDServico := Integer(cmbServico.Items.Objects[cmbServico.ItemIndex]);

    //pegar valor serviço
    FDQueryAgenda.Close;
    FDQueryAgenda.SQL.Text := 'SELECT PRECO FROM SERVICOS WHERE ID_SERVICO = :ID_SERVICO';
    FDQueryAgenda.ParamByName('ID_SERVICO').AsInteger := SelectedIDServico;
    FDQueryAgenda.Open;

    if FDQueryAgenda.IsEmpty then
    begin
      ShowMessage('Erro: Serviço não encontrado.');
      Exit;
    end;

    ValorServico := FDQueryAgenda.FieldByName('PRECO').AsCurrency;

    FDQueryAgenda.SQL.Text := 'INSERT INTO AGENDAMENTOS (ID_CLIENTE, ID_SERVICO, DATAAGENDAMENTO, VALOR) ' +
                              'VALUES (:ID_CLIENTE, :ID_SERVICO, :DATAAGENDAMENTO, :VALOR)';
    FDQueryAgenda.ParamByName('ID_CLIENTE').AsInteger := FDQueryCliente.FieldByName('ID_CLIENTE').AsInteger;
    FDQueryAgenda.ParamByName('ID_SERVICO').AsInteger := SelectedIDServico;
    FDQueryAgenda.ParamByName('DATAAGENDAMENTO').AsDateTime := DateTimePicker1.DateTime;
    FDQueryAgenda.ParamByName('VALOR').AsCurrency := ValorServico;

    try
      FDQueryAgenda.ExecSQL;
      ShowMessage('Agendamento realizado com sucesso!');
      edtCliente.Clear;
      cmbServico.ItemIndex := -1;
      DateTimePicker1.Date := Now;
    except
      on E: Exception do
        ShowMessage('Erro ao agendar: ' + E.Message);
    end;
  end
  else
  begin
    ShowMessage('Cliente não encontrado.');
  end;
end;


procedure TfrmCadAgenda.edtClienteChange(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer1.Enabled := True;
end;

procedure TfrmCadAgenda.FormShow(Sender: TObject);
begin
  CarregarServicos;
end;

procedure TfrmCadAgenda.CarregarServicos;
begin
  cmbServico.Clear;

  FDQueryAgenda.Close;
  FDQueryAgenda.SQL.Text := 'SELECT NOMESERVICO, ID_SERVICO FROM SERVICOS';
  FDQueryAgenda.Open;

  while not FDQueryAgenda.Eof do
  begin
    cmbServico.Items.Add(FDQueryAgenda.FieldByName('NOMESERVICO').AsString);
    cmbServico.Items.Objects[cmbServico.Items.Count - 1] := TObject(FDQueryAgenda.FieldByName('ID_SERVICO').AsInteger);
    FDQueryAgenda.Next;
  end;
end;



procedure TfrmCadAgenda.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;


  if edtCliente.Text <> '' then
  begin
    VerificarClienteNoBD;
  end
  else
  begin
    ShowMessage('Por favor, insira um nome de cliente.');
  end;
end;

end.

