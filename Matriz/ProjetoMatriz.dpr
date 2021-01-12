program ProjetoMatriz;

uses
  Vcl.Forms,
  U_Matriz in 'U_Matriz.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
