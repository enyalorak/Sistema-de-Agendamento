unit UnitCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFrmCadClientes = class(TForm)
    edtEmail: TEdit;
    Label1: TLabel;
    edtName: TEdit;
    edtTelefone: TEdit;
    FDConn: TFDConnection;
    FDQueryCliente: TFDQuery;
    btnCadastrarCliente: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    btnExcluir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CarregarClientes(Sender: TObject);
    procedure btnCadastrarClienteClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadClientes: TFrmCadClientes;

implementation

{$R *.dfm}
procedure TFrmCadClientes.btnExcluirClick(Sender: TObject);
begin
  if FDQueryCliente.IsEmpty then
  begin
    ShowMessage('Nenhum cliente selecionado para exclus�o.');
    Exit;
  end;


  if MessageDlg('Tem certeza que deseja excluir o cliente selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      FDQueryCliente.Delete;
      ShowMessage('Cliente exclu�do com sucesso!');
      CarregarClientes(Sender);
    except
      on E: Exception do
        ShowMessage('Erro ao excluir cliente: ' + E.Message);
    end;
  end;
end;

procedure TFrmCadClientes.CarregarClientes(Sender: TObject);
begin
  FDQueryCliente.SQL.Text := 'SELECT * FROM CLIENTES';
  FDQueryCliente.Open;
end;

procedure TFrmCadClientes.FormCreate(Sender: TObject);
begin
  FDConn.Connected := True;
  DataSource1.DataSet := FDQueryCliente;


  CarregarClientes(Sender);
end;






procedure TFrmCadClientes.btnCadastrarClienteClick(Sender: TObject);
begin
  FDQueryCliente.SQL.Text := 'INSERT INTO CLIENTES (NOME, TELEFONE, EMAIL, DATACADASTRO) ' +
                            'VALUES (:NOME, :TELEFONE, :EMAIL, :DATACADASTRO)';
  FDQueryCliente.ParamByName('NOME').AsString := edtName.Text;
  FDQueryCliente.ParamByName('TELEFONE').AsString := edtTelefone.Text;
  FDQueryCliente.ParamByName('EMAIL').AsString := edtEmail.Text;
  FDQueryCliente.ParamByName('DATACADASTRO').AsDate := Now;

  try
    FDQueryCliente.ExecSQL;
    ShowMessage('Cliente cadastrado com sucesso!');
    CarregarClientes(Sender);

  except
    on E: Exception do
      ShowMessage('Erro ao cadastrar cliente: ' + E.Message);
  end;
end;

end.