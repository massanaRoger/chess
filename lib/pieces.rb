class Piece
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
end

class Pawn < Piece
  def initialize(x, y)
    super(x, y)
    @moves = legal_moves
  end

  def legal_moves
    {
      up: [x+1, y],
      down: [x-1, y],
      up_left: [x+1, y-1],
      up_right: [x+1, y+1]
    }
  end
end

class Bishop < Piece
  attr_reader :moves
  def initialize(x, y)
    super(x, y)
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
    while i < 8 && j > 0
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
    while i > 0 && j > 0
      i -= 1
      j -= 1
    end
    [i, j]
  end

  def down_right 
    i = x
    j = y
    while i > 0 && j < 7
      i -= 1
      j += 1
    end
    [i, j]
  end
end

bishop = Bishop.new(3, 3)
p bishop.moves
