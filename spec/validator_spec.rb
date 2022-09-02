require_relative '../lib/validator'
require_relative '../lib/piece'
require_relative '../lib/rook'
require_relative '../lib/bishop'
require_relative '../lib/queen'


describe Validator do
  describe '#valid_move?' do
    context 'when move is valid' do
      context 'and piece is rook' do
        it 'returns true' do
          board = double('board')
          rook  = double('rook')
          allow(board).to receive(:selected_piece).and_return(rook)
          allow(rook).to receive(:current_coordinate).and_return(:f1)
          allow(rook).to receive(:destination_coordinate).and_return(:f7)
          allow(Rook).to receive(:===).with(rook).and_return(true)
          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

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
          allow(Bishop).to receive(:===).with(bishop).and_return(true)
          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

          expect(result).to be(true)
        end
      end

      context 'and piece is queen' do
        context 'when it moves like a rook' do
          it 'returns true' do
            board = double('board')
            queen = double('queen')
            allow(board).to receive(:selected_piece).and_return(queen)
            allow(queen).to receive(:current_coordinate).and_return(:f3)
            allow(queen).to receive(:destination_coordinate).and_return(:f8)
            allow(Queen).to receive(:===).with(queen).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(true)
          end
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
          allow(Rook).to receive(:===).with(rook).and_return(true)
          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

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
          allow(Bishop).to receive(:===).with(bishop).and_return(true)

          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

          expect(result).to be(false)
        end
      end
    end
  end
end
