require_relative '../lib/validator'
require_relative '../lib/piece'
require_relative '../lib/rook'
require_relative '../lib/bishop'
require_relative '../lib/queen'
require_relative '../lib/king'
require_relative '../lib/knight'
require_relative '../lib/pawn'


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

        context 'when it moves like a bishop' do
          it 'returns true' do
            board = double('board')
            queen = double('queen')
            allow(board).to receive(:selected_piece).and_return(queen)
            allow(queen).to receive(:current_coordinate).and_return(:d1)
            allow(queen).to receive(:destination_coordinate).and_return(:b3)
            allow(Queen).to receive(:===).with(queen).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(true)
          end
        end
      end

      context 'and piece is king' do
        it 'returns true' do
          board = double('board')
          king  = double('king')
          allow(board).to receive(:selected_piece).and_return(king)
          allow(king).to receive(:current_coordinate).and_return(:f2)
          allow(king).to receive(:destination_coordinate).and_return(:e3)
          allow(King).to receive(:===).with(king).and_return(true)
          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

          expect(result).to be(true)
        end
      end

      context 'and piece is knight' do
        it 'returns true' do
          board = double('board')
          knight = double('knight')
          allow(board).to receive(:selected_piece).and_return(knight)
          allow(knight).to receive(:current_coordinate).and_return(:g1)
          allow(knight).to receive(:destination_coordinate).and_return(:f3)
          allow(Knight).to receive(:===).with(knight).and_return(true)
          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

          expect(result).to be(true)
        end
      end

      context 'and piece is pawn' do
        context 'when one step' do
          it 'returns true' do
            board = double('board')
            pawn  = double('pawn')
            allow(board).to receive(:selected_piece).and_return(pawn)
            allow(pawn).to receive(:current_coordinate).and_return(:d7)
            allow(pawn).to receive(:destination_coordinate).and_return(:d6)
            allow(Pawn).to receive(:===).with(pawn).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(true)
          end
        end

        context 'when two steps' do
          it 'returns true' do
            board = double('board')
            pawn  = double('pawn')
            allow(board).to receive(:selected_piece).and_return(pawn)
            allow(pawn).to receive(:current_coordinate).and_return(:e2)
            allow(pawn).to receive(:destination_coordinate).and_return(:e4)
            allow(Pawn).to receive(:===).with(pawn).and_return(true)
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

      context 'and piece is queen' do
        context 'when it moves like a rook' do
          it 'returns false' do
            board = double('board')
            queen = double('queen')
            allow(board).to receive(:selected_piece).and_return(queen)
            allow(queen).to receive(:current_coordinate).and_return(:c2)
            allow(queen).to receive(:destination_coordinate).and_return(:h1)
            allow(Queen).to receive(:===).with(queen).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(false)
          end
        end

        context 'when it moves like a bishop' do
          it 'returns false' do
            board = double('board')
            queen = double('queen')
            allow(board).to receive(:selected_piece).and_return(queen)
            allow(queen).to receive(:current_coordinate).and_return(:g4)
            allow(queen).to receive(:destination_coordinate).and_return(:e5)
            allow(Queen).to receive(:===).with(queen).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(false)
          end
        end
      end

      context 'and piece is king' do
        it 'returns false' do
          board = double('board')
          king  = double('king')
          allow(board).to receive(:selected_piece).and_return(king)
          allow(king).to receive(:current_coordinate).and_return(:b6)
          allow(king).to receive(:destination_coordinate).and_return(:a8)
          allow(King).to receive(:===).with(king).and_return(true)
          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

          expect(result).to be(false)
        end
      end

      context 'and piece is knight' do
        it 'returns false' do
          board = double('board')
          knight = double('knight')
          allow(board).to receive(:selected_piece).and_return(knight)
          allow(knight).to receive(:current_coordinate).and_return(:c5)
          allow(knight).to receive(:destination_coordinate).and_return(:e8)
          allow(Knight).to receive(:===).with(knight).and_return(true)
          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

          expect(result).to be(false)
        end
      end
    end
  end
end
