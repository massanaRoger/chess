# frozen_string_literal: true

# Main class for the game
class Game
  attr_accessor :board

  def initialize
    @board = create_board
  end

  def create_board
    Array.new(8) { Array.new(8, nil) }
  end
end
