require_relative '../lib/validator'
require_relative '../lib/rook'
require_relative '../lib/bishop'

describe Validator do
  describe '#valid_move?' do
    subject(:validator) { Validator.new }

    context 'when move is valid' do
      context 'and piece is rook' do
        it 'returns true' do
          board = double('board')
          rook  = double('rook')
          allow(board).to receive(:selected_piece).and_return(rook)
          allow(rook).to receive(:current_coordinate).and_return(:f1)
          allow(rook).to receive(:destination_coordinate).and_return(:f7)
          allow(rook).to receive(:class).and_return(Rook)

          result = validator.valid_move?(board:)

          expect(result).to be(true)
        end
      end

      context 'and piece is bishop' do
        it 'returns true' do
          board = double('board')
          bishop  = double('bishop')
          allow(board).to receive(:selected_piece).and_return(bishop)
          allow(bishop).to receive(:current_coordinate).and_return(:c4)
          allow(bishop).to receive(:destination_coordinate).and_return(:f7)
          allow(bishop).to receive(:class).and_return(Bishop)

          result = validator.valid_move?(board:)

          expect(result).to be(true)
        end
      end
    end

    context 'when move is not valid' do
      context 'and piece is rook' do
        it 'returns false' do
          board = double('board')
          rook  = double('rook')
          allow(board).to receive(:selected_piece).and_return(rook)
          allow(rook).to receive(:current_coordinate).and_return(:h1)
          allow(rook).to receive(:destination_coordinate).and_return(:a7)
          allow(rook).to receive(:class).and_return(Rook)

          result = validator.valid_move?(board:)

          expect(result).to be(false)
        end
      end

      context 'and piece is bishop' do
        it 'returns false' do
          board = double('board')
          bishop  = double('bishop')
          allow(board).to receive(:selected_piece).and_return(bishop)
          allow(bishop).to receive(:current_coordinate).and_return(:b3)
          allow(bishop).to receive(:destination_coordinate).and_return(:e5)
          allow(bishop).to receive(:class).and_return(Bishop)

          result = validator.valid_move?(board:)

          expect(result).to be(false)
        end
      end
    end
  end
end
