unit Base.Interfaces;

interface

uses System.Classes;

type

  TpropertyType = (ptText, ptCaption, ptIndex, ptDate, ptDouble, ptInteger);
  TPropertyFormat = (pfNone, pfText, pfDate, pfDateDB, pfTime, pfInteger, pfNumero12x1, pfNumero12x2, pfNumero12x3, pfNumero12x4, pfNumero12x5, pfNumero12x6, pfCurrency);

  IModel = Interface
    ['{26728352-3625-4C1B-9663-20CBB32843D9}']
  End;

  IDao = interface
    ['{9EF20DB2-0431-4C2C-8953-806B0B1F357A}']
    function First: IDao;
    function Prior: IDao;
    function Next: IDao;
    function Last: IDao;
    function Save: IDao;
    function Delete: IDao;
  end;

  IController = interface
    ['{675E1199-6DE7-44F6-B817-27CFC290860D}']
    function getProp(aPropertyName: string; aPropertyType: TpropertyType; aSender: TComponent; aFormat: TPropertyFormat = pfNone): IController;
    function setProp(aPropertyName: string; aPropertyType: TpropertyType; aSender: TComponent; aFormat: TPropertyFormat = pfNone): IController; overload;
    function setProp(aPropertyName: string; aPropertyType: TpropertyType; aValue: Variant; aFormat: TPropertyFormat = pfNone): IController; overload;
    function First: IController;
    function Prior: IController;
    function Next: IController;
    function Last: IController;
    function Save: IController;
    function Delete: IController;

  end;

  IConnection = interface
    ['{FAF494A0-337D-4D98-A0B2-AB595C0F3541}']
    function Connect: IConnection; overload;
    function Connect(aHost, aPort, aUser, aPassword: string): IConnection; overload;
    function ExceuteSql(aSql:string):iconnection;
  end;

implementation

end.
