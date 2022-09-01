# frozen_string_literal: true

require_relative './pieces'

# Main class for the game
class Game
  attr_accessor :board

  def initialize
    @turn = 'white'
    @board = create_board
  end

  def create_board
    arr = Array.new(8) { Array.new(8, nil) }
    arr[0] = piece_row(0)
    arr[1] = pawn_row(1)
    @turn = 'black'
    arr[6] = pawn_row(6)
    arr[7] = piece_row(7)
    arr
  end

  def pawn_row(row)
    arr = Array.new(8, nil)
    arr.map.with_index { |_el, index| Pawn.new(row, index, @turn) }
  end

  def piece_row(row)
    [Rook.new(row, 0, @turn), Knight.new(row, 1, @turn), Bishop.new(row, 2, @turn), Queen.new(row, 3, @turn),
     King.new(row, 4, @turn), Bishop.new(row, 5, @turn), Knight.new(row, 6, @turn), Rook.new(row, 7, @turn)]
  end
end

game = Game.new
p game.board
