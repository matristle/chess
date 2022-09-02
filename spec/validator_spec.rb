require_relative '../lib/validator'

describe Validator do
  describe '#valid_move?' do
    context 'when move is valid' do
      context 'and piece is rook' do
        it 'returns true' do
          validator = Validator.new
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
    end

    context 'when move is not valid' do
      context 'and piece is rook' do
        it 'returns false' do
          validator = Validator.new
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
    end
  end
end
