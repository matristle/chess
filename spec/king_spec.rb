require_relative '../lib/king'
require_relative '../lib/piece'
require_relative '../lib/rook'
require_relative '../lib/board'
require_relative '../lib/coordinate'
require_relative '../lib/square'

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

  context 'when other pieces are needed' do
    context 'when capturing a piece' do
      context 'when move is valid' do
        context 'when up' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:f1) }
          let(:destination_coordinate) { Coordinate.new(:f2) }

          before do
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
            allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
              allow(board).to receive(:any_piece_watching_at?).and_return(false)
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
      end
    end

    context 'when moving into another piece\'s moveset' do
      context 'when up' do
        let(:watching_piece)           { double('watching_piece') }
        let(:current_coordinate)     { Coordinate.new(:e5) }
        let(:destination_coordinate) { Coordinate.new(:e6) }
        let(:rook_square) { Square.new }

        before do
          allow(rook_square).to receive(:watchers?).and_return(true)
          allow(king).to receive(:color).and_return(:white)
          allow(watching_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(current_coordinate.to_sym).and_call_original
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(rook_square)
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
        let(:watching_piece)            { double('watching_piece') }
        let(:current_coordinate)     { Coordinate.new(:c3) }
        let(:destination_coordinate) { Coordinate.new(:b4) }
        let(:rook_square) { Square.new }

        before do
          allow(rook_square).to receive(:watchers?).and_return(true)
          allow(king).to receive(:color).and_return(:white)
          allow(watching_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(current_coordinate.to_sym).and_call_original
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(rook_square)
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
        let(:watching_piece)            { double('watching_piece') }
        let(:current_coordinate)     { Coordinate.new(:f6) }
        let(:destination_coordinate) { Coordinate.new(:g7) }
        let(:rook_square) { Square.new }

        before do
          allow(rook_square).to receive(:watchers?).and_return(true)
          allow(king).to receive(:color).and_return(:white)
          allow(watching_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(current_coordinate.to_sym).and_call_original
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(rook_square)
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
        let(:watching_piece)            { double('watching_piece') }
        let(:current_coordinate)     { Coordinate.new(:c5) }
        let(:destination_coordinate) { Coordinate.new(:c4) }
        let(:rook_square) { Square.new }

        before do
          allow(rook_square).to receive(:watchers?).and_return(true)
          allow(king).to receive(:color).and_return(:white)
          allow(watching_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(current_coordinate.to_sym).and_call_original
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(rook_square)
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
        let(:watching_piece)            { double('watching_piece') }
        let(:current_coordinate)     { Coordinate.new(:e8) }
        let(:destination_coordinate) { Coordinate.new(:d7) }
        let(:rook_square) { Square.new }

        before do
          allow(rook_square).to receive(:watchers?).and_return(true)
          allow(king).to receive(:color).and_return(:white)
          allow(watching_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(current_coordinate.to_sym).and_call_original
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(rook_square)
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
        let(:watching_piece)            { double('watching_piece') }
        let(:current_coordinate)     { Coordinate.new(:g2) }
        let(:destination_coordinate) { Coordinate.new(:h1) }
        let(:rook_square) { Square.new }

        before do
          allow(rook_square).to receive(:watchers?).and_return(true)
          allow(king).to receive(:color).and_return(:white)
          allow(watching_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(current_coordinate.to_sym).and_call_original
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(rook_square)
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
