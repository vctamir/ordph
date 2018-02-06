unit sample.controller;

interface

uses
  base.Model, base.Controller, Base.Interfaces;


type
   tSampleModel = class(TModel)
  private
    Fnome: string;
  published
    property nome: string read Fnome write Fnome;

 end;

 TcontrollerTeste = class(Tcontroller)
  public
    function setInitialize:icontroller; override;
 end;

implementation

{ TcontrollerTeste }

function TcontrollerTeste.setInitialize: icontroller;
begin
  Model := tSampleModel.Create;
  Inherited;
end;






end.
