program sample.FReativa;

uses
  Vcl.Forms,
  sample.main in 'sample.main.pas' {Form1},
  Base.Interfaces in '..\scr\Base\Base.Interfaces.pas',
  base.Controller in '..\scr\Base\base.Controller.pas',
  sample.controller in 'sample.controller.pas',
  base.Lib in '..\scr\Base\base.Lib.pas',
  base.Variables in '..\scr\Base\base.Variables.pas',
  base.Model in '..\scr\Base\base.Model.pas',
  base.Dao in '..\scr\Base\base.Dao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
