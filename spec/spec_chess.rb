# frozen_string_literal: true

require_relative '../lib/pieces'

describe Pawn do
  describe '#initialize' do
    let(:board) { Array.new(8) { Array.new(8, nil) } }
    context 'when is at top' do
      subject(:top_left_pawn) { Pawn.new(7, 0, 'white', board) }
      it 'top left' do
        expect(top_right_pawn.legal_moves).to eq([])
      end

      subject(:top_right_pawn) { Pawn.new(7, 7, 'white', board) }
      it 'top right' do
        expect(top_right_pawn.legal_moves).to eq([])
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_pawn) { Pawn.new(0, 0, 'white', board) }
      it 'bottom left' do
        expect(bottom_left_pawn.legal_moves).to eq([[2, 0], [1, 0], [1, 1]])
      end

      subject(:bottom_right_pawn) { Pawn.new(0, 7, 'white', board) }
      it 'bottom right' do
        expect(bottom_right_pawn.legal_moves).to eq([[2, 7], [1, 7], [1, 6]])
      end

      subject(:bottom_mid_pawn) { Pawn.new(0, 3, 'white', board) }
      it 'bottom mid' do
        expect(bottom_mid_pawn.legal_moves).to eq([[2, 3], [1, 3], [1, 2], [1, 4]])
      end
    end
  end
end

describe Bishop do
  describe '#initialize' do
    let(:board) { Array.new(8) { Array.new(8, nil) } }
    context 'when is at top' do
      subject(:top_left_bishop) { Bishop.new(7, 0, 'white', board) }
      it 'top left' do
        expect(top_left_bishop.legal_moves).to contain_exactly([6, 1], [5, 2], [0, 7], [4, 3], [3, 4], [2, 5], [1, 6])
      end

      subject(:top_right_bishop) { Bishop.new(7, 7, 'white', board) }
      it 'top right' do
        expect(top_right_bishop.legal_moves).to contain_exactly([6, 6], [5, 5], [4, 4], [3, 3], [2, 2], [1, 1], [0, 0])
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_bishop) { Bishop.new(0, 0, 'white', board) }
      it 'bottom left' do
        expect(bottom_left_bishop.legal_moves).to contain_exactly([6, 6], [5, 5], [4, 4], [3, 3], [2, 2], [1, 1],
                                                                  [7, 7])
      end

      subject(:bottom_right_bishop) { Bishop.new(0, 7, 'white', board) }
      it 'bottom right' do
        expect(bottom_right_bishop.legal_moves).to contain_exactly([6, 1], [5, 2], [7, 0], [4, 3], [3, 4], [2, 5],
                                                                   [1, 6])
      end

      subject(:bottom_mid_bishop) { Bishop.new(0, 3, 'white', board) }
      it 'bottom mid' do
        expect(bottom_mid_bishop.legal_moves).to contain_exactly([1, 2], [2, 1], [3, 0], [1, 4], [2, 5], [3, 6], [4, 7])
      end
    end
  end
end

describe Knight do
  describe '#initialize' do
    let(:board) { Array.new(8) { Array.new(8, nil) } }
    context 'when is at top' do
      subject(:top_left_knight) { Knight.new(7, 0, 'white', board) }
      it 'top left' do
        expect(top_left_knight.legal_moves).to contain_exactly([6, 2], [5, 1])
      end

      subject(:top_right_knight) { Knight.new(7, 7, 'white', board) }
      it 'top right' do
        expect(top_right_knight.legal_moves).to contain_exactly([5, 6], [6, 5])
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_knight) { Knight.new(0, 0, 'white', board) }
      it 'bottom left' do
        expect(bottom_left_knight.legal_moves).to contain_exactly([2, 1], [1, 2])
      end

      subject(:bottom_right_knight) { Knight.new(0, 7, 'white', board) }
      it 'bottom right' do
        expect(bottom_right_knight.legal_moves).to contain_exactly([1, 5], [2, 6])
      end

      subject(:bottom_mid_knight) { Knight.new(0, 3, 'white', board) }
      it 'bottom mid' do
        expect(bottom_mid_knight.legal_moves).to contain_exactly([1, 1], [2, 2], [2, 4], [1, 5])
      end
    end
  end
end

