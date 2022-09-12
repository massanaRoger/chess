# frozen_string_literal: true

require_relative './pieces'

# Main class for the game
class Game
  attr_accessor :board

  def initialize
    init_game
    @turn = @player1
    @board = Array.new(8) { Array.new(8, nil) }
    create_board
    print_board
  end

  def create_board
    @board[0] = piece_row(0)
    @board[1] = pawn_row(1)
    @turn = @player2
    @board[6] = pawn_row(6)
    @board[7] = piece_row(7)
  end

  def pawn_row(row)
    arr = Array.new(8, nil)
    arr.map.with_index { |_el, index| Pawn.new(row, index, @turn.color, board) }
  end

  def piece_row(row)
    [left_side(row), right_side(row)].flatten(1)
  end

  def left_side(row)
    [Rook.new(row, 0, @turn.color, board),
     Knight.new(row, 1, @turn.color, board),
     Bishop.new(row, 2, @turn.color, board),
     Queen.new(row, 3, @turn.color, board)]
  end

  def right_side(row)
    [King.new(row, 4, @turn.color, board),
     Bishop.new(row, 5, @turn.color, board),
     Knight.new(row, 6, @turn.color, board),
     Rook.new(row, 7, @turn.color, board)]
  end

  def init_game
    print 'Type player 1 name: '
    @player1 = Player.new(gets.chomp, 'white')
    print 'Type player 2 name: '
    @player2 = Player.new(gets.chomp, 'black')
  end

  def print_board
    i = 8
    board.reverse_each do |arr|
      print "#{i} "
      arr.each do |val|
        print_row(val)
      end
      puts ''
      i -= 1
    end
    puts '   a b c d e f g h'
  end

  def move_piece
    puts 'Select the piece to move'
    piece = gets.chomp
    puts 'Select the move'
    move = gets.chomp
    piece = pick_piece(piece)
    if legal_pos?(move, piece)
      puts 'legal'
    else
      puts 'Non legal'
    end
  end

  def play_game
    game_end = false
    move_piece until game_end
  end

  def pick_piece(pos)
    pos = format_pos(pos)
    board[pos[0]][pos[1]]
  end

  private

  def legal_pos?(pos, piece)
    pos = format_pos(pos)
    p piece.legal_moves
    legal_moves = piece.legal_moves.filter do |value|
      board[value[0]][value[1]].nil? ||
        board[value[0]][value[1]].turn != piece.turn
    end
    p legal_moves
    legal_moves.include?(pos)
  end

  def format_pos(pos)
    pos = pos.split('')
    pos[1] = pos[1].to_i - 1
    pos[0] = (pos[0].ord - 49).chr.to_i
    [pos[1], pos[0]]
  end

  def print_row(val)
    print ' '
    if val.nil?
      print ''
    else
      print val.symb
    end
  end
end

# Class for each player
class Player
  attr_reader :color, :name

  def initialize(name, color)
    @color = color
    @name = name
  end
end

game = Game.new
game.play_game
