unit uNailDesigner;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Menus;

type
  TForm1 = class(TForm)
    ImageLogo: TImage; // Mantendo a imagem
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    CadCliente: TMenuItem;
    Agenda1: TMenuItem;
    ListadeAgendamento1: TMenuItem;
    Servios1: TMenuItem;
    Cadastrarservios1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CadClienteClick(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure Cadastrarservios1Click(Sender: TObject);
    procedure ListadeAgendamento1Click(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses UnitCadClientes, unitAgendar, UnitServico, UnitListagem; // Importa a unidade de cadastro de clientes

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Caption := 'Gleiciane Nail Designer';
end;

procedure TForm1.ListadeAgendamento1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmListagem, frmListagem);
  frmListagem.showModal;
end;

procedure TForm1.Agenda1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadAgenda, frmCadAgenda);
  frmCadAgenda.showModal;
end;

procedure TForm1.Cadastrarservios1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmServico, frmServico);
  frmServico.showModal;
end;

procedure TForm1.CadClienteClick(Sender: TObject);
begin
  // Abre o formulário de cadastro de clientes
  FrmCadClientes := TFrmCadClientes.Create(Self);
  try
    FrmCadClientes.ShowModal;
  finally
    FrmCadClientes.Free;
  end;
end;

end.

