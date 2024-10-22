unit models;

{$mode objfpc}{$H+}

interface

uses
  crt;

type
  Rows = array of integer;
  Column = array of Rows;

  TMatrix = class
  private
    TMatrixGrid: Column;
    TMatrixLengthM: integer;
    TMatrixLengthN: integer;
  public
    property Grid: Column read TMatrixGrid write TMatrixGrid;
    property LengthM: integer read TMatrixLengthM;
    property LengthN: integer read TMatrixLengthN;
  private
    procedure ReSize(m, n: integer);
  public
    constructor Create(m, n: integer);
    procedure ClearAll;
  end;

  Character = class

  private
    CharacterColor: byte;
    CharacterGrid: TMatrix;
    CharacterState: boolean;
    CharacterDirection: word;
    CharacterPositionX: integer;
    CharacterPositionY: integer;
    CharacterIdentity: integer;

  public
    property Color: byte read CharacterColor write CharacterColor;
    property Direction: word read CharacterDirection write CharacterDirection;
    property Shape: TMatrix read CharacterGrid write CharacterGrid;
    property State: boolean read CharacterState write CharacterState;
    property PositionX: integer read CharacterPositionX write CharacterPositionX;
    property PositionY: integer read CharacterPositionY write CharacterPositionY;
    property Identity: integer read CharacterIdentity write CharacterIdentity;

  public
    constructor Create(m, n: integer);
  end;

  Stage = class

  private
    StageGrid: TMatrix;

  public
    property Grid: TMatrix read StageGrid write StageGrid;

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

{Character}
constructor Character.Create(m, n: integer);
begin
  PositionX := 0;
  PositionY := 0;
  Shape := TMatrix.Create(m, n);
  Shape.ClearAll;
end;

{Stage}
constructor Stage.Create(m, n: integer);
begin
  StageGrid := TMatrix.Create(m, n);
  StageGrid.ClearAll;
end;

end.

