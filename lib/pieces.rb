# frozen_string_literal: true

# Parent class Piece
class Piece
  attr_reader :x, :y

  def initialize(row, col, turn)
    @x = row
    @y = col
    @turn = turn
  end
end

# Child class Pawn that extends from Piece
class Pawn < Piece
  attr_reader :moves, :symb

  def initialize(row, col, turn)
    super(row, col, turn)
    @moves = legal_moves.filter do |_key, value|
      value[0] < 8 && value[0] >= 0 && value[1] < 8 && value[1] >= 0
    end
    @symb = turn == 'white' ? '♙' : '♟'
  end

  def legal_moves
    {
      up: [x + 1, y],
      up_left: [x + 1, y - 1],
      up_right: [x + 1, y + 1]
    }
  end
end

# Child class Bishop that extends from Piece
class Bishop < Piece
  attr_reader :moves, :symb

  def initialize(row, col, turn)
    super(row, col, turn)
    @moves = legal_moves.filter { |_key, value| value != [x, y] }
    @symb = turn == 'white' ? '♗' : '♝'
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
    while i < 7 && j.positive?
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
  attr_accessor :moves, :symb

  def initialize(row, col, turn)
    super(row, col, turn)
    @moves = legal_moves.filter { |arr| arr[0] < 8 && arr[0] >= 0 && arr[1] < 8 && arr[1] >= 0 }
    @symb = turn == 'white' ? '♘' : '♞'
  end

  def legal_moves
    [left_part, right_part].flatten(1)
  end

  private

  def right_part
    [[x + 2, y + 1], [x + 1, y + 2], [x - 1, y + 2], [x - 2, y + 1]]
  end

  def left_part
    [[x - 2, y - 1], [x - 1, y - 2], [x + 1, y - 2], [x + 2, y - 1]]
  end
end

# Child class Rook that extends from Piece
class Rook < Piece
  attr_accessor :moves, :symb

  def initialize(row, col, turn)
    super(row, col, turn)
    @moves = legal_moves.filter { |_key, value| value != [x, y] }
    @symb = turn == 'white' ? '♖' : '♜'
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

# Child class Queen that extends from Piece
class Queen < Piece
  attr_accessor :moves, :symb

  def initialize(row, col, turn)
    super(row, col, turn)
    @rook = Rook.new(row, col, turn)
    @bishop = Bishop.new(row, col, turn)
    @moves = legal_moves.filter { |_key, value| value != [x, y] }
    @symb = turn == 'white' ? '♕' : '♛'
  end

  private

  def legal_moves
    # Queen moves like a combination between a bishop and a rook
    @rook.legal_moves.merge(@bishop.legal_moves)
  end
end

# Child class King that extends from Piece
class King < Piece
  attr_accessor :moves, :symb

  def initialize(row, col, turn)
    super(row, col, turn)
    @moves = legal_moves.filter { |_key, value| value[0] < 8 && value[0] >= 0 && value[1] < 8 && value[1] >= 0 }
    @symb = turn == 'white' ? '♔' : '♚'
  end

  def legal_moves
    {
      top: [x + 1, y],
      right: [x, y + 1],
      bottom: [x - 1, y],
      left: [x, y - 1]
    }.merge(diagonal)
  end

  private

  def diagonal
    {
      top_right: [x + 1, y + 1],
      bottom_right: [x - 1, y + 1],
      bottom_left: [x - 1, y - 1],
      top_left: [x + 1, y - 1]
    }
  end
end
