# frozen_string_literal: true

require_relative './pieces'

# Main class for the game
class Game
  attr_accessor :board

  def initialize
    init_game
    @turn = @player1 
    @board = create_board
    print_board
  end

  def create_board
    arr = Array.new(8) { Array.new(8, nil) }
    arr[6] = pawn_row(6)
    arr[7] = piece_row(7)
    @turn = @player2 
    arr[0] = piece_row(0)
    arr[1] = pawn_row(1)
    arr
  end

  def pawn_row(row)
    arr = Array.new(8, nil)
    arr.map.with_index { |_el, index| Pawn.new(row, index, @turn.color) }
  end

  def piece_row(row)
    [Rook.new(row, 0, @turn.color), Knight.new(row, 1, @turn.color), Bishop.new(row, 2, @turn.color), Queen.new(row, 3, @turn.color),
     King.new(row, 4, @turn.color), Bishop.new(row, 5, @turn.color), Knight.new(row, 6, @turn.color), Rook.new(row, 7, @turn.color)]
  end

  def init_game
    print 'Type player 1 name: '
    @player1 = Player.new(gets.chomp, 'white')
    print 'Type player 2 name: '
    @player2 = Player.new(gets.chomp, 'black')
  end

  def print_board
    board.each do |arr|
      arr.each do |val|
        if val == nil
          print ''
        else
          print val.symb
        end
      end
      puts ''
    end
  end
end

class Player
  attr_reader :color, :name
  def initialize(name, color)
    @color = color 
    @name = name
  end
end

game = Game.new
