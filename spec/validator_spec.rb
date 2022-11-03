require_relative '../lib/validator'
require_relative '../lib/piece'
require_relative '../lib/rook'
require_relative '../lib/bishop'
require_relative '../lib/queen'
require_relative '../lib/king'
require_relative '../lib/knight'
require_relative '../lib/pawn'
require_relative '../lib/coordinate'
require_relative '../lib/board'

xdescribe Validator do
  describe '#valid_move?' do
    context 'when other pieces aren\'t needed' do
      context 'when move is valid' do
        context 'piece is rook' do
          let(:current_coordinate)     { double('current_coordinate') }
          let(:destination_coordinate) { double('destination_coordinate') }
          let(:board)                  { double('board') }
          let(:rook)                   { double('rook') }
          subject(:validator) { described_class.new(board:) }

          context 'when up' do
            before do
              allow(current_coordinate).to receive_messages(file: 'f', rank: '1')
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '7')
              allow(board).to receive(:selected_piece).and_return(rook)
              allow(rook).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Rook).to receive(:===).with(rook).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when down' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '3')
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '1')
              allow(board).to receive(:selected_piece).and_return(rook)
              allow(rook).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Rook).to receive(:===).with(rook).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when left' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '1')
              allow(destination_coordinate).to receive_messages(file: 'a', rank: '1')
              allow(board).to receive(:selected_piece).and_return(rook)
              allow(rook).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Rook).to receive(:===).with(rook).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when right' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '4')
              allow(destination_coordinate).to receive_messages(file: 'g', rank: '4')
              allow(board).to receive(:selected_piece).and_return(rook)
              allow(rook).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Rook).to receive(:===).with(rook).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
        end

        context 'piece is bishop' do
          let(:current_coordinate)     { double('current_coordinate') }
          let(:destination_coordinate) { double('destination_coordinate') }
          let(:board)                  { double('board') }
          let(:bishop)                 { double('bishop') }
          subject(:validator) { described_class.new(board:) }

          context 'when top left diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '5', file_to_number: 3)
              allow(destination_coordinate).to receive_messages(file: 'a', rank: '3', file_to_number: 1)
              allow(board).to receive(:selected_piece).and_return(bishop)
              allow(bishop).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Bishop).to receive(:===).with(bishop).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when top right diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '3', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'g', rank: '6', file_to_number: 7)
              allow(board).to receive(:selected_piece).and_return(bishop)
              allow(bishop).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Bishop).to receive(:===).with(bishop).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom left diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '7', file_to_number: 5)
              allow(destination_coordinate).to receive_messages(file: 'b', rank: '4', file_to_number: 2)
              allow(board).to receive(:selected_piece).and_return(bishop)
              allow(bishop).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Bishop).to receive(:===).with(bishop).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom right diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '4', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '2', file_to_number: 6)
              allow(board).to receive(:selected_piece).and_return(bishop)
              allow(bishop).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Bishop).to receive(:===).with(bishop).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
        end

        context 'piece is queen' do
          let(:current_coordinate)     { double('current_coordinate') }
          let(:destination_coordinate) { double('destination_coordinate') }
          let(:board)                  { double('board') }
          let(:queen)                  { double('queen') }
          subject(:validator) { described_class.new(board:) }

          context 'when up' do
            before do
              allow(current_coordinate).to receive_messages(file: 'f', rank: '1')
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '7')
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when down' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '3')
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '1')
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when left' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '1')
              allow(destination_coordinate).to receive_messages(file: 'a', rank: '1')
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when right' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '4')
              allow(destination_coordinate).to receive_messages(file: 'g', rank: '4')
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when top left diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '5', file_to_number: 3)
              allow(destination_coordinate).to receive_messages(file: 'a', rank: '3', file_to_number: 1)
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when top right diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '3', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'g', rank: '6', file_to_number: 7)
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom left diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '7', file_to_number: 5)
              allow(destination_coordinate).to receive_messages(file: 'b', rank: '4', file_to_number: 2)
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom right diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '4', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '2', file_to_number: 6)
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
        end

        context 'piece is king' do
          let(:current_coordinate)     { double('current_coordinate') }
          let(:destination_coordinate) { double('destination_coordinate') }
          let(:board)                  { double('board') }
          let(:king)                   { double('king') }
          subject(:validator) { described_class.new(board:) }

          context 'when up' do
            before do
              allow(current_coordinate).to receive_messages(file: 'f', rank: '6')
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '7')
              allow(board).to receive(:selected_piece).and_return(king)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when down' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '3')
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '2')
              allow(board).to receive(:selected_piece).and_return(king)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when left' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '1', file_to_number: 3)
              allow(destination_coordinate).to receive_messages(file: 'b', rank: '1', file_to_number: 2)
              allow(board).to receive(:selected_piece).and_return(king)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when right' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '4', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '4', file_to_number: 5)
              allow(board).to receive(:selected_piece).and_return(king)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when top left diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '5', file_to_number: 3)
              allow(destination_coordinate).to receive_messages(file: 'b', rank: '6', file_to_number: 2)
              allow(board).to receive(:selected_piece).and_return(king)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when top right diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '3', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '4', file_to_number: 5)
              allow(board).to receive(:selected_piece).and_return(king)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when bottom left diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '7', file_to_number: 5)
              allow(destination_coordinate).to receive_messages(file: 'd', rank: '6', file_to_number: 4)
              allow(board).to receive(:selected_piece).and_return(king)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when bottom right diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '4', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '3', file_to_number: 5)
              allow(board).to receive(:selected_piece).and_return(king)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
        end
        context 'piece is knight' do
          let(:current_coordinate)     { double('current_coordinate') }
          let(:destination_coordinate) { double('destination_coordinate') }
          let(:board)                  { double('board') }
          let(:knight)                 { double('knight') }
          subject(:validator) { described_class.new(board:) }

          context 'when top left narrow L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'g', rank: '6', file_to_number: 7)
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '8', file_to_number: 6)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when top left wide L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '7', file_to_number: 3)
              allow(destination_coordinate).to receive_messages(file: 'a', rank: '8', file_to_number: 1)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when top right narrow L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '4', file_to_number: 5)
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '6', file_to_number: 6)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when top right wide L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '1', file_to_number: 5)
              allow(destination_coordinate).to receive_messages(file: 'g', rank: '2', file_to_number: 7)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when bottom left narrow L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'f', rank: '7', file_to_number: 6)
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '5', file_to_number: 5)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom left wide L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'g', rank: '2', file_to_number: 7)
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '1', file_to_number: 5)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom right narrow L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '3', file_to_number: 5)
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '1', file_to_number: 6)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom right wide L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'f', rank: '3', file_to_number: 6)
              allow(destination_coordinate).to receive_messages(file: 'h', rank: '2', file_to_number: 8)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(validator).to receive(:valid_board_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
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

    context 'when other pieces are needed' do
      context 'when capturing a piece' do
        context 'piece is rook' do
          let(:current_coordinate)     { double('current_coordinate') }
          let(:destination_coordinate) { double('destination_coordinate') }
          let(:board)                  { double('board') }
          let(:rook)                   { double('rook') }
          let(:target_piece)           { double('target_piece') }
          subject(:validator) { described_class.new(board:) }
          
          context 'when up' do
            before do
              allow(current_coordinate).to receive_messages(file: 'f', rank: '1')
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '7')
              allow(board).to receive(:selected_piece).and_return(rook)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(rook).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Rook).to receive(:===).with(rook).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(rook).to receive(:capturable?).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end
            
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          
          context 'when down' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '3')
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '1')
              allow(board).to receive(:selected_piece).and_return(rook)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(rook).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Rook).to receive(:===).with(rook).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end
            
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          
          context 'when left' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '1')
              allow(destination_coordinate).to receive_messages(file: 'a', rank: '1')
              allow(board).to receive(:selected_piece).and_return(rook)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(rook).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Rook).to receive(:===).with(rook).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          
          context 'when right' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '4')
              allow(destination_coordinate).to receive_messages(file: 'g', rank: '4')
              allow(board).to receive(:selected_piece).and_return(rook)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(rook).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Rook).to receive(:===).with(rook).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
        end

        context 'piece is bishop' do
          let(:current_coordinate)     { double('current_coordinate') }
          let(:destination_coordinate) { double('destination_coordinate') }
          let(:board)                  { double('board') }
          let(:bishop)                 { double('bishop') }
          let(:target_piece)           { double('target_piece') }
          subject(:validator) { described_class.new(board:) }

          context 'when top left diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '5', file_to_number: 3)
              allow(destination_coordinate).to receive_messages(file: 'a', rank: '3', file_to_number: 1)
              allow(board).to receive(:selected_piece).and_return(bishop)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(bishop).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Bishop).to receive(:===).with(bishop).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when top right diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '3', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'g', rank: '6', file_to_number: 7)
              allow(board).to receive(:selected_piece).and_return(bishop)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(bishop).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(Bishop).to receive(:===).with(bishop).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom left diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '7', file_to_number: 5)
              allow(destination_coordinate).to receive_messages(file: 'b', rank: '4', file_to_number: 2)
              allow(board).to receive(:selected_piece).and_return(bishop)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(bishop).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Bishop).to receive(:===).with(bishop).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom right diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '4', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '2', file_to_number: 6)
              allow(board).to receive(:selected_piece).and_return(bishop)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(bishop).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Bishop).to receive(:===).with(bishop).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
        end

        context 'piece is queen' do
          let(:current_coordinate)     { double('current_coordinate') }
          let(:destination_coordinate) { double('destination_coordinate') }
          let(:board)                  { double('board') }
          let(:queen)                  { double('queen') }
          let(:target_piece)           { double('target_piece') }
          subject(:validator) { described_class.new(board:) }

          context 'when up' do
            before do
              allow(current_coordinate).to receive_messages(file: 'f', rank: '1')
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '7')
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when down' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '3')
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '1')
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when left' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '1')
              allow(destination_coordinate).to receive_messages(file: 'a', rank: '1')
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when right' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '4')
              allow(destination_coordinate).to receive_messages(file: 'g', rank: '4')
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when top left diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '5', file_to_number: 3)
              allow(destination_coordinate).to receive_messages(file: 'a', rank: '3', file_to_number: 1)
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when top right diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '3', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'g', rank: '6', file_to_number: 7)
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom left diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '7', file_to_number: 5)
              allow(destination_coordinate).to receive_messages(file: 'b', rank: '4', file_to_number: 2)
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom right diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '4', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '2', file_to_number: 6)
              allow(board).to receive(:selected_piece).and_return(queen)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(queen).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Queen).to receive(:===).with(queen).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
        end

        context 'piece is king' do
          let(:current_coordinate)     { double('current_coordinate') }
          let(:destination_coordinate) { double('destination_coordinate') }
          let(:board)                  { double('board') }
          let(:king)                   { double('king') }
          let(:target_piece)           { double('target_piece') }
          subject(:validator) { described_class.new(board:) }

          context 'when up' do
            before do
              allow(current_coordinate).to receive_messages(file: 'f', rank: '6')
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '7')
              allow(board).to receive(:selected_piece).and_return(king)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when down' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '3')
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '2')
              allow(board).to receive(:selected_piece).and_return(king)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when left' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '1', file_to_number: 3)
              allow(destination_coordinate).to receive_messages(file: 'b', rank: '1', file_to_number: 2)
              allow(board).to receive(:selected_piece).and_return(king)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when right' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '4', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '4', file_to_number: 5)
              allow(board).to receive(:selected_piece).and_return(king)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when top left diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '5', file_to_number: 3)
              allow(destination_coordinate).to receive_messages(file: 'b', rank: '6', file_to_number: 2)
              allow(board).to receive(:selected_piece).and_return(king)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when top right diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '3', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '4', file_to_number: 5)
              allow(board).to receive(:selected_piece).and_return(king)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when bottom left diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '7', file_to_number: 5)
              allow(destination_coordinate).to receive_messages(file: 'd', rank: '6', file_to_number: 4)
              allow(board).to receive(:selected_piece).and_return(king)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when bottom right diagonal' do
            before do
              allow(current_coordinate).to receive_messages(file: 'd', rank: '4', file_to_number: 4)
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '3', file_to_number: 5)
              allow(board).to receive(:selected_piece).and_return(king)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(king).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(King).to receive(:===).with(king).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
        end
        context 'piece is knight' do
          let(:current_coordinate)     { double('current_coordinate') }
          let(:destination_coordinate) { double('destination_coordinate') }
          let(:board)                  { double('board') }
          let(:knight)                 { double('knight') }
          let(:target_piece)           { double('target_piece') }
          subject(:validator) { described_class.new(board:) }

          context 'when top left narrow L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'g', rank: '6', file_to_number: 7)
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '8', file_to_number: 6)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when top left wide L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'c', rank: '7', file_to_number: 3)
              allow(destination_coordinate).to receive_messages(file: 'a', rank: '8', file_to_number: 1)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when top right narrow L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '4', file_to_number: 5)
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '6', file_to_number: 6)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when top right wide L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '1', file_to_number: 5)
              allow(destination_coordinate).to receive_messages(file: 'g', rank: '2', file_to_number: 7)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end
            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when bottom left narrow L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'f', rank: '7', file_to_number: 6)
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '5', file_to_number: 5)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom left wide L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'g', rank: '2', file_to_number: 7)
              allow(destination_coordinate).to receive_messages(file: 'e', rank: '1', file_to_number: 5)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom right narrow L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'e', rank: '3', file_to_number: 5)
              allow(destination_coordinate).to receive_messages(file: 'f', rank: '1', file_to_number: 6)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
          context 'when bottom right wide L' do
            before do
              allow(current_coordinate).to receive_messages(file: 'f', rank: '3', file_to_number: 6)
              allow(destination_coordinate).to receive_messages(file: 'h', rank: '2', file_to_number: 8)
              allow(board).to receive(:selected_piece).and_return(knight)
              allow(board).to receive(:[]).with(destination_coordinate).and_return(target_piece)
              allow(knight).to receive_messages(current_coordinate:, destination_coordinate:)
              allow(validator).to receive(:valid_piece_move?).and_return(true)
              allow(Knight).to receive(:===).with(knight).and_return(true)
              allow(board).to receive(:piece_at?).with(destination_coordinate).and_return(true)
              allow(target_piece).to receive(:capturable?).and_return(true)
            end

            it 'returns true' do
              move_validity = validator.valid_move?
              expect(move_validity).to be(true)
            end
          end
        end

        context 'piece is pawn' do
          let(:current_coordinate)     { double('current_coordinate') }
          let(:destination_coordinate) { double('destination_coordinate') }
          let(:board)                  { double('board') }
          let(:pawn)                   { double('pawn') }
          let(:target_piece)           { double('target_piece') }
          subject(:validator) { described_class.new(board:) }

          context 'when piece is white' do
            xcontext 'when move is valid' do
              context 'when left capture' do
                before do
                  allow(validator).to receive()
                end

                it 'returns true' do
                  move_validity = validator.valid_move?
                  expect(move_validity).to be(true)
                end
              end
            end

            context 'when move is invalid' do
              context 'when left capture' do
                context 'when 2 steps instad of 1' do
                end
              end

              context 'when right capture' do
                context 'when 2 steps instad of 1' do
                end
              end

              context 'when forward capture instead of diagonal capture' do
              end
            end
          end

          context 'when piece is black' do
            context 'when move is valid' do
              context 'when left capture' do
              end

              context 'when right capture' do
              end
            end

            context 'when move is invalid' do
            end
          end
        end
      end
    end
  end
end
