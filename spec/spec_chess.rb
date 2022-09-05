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
        expect(top_left_bishop.moves).to eq({down_right: [0, 7]})
      end

      subject(:top_right_bishop) { Bishop.new(7, 7, 'white') }
      it 'top right' do
        expect(top_right_bishop.moves).to eq({})
      end
    end

    context 'when is at bottom' do
      subject(:bottom_left_bishop) { Pawn.new(0, 0, 'white') }
      xit 'bottom left' do
        expect(bottom_left_pawn.moves).to eq({ up: [1, 0], up_right: [1, 1] })
      end

      subject(:bottom_right_bishop) { Pawn.new(0, 7, 'white') }
      xit 'bottom right' do
        expect(bottom_right_pawn.moves).to eq({ up: [1, 7], up_left: [1, 6] })
      end

      subject(:bottom_mid_bishop) { Pawn.new(0, 3, 'white') }
      xit 'bottom mid' do
        expect(bottom_mid_pawn.moves).to eq({ up: [1, 3], up_right: [1, 4], up_left: [1, 2] })
      end
    end
  end
end
