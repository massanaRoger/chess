
class Game
  attr_accessor :board
  def initialize
    @board = create_board
  end

  def create_board
    fin_board = Array.new(8) { Array.new(8, nil) }
    fin_board
  end
end
