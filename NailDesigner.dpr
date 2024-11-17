program NailDesigner;

uses
  Forms,
  uNailDesigner in 'uNailDesigner.pas' {Form1},
  UnitCadClientes in 'clientes\UnitCadClientes.pas' {FrmCadClientes},
  unitAgendar in 'Agenda\unitAgendar.pas' {frmCadAgenda},
  UnitServico in 'Servicos\UnitServico.pas' {frmServico},
  UnitListagem in 'lista\UnitListagem.pas' {frmListagem};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmServico, frmServico);
  Application.CreateForm(TfrmListagem, frmListagem);
  Application.Run;
end.
