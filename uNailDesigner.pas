﻿unit uNailDesigner;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    ButtonAdicionar: TButton;
    ButtonLimpar: TButton;
    ButtonSair: TButton;
    ComboBoxServicos: TComboBox;
    edtNomeCliente: TEdit;
    ListBoxClientes: TListBox;
    lblNomeCliente: TLabel;
    lblServicos: TLabel;
    lblTotalCadastrados: TLabel;
    edtValorTotalServicos: TEdit;
    ImageLogo: TImage;
    ExportarCSVClick: TButton;
    DateTimePicker1: TDateTimePicker;
    D: TLabel;
    procedure ButtonAdicionarClick(Sender: TObject);
    procedure ButtonLimparClick(Sender: TObject);
    procedure ButtonSairClick(Sender: TObject);
    procedure ButtonExportarCSVClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SomarValores();
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin

  Form1.Caption := 'Gleiciane Nail Designer';


  ComboBoxServicos.Items.Add('Aplicação - R$ 120,00');
  ComboBoxServicos.Items.Add('Manutenção - R$ 90,00');
  ComboBoxServicos.Items.Add('Banho de acrílico - R$ 90,00');
  ComboBoxServicos.Items.Add('Manutenção banho de acrílico - R$ 90,00');
  ComboBoxServicos.Items.Add('Reposição de unha quebrada - R$ 5,00');
  ComboBoxServicos.Items.Add('Manicure e pedicure - R$ 35,00');
  ComboBoxServicos.Items.Add('Manicure - R$ 20,00');
  ComboBoxServicos.Items.Add('Pedicure - R$ 20,00');



end;

procedure TForm1.ButtonAdicionarClick(Sender: TObject);
var
  clienteInfo: string;
begin

  clienteInfo := 'Cliente: ' + edtNomeCliente.Text + ' - Serviço: ' + ComboBoxServicos.Text + ' Data: ' + DateToStr(DateTimePicker1.Date);
  ListBoxClientes.Items.Add(clienteInfo);


  SomarValores();
end;

procedure TForm1.ButtonLimparClick(Sender: TObject);
begin
  // Limpar o campo do nome do cliente
  edtNomeCliente.Clear;

  // Resetar a seleção do ComboBox de serviços
  ComboBoxServicos.ItemIndex := -1;

  // Resetar o DateTimePicker para a data atual
  DateTimePicker1.Date := Now;

  // Resetar o valor total dos serviços
  edtValorTotalServicos.Text := 'R$ 0,00';
end;

procedure TForm1.ButtonSairClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TForm1.SomarValores();
var
  valorAtual, totalAtual: Extended;
begin
  totalAtual := StrToFloatDef(StringReplace(edtValorTotalServicos.Text, 'R$ ', '', []), 0);


  case ComboBoxServicos.ItemIndex of
    0: valorAtual := 120;
    1: valorAtual := 90;
    2: valorAtual := 90;
    3: valorAtual := 90;
    4: valorAtual := 5;
    5: valorAtual := 35;
    6: valorAtual := 20;
    7: valorAtual := 20;
  else
    valorAtual := 0;
  end;

  totalAtual := totalAtual + valorAtual;

  edtValorTotalServicos.Text := 'R$ ' + FormatFloat('0.00', totalAtual);
end;

procedure TForm1.ButtonExportarCSVClick(Sender: TObject);
var
  i: Integer;
  linhaCSV: TStringList;
  csvLine: String;
begin
  linhaCSV := TStringList.Create;
  try
    // Adicionar cabeçalhos ao CSV
    linhaCSV.Add('Nome Cliente,Serviço');


    for i := 0 to ListBoxClientes.Items.Count - 1 do
    begin
      csvLine := ListBoxClientes.Items[i]; // Aqui vai adicionar o cliente e o serviço
      linhaCSV.Add(csvLine);
    end;


    linhaCSV.SaveToFile('C:\clientes_servicos.csv');
  finally
    linhaCSV.Free;
  end;

  //ShowMessage('Dados exportados para CSV com sucesso!');
  end;
end.