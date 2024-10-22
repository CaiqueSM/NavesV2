unit Characters;

{$mode objfpc}{$H+}

interface

uses
  crt, Models;

type

  { veiculo }

  vehicle = class(Character)
  private
    VehicleLife: integer;
    VehicleAttack: integer;
    VehicleCanShot: boolean;
  public
    property Life: integer read VehicleLife write VehicleLife;
    property Attack: integer read VehicleAttack write VehicleAttack;
    property CanShot: boolean read VehicleCanShot write VehicleCanShot;

  public
    constructor Create(m, n: integer);
  end;

  { player }

  Player = class(vehicle)
  private
    PlayerBlast: integer;
  public
    property Blast: integer read PlayerBlast write PlayerBlast;
    constructor Create(m, n: integer);
  end;

  { SpaceShip }

  SpaceShip = class(vehicle)
  public
    constructor Create(m, n: integer);
  end;

  { MotherShip }

  MotherShip = class(vehicle)
  private
    MotherShipBlast: integer;
  public
    property Blast: integer read MotherShipBlast write MotherShipBlast;
    constructor Create;
  end;

  { Projetil }

  Shot = class(Person)
  private
    ShotDamage: integer;
    ShotOwner: vehicle;
  public
    property Damage: integer read ShotDamage write ShotDamage;
    property Owner: vehicle read ShotOwner;
  public
    constructor Create(Attack, x, y: integer);
    procedure Shooter(var AOwner: vehicle);
  end;

implementation

{ vehicle }

constructor vehicle.Create(m, n: integer);
begin
  inherited Create(m, n);
  Direction := 2;
  State := True;
  CanShot := True;
end;

{ Shot }

constructor Shot.Create(Attack, x, y: integer);
begin
  inherited Create(1, 1);
  Color := 1;
  Damage := Attack;
  State := True;
  Direction := 1;
  PositionX := x;
  PositionY := y;
  Shape.Grid[0][0] := 1;
end;

procedure Shot.Shooter(var AOwner: vehicle);
begin
  ShotOwner := AOwner;
end;

{ player }

constructor player.Create(m, n: integer);
begin
  inherited Create(m, n);
  Life := 5;
  Attack := 3;
  Color := Yellow;
  Blast := 0;
  Shape.Grid[1][1] := 1;
  Shape.Grid[2][0] := 1;
  Shape.Grid[2][1] := 1;
  Shape.Grid[2][2] := 1;
end;

{ SpaceShip }

constructor SpaceShip.Create(m, n: integer);
begin
  inherited Create(m, n);
  Color := Random(15) + 1;
  if Color = 8 then
  begin
    Attack := 2;
    Life := 15;
  end
  else
  begin
    Attack := 1;
    Life := 6;
  end;
  Shape.Grid[0][0] := 1;
  Shape.Grid[0][2] := 1;
  Shape.Grid[1][1] := 1;
end;

{ MotherShip }

constructor MotherShip.Create;
begin
  inherited Create(3, 7);
  Life := 50;
  Attack := 3;
  Blast := 0;
  Color := 8;
  Shape.Grid[0][1] := 1;
  Shape.Grid[0][2] := 1;
  Shape.Grid[0][3] := 1;
  Shape.Grid[0][4] := 1;
  Shape.Grid[0][5] := 1;
  Shape.Grid[1][0] := 1;
  Shape.Grid[1][1] := 1;
  Shape.Grid[1][2] := 1;
  Shape.Grid[1][3] := 1;
  Shape.Grid[1][4] := 1;
  Shape.Grid[1][5] := 1;
  Shape.Grid[1][6] := 1;
  Shape.Grid[2][1] := 1;
  Shape.Grid[2][3] := 1;
  Shape.Grid[2][5] := 1;
end;

end.

