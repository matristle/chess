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
      context 'piece is rook' do
        context 'when up' do
          it 'returns true' do
            current_coordinate = double('current_coordinate')
            destination_coordinate = double('destination_coordinate')
            board = double('board')
            rook  = double('rook')
            allow(current_coordinate).to receive(:file).and_return('f')
            allow(current_coordinate).to receive(:rank).and_return('1')
            allow(destination_coordinate).to receive(:file).and_return('f')
            allow(destination_coordinate).to receive(:rank).and_return('7')
            allow(board).to receive(:selected_piece).and_return(rook)
            allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
            allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(Rook).to receive(:===).with(rook).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(true)
          end
        end
        context 'when down' do
          it 'returns true' do
            current_coordinate = double('current_coordinate')
            destination_coordinate = double('destination_coordinate')
            board = double('board')
            rook  = double('rook')
            allow(current_coordinate).to receive(:file).and_return('e')
            allow(current_coordinate).to receive(:rank).and_return('3')
            allow(destination_coordinate).to receive(:file).and_return('e')
            allow(destination_coordinate).to receive(:rank).and_return('2')
            allow(board).to receive(:selected_piece).and_return(rook)
            allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
            allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(Rook).to receive(:===).with(rook).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(true)
          end
        end
        context 'when left' do
          it 'returns true' do
            current_coordinate = double('current_coordinate')
            destination_coordinate = double('destination_coordinate')
            board = double('board')
            rook  = double('rook')
            allow(current_coordinate).to receive(:file).and_return('c')
            allow(current_coordinate).to receive(:rank).and_return('1')
            allow(destination_coordinate).to receive(:file).and_return('a')
            allow(destination_coordinate).to receive(:rank).and_return('1')
            allow(board).to receive(:selected_piece).and_return(rook)
            allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
            allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(Rook).to receive(:===).with(rook).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(true)
          end
        end
        context 'when right' do
          it 'returns true' do
            current_coordinate = double('current_coordinate')
            destination_coordinate = double('destination_coordinate')
            board = double('board')
            rook  = double('rook')
            allow(current_coordinate).to receive(:file).and_return('d')
            allow(current_coordinate).to receive(:rank).and_return('4')
            allow(destination_coordinate).to receive(:file).and_return('g')
            allow(destination_coordinate).to receive(:rank).and_return('4')
            allow(board).to receive(:selected_piece).and_return(rook)
            allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
            allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(Rook).to receive(:===).with(rook).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(true)
          end
        end
      end

      context 'piece is bishop' do
        context 'when top left diagonal' do
          it 'returns true' do
            current_coordinate = double('current_coordinate')
            destination_coordinate = double('destination_coordinate')
            board = double('board')
            bishop = double('bishop')
            allow(current_coordinate).to receive(:file_to_number).and_return(3)
            allow(destination_coordinate).to receive(:file_to_number).and_return(1)
            allow(current_coordinate).to receive(:file).and_return('c')
            allow(current_coordinate).to receive(:rank).and_return('3')
            allow(destination_coordinate).to receive(:file).and_return('a')
            allow(destination_coordinate).to receive(:rank).and_return('5')
            allow(board).to receive(:selected_piece).and_return(bishop)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(Bishop).to receive(:===).with(bishop).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(true)
          end
        end
        context 'when top right diagonal' do
          it 'returns true' do
            current_coordinate = double('current_coordinate')
            destination_coordinate = double('destination_coordinate')
            board = double('board')
            bishop = double('bishop')
            allow(current_coordinate).to receive(:file_to_number).and_return(4)
            allow(destination_coordinate).to receive(:file_to_number).and_return(7)
            allow(current_coordinate).to receive(:file).and_return('d')
            allow(current_coordinate).to receive(:rank).and_return('3')
            allow(destination_coordinate).to receive(:file).and_return('g')
            allow(destination_coordinate).to receive(:rank).and_return('6')
            allow(board).to receive(:selected_piece).and_return(bishop)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(Bishop).to receive(:===).with(bishop).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(true)
          end
        end
        context 'when bottom left diagonal' do
          it 'returns true' do
            current_coordinate = double('current_coordinate')
            destination_coordinate = double('destination_coordinate')
            board = double('board')
            bishop = double('bishop')
            allow(current_coordinate).to receive(:file_to_number).and_return(5)
            allow(destination_coordinate).to receive(:file_to_number).and_return(2)
            allow(current_coordinate).to receive(:file).and_return('e')
            allow(current_coordinate).to receive(:rank).and_return('7')
            allow(destination_coordinate).to receive(:file).and_return('b')
            allow(destination_coordinate).to receive(:rank).and_return('4')
            allow(board).to receive(:selected_piece).and_return(bishop)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(Bishop).to receive(:===).with(bishop).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(true)
          end
        end
        context 'when bottom right diagonal' do
          it 'returns true' do
            current_coordinate = double('current_coordinate')
            destination_coordinate = double('destination_coordinate')
            board = double('board')
            bishop = double('bishop')
            allow(current_coordinate).to receive(:file_to_number).and_return(4)
            allow(destination_coordinate).to receive(:file_to_number).and_return(6)
            allow(current_coordinate).to receive(:file).and_return('d')
            allow(current_coordinate).to receive(:rank).and_return('4')
            allow(destination_coordinate).to receive(:file).and_return('f')
            allow(destination_coordinate).to receive(:rank).and_return('2')
            allow(board).to receive(:selected_piece).and_return(bishop)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(Bishop).to receive(:===).with(bishop).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(true)
          end
        end
      end

      context 'piece is queen' do
        context 'when it moves like a rook' do
          it 'returns true' do
            current_coordinate = double('current_coordinate')
            destination_coordinate = double('destination_coordinate')
            board = double('board')
            queen = double('queen')
            allow(current_coordinate).to receive(:file).and_return('f')
            allow(current_coordinate).to receive(:rank).and_return('3')
            allow(destination_coordinate).to receive(:file).and_return('f')
            allow(destination_coordinate).to receive(:rank).and_return('8')
            allow(board).to receive(:selected_piece).and_return(queen)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(Queen).to receive(:===).with(queen).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(true)
          end
        end

        context 'when it moves like a bishop' do
          it 'returns true' do
            current_coordinate = double('current_coordinate')
            destination_coordinate = double('destination_coordinate')
            board = double('board')
            queen = double('queen')
            allow(current_coordinate).to receive(:file_to_number).and_return(4)
            allow(destination_coordinate).to receive(:file_to_number).and_return(2)
            allow(current_coordinate).to receive(:file).and_return('d')
            allow(current_coordinate).to receive(:rank).and_return('1')
            allow(destination_coordinate).to receive(:file).and_return('b')
            allow(destination_coordinate).to receive(:rank).and_return('3')
            allow(board).to receive(:selected_piece).and_return(queen)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(Queen).to receive(:===).with(queen).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(true)
          end
        end
      end

      context 'piece is king' do
        it 'returns true' do
          current_coordinate = double('current_coordinate')
          destination_coordinate = double('destination_coordinate')
          board = double('board')
          king  = double('king')
          allow(current_coordinate).to receive(:file_to_number).and_return(6)
          allow(destination_coordinate).to receive(:file_to_number).and_return(5)
          allow(current_coordinate).to receive(:file).and_return('f')
          allow(current_coordinate).to receive(:rank).and_return('2')
          allow(destination_coordinate).to receive(:file).and_return('e')
          allow(destination_coordinate).to receive(:rank).and_return('3')
          allow(board).to receive(:selected_piece).and_return(king)
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(King).to receive(:===).with(king).and_return(true)
          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

          expect(result).to be(true)
        end
      end

      context 'piece is knight' do
        it 'returns true' do
          current_coordinate = double('current_coordinate')
          destination_coordinate = double('destination_coordinate')
          board = double('board')
          knight = double('knight')
          allow(current_coordinate).to receive(:file_to_number).and_return(7)
          allow(destination_coordinate).to receive(:file_to_number).and_return(6)
          allow(current_coordinate).to receive(:file).and_return('g')
          allow(current_coordinate).to receive(:rank).and_return('1')
          allow(destination_coordinate).to receive(:file).and_return('f')
          allow(destination_coordinate).to receive(:rank).and_return('3')
          allow(board).to receive(:selected_piece).and_return(knight)
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(Knight).to receive(:===).with(knight).and_return(true)
          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

          expect(result).to be(true)
        end
      end

      context 'piece is pawn' do
        context 'when piece is white' do
          context 'when one step forward' do
            it 'returns true' do
              current_coordinate = double('current_coordinate')
              destination_coordinate = double('destination_coordinate')
              board = double('board')
              pawn  = double('pawn')
              allow(pawn).to receive(:color).and_return(:white)
              allow(pawn).to receive(:is_a?).and_return(Pawn)
              allow(current_coordinate).to receive(:file).and_return('c')
              allow(current_coordinate).to receive(:rank).and_return('5')
              allow(destination_coordinate).to receive(:file).and_return('c')
              allow(destination_coordinate).to receive(:rank).and_return('6')
              allow(board).to receive(:selected_piece).and_return(pawn)
              allow(pawn).to receive(:current_coordinate).and_return(current_coordinate)
              allow(pawn).to receive(:destination_coordinate).and_return(destination_coordinate)
              allow(Pawn).to receive(:===).with(pawn).and_return(true)
              validator = Validator.new(board:)
              allow(validator).to receive(:valid_board_move?).and_return(true)

              result = validator.valid_move?

              expect(result).to be(true)
            end
          end

          context 'when two steps forward' do
            it 'returns true' do
              current_coordinate = double('current_coordinate')
              destination_coordinate = double('destination_coordinate')
              board = double('board')
              pawn  = double('pawn')
              allow(pawn).to receive(:color).and_return(:white)
              allow(pawn).to receive(:is_a?).and_return(Pawn)
              allow(current_coordinate).to receive(:file_to_number).and_return(5)
              allow(destination_coordinate).to receive(:file_to_number).and_return(5)
              allow(current_coordinate).to receive(:file).and_return('e')
              allow(current_coordinate).to receive(:rank).and_return('2')
              allow(destination_coordinate).to receive(:file).and_return('e')
              allow(destination_coordinate).to receive(:rank).and_return('4')
              allow(pawn).to receive(:current_coordinate).and_return(current_coordinate)
              allow(pawn).to receive(:destination_coordinate).and_return(destination_coordinate)
              allow(board).to receive(:selected_piece).and_return(pawn)
              allow(Pawn).to receive(:===).with(pawn).and_return(true)
              validator = Validator.new(board:)
              allow(validator).to receive(:valid_board_move?).and_return(true)

              result = validator.valid_move?

              expect(result).to be(true)
            end
          end
        end

        context 'when piece is black' do
          context 'when one step forward' do
            it 'returns true' do
              current_coordinate = double('current_coordinate')
              destination_coordinate = double('destination_coordinate')
              board = double('board')
              pawn  = double('pawn')
              allow(pawn).to receive(:color).and_return(:black)
              allow(pawn).to receive(:is_a?).and_return(Pawn)
              allow(current_coordinate).to receive(:file).and_return('c')
              allow(current_coordinate).to receive(:rank).and_return('5')
              allow(destination_coordinate).to receive(:file).and_return('c')
              allow(destination_coordinate).to receive(:rank).and_return('4')
              allow(board).to receive(:selected_piece).and_return(pawn)
              allow(pawn).to receive(:current_coordinate).and_return(current_coordinate)
              allow(pawn).to receive(:destination_coordinate).and_return(destination_coordinate)
              allow(Pawn).to receive(:===).with(pawn).and_return(true)
              validator = Validator.new(board:)
              allow(validator).to receive(:valid_board_move?).and_return(true)

              result = validator.valid_move?

              expect(result).to be(true)
            end
          end

          context 'when two steps forward' do
            it 'returns true' do
              current_coordinate = double('current_coordinate')
              destination_coordinate = double('destination_coordinate')
              board = double('board')
              pawn  = double('pawn')
              allow(pawn).to receive(:color).and_return(:black)
              allow(pawn).to receive(:is_a?).and_return(Pawn)
              allow(current_coordinate).to receive(:file_to_number).and_return(5)
              allow(destination_coordinate).to receive(:file_to_number).and_return(5)
              allow(current_coordinate).to receive(:file).and_return('e')
              allow(current_coordinate).to receive(:rank).and_return('7')
              allow(destination_coordinate).to receive(:file).and_return('e')
              allow(destination_coordinate).to receive(:rank).and_return('5')
              allow(pawn).to receive(:current_coordinate).and_return(current_coordinate)
              allow(pawn).to receive(:destination_coordinate).and_return(destination_coordinate)
              allow(board).to receive(:selected_piece).and_return(pawn)
              allow(Pawn).to receive(:===).with(pawn).and_return(true)
              validator = Validator.new(board:)
              allow(validator).to receive(:valid_board_move?).and_return(true)

              result = validator.valid_move?

              expect(result).to be(true)
            end
          end
        end
      end
    end

    context 'when move is not valid' do
      context 'piece is rook' do
        it 'returns false' do
          current_coordinate = double('current_coordinate')
          destination_coordinate = double('destination_coordinate')
          board = double('board')
          rook  = double('rook')
          allow(current_coordinate).to receive(:file).and_return('h')
          allow(current_coordinate).to receive(:rank).and_return('1')
          allow(destination_coordinate).to receive(:file).and_return('a')
          allow(destination_coordinate).to receive(:rank).and_return('7')
          allow(board).to receive(:selected_piece).and_return(rook)
          allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
          allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(Rook).to receive(:===).with(rook).and_return(true)
          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

          expect(result).to be(false)
        end
      end

      context 'piece is bishop' do
        it 'returns false' do
          current_coordinate = double('current_coordinate')
          destination_coordinate = double('destination_coordinate')
          board = double('board')
          bishop  = double('bishop')
          allow(current_coordinate).to receive(:file_to_number).and_return(2)
          allow(destination_coordinate).to receive(:file_to_number).and_return(5)
          allow(current_coordinate).to receive(:file).and_return('b')
          allow(current_coordinate).to receive(:rank).and_return('3')
          allow(destination_coordinate).to receive(:file).and_return('e')
          allow(destination_coordinate).to receive(:rank).and_return('5')
          allow(board).to receive(:selected_piece).and_return(bishop)
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(Bishop).to receive(:===).with(bishop).and_return(true)

          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

          expect(result).to be(false)
        end
      end

      context 'piece is queen' do
        context 'when it moves like a rook' do
          it 'returns false' do
            current_coordinate = double('current_coordinate')
            destination_coordinate = double('destination_coordinate')
            board = double('board')
            queen = double('queen')
            allow(current_coordinate).to receive(:file_to_number).and_return(3)
            allow(destination_coordinate).to receive(:file_to_number).and_return(8)
            allow(current_coordinate).to receive(:file).and_return('c')
            allow(current_coordinate).to receive(:rank).and_return('2')
            allow(destination_coordinate).to receive(:file).and_return('h')
            allow(destination_coordinate).to receive(:rank).and_return('1')
            allow(board).to receive(:selected_piece).and_return(queen)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(Queen).to receive(:===).with(queen).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(false)
          end
        end

        context 'when it moves like a bishop' do
          it 'returns false' do
            current_coordinate = double('current_coordinate')
            destination_coordinate = double('destination_coordinate')
            board = double('board')
            queen = double('queen')
            allow(current_coordinate).to receive(:file_to_number).and_return(7)
            allow(destination_coordinate).to receive(:file_to_number).and_return(5)
            allow(current_coordinate).to receive(:file).and_return('g')
            allow(current_coordinate).to receive(:rank).and_return('4')
            allow(destination_coordinate).to receive(:file).and_return('e')
            allow(destination_coordinate).to receive(:rank).and_return('5')
            allow(board).to receive(:selected_piece).and_return(queen)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(Queen).to receive(:===).with(queen).and_return(true)
            validator = Validator.new(board:)
            allow(validator).to receive(:valid_board_move?).and_return(true)

            result = validator.valid_move?

            expect(result).to be(false)
          end
        end
      end

      context 'piece is king' do
        it 'returns false' do
          current_coordinate = double('current_coordinate')
          destination_coordinate = double('destination_coordinate')
          board = double('board')
          king  = double('king')
          allow(current_coordinate).to receive(:file_to_number).and_return(2)
          allow(destination_coordinate).to receive(:file_to_number).and_return(1)
          allow(current_coordinate).to receive(:file).and_return('b')
          allow(current_coordinate).to receive(:rank).and_return('6')
          allow(destination_coordinate).to receive(:file).and_return('a')
          allow(destination_coordinate).to receive(:rank).and_return('8')
          allow(board).to receive(:selected_piece).and_return(king)
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(King).to receive(:===).with(king).and_return(true)
          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

          expect(result).to be(false)
        end
      end

      context 'piece is knight' do
        it 'returns false' do
          current_coordinate = double('current_coordinate')
          destination_coordinate = double('destination_coordinate')
          board = double('board')
          knight = double('knight')
          allow(current_coordinate).to receive(:file).and_return('c')
          allow(current_coordinate).to receive(:rank).and_return('5')
          allow(destination_coordinate).to receive(:file).and_return('e')
          allow(destination_coordinate).to receive(:rank).and_return('8')
          allow(board).to receive(:selected_piece).and_return(knight)
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(Knight).to receive(:===).with(knight).and_return(true)
          validator = Validator.new(board:)
          allow(validator).to receive(:valid_board_move?).and_return(true)

          result = validator.valid_move?

          expect(result).to be(false)
        end
      end

      context 'piece is pawn' do
        context 'color is white' do
          context 'when one step backward' do
            it 'returns false' do
              current_coordinate     = double('current_coordinate')
              destination_coordinate = double('destination_coordinate')
              board = double('board')
              pawn  = double('pawn')
              allow(pawn).to receive(:color).and_return(:white)
              allow(pawn).to receive(:is_a?).and_return(Pawn)
              allow(current_coordinate).to receive(:file).and_return('d')
              allow(current_coordinate).to receive(:rank).and_return('4')
              allow(destination_coordinate).to receive(:file).and_return('d')
              allow(destination_coordinate).to receive(:rank).and_return('3')
              allow(board).to receive(:selected_piece).and_return(pawn)
              allow(pawn).to receive(:current_coordinate).and_return(current_coordinate)
              allow(pawn).to receive(:destination_coordinate).and_return(destination_coordinate)
              allow(Pawn).to receive(:===).with(pawn).and_return(true)
              validator = Validator.new(board:)
              allow(validator).to receive(:valid_board_move?).and_return(true)

              result = validator.valid_move?

              expect(result).to be(false)
            end
          end

          context 'when two steps backward' do
            it 'returns false' do
              current_coordinate     = double('current_coordinate')
              destination_coordinate = double('destination_coordinate')
              board = double('board')
              pawn  = double('pawn')
              allow(pawn).to receive(:color).and_return(:white)
              allow(pawn).to receive(:is_a?).and_return(Pawn)
              allow(current_coordinate).to receive(:file_to_number).and_return(5)
              allow(destination_coordinate).to receive(:file_to_number).and_return(5)
              allow(current_coordinate).to receive(:file).and_return('e')
              allow(current_coordinate).to receive(:rank).and_return('4')
              allow(destination_coordinate).to receive(:file).and_return('e')
              allow(destination_coordinate).to receive(:rank).and_return('2')
              allow(board).to receive(:selected_piece).and_return(pawn)
              allow(pawn).to receive(:current_coordinate).and_return(current_coordinate)
              allow(pawn).to receive(:destination_coordinate).and_return(destination_coordinate)
              allow(Pawn).to receive(:===).with(pawn).and_return(true)
              validator = Validator.new(board:)
              allow(validator).to receive(:valid_board_move?).and_return(true)

              result = validator.valid_move?

              expect(result).to be(false)
            end
          end
        end

        context 'color is black' do
          context 'when one step backward' do
            it 'returns false' do
              current_coordinate     = double('current_coordinate')
              destination_coordinate = double('destination_coordinate')
              board = double('board')
              pawn  = double('pawn')
              allow(pawn).to receive(:color).and_return(:black)
              allow(pawn).to receive(:is_a?).and_return(Pawn)
              allow(current_coordinate).to receive(:file).and_return('g')
              allow(current_coordinate).to receive(:rank).and_return('7')
              allow(destination_coordinate).to receive(:file).and_return('g')
              allow(destination_coordinate).to receive(:rank).and_return('8')
              allow(board).to receive(:selected_piece).and_return(pawn)
              allow(pawn).to receive(:current_coordinate).and_return(current_coordinate)
              allow(pawn).to receive(:destination_coordinate).and_return(destination_coordinate)
              allow(Pawn).to receive(:===).with(pawn).and_return(true)
              validator = Validator.new(board:)
              allow(validator).to receive(:valid_board_move?).and_return(true)

              result = validator.valid_move?

              expect(result).to be(false)
            end
          end
        end
      end
    end
  end
end
