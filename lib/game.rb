# frozen_string_literal: true

require_relative './pieces'

# Main class for the game
class Game
  attr_accessor :board

  def initialize
    @board = create_board
  end

  def create_board
    arr = Array.new(8) { Array.new(8, nil) }
    arr[1] = pawn_row(1)
    arr[6] = pawn_row(6)
    arr
  end

  def pawn_row(row)
    arr = Array.new(8, nil)
    arr.map.with_index { |_el, index| Pawn.new(row, index) }
  end
end

game = Game.new
p game.board
