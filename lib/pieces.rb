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
      up: [x+1, y]
      down: [x-1, y]
      up_left: [x+1, y-1]
      up_right: [x+1, y+1]
    }
  end
end

class Bishop < Piece
  def initialize(x, y)
    super(x, y)
  end
end
