unit base.Lib;

interface
uses
  System.SysUtils, Base.Interfaces;

type
  Tlib = class
    class function iif(aCondition: Boolean; aTrue, aFalse: Variant): Variant;
    class function getPropertyFormat(aValue: Variant; aFormat: TPropertyFormat): Variant;
  end;

implementation

{ Tlib }

class function Tlib.iif(aCondition: Boolean; aTrue, aFalse: Variant): Variant;
begin
  if aCondition then
    Result := aTrue
  else
    Result := aFalse;
end;

class function Tlib.getPropertyFormat(aValue: Variant; aFormat: TPropertyFormat): Variant;
var
 outDate:TDateTime;
 outInt:Integer;
 outDouble:Double;
begin
  case aFormat of
    pfNone:
      Result := aValue;
    pfText:
      Result := aValue;
    pfDate:
      Result := iif(TryStrToDate(aValue,outDate), DateToStr(outDate), '');
    pfDateDB:
      Result := iif(TryStrToDate(aValue,outDate), FormatDateTime('MM/DD/YYYY', outDate), 'null');
    pfTime:
      Result := iif(TryStrToTime(aValue,outDate), outDate, '');
    pfInteger:
      Result := iif(TryStrToInt(aValue,outInt), outInt, 0);
    pfNumero12x1:
      Result := iif(TryStrToFloat(aValue,outDouble), FloatToStrF(outDouble, ffNumber, 12, 1), '');
    pfNumero12x2:
      Result := iif(TryStrToFloat(aValue,outDouble), FloatToStrF(outDouble, ffNumber, 12, 2), '');
    pfNumero12x3:
      Result := iif(TryStrToFloat(aValue,outDouble), FloatToStrF(outDouble, ffNumber, 12, 3), '');
    pfNumero12x4:
      Result := iif(TryStrToFloat(aValue,outDouble), FloatToStrF(outDouble, ffNumber, 12, 4), '');
    pfNumero12x5:
      Result := iif(TryStrToFloat(aValue,outDouble), FloatToStrF(outDouble, ffNumber, 12, 5), '');
    pfNumero12x6:
      Result := iif(TryStrToFloat(aValue,outDouble), FloatToStrF(outDouble, ffNumber, 12, 6), '');
    pfCurrency:
      Result := iif(TryStrToFloat(aValue,outDouble), FloatToStrF(outDouble, ffCurrency, 12, 2), '');

  end;

end;

end.
