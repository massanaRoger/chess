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
  end

  def create_board
    @board[0] = piece_row(0)
    @board[1] = pawn_row(1)
    @turn = @player2
    @board[6] = pawn_row(6)
    @board[7] = piece_row(7)
    @turn = @player1
  end

  def pawn_row(row)
    arr = Array.new(8, nil)
    arr.map.with_index { |_el, index| Pawn.new(row, index, @turn.color) }
  end

  def piece_row(row)
    [left_side(row), right_side(row)].flatten(1)
  end

  def left_side(row)
    [Rook.new(row, 0, @turn.color),
     Knight.new(row, 1, @turn.color),
     Bishop.new(row, 2, @turn.color),
     Queen.new(row, 3, @turn.color)]
  end

  def right_side(row)
    [King.new(row, 4, @turn.color),
     Bishop.new(row, 5, @turn.color),
     Knight.new(row, 6, @turn.color),
     Rook.new(row, 7, @turn.color)]
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
    move_formatted, piece_formatted = select_piece_move
    selected_piece = pick_piece(piece_formatted)
    if selected_piece.turn == @turn.color && legal_pos?(move_formatted, selected_piece)
      p move_formatted
      selected_piece.update_pos(move_formatted[0], move_formatted[1])
      board[move_formatted[0]][move_formatted[1]] = selected_piece
      board[piece_formatted[0]][piece_formatted[1]] = nil
      @turn = @turn == @player1 ? @player2 : @player1
    else
      puts 'Non legal'
    end
  end

  def select_piece_move
    puts 'Select the piece to move'
    piece = gets.chomp
    puts 'Select the move'
    move = gets.chomp
    move_formatted = format_pos(move)
    piece_formatted = format_pos(piece)
    return move_formatted, piece_formatted
  end

  def play_game
    game_end = false
    until game_end
      print_board
      move_piece 
    end
  end

  def pick_piece(pos)
    board[pos[0]][pos[1]]
  end

  private

  def legal_pos?(pos, piece)
    legal_moves = piece.legal_moves(@turn.color).filter do |value|
      board[value[0]][value[1]].nil? ||
        board[value[0]][value[1]].turn != piece.turn
    end
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
      print ' '
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
