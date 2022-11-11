require_relative '../lib/king'
require_relative '../lib/piece'
require_relative '../lib/rook'
require_relative '../lib/board'
require_relative '../lib/coordinate'
require_relative '../lib/square'
require_relative '../lib/bishop'
require_relative '../lib/queen'
require_relative '../lib/knight'

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
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end
    end
  end

  context 'when other pieces are needed' do
    context 'when capturing a piece' do
      context 'when move is valid' do
        context 'when up' do
          let(:target_piece) { Rook.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:f1) }
          let(:destination_coordinate) { Coordinate.new(:f2) }
          let(:capture_square) { Square.new }

          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end

          it 'returns true' do
            move_validity = king.valid_move?
            expect(move_validity).to be(true)
          end
        end

        context 'when down' do
          let(:target_piece) { Bishop.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g3) }
          let(:destination_coordinate) { Coordinate.new(:g2) }
          let(:capture_square) { Square.new }
  
          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end
  
          it 'returns true' do
            move_validity = king.valid_move?
            expect(move_validity).to be(true)
          end
        end

        context 'when left' do
          let(:target_piece) { Queen.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:f2) }
          let(:destination_coordinate) { Coordinate.new(:e2) }
          let(:capture_square) { Square.new }
  
          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end
  
          it 'returns true' do
            move_validity = king.valid_move?
            expect(move_validity).to be(true)
          end
        end

        context 'when right' do
          let(:target_piece) { Knight.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:d5) }
          let(:destination_coordinate) { Coordinate.new(:e5) }
          let(:capture_square) { Square.new }
  
          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end
  
          it 'returns true' do
            move_validity = king.valid_move?
            expect(move_validity).to be(true)
          end
        end

        context 'when top left' do
          let(:target_piece) { Rook.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g2) }
          let(:destination_coordinate) { Coordinate.new(:f3) }
          let(:capture_square) { Square.new }
  
          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end
  
          it 'returns true' do
            move_validity = king.valid_move?
            expect(move_validity).to be(true)
          end
        end

        context 'when top right' do
          let(:target_piece) { Bishop.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:c3) }
          let(:destination_coordinate) { Coordinate.new(:d4) }
          let(:capture_square) { Square.new }
  
          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end
  
          it 'returns true' do
            move_validity = king.valid_move?
            expect(move_validity).to be(true)
          end
        end

        context 'when bottom left' do
          let(:target_piece) { Queen.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:f5) }
          let(:destination_coordinate) { Coordinate.new(:e4) }
          let(:capture_square) { Square.new }
  
          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end
  
          it 'returns true' do
            move_validity = king.valid_move?
            expect(move_validity).to be(true)
          end
        end

        context 'when bottom right' do
          let(:target_piece) { Knight.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:b4) }
          let(:destination_coordinate) { Coordinate.new(:c3) }
          let(:capture_square) { Square.new }
  
          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
            allow(king).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
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
            let(:target_piece) { Rook.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:f1) }
            let(:destination_coordinate) { Coordinate.new(:f2) }
            let(:capture_square) { Square.new }
  
            before do
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:white)
              allow(target_piece).to receive(:color).and_return(:white)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(target_piece)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
  
          context 'when down' do
            let(:target_piece) { Bishop.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:g3) }
            let(:destination_coordinate) { Coordinate.new(:g2) }
            let(:capture_square) { Square.new }
  
            before do
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:black)
              allow(target_piece).to receive(:color).and_return(:black)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(target_piece)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
  
          context 'when left' do
            let(:target_piece) { Queen.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:f2) }
            let(:destination_coordinate) { Coordinate.new(:e2) }
            let(:capture_square) { Square.new }
  
            before do
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:white)
              allow(target_piece).to receive(:color).and_return(:white)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(target_piece)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
  
          context 'when right' do
            let(:target_piece) { Knight.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:d5) }
            let(:destination_coordinate) { Coordinate.new(:e5) }
            let(:capture_square) { Square.new }
  
            before do
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:black)
              allow(target_piece).to receive(:color).and_return(:black)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(target_piece)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
  
          context 'when top left' do
            let(:target_piece) { Rook.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:g2) }
            let(:destination_coordinate) { Coordinate.new(:f3) }
            let(:capture_square) { Square.new }
  
            before do
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:white)
              allow(target_piece).to receive(:color).and_return(:white)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(target_piece)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
          context 'when top right' do
            let(:target_piece) { Bishop.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:c3) }
            let(:destination_coordinate) { Coordinate.new(:d4) }
            let(:capture_square) { Square.new }
  
            before do
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:black)
              allow(target_piece).to receive(:color).and_return(:black)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(target_piece)
            end

            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
  
          context 'when bottom left' do
            let(:target_piece) { Queen.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:f5) }
            let(:destination_coordinate) { Coordinate.new(:e4) }
            let(:capture_square) { Square.new }
  
            before do
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:white)
              allow(target_piece).to receive(:color).and_return(:white)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(target_piece)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
  
          context 'when bottom right' do
            let(:target_piece) { Knight.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:b4) }
            let(:destination_coordinate) { Coordinate.new(:c3) }
            let(:capture_square) { Square.new }
  
            before do
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:black)
              allow(target_piece).to receive(:color).and_return(:black)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(target_piece)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
        end

        context 'when target piece is a king' do
          context 'when up' do
            let(:uncaptureable_target_king) { King.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:f1) }
            let(:destination_coordinate) { Coordinate.new(:f2) }
            let(:capture_square) { Square.new }
  
            before do

              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:white)
              allow(uncaptureable_target_king).to receive(:color).and_return(:black)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(uncaptureable_target_king)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
  
          context 'when down' do
            let(:uncaptureable_target_king) { King.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:g3) }
            let(:destination_coordinate) { Coordinate.new(:g2) }
            let(:capture_square) { Square.new }
  
            before do

              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:white)
              allow(uncaptureable_target_king).to receive(:color).and_return(:black)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(uncaptureable_target_king)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
  
          context 'when left' do
            let(:uncaptureable_target_king) { King.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:f2) }
            let(:destination_coordinate) { Coordinate.new(:e2) }
            let(:capture_square) { Square.new }
  
            before do

              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:white)
              allow(uncaptureable_target_king).to receive(:color).and_return(:black)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(uncaptureable_target_king)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
  
          context 'when right' do
            let(:uncaptureable_target_king) { King.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:d5) }
            let(:destination_coordinate) { Coordinate.new(:e5) }
            let(:capture_square) { Square.new }
  
            before do

              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:white)
              allow(uncaptureable_target_king).to receive(:color).and_return(:black)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(uncaptureable_target_king)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
  
          context 'when top left' do
            let(:uncaptureable_target_king) { King.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:g2) }
            let(:destination_coordinate) { Coordinate.new(:b7) }
            let(:capture_square) { Square.new }
  
            before do

              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:white)
              allow(uncaptureable_target_king).to receive(:color).and_return(:black)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(uncaptureable_target_king)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
  
          context 'when top right' do
            let(:uncaptureable_target_king) { King.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:c3) }
            let(:destination_coordinate) { Coordinate.new(:f6) }
            let(:capture_square) { Square.new }
  
            before do

              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:white)
              allow(uncaptureable_target_king).to receive(:color).and_return(:white)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(uncaptureable_target_king)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
  
          context 'when bottom left' do
            let(:uncaptureable_target_king) { King.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:f5) }
            let(:destination_coordinate) { Coordinate.new(:b1) }
            let(:capture_square) { Square.new }
  
            before do

              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:black)
              allow(uncaptureable_target_king).to receive(:color).and_return(:white)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(uncaptureable_target_king)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
  
          context 'when bottom right' do
            let(:uncaptureable_target_king) { King.new(board:) }
            let(:current_coordinate)     { Coordinate.new(:b4) }
            let(:destination_coordinate) { Coordinate.new(:d2) }
            let(:capture_square) { Square.new }
  
            before do

              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:color).and_return(:black)
              allow(uncaptureable_target_king).to receive(:color).and_return(:black)
              allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              capture_square.add(uncaptureable_target_king)
            end
  
            it 'returns false' do
              move_validity = king.valid_move?
              expect(move_validity).to be(false)
            end
          end
        end
      end
    end

    context 'when moving into another piece\'s moveset' do
      context 'when watching piece is rook' do
        context 'when top left' do
          let(:watching_piece) { Rook.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:c3) }
          let(:destination_coordinate) { Coordinate.new(:b4) }
          let(:forbidden_square) { Square.new }
  
          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(true)
            allow(king).to receive(:color).and_return(:white)
            allow(watching_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(forbidden_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top right' do
          let(:watching_piece) { Rook.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:f6) }
          let(:destination_coordinate) { Coordinate.new(:g7) }
          let(:forbidden_square) { Square.new }
  
          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(true)
            allow(king).to receive(:color).and_return(:white)
            allow(watching_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(forbidden_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when up' do
          let(:watching_piece) { Rook.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:e5) }
          let(:destination_coordinate) { Coordinate.new(:e6) }
          let(:forbidden_square) { Square.new }
  
          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(true)
            allow(king).to receive(:color).and_return(:white)
            allow(watching_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(forbidden_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when down' do
          let(:watching_piece) { Rook.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:c5) }
          let(:destination_coordinate) { Coordinate.new(:c4) }
          let(:forbidden_square) { Square.new }
  
          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(true)
            allow(king).to receive(:color).and_return(:white)
            allow(watching_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(forbidden_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom left' do
          let(:watching_piece) { Rook.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:e8) }
          let(:destination_coordinate) { Coordinate.new(:d7) }
          let(:forbidden_square) { Square.new }
  
          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(true)
            allow(king).to receive(:color).and_return(:white)
            allow(watching_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(forbidden_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom right' do
          let(:watching_piece) { Rook.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g2) }
          let(:destination_coordinate) { Coordinate.new(:h1) }
          let(:forbidden_square) { Square.new }
  
          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(true)
            allow(king).to receive(:color).and_return(:white)
            allow(watching_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(forbidden_square)
            allow(king).to receive(:current_coordinate).and_return(current_coordinate)
            allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
          end
  
          it 'returns false' do
            move_validity = king.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end
      context 'when watching piece is bishop'
      context 'when watching piece is queen'
      context 'when watching piece is knight'
    end

    context 'when castling' do
      context 'when move is valid' do
        context 'when short castling' do
          context 'when white' do
            let(:current_coordinate)     { Coordinate.new(:e1) }
            let(:destination_coordinate) { Coordinate.new(:g1) }
            let(:cooperating_rook) { Rook.new(board:) }

            before do
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
              allow(king).to receive(:current_coordinate).and_return(current_coordinate)
              allow(king).to receive(:destination_coordinate).and_return(destination_coordinate)
              allow(king).to receive(:valid_piece_move?).and_return(true)
            end

            it 'returns true' do
              move_validity = king.valid_move?
              expect(move_validity).to be(true)
            end
          end

          context 'when black'
        end

        context 'when long castling'
      end

      context 'when move is invalid' do
        context 'when short castling'

        context 'when long castling'
      end
    end
  end
end
