# frozen_string_literal: true

require_relative '../lib/pieces'

describe Pawn do
  describe '#initialize' do
    context 'when is at top' do
      subject(:top_left_pawn) { Pawn.new(7, 0, 'white') }
      it 'top left' do
        expect(top_right_pawn.moves).to eq({})
      end

      subject(:top_right_pawn) { Pawn.new(7, 7, 'white') }
      it 'top right' do
        expect(top_right_pawn.moves).to eq({})
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_pawn) { Pawn.new(0, 0, 'white') }
      it 'bottom left' do
        expect(bottom_left_pawn.moves).to eq({ up: [1, 0], up_right: [1, 1] })
      end

      subject(:bottom_right_pawn) { Pawn.new(0, 7, 'white') }
      it 'bottom right' do
        expect(bottom_right_pawn.moves).to eq({ up: [1, 7], up_left: [1, 6] })
      end

      subject(:bottom_mid_pawn) { Pawn.new(0, 3, 'white') }
      it 'bottom mid' do
        expect(bottom_mid_pawn.moves).to eq({ up: [1, 3], up_right: [1, 4], up_left: [1, 2] })
      end
    end
  end
end

describe Bishop do
  describe '#initialize' do
    context 'when is at top' do
      subject(:top_left_bishop) { Bishop.new(7, 0, 'white') }
      it 'top left' do
        expect(top_left_bishop.moves).to eq({ down_right: [0, 7] })
      end

      subject(:top_right_bishop) { Bishop.new(7, 7, 'white') }
      it 'top right' do
        expect(top_right_bishop.moves).to eq({ down_left: [0, 0] })
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_bishop) { Bishop.new(0, 0, 'white') }
      it 'bottom left' do
        expect(bottom_left_bishop.moves).to eq({ up_right: [7, 7] })
      end

      subject(:bottom_right_bishop) { Bishop.new(0, 7, 'white') }
      it 'bottom right' do
        expect(bottom_right_bishop.moves).to eq({ up_left: [7, 0] })
      end

      subject(:bottom_mid_bishop) { Bishop.new(0, 3, 'white') }
      it 'bottom mid' do
        expect(bottom_mid_bishop.moves).to eq({ up_right: [4, 7], up_left: [3, 0] })
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
        expect(top_left_rook.moves).to eq({ right: [7, 7], bottom: [0, 0] })
      end

      subject(:top_right_rook) { Rook.new(7, 7, 'white') }
      it 'top right' do
        expect(top_right_rook.moves).to eq({ bottom: [0, 7], left: [7, 0] })
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_rook) { Rook.new(0, 0, 'white') }
      it 'bottom left' do
        expect(bottom_left_rook.moves).to eq({ right: [0, 7], top: [7, 0] })
      end

      subject(:bottom_right_rook) { Rook.new(0, 7, 'white') }
      it 'bottom right' do
        expect(bottom_right_rook.moves).to eq({ left: [0, 0], top: [7, 7] })
      end

      subject(:bottom_mid_rook) { Rook.new(0, 3, 'white') }
      it 'bottom mid' do
        expect(bottom_mid_rook.moves).to eq({ left: [0, 0], top: [7, 3], right: [0, 7] })
      end
    end
  end
end

describe Queen do
  describe '#initialize' do
    context 'when is at top' do
      subject(:top_left_queen) { Queen.new(7, 0, 'white') }
      it 'top left' do
        expect(top_left_queen.moves).to eq({ right: [7, 7], bottom: [0, 0], down_right: [0, 7] })
      end

      subject(:top_right_queen) { Queen.new(7, 7, 'white') }
      it 'top right' do
        expect(top_right_queen.moves).to eq({ bottom: [0, 7], left: [7, 0], down_left: [0, 0] })
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_queen) { Queen.new(0, 0, 'white') }
      it 'bottom left' do
        expect(bottom_left_queen.moves).to eq({ right: [0, 7], top: [7, 0], up_right: [7, 7] })
      end

      subject(:bottom_right_queen) { Queen.new(0, 7, 'white') }
      it 'bottom right' do
        expect(bottom_right_queen.moves).to eq({ left: [0, 0], top: [7, 7], up_left: [7, 0] })
      end

      subject(:bottom_mid_queen) { Queen.new(0, 3, 'white') }
      it 'bottom mid' do
        expect(bottom_mid_queen.moves).to eq({ left: [0, 0], top: [7, 3], right: [0, 7], up_right: [4, 7],
                                               up_left: [3, 0] })
      end
    end
  end
end

describe King do
  describe '#initialize' do
    context 'when is at top' do
      subject(:top_left_king) { King.new(7, 0, 'white') }
      it 'top left' do
        expect(top_left_king.moves).to eq({ right: [7, 1], bottom: [6, 0], bottom_right: [6, 1] })
      end

      subject(:top_right_king) { King.new(7, 7, 'white') }
      it 'top right' do
        expect(top_right_king.moves).to eq({ bottom: [6, 7], left: [7, 6], bottom_left: [6, 6] })
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_king) { King.new(0, 0, 'white') }
      it 'bottom left' do
        expect(bottom_left_king.moves).to eq({ right: [0, 1], top: [1, 0], top_right: [1, 1] })
      end

      subject(:bottom_right_king) { King.new(0, 7, 'white') }
      it 'bottom right' do
        expect(bottom_right_king.moves).to eq({ left: [0, 6], top: [1, 7], top_left: [1, 6] })
      end

      subject(:bottom_mid_king) { King.new(0, 3, 'white') }
      it 'bottom mid' do
        expect(bottom_mid_king.moves).to eq({ left: [0, 2], top: [1, 3], right: [0, 4], top_right: [1, 4],
                                               top_left: [1, 2] })
      end
    end
  end
end