describe Rook do
  describe '#initialize' do
    let(:board) { Array.new(8) { Array.new(8, nil) } }
    context 'when is at top' do
      subject(:top_left_rook) { Rook.new(7, 0, 'white', board) }
      it 'top left' do
        expect(top_left_rook.legal_moves).to contain_exactly([7, 7], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5],
                                                             [7, 6], [0, 0], [1, 0], [2, 0], [3, 0], [4, 0],
                                                             [5, 0], [6, 0])
      end

      subject(:top_right_rook) { Rook.new(7, 7, 'white', board) }
      it 'top right' do
        expect(top_right_rook.legal_moves).to contain_exactly([0, 7], [7, 0], [7, 1], [7, 2], [7, 3], [7, 4],
                                                              [7, 5], [7, 6], [1, 7], [2, 7], [3, 7], [4, 7],
                                                              [5, 7], [6, 7])
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_rook) { Rook.new(0, 0, 'white', board) }
      it 'bottom left' do
        expect(bottom_left_rook.legal_moves).to contain_exactly([0, 1], [0, 2], [0, 3], [0, 4], [0, 5],
                                                                [0, 6], [0, 7], [1, 0], [2, 0], [3, 0],
                                                                [4, 0], [5, 0], [6, 0], [7, 0])
      end

      subject(:bottom_right_rook) { Rook.new(0, 7, 'white', board) }
      it 'bottom right' do
        expect(bottom_right_rook.legal_moves).to contain_exactly([0, 0], [0, 1], [0, 2], [0, 3], [0, 4],
                                                                 [0, 5], [0, 6], [1, 7], [2, 7], [3, 7],
                                                                 [4, 7], [5, 7], [6, 7], [7, 7])
      end

      subject(:bottom_mid_rook) { Rook.new(0, 3, 'white', board) }
      it 'bottom mid' do
        expect(bottom_mid_rook.legal_moves).to contain_exactly([0, 0], [0, 1], [0, 2], [0, 4], [0, 5],
                                                               [0, 6], [0, 7], [1, 3], [2, 3], [3, 3],
                                                               [4, 3], [5, 3], [6, 3], [7, 3])
      end
    end
  end
end

describe Queen do
  describe '#initialize' do
    let(:board) { Array.new(8) { Array.new(8, nil) } }
    context 'when is at top' do
      subject(:top_left_queen) { Queen.new(7, 0, 'white', board) }
      it 'top left' do
        expect(top_left_queen.legal_moves).to contain_exactly([7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6],
                                                              [7, 7], [6, 0], [5, 0], [4, 0], [3, 0], [2, 0],
                                                              [1, 0], [0, 0], [6, 1], [5, 2], [4, 3], [3, 4],
                                                              [2, 5], [1, 6], [0, 7])
      end

      subject(:top_right_queen) { Queen.new(7, 7, 'white', board) }
      it 'top right' do
        expect(top_right_queen.legal_moves).to contain_exactly([0, 0], [0, 7], [1, 1], [1, 7], [2, 2], [2, 7],
                                                               [3, 3], [3, 7], [4, 4], [4, 7], [5, 5], [5, 7],
                                                               [6, 6], [6, 7], [7, 0], [7, 1], [7, 2], [7, 3],
                                                               [7, 4], [7, 5], [7, 6])
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_queen) { Queen.new(0, 0, 'white', board) }
      it 'bottom left' do
        expect(bottom_left_queen.legal_moves).to contain_exactly([0, 1], [0, 2], [0, 3], [0, 4], [0, 5],
                                                                 [0, 6], [0, 7], [1, 0], [1, 1], [2, 0],
                                                                 [2, 2], [3, 0], [3, 3], [4, 0], [4, 4],
                                                                 [5, 0], [5, 5], [6, 0], [6, 6], [7, 0], [7, 7])
      end

      subject(:bottom_right_queen) { Queen.new(0, 7, 'white', board) }
      it 'bottom right' do
        expect(bottom_right_queen.legal_moves).to contain_exactly([0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5],
                                                                  [0, 6], [1, 6], [1, 7], [2, 5], [2, 7], [3, 4],
                                                                  [3, 7], [4, 3], [4, 7], [5, 2], [5, 7], [6, 1],
                                                                  [6, 7], [7, 0], [7, 7])
      end

      subject(:bottom_mid_queen) { Queen.new(0, 3, 'white', board) }
      it 'bottom mid' do
        expect(bottom_mid_queen.legal_moves).to contain_exactly([0, 0], [0, 1], [0, 2], [0, 4], [0, 5], [0, 6],
                                                                [0, 7], [1, 2], [1, 3], [1, 4], [2, 1], [2, 3],
                                                                [2, 5], [3, 0], [3, 3], [3, 6], [4, 3], [4, 7],
                                                                [5, 3], [6, 3], [7, 3])
      end
    end
  end
end

describe King do
  describe '#initialize' do
    let(:board) { Array.new(8) { Array.new(8, nil) } }
    context 'when is at top' do
      subject(:top_left_king) { King.new(7, 0, 'white', board) }
      it 'top left' do
        expect(top_left_king.legal_moves).to contain_exactly([7, 1], [6, 0], [6, 1])
      end

      subject(:top_right_king) { King.new(7, 7, 'white', board) }
      it 'top right' do
        expect(top_right_king.legal_moves).to contain_exactly([6, 7], [7, 6], [6, 6])
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_king) { King.new(0, 0, 'white', board) }
      it 'bottom left' do
        expect(bottom_left_king.legal_moves).to contain_exactly([1, 0], [0, 1], [1, 1])
      end

      subject(:bottom_right_king) { King.new(0, 7, 'white', board) }
      it 'bottom right' do
        expect(bottom_right_king.legal_moves).to contain_exactly([1, 7], [0, 6], [1, 6])
      end

      subject(:bottom_mid_king) { King.new(0, 3, 'white', board) }
      it 'bottom mid' do
        expect(bottom_mid_king.legal_moves).to contain_exactly([1, 3], [0, 4], [0, 2], [1, 4],
                                                               [1, 2])
      end
    end
  end
end
