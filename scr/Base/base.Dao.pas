unit base.Dao;

interface

uses
  Base.Interfaces;

type
 TDao = class(TInterfacedObject, IDao)
    function First: IDao;
    function Prior: IDao;
    function Next: IDao;
    function Last: IDao;
    function Save: IDao;
    function Delete: IDao;
  end;

implementation
{ TDao }

function TDao.Delete: IDao;
begin

end;

function TDao.First: IDao;
begin

end;

function TDao.Last: IDao;
begin

end;

function TDao.Next: IDao;
begin

end;

function TDao.Prior: IDao;
begin

end;

function TDao.Save: IDao;
begin

end;
end.
