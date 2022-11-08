require_relative '../lib/bishop'
require_relative '../lib/piece'
require_relative '../lib/king'
require_relative '../lib/board'
require_relative '../lib/coordinate'
require_relative '../lib/rook'
require_relative '../lib/queen'
require_relative '../lib/knight'
require_relative '../lib/square'

describe Bishop do
  subject(:bishop) { described_class.new(board:) }
  let(:board) { Board.new }

  context 'when other pieces aren\'t needed' do
    context 'when move is valid' do
      context 'when top left' do
        let(:current_coordinate)     { Coordinate.new(:g2) }
        let(:destination_coordinate) { Coordinate.new(:b7) }

        before do
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
        end

        it 'returns true' do
          move_validity = bishop.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top right' do
        let(:current_coordinate)     { Coordinate.new(:c3) }
        let(:destination_coordinate) { Coordinate.new(:f6) }

        before do
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
        end

        it 'returns true' do
          move_validity = bishop.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom left' do
        let(:current_coordinate)     { Coordinate.new(:f5) }
        let(:destination_coordinate) { Coordinate.new(:b1) }

        before do
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
        end

        it 'returns true' do
          move_validity = bishop.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom right' do
        let(:current_coordinate)     { Coordinate.new(:b4) }
        let(:destination_coordinate) { Coordinate.new(:d2) }

        before do
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
        end

        it 'returns true' do
          move_validity = bishop.valid_move?
          expect(move_validity).to be(true)
        end
      end
    end

    context 'when move is invalid' do
      context 'when target coordinate is same as current coordinate' do
        let(:current_coordinate)     { Coordinate.new(:g8) }
        let(:destination_coordinate) { Coordinate.new(:g8) }

        before do
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
        end

        it 'returns false' do
          move_validity = bishop.valid_move?
          expect(move_validity).to be(false)
        end
      end
    end
  end

  context 'when other pieces are needed: capturing a piece' do
    context 'when move is valid' do
      context 'when top left' do
        let(:target_piece) { Rook.new(board:) }
        let(:current_coordinate)     { Coordinate.new(:g2) }
        let(:destination_coordinate) { Coordinate.new(:b7) }
        let(:capture_square) { Square.new }

        before do
          allow(bishop).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
          capture_square.add(target_piece)
        end

        it 'returns true' do
          move_validity = bishop.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top right' do
        let(:target_piece) { Bishop.new(board:) }
        let(:current_coordinate)     { Coordinate.new(:c3) }
        let(:destination_coordinate) { Coordinate.new(:f6) }
        let(:capture_square) { Square.new }

        before do
          allow(bishop).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
          capture_square.add(target_piece)
        end

        it 'returns true' do
          move_validity = bishop.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom left' do
        let(:target_piece) { Queen.new(board:) }
        let(:current_coordinate)     { Coordinate.new(:f5) }
        let(:destination_coordinate) { Coordinate.new(:b1) }
        let(:capture_square) { Square.new }

        before do
          allow(bishop).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
          capture_square.add(target_piece)
        end

        it 'returns true' do
          move_validity = bishop.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom right' do
        let(:target_piece) { Knight.new(board:) }
        let(:current_coordinate)     { Coordinate.new(:b4) }
        let(:destination_coordinate) { Coordinate.new(:d2) }
        let(:capture_square) { Square.new }

        before do
          allow(bishop).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
          capture_square.add(target_piece)
        end

        it 'returns true' do
          move_validity = bishop.valid_move?
          expect(move_validity).to be(true)
        end
      end
    end

    context 'when move is invalid' do
      context 'when piece has the same color' do
        context 'when top left' do
          let(:target_piece) { Rook.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g2) }
          let(:destination_coordinate) { Coordinate.new(:b7) }
          let(:capture_square) { Square.new }

          before do
            allow(bishop).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end

          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top right' do
          let(:target_piece) { Bishop.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:c3) }
          let(:destination_coordinate) { Coordinate.new(:f6) }
          let(:capture_square) { Square.new }

          before do
            allow(bishop).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end

          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom left' do
          let(:target_piece) { Queen.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:f5) }
          let(:destination_coordinate) { Coordinate.new(:b1) }
          let(:capture_square) { Square.new }

          before do
            allow(bishop).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end

          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom right' do
          let(:target_piece) { Knight.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:b4) }
          let(:destination_coordinate) { Coordinate.new(:d2) }
          let(:capture_square) { Square.new }

          before do
            allow(bishop).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end

          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end

      context 'when target piece is a king' do
        context 'when top left' do
          let(:uncaptureable_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g2) }
          let(:destination_coordinate) { Coordinate.new(:b7) }
          let(:capture_square) { Square.new }
          
          before do
            allow(bishop).to receive(:color).and_return(:white)
            allow(uncaptureable_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(uncaptureable_king)
          end

          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top right' do
          let(:uncaptureable_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:c3) }
          let(:destination_coordinate) { Coordinate.new(:f6) }
          let(:capture_square) { Square.new }
          
          before do
            allow(bishop).to receive(:color).and_return(:white)
            allow(uncaptureable_king).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(uncaptureable_king)
          end

          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom left' do
          let(:uncaptureable_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:f5) }
          let(:destination_coordinate) { Coordinate.new(:b1) }
          let(:capture_square) { Square.new }
          
          before do
            allow(bishop).to receive(:color).and_return(:black)
            allow(uncaptureable_king).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(uncaptureable_king)
          end

          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom right' do
          let(:uncaptureable_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:b4) }
          let(:destination_coordinate) { Coordinate.new(:d2) }
          let(:capture_square) { Square.new }
          
          before do
            allow(bishop).to receive(:color).and_return(:black)
            allow(uncaptureable_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(uncaptureable_king)
          end

          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end
    end
  end
end
