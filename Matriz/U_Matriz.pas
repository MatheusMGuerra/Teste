unit U_Matriz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btn_consultar: TButton;
    edt_endereco: TEdit;
    ListBox1: TListBox;
    edt_idade: TEdit;
    edt_peso: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btn_consultarClick(Sender: TObject);
    function setarArq(z: string): String;
    procedure tratamento(a: string);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    mtRapaziada: array of array [0 .. 2] of String;
    y, x: integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn_consultarClick(Sender: TObject);
begin
  ListBox1.Items.Clear;
  setarArq(edt_endereco.text);
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  edt_idade.Text := mtRapaziada[ListBox1.itemindex, 1];
  edt_peso.Text := mtRapaziada[ListBox1.itemindex, 2];
end;

function TForm1.setarArq(z: string): String;
var
  arq: textfile;
  leitura: String;
begin
  y := 0;
  AssignFile(arq, z);
  reset(arq);
  while not EoF(arq) do
  begin
    readln(arq, leitura);
    y := y + 1;
    SetLength(mtRapaziada, y + 1);
    tratamento(leitura);
    ListBox1.Items.Add(mtRapaziada[y, 0]);
  end;
  closefile(arq);
end;

procedure TForm1.tratamento(a: string);
var
  qtdP: integer;
  charac: char;
  auxiliar: string;
begin
  qtdP := 0;
  for charac in a do
  begin
    if charac = '|' then
    begin
      qtdP := qtdP + 1;
      x := qtdP - 1;
      mtRapaziada[y][x] := auxiliar;
      auxiliar := '';
    end
    else
    begin
      auxiliar := auxiliar + charac;
    end;
  end;
end;

end.
