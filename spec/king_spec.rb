require_relative '../lib/king'
require_relative '../lib/piece'
require_relative '../lib/board'
require_relative '../lib/coordinate'

describe King do
  subject(:king) { described_class.new(board:) }
  let(:board) { Board.new }

  context 'when other pieces aren\'t needed' do
    context 'when move is valid' do
      context 'when up' do
        let(:current_coordinate)     { Coordinate.new(:f1) }
        let(:destination_coordinate) { Coordinate.new(:f2) }

        before do
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when down' do
        let(:current_coordinate)     { Coordinate.new(:e3) }
        let(:destination_coordinate) { Coordinate.new(:e2) }

        before do
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when left' do
        let(:current_coordinate)     { Coordinate.new(:c1) }
        let(:destination_coordinate) { Coordinate.new(:b1) }

        before do
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when right' do
        let(:current_coordinate)     { Coordinate.new(:d4) }
        let(:destination_coordinate) { Coordinate.new(:e4) }

        before do
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top left' do
        let(:current_coordinate)     { Coordinate.new(:g2) }
        let(:destination_coordinate) { Coordinate.new(:f3) }

        before do
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top right' do
        let(:current_coordinate)     { Coordinate.new(:c3) }
        let(:destination_coordinate) { Coordinate.new(:d4) }

        before do
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom left' do
        let(:current_coordinate)     { Coordinate.new(:f5) }
        let(:destination_coordinate) { Coordinate.new(:e4) }

        before do
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom right' do
        let(:current_coordinate)     { Coordinate.new(:b4) }
        let(:destination_coordinate) { Coordinate.new(:c3) }

        before do
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end
    end

    context 'when move is invalid' do
      context 'when target coordinate is same as current coordinate' do
        let(:current_coordinate)     { Coordinate.new(:b6) }
        let(:destination_coordinate) { Coordinate.new(:b6) }

        before do
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns false' do
          move_validity = king.valid_move?
          expect(move_validity).to be(false)
        end
      end

      context 'when has undesired rook moves' do
        context 'when up' do
          let(:current_coordinate)     { Coordinate.new(:f1) }
          let(:destination_coordinate) { Coordinate.new(:f7) }
  
          before do
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_board_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when down' do
          let(:current_coordinate)     { Coordinate.new(:e3) }
          let(:destination_coordinate) { Coordinate.new(:e1) }
  
          before do
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_board_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when left' do
          let(:current_coordinate)     { Coordinate.new(:c1) }
          let(:destination_coordinate) { Coordinate.new(:a1) }
  
          before do
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_board_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when right' do
          let(:current_coordinate)     { Coordinate.new(:d4) }
          let(:destination_coordinate) { Coordinate.new(:g4) }
  
          before do
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_board_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end

      context 'when has undesired bishop moves' do
        context 'when top left' do
          let(:current_coordinate)     { Coordinate.new(:g2) }
          let(:destination_coordinate) { Coordinate.new(:d5) }
  
          before do
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_board_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when top right' do
          let(:current_coordinate)     { Coordinate.new(:c3) }
          let(:destination_coordinate) { Coordinate.new(:e5) }
  
          before do
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_board_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when bottom left' do
          let(:current_coordinate)     { Coordinate.new(:f5) }
          let(:destination_coordinate) { Coordinate.new(:d3) }
  
          before do
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_board_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when bottom right' do
          let(:current_coordinate)     { Coordinate.new(:b4) }
          let(:destination_coordinate) { Coordinate.new(:e1) }
  
          before do
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_board_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end
    end
  end

  context 'when other pieces are needed: capturing a piece' do
    context 'when move is valid' do
      context 'when up' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:f1) }
        let(:destination_coordinate) { Coordinate.new(:f2) }

        before do
          allow(king).to receive(:moving_next_to_king?).and_return(false)
          allow(king).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when down' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:g3) }
        let(:destination_coordinate) { Coordinate.new(:g2) }

        before do
          allow(king).to receive(:moving_next_to_king?).and_return(false)
          allow(king).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when left' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:f2) }
        let(:destination_coordinate) { Coordinate.new(:e2) }

        before do
          allow(king).to receive(:moving_next_to_king?).and_return(false)
          allow(king).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when right' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:d5) }
        let(:destination_coordinate) { Coordinate.new(:e5) }

        before do
          allow(king).to receive(:moving_next_to_king?).and_return(false)
          allow(king).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top left' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:g2) }
        let(:destination_coordinate) { Coordinate.new(:f3) }

        before do
          allow(king).to receive(:moving_next_to_king?).and_return(false)
          allow(king).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top right' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:c3) }
        let(:destination_coordinate) { Coordinate.new(:d4) }

        before do
          allow(king).to receive(:moving_next_to_king?).and_return(false)
          allow(king).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom left' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:f5) }
        let(:destination_coordinate) { Coordinate.new(:e4) }

        before do
          allow(king).to receive(:moving_next_to_king?).and_return(false)
          allow(king).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom right' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:b4) }
        let(:destination_coordinate) { Coordinate.new(:c3) }

        before do
          allow(king).to receive(:moving_next_to_king?).and_return(false)
          allow(king).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(king).to receive(:current_coordinate).and_return(current_coordinate)
          allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(king).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = king.valid_move?
          expect(move_validity).to be(true)
        end
      end
    end

    context 'when move is invalid' do
      context 'when piece has the same color' do
        context 'when up' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:f1) }
          let(:destination_coordinate) { Coordinate.new(:f2) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when down' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:g3) }
          let(:destination_coordinate) { Coordinate.new(:g2) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when left' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:f2) }
          let(:destination_coordinate) { Coordinate.new(:e2) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when right' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:d5) }
          let(:destination_coordinate) { Coordinate.new(:e5) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top left' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:g2) }
          let(:destination_coordinate) { Coordinate.new(:f3) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
        context 'when top right' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:c3) }
          let(:destination_coordinate) { Coordinate.new(:d4) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom left' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:f5) }
          let(:destination_coordinate) { Coordinate.new(:e4) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom right' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:b4) }
          let(:destination_coordinate) { Coordinate.new(:c3) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end

      context 'when target piece is a king' do
        context 'when up' do
          let(:another_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:f1) }
          let(:destination_coordinate) { Coordinate.new(:f2) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(another_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(another_king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when down' do
          let(:another_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g3) }
          let(:destination_coordinate) { Coordinate.new(:g2) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(another_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(another_king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when left' do
          let(:another_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:f2) }
          let(:destination_coordinate) { Coordinate.new(:e2) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(another_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(another_king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when right' do
          let(:another_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:d5) }
          let(:destination_coordinate) { Coordinate.new(:e5) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(another_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(another_king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top left' do
          let(:another_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g2) }
          let(:destination_coordinate) { Coordinate.new(:b7) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(another_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top right' do
          let(:another_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:c3) }
          let(:destination_coordinate) { Coordinate.new(:f6) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(another_king).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom left' do
          let(:another_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:f5) }
          let(:destination_coordinate) { Coordinate.new(:b1) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:black)
            allow(another_king).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom right' do
          let(:another_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:b4) }
          let(:destination_coordinate) { Coordinate.new(:d2) }

          before do
            allow(king).to receive(:moving_next_to_king?).and_return(false)
            allow(king).to receive(:color).and_return(:black)
            allow(another_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end

      context 'when destination is next to another king' do
        context 'when move would be top of another king' do
          let(:nearby_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:d7) }
          let(:destination_coordinate) { Coordinate.new(:e6) }
          let(:nearby_king_coordinate) { Coordinate.new(:e5) }

          before do
            allow(king).to receive(:color).and_return(:white)
            allow(nearby_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(:e7).and_call_original
            allow(board).to receive(:[]).with(nearby_king_coordinate.to_sym).and_return(nearby_king)
            allow(board).to receive(:[]).with(:f6).and_call_original
            allow(board).to receive(:[]).with(:d6).and_call_original
            allow(board).to receive(:[]).with(:f5).and_call_original
            allow(board).to receive(:[]).with(:d5).and_call_original
            allow(board).to receive(:[]).with(:f7).and_call_original
            allow(board).to receive(:[]).with(:d7).and_call_original
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when move would be bottom of another king' do
          let(:nearby_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:e3) }
          let(:destination_coordinate) { Coordinate.new(:e4) }
          let(:nearby_king_coordinate) { Coordinate.new(:e5) }

          before do
            allow(king).to receive(:color).and_return(:white)
            allow(nearby_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(:e3).and_call_original
            allow(board).to receive(:[]).with(:f4).and_call_original
            allow(board).to receive(:[]).with(:d4).and_call_original
            allow(board).to receive(:[]).with(:f3).and_call_original
            allow(board).to receive(:[]).with(:d3).and_call_original
            allow(board).to receive(:[]).with(:f5).and_call_original
            allow(board).to receive(:[]).with(:d5).and_call_original
            allow(board).to receive(:[]).with(nearby_king_coordinate.to_sym).and_return(nearby_king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when move would be left of another king' do
          let(:nearby_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:c4) }
          let(:destination_coordinate) { Coordinate.new(:d5) }
          let(:nearby_king_coordinate) { Coordinate.new(:e5) }

          before do
            allow(king).to receive(:color).and_return(:white)
            allow(nearby_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(:d6).and_call_original
            allow(board).to receive(:[]).with(:d4).and_call_original
            allow(board).to receive(:[]).with(:c5).and_call_original
            allow(board).to receive(:[]).with(:e4).and_call_original
            allow(board).to receive(:[]).with(:c4).and_call_original
            allow(board).to receive(:[]).with(:e6).and_call_original
            allow(board).to receive(:[]).with(:c6).and_call_original
            allow(board).to receive(:[]).with(nearby_king_coordinate.to_sym).and_return(nearby_king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when move would be right of another king' do
          let(:nearby_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g6) }
          let(:destination_coordinate) { Coordinate.new(:f5) }
          let(:nearby_king_coordinate) { Coordinate.new(:e5) }

          before do
            allow(king).to receive(:color).and_return(:white)
            allow(nearby_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(:f6).and_call_original
            allow(board).to receive(:[]).with(:f4).and_call_original
            allow(board).to receive(:[]).with(:g5).and_call_original
            allow(board).to receive(:[]).with(:g4).and_call_original
            allow(board).to receive(:[]).with(:e4).and_call_original
            allow(board).to receive(:[]).with(:g6).and_call_original
            allow(board).to receive(:[]).with(:e6).and_call_original
            allow(board).to receive(:[]).with(nearby_king_coordinate.to_sym).and_return(nearby_king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when move would be top left of another king' do
          let(:nearby_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:c6) }
          let(:destination_coordinate) { Coordinate.new(:d6) }
          let(:nearby_king_coordinate) { Coordinate.new(:e5) }

          before do
            allow(king).to receive(:color).and_return(:white)
            allow(nearby_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(:d7).and_call_original
            allow(board).to receive(:[]).with(:d5).and_call_original
            allow(board).to receive(:[]).with(:e6).and_call_original
            allow(board).to receive(:[]).with(:c6).and_call_original
            allow(board).to receive(:[]).with(:c5).and_call_original
            allow(board).to receive(:[]).with(:e7).and_call_original
            allow(board).to receive(:[]).with(:c7).and_call_original
            allow(board).to receive(:[]).with(nearby_king_coordinate.to_sym).and_return(nearby_king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when move would be top right of another king' do
          let(:nearby_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g7) }
          let(:destination_coordinate) { Coordinate.new(:f6) }
          let(:nearby_king_coordinate) { Coordinate.new(:e5) }

          before do
            allow(king).to receive(:color).and_return(:white)
            allow(nearby_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(:f7).and_call_original
            allow(board).to receive(:[]).with(:f5).and_call_original
            allow(board).to receive(:[]).with(:g6).and_call_original
            allow(board).to receive(:[]).with(:e6).and_call_original
            allow(board).to receive(:[]).with(:g5).and_call_original
            allow(board).to receive(:[]).with(:g7).and_call_original
            allow(board).to receive(:[]).with(:e7).and_call_original
            allow(board).to receive(:[]).with(nearby_king_coordinate.to_sym).and_return(nearby_king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when move would be bottom left of another king' do
          let(:nearby_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:d3) }
          let(:destination_coordinate) { Coordinate.new(:d4) }
          let(:nearby_king_coordinate) { Coordinate.new(:e5) }

          before do
            allow(king).to receive(:color).and_return(:white)
            allow(nearby_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(:d5).and_call_original
            allow(board).to receive(:[]).with(:d3).and_call_original
            allow(board).to receive(:[]).with(:e4).and_call_original
            allow(board).to receive(:[]).with(:c4).and_call_original
            allow(board).to receive(:[]).with(:c3).and_call_original
            allow(board).to receive(:[]).with(:e3).and_call_original
            allow(board).to receive(:[]).with(:c5).and_call_original
            allow(board).to receive(:[]).with(nearby_king_coordinate.to_sym).and_return(nearby_king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when move would be bottom right of another king' do
          let(:nearby_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g5) }
          let(:destination_coordinate) { Coordinate.new(:f4) }
          let(:nearby_king_coordinate) { Coordinate.new(:e5) }

          before do
            allow(king).to receive(:color).and_return(:white)
            allow(nearby_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(:f5).and_call_original
            allow(board).to receive(:[]).with(:f3).and_call_original
            allow(board).to receive(:[]).with(:g4).and_call_original
            allow(board).to receive(:[]).with(:e4).and_call_original
            allow(board).to receive(:[]).with(:g3).and_call_original
            allow(board).to receive(:[]).with(:e3).and_call_original
            allow(board).to receive(:[]).with(:g5).and_call_original
            allow(board).to receive(:[]).with(nearby_king_coordinate.to_sym).and_return(nearby_king)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(king).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end
    end
  end
end
