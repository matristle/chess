require_relative '../lib/bishop'
require_relative '../lib/piece'
require_relative '../lib/king'
require_relative '../lib/board'
require_relative '../lib/coordinate'

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
          allow(bishop).to receive(:valid_board_move?).and_return(true)
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
          allow(bishop).to receive(:valid_board_move?).and_return(true)
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
          allow(bishop).to receive(:valid_board_move?).and_return(true)
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
          allow(bishop).to receive(:valid_board_move?).and_return(true)
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
          allow(bishop).to receive(:valid_board_move?).and_return(true)
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
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:g2) }
        let(:destination_coordinate) { Coordinate.new(:b7) }

        before do
          allow(bishop).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.symbol).and_return(target_piece)
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(bishop).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = bishop.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top right' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:c3) }
        let(:destination_coordinate) { Coordinate.new(:f6) }

        before do
          allow(bishop).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.symbol).and_return(target_piece)
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(bishop).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = bishop.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom left' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:f5) }
        let(:destination_coordinate) { Coordinate.new(:b1) }

        before do
          allow(bishop).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.symbol).and_return(target_piece)
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(bishop).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = bishop.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom right' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:b4) }
        let(:destination_coordinate) { Coordinate.new(:d2) }

        before do
          allow(bishop).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.symbol).and_return(target_piece)
          allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
          allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(bishop).to receive(:valid_piece_move?).and_return(true)
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
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:g2) }
          let(:destination_coordinate) { Coordinate.new(:b7) }
  
          before do
            allow(bishop).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.symbol).and_return(target_piece)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(bishop).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when top right' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:c3) }
          let(:destination_coordinate) { Coordinate.new(:f6) }
  
          before do
            allow(bishop).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.symbol).and_return(target_piece)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(bishop).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when bottom left' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:f5) }
          let(:destination_coordinate) { Coordinate.new(:b1) }
  
          before do
            allow(bishop).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.symbol).and_return(target_piece)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(bishop).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when bottom right' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:b4) }
          let(:destination_coordinate) { Coordinate.new(:d2) }
  
          before do
            allow(bishop).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.symbol).and_return(target_piece)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(bishop).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end

      context 'when piece is a king' do
        context 'when top left' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g2) }
          let(:destination_coordinate) { Coordinate.new(:b7) }
  
          before do
            allow(bishop).to receive(:color).and_return(:white)
            allow(king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.symbol).and_return(king)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(bishop).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when top right' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:c3) }
          let(:destination_coordinate) { Coordinate.new(:f6) }
  
          before do
            allow(bishop).to receive(:color).and_return(:white)
            allow(king).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.symbol).and_return(king)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(bishop).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when bottom left' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:f5) }
          let(:destination_coordinate) { Coordinate.new(:b1) }
  
          before do
            allow(bishop).to receive(:color).and_return(:black)
            allow(king).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.symbol).and_return(king)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(bishop).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = bishop.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when bottom right' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:b4) }
          let(:destination_coordinate) { Coordinate.new(:d2) }
  
          before do
            allow(bishop).to receive(:color).and_return(:black)
            allow(king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.symbol).and_return(king)
            allow(bishop).to receive(:current_coordinate).and_return(current_coordinate)
            allow(bishop).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(bishop).to receive(:valid_piece_move?).and_return(true)
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
