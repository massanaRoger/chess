# frozen_string_literal: true

# Parent class Piece
class Piece
  attr_reader :x, :y

  def initialize(row, col)
    @x = row
    @y = col
  end
end

# Child class Pawn that extends from Piece
class Pawn < Piece
  def initialize(row, col)
    super(row, col)
    @moves = legal_moves
  end

  def legal_moves
    {
      up: [x + 1, y],
      down: [x - 1, y],
      up_left: [x + 1, y - 1],
      up_right: [x + 1, y + 1]
    }
  end
end

# Child class Bishop that extends from Piece
class Bishop < Piece
  attr_reader :moves

  def initialize(row, col)
    super(row, col)
    @moves = legal_moves
  end

  def legal_moves
    {
      up_left: up_left,
      up_right: up_right,
      down_left: down_left,
      down_right: down_right
    }
  end

  private

  def up_left
    i = x
    j = y
    while i < 8 && j.positive?
      i += 1
      j -= 1
    end
    [i, j]
  end

  def up_right
    i = x
    j = y
    while i < 7 && j < 7
      i += 1
      j += 1
    end
    [i, j]
  end

  def down_left
    i = x
    j = y
    while i.positive? && j.positive?
      i -= 1
      j -= 1
    end
    [i, j]
  end

  def down_right
    i = x
    j = y
    while i.positive? && j < 7
      i -= 1
      j += 1
    end
    [i, j]
  end
end

# Child class Knight that extends from Piece
class Knight < Piece
  attr_accessor :moves
  def initialize(row, col)
    super(row, col)
    @moves = legal_moves
  end

  def legal_moves
    [[x+2, y+1], [x+1, y+2], [x-1, y+2], [x-2, y+1], [x-2, y-1], [x-1, y-2], [x+1, y-2], [x+2, y-1]]
  end
end

# Child class Knight that extends from Piece
class Rook < Piece
  attr_accessor :moves
  def initialize(row, col)
    super(row, col)
    @moves = legal_moves
  end

  def legal_moves
    {
      top: [7, y],
      right: [x, 7],
      bottom: [0, y],
      left: [x, 0]
    }
  end
end

rook = Rook.new(3, 4)
p rook.moves
