unit UnitServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, Vcl.Grids, Vcl.DBGrids;

type
  TfrmServico = class(TForm)
    Label1: TLabel;
    edtNomeServico: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtValorServico: TEdit;
    btnSalvarServico: TButton;
    FDQueryServicos: TFDQuery;
    FDConnectionServicos: TFDConnection;
    DBGrid1: TDBGrid;
    DataSourceServico: TDataSource;
    btnExcluirServico: TButton;
    procedure btnSalvarServicoClick(Sender: TObject);
    procedure btnExcluirServicoClick(Sender: TObject);
    procedure CarregarServicos(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServico: TfrmServico;

implementation

{$R *.dfm}

procedure TfrmServico.CarregarServicos(Sender: TObject);
begin
  FDQueryServicos.SQL.Text := 'SELECT * FROM SERVICOS';
  FDQueryServicos.Open;
end;


procedure TfrmServico.btnExcluirServicoClick(Sender: TObject);
begin
  if FDQueryServicos.IsEmpty then
  begin
    ShowMessage('Nenhum servico selecionado para exclusão.');
    Exit;
  end;


  if MessageDlg('Tem certeza que deseja excluir o serviço selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      FDQueryServicos.Delete;
      ShowMessage('Serviço excluído com sucesso!');
      CarregarServicos(Sender);
    except
      on E: Exception do
        ShowMessage('Erro ao excluir cliente: ' + E.Message);
    end;
  end;

end;

procedure TfrmServico.btnSalvarServicoClick(Sender: TObject);
begin
  if edtNomeServico.Text = '' then
  begin
    ShowMessage('Insira o nome do serviço');
    Exit;
  end;

  if edtValorServico.Text = '' then
  begin
    ShowMessage('Insira o valor do serviço');
    Exit;
  end;

  try
    FDQueryServicos.SQL.Text := 'INSERT INTO SERVICOS (NOMESERVICO, PRECO) VALUES (:NOMESERVICO, :PRECO)';
    FDQueryServicos.ParamByName('NOMESERVICO').AsString := edtNomeServico.Text;
    FDQueryServicos.ParamByName('PRECO').AsFloat := StrToFloat(edtValorServico.Text);
    FDQueryServicos.ExecSQL;

    ShowMessage('Serviço cadastrado com sucesso!');
    CarregarServicos(Sender);

    edtNomeServico.Clear;
    edtValorServico.Clear;

    CarregarServicos(Sender);


    FDQueryServicos.SQL.Text := 'SELECT * FROM SERVICOS';
    FDQueryServicos.Open;
  except
    on E: Exception do
      ShowMessage('Erro ao cadastrar serviço: ' + E.Message);
  end;
end;

end.
