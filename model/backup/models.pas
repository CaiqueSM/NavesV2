unit models;

{$mode objfpc}{$H+}

interface

uses
  crt;

type
  Rows   = array of integer;
  Column = array of Rows;

  TMatrix = class
  private
    TMatrixGrid:    Column;
    TMatrixLengthM: integer;
    TMatrixLengthN: integer;
  public
    property Grid: Column Read TMatrixGrid Write TMatrixGrid;
    property LengthM: integer Read TMatrixLengthM;
    property LengthN: integer Read TMatrixLengthN;
  public
    constructor Create(m, n: integer);
    procedure ReSize(m, n: integer);
    procedure ClearAll;
    //destructor Destroy(); override;
  end;

  Person = class

  private
    PersonColor:     byte;
    PersonGrid:      TMatrix;
    PersonState:     boolean;
    PersonDirection: word;
    PersonPositionX: integer;
    PersonPositionY: integer;
    PersonIdentity:  integer;

  public
    property Color: byte Read PersonColor Write PersonColor;
    property Direction: word Read PersonDirection Write PersonDirection;
    property Shape: TMatrix Read PersonGrid Write PersonGrid;
    property State: boolean Read PersonState Write PersonState;
    property PositionX: integer Read PersonPositionX Write PersonPositionX;
    property PositionY: integer Read PersonPositionY Write PersonPositionY;
    property Identity: integer Read PersonIdentity Write PersonIdentity;

  public
    constructor Create(m, n: integer);
    //destructor Destroy; override;
  end;

  Stage = class

  private
    StageGrid: TMatrix;

  public
    property Grid: TMatrix Read StageGrid Write StageGrid;

  public
    constructor Create(m, n: integer);
  end;


implementation

{tmatrix}
constructor TMatrix.Create(m, n: integer);
begin
  ReSize(m, n);
end;

procedure TMatrix.ReSize(m, n: integer);
var
  index: integer;
begin
  TMatrixLengthM := m;
  TMatrixLengthN := n;
  SetLength(TMatrixGrid, m);
  for index := 0 to m - 1 do
  begin
    SetLength(Grid[index], n);
  end;
end;

procedure TMatrix.ClearAll;
var
  row, column: integer;
begin
  for row := 0 to LengthM - 1 do
    for column := 0 to LengthN - 1 do
      Grid[row][column] := 0;
end;

//destructor TMatrix.Destroy();
//begin
//  Grid := nil;
//end;

{Person}
constructor Person.Create(m, n: integer);
begin
  PositionX := 0;
  PositionY := 0;
  Shape     := TMatrix.Create(m, n);
  Shape.ClearAll;
end;

//destructor Person.Destroy;
//begin
//  Dispose(Pinteger(Self));
//end;

{Stage}
constructor Stage.Create(m, n: integer);
begin
  StageGrid := TMatrix.Create(m, n);
  StageGrid.ClearAll;
end;

end.

