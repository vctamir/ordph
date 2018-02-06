unit base.Controller;

interface

uses
  System.TypInfo, System.SysUtils, System.Classes, base.Interfaces;

type
  TController = class(TInterfacedObject, iController)
  private
    Fdao: IDao;
    FModel: imodel;
    constructor Create;
    destructor Destroy;

  public
    property Dao: IDao read Fdao write Fdao;
    property Model: imodel read FModel write FModel;

    class function new: iController;
    function setInitialize: iController; virtual;
    function getProp(aPropertyName: string; aPropertyType: TpropertyType; aSender: TComponent; aFormat: TPropertyFormat = pfNone): iController;
    function setProp(aPropertyName: string; aPropertyType: TpropertyType; aSender: TComponent; aFormat: TPropertyFormat = pfNone): iController; overload;
    function setProp(aPropertyName: string; aPropertyType: TpropertyType; aValue: Variant; aFormat: TPropertyFormat = pfNone): iController; overload;
    function First: iController;
    function Prior: iController;
    function Next: iController;
    function Last: iController;
    function Save: iController;
    function Delete: iController;
  end;

implementation

uses
  base.Lib;

{ TController }

constructor TController.Create;
begin
  inherited;
  setInitialize;
end;

function TController.setInitialize: iController;
begin
  Result := Self;
end;

destructor TController.Destroy;
begin
  if assigned(Fdao) then
    FreeAndNil(Fdao);

  if assigned(FModel) then
    FreeAndNil(FModel);
  inherited;
end;

class function TController.new: iController;
begin
  Result := Self.Create;
end;

function TController.getProp(aPropertyName: string; aPropertyType: TpropertyType; aSender: TComponent; aFormat: TPropertyFormat = pfNone): iController;
begin
  Result := Self;
  case aPropertyType of
    ptText:
      if IsPublishedProp(aSender, 'Text') then
      begin
        SetPropValue(aSender, 'Text', TLib.getPropertyFormat(GetPropValue(TObject(Model), aPropertyName), aFormat));
      end;
    ptCaption:
      if IsPublishedProp(aSender, 'Caption') then
      begin
        SetPropValue(aSender, 'Caption', TLib.getPropertyFormat(GetPropValue(TObject(Model), aPropertyName), aFormat));
      end;
    ptIndex:
      if IsPublishedProp(aSender, 'Index') then
      begin
        SetPropValue(aSender, 'Index', strtointdef(TLib.getPropertyFormat(GetPropValue(TObject(Model), aPropertyName), aFormat), 0));
      end;
    ptDate:
      if IsPublishedProp(aSender, 'Date') then
      begin
        SetPropValue(aSender, 'Date', TLib.getPropertyFormat(GetPropValue(TObject(Model), aPropertyName), aFormat));
      end;
    ptDouble:
      if IsPublishedProp(aSender, 'Value') then
      begin
        SetPropValue(aSender, 'Value', StrToFloat(TLib.getPropertyFormat(GetPropValue(TObject(Model), aPropertyName), aFormat)));
      end;
    ptInteger:
      if IsPublishedProp(aSender, 'Value') then
      begin
        SetPropValue(aSender, 'Value', strtointdef(TLib.getPropertyFormat(GetPropValue(TObject(Model), aPropertyName), aFormat), 0));
      end;
  end;
end;

function TController.setProp(aPropertyName: string; aPropertyType: TpropertyType; aValue: Variant; aFormat: TPropertyFormat = pfNone): iController;
begin
  Result := Self;
  case aPropertyType of
    ptText:
      if IsPublishedProp(TObject(Model), aPropertyName) then
        SetPropValue(TObject(Model), aPropertyName, TLib.getPropertyFormat(aValue, aFormat));
    ptCaption:

      if IsPublishedProp(TObject(Model), aPropertyName) then
        SetPropValue(TObject(Model), aPropertyName, TLib.getPropertyFormat(aValue, aFormat));
    ptIndex:

      if IsPublishedProp(TObject(Model), aPropertyName) then
        SetPropValue(TObject(Model), aPropertyName, TLib.getPropertyFormat(aValue, aFormat));
    ptDate:

      if IsPublishedProp(TObject(Model), aPropertyName) then
        SetPropValue(TObject(Model), aPropertyName, TLib.getPropertyFormat(aValue, aFormat));
    ptDouble:

      if IsPublishedProp(TObject(Model), aPropertyName) then
        SetPropValue(TObject(Model), aPropertyName, TLib.getPropertyFormat(aValue, aFormat));
    ptInteger:

      if IsPublishedProp(TObject(Model), aPropertyName) then
        SetPropValue(TObject(Model), aPropertyName, TLib.getPropertyFormat(aValue, aFormat));
  end;
end;

function TController.setProp(aPropertyName: string; aPropertyType: TpropertyType; aSender: TComponent; aFormat: TPropertyFormat = pfNone): iController;
begin
  Result := Self;
  case aPropertyType of
    ptText:
      if IsPublishedProp(TObject(Model), aPropertyName) then
        SetPropValue(TObject(Model), aPropertyName, TLib.getPropertyFormat(GetPropValue(aSender, 'Text'), aFormat));

    ptCaption:
      if IsPublishedProp(aSender, 'Caption') then
        SetPropValue(TObject(Model), aPropertyName, TLib.getPropertyFormat(GetPropValue(aSender, 'Caption'), aFormat));

    ptIndex:
      if IsPublishedProp(aSender, 'Index') then
        SetPropValue(TObject(Model), aPropertyName, strtointdef(TLib.getPropertyFormat(GetPropValue(aSender, 'Index'), aFormat), 0));

    ptDate:
      if IsPublishedProp(aSender, 'Date') then
        SetPropValue(TObject(Model), aPropertyName, StrToDate(TLib.getPropertyFormat(GetPropValue(aSender, 'Date'), aFormat)));

    ptDouble:
      if IsPublishedProp(aSender, 'Value') then
        SetPropValue(TObject(Model), aPropertyName, StrToFloat(TLib.getPropertyFormat(GetPropValue(aSender, 'Value'), aFormat)));

    ptInteger:
      if IsPublishedProp(aSender, 'Value') then
        SetPropValue(TObject(Model), aPropertyName, strtointdef(TLib.getPropertyFormat(GetPropValue(aSender, 'Value'), aFormat), 0));

  end;
end;

function TController.Delete: iController;
begin
  if assigned(Fdao) then
    Fdao.Delete;

end;

function TController.First: iController;
begin
  if assigned(Fdao) then
    Fdao.First;

end;

function TController.Last: iController;
begin
  if assigned(Fdao) then
    Fdao.Last;
end;

function TController.Next: iController;
begin
  if assigned(Fdao) then
    Fdao.Next;
end;

function TController.Prior: iController;
begin
  if assigned(Fdao) then
    Fdao.Prior;
end;

function TController.Save: iController;
begin
  if assigned(Fdao) then
    Fdao.Save;
end;

end.
