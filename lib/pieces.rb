# frozen_string_literal: true

# Parent class Piece
class Piece
  attr_reader :x, :y, :turn

  def initialize(row, col, turn)
    @x = row
    @y = col
    @turn = turn
  end

  def filter_inside_board(value)
    value[0] < 8 && value[0] >= 0 && value[1] < 8 && value[1] >= 0
  end
end

# Child class Pawn that extends from Piece
class Pawn < Piece
  attr_reader :moves, :symb

  def initialize(row, col, turn)
    super(row, col, turn)
    @moves = legal_moves
    @symb = turn == 'white' ? '♙' : '♟'
  end

  def legal_moves
    [
      [x + 1, y],
      [x + 1, y - 1],
      [x + 1, y + 1]
    ].filter { |value| filter_inside_board(value) }
  end

  def update_pos(row, col)
    @x = row
    @y = col
  end
end

# Child class Bishop that extends from Piece
class Bishop < Piece
  attr_reader :moves, :symb

  def initialize(row, col, turn)
    super(row, col, turn)
    @moves = legal_moves
    @symb = turn == 'white' ? '♗' : '♝'
  end

  def legal_moves
    [
      up_left,
      up_right,
      down_left,
      down_right
    ].filter { |value| value != [x, y] }
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
    @moves = legal_moves
    @symb = turn == 'white' ? '♘' : '♞'
  end

  def legal_moves
    [left_part, right_part]
      .flatten(1)
      .filter { |arr| filter_inside_board(arr) }
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
    @moves = legal_moves
    @symb = turn == 'white' ? '♖' : '♜'
  end

  def legal_moves
    [
      [7, y],
      [x, 7],
      [0, y],
      [x, 0]
    ].filter { |value| value != [x, y] }
  end
end

# Child class Queen that extends from Piece
class Queen < Piece
  attr_accessor :moves, :symb

  def initialize(row, col, turn)
    super(row, col, turn)
    @rook = Rook.new(row, col, turn)
    @bishop = Bishop.new(row, col, turn)
    @moves = legal_moves
    @symb = turn == 'white' ? '♕' : '♛'
  end

  private

  def legal_moves
    # Queen moves like a combination between a bishop and a rook
    [@rook.legal_moves, @bishop.legal_moves].flatten(1).filter { |value| value != [x, y] }
  end
end

# Child class King that extends from Piece
class King < Piece
  attr_accessor :moves, :symb

  def initialize(row, col, turn)
    super(row, col, turn)
    @moves = legal_moves
    @symb = turn == 'white' ? '♔' : '♚'
  end

  def legal_moves
    [
      [
        [x + 1, y],
        [x, y + 1],
        [x - 1, y],
        [x, y - 1]
      ],
      diagonal
    ].flatten(1)
      .filter { |value| filter_inside_board(value) }
  end

  private

  def diagonal
    [
      [x + 1, y + 1],
      [x - 1, y + 1],
      [x - 1, y - 1],
      [x + 1, y - 1]
    ]
  end
end
