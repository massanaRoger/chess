# frozen_string_literal: true

require_relative '../lib/pieces'

describe Pawn do
  describe '#initialize' do
    context 'when is at top' do
      subject(:top_left_pawn) { Pawn.new(7, 0, 'white') }
      it 'top left' do
        expect(top_right_pawn.moves).to eq([])
      end

      subject(:top_right_pawn) { Pawn.new(7, 7, 'white') }
      it 'top right' do
        expect(top_right_pawn.moves).to eq([])
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_pawn) { Pawn.new(0, 0, 'white') }
      it 'bottom left' do
        expect(bottom_left_pawn.moves).to eq([[1, 0], [1, 1]])
      end

      subject(:bottom_right_pawn) { Pawn.new(0, 7, 'white') }
      it 'bottom right' do
        expect(bottom_right_pawn.moves).to eq([[1, 7], [1, 6]])
      end

      subject(:bottom_mid_pawn) { Pawn.new(0, 3, 'white') }
      it 'bottom mid' do
        expect(bottom_mid_pawn.moves).to eq([[1, 3], [1, 2], [1, 4]])
      end
    end
  end
end

describe Bishop do
  describe '#initialize' do
    context 'when is at top' do
      subject(:top_left_bishop) { Bishop.new(7, 0, 'white') }
      it 'top left' do
        expect(top_left_bishop.moves).to eq([[0, 7]])
      end

      subject(:top_right_bishop) { Bishop.new(7, 7, 'white') }
      it 'top right' do
        expect(top_right_bishop.moves).to eq([[0, 0]])
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_bishop) { Bishop.new(0, 0, 'white') }
      it 'bottom left' do
        expect(bottom_left_bishop.moves).to eq([[7, 7]])
      end

      subject(:bottom_right_bishop) { Bishop.new(0, 7, 'white') }
      it 'bottom right' do
        expect(bottom_right_bishop.moves).to eq([[7, 0]])
      end

      subject(:bottom_mid_bishop) { Bishop.new(0, 3, 'white') }
      it 'bottom mid' do
        expect(bottom_mid_bishop.moves).to eq([[3, 0], [4, 7]])
      end
    end
  end
end

describe Knight do
  describe '#initialize' do
    context 'when is at top' do
      subject(:top_left_knight) { Knight.new(7, 0, 'white') }
      it 'top left' do
        expect(top_left_knight.moves).to eq([[6, 2], [5, 1]])
      end

      subject(:top_right_knight) { Knight.new(7, 7, 'white') }
      it 'top right' do
        expect(top_right_knight.moves).to eq([[5, 6], [6, 5]])
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_knight) { Knight.new(0, 0, 'white') }
      it 'bottom left' do
        expect(bottom_left_knight.moves).to eq([[2, 1], [1, 2]])
      end

      subject(:bottom_right_knight) { Knight.new(0, 7, 'white') }
      it 'bottom right' do
        expect(bottom_right_knight.moves).to eq([[1, 5], [2, 6]])
      end

      subject(:bottom_mid_knight) { Knight.new(0, 3, 'white') }
      it 'bottom mid' do
        expect(bottom_mid_knight.moves).to eq([[1, 1], [2, 2], [2, 4], [1, 5]])
      end
    end
  end
end

describe Rook do
  describe '#initialize' do
    context 'when is at top' do
      subject(:top_left_rook) { Rook.new(7, 0, 'white') }
      it 'top left' do
        expect(top_left_rook.moves).to eq([[7, 7], [0, 0]])
      end

      subject(:top_right_rook) { Rook.new(7, 7, 'white') }
      it 'top right' do
        expect(top_right_rook.moves).to eq([[0, 7], [7, 0]])
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_rook) { Rook.new(0, 0, 'white') }
      it 'bottom left' do
        expect(bottom_left_rook.moves).to eq([[7, 0], [0, 7]])
      end

      subject(:bottom_right_rook) { Rook.new(0, 7, 'white') }
      it 'bottom right' do
        expect(bottom_right_rook.moves).to eq([[7, 7], [0, 0]])
      end

      subject(:bottom_mid_rook) { Rook.new(0, 3, 'white') }
      it 'bottom mid' do
        expect(bottom_mid_rook.moves).to eq([[7, 3], [0, 7], [0, 0]])
      end
    end
  end
end

describe Queen do
  describe '#initialize' do
    context 'when is at top' do
      subject(:top_left_queen) { Queen.new(7, 0, 'white') }
      it 'top left' do
        expect(top_left_queen.moves).to eq([[7, 7], [0, 0], [0, 7]])
      end

      subject(:top_right_queen) { Queen.new(7, 7, 'white') }
      it 'top right' do
        expect(top_right_queen.moves).to eq([[0, 7], [7, 0], [0, 0]])
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_queen) { Queen.new(0, 0, 'white') }
      it 'bottom left' do
        expect(bottom_left_queen.moves).to eq([[7, 0], [0, 7], [7, 7]])
      end

      subject(:bottom_right_queen) { Queen.new(0, 7, 'white') }
      it 'bottom right' do
        expect(bottom_right_queen.moves).to eq([[7, 7], [0, 0], [7, 0]])
      end

      subject(:bottom_mid_queen) { Queen.new(0, 3, 'white') }
      it 'bottom mid' do
        expect(bottom_mid_queen.moves).to eq([[7, 3], [0, 7], [0, 0], [3, 0],
                                              [4, 7]])
      end
    end
  end
end

describe King do
  describe '#initialize' do
    context 'when is at top' do
      subject(:top_left_king) { King.new(7, 0, 'white') }
      it 'top left' do
        expect(top_left_king.moves).to eq([[7, 1], [6, 0], [6, 1]])
      end

      subject(:top_right_king) { King.new(7, 7, 'white') }
      it 'top right' do
        expect(top_right_king.moves).to eq([[6, 7], [7, 6], [6, 6]])
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_king) { King.new(0, 0, 'white') }
      it 'bottom left' do
        expect(bottom_left_king.moves).to eq([[1, 0], [0, 1], [1, 1]])
      end

      subject(:bottom_right_king) { King.new(0, 7, 'white') }
      it 'bottom right' do
        expect(bottom_right_king.moves).to eq([[1, 7], [0, 6], [1, 6]])
      end

      subject(:bottom_mid_king) { King.new(0, 3, 'white') }
      it 'bottom mid' do
        expect(bottom_mid_king.moves).to eq([[1, 3], [0, 4], [0, 2], [1, 4],
                                             [1, 2]])
      end
    end
  end
end
