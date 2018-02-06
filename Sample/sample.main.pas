unit sample.main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type


  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
 sample.controller, Base.Interfaces;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

begin
  TcontrollerTeste
    .new()
    .setProp('nome',ptText,Edit1)
    .getProp('nOme', ptText, Edit2,pfNumero12x6);
end;

end.
