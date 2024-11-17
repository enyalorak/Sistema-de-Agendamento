unit UnitListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Vcl.StdCtrls, FireDAC.Comp.DataSet;

type
  TfrmListagem = class(TForm)
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ListarAgendas;
  public
    { Public declarations }
  end;

var
  frmListagem: TfrmListagem;

implementation

{$R *.dfm}

procedure TfrmListagem.FormShow(Sender: TObject);
begin
  ListarAgendas;
end;

procedure TfrmListagem.ListarAgendas;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'SELECT ' +
                       '  A.ID_AGENDAMENTO, ' +
                       '  C.NOME AS CLIENTE, ' +
                       '  S.NOMESERVICO AS SERVICO, ' +
                       '  A.DATAAGENDAMENTO, ' +
                       '  A.VALOR ' +
                       'FROM ' +
                       '  AGENDAMENTOS A ' +
                       'JOIN ' +
                       '  CLIENTES C ON A.ID_CLIENTE = C.ID_CLIENTE ' +
                       'JOIN ' +
                       '  SERVICOS S ON A.ID_SERVICO = S.ID_SERVICO ' +
                       'ORDER BY ' +
                       '  A.DATAAGENDAMENTO;';
  FDQuery1.Open;
end;



end.

