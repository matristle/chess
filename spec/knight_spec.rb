require_relative '../lib/knight'
require_relative '../lib/board'
require_relative '../lib/piece'
require_relative '../lib/king'
require_relative '../lib/coordinate'

describe Knight do
  subject(:knight) { described_class.new(board:) }
  let(:board) { Board.new }

  context 'when other pieces aren\'t needed' do
    context 'when move is valid' do
      context 'when top-left wide L' do
        let(:current_coordinate)     { Coordinate.new(:c2) }
        let(:destination_coordinate) { Coordinate.new(:a3) }

        before do
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top-left narrow L' do
        let(:current_coordinate)     { Coordinate.new(:d5) }
        let(:destination_coordinate) { Coordinate.new(:c7) }

        before do
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top-right narrow L' do
        let(:current_coordinate)     { Coordinate.new(:d2) }
        let(:destination_coordinate) { Coordinate.new(:e4) }

        before do
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top-right wide L' do
        let(:current_coordinate)     { Coordinate.new(:e3) }
        let(:destination_coordinate) { Coordinate.new(:g4) }

        before do
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom-right wide L' do
        let(:current_coordinate)     { Coordinate.new(:b7) }
        let(:destination_coordinate) { Coordinate.new(:d6) }

        before do
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom-right narrow L' do
        let(:current_coordinate)     { Coordinate.new(:e5) }
        let(:destination_coordinate) { Coordinate.new(:f3) }

        before do
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom-left narrow L' do
        let(:current_coordinate)     { Coordinate.new(:g8) }
        let(:destination_coordinate) { Coordinate.new(:f6) }

        before do
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom-left wide L' do
        let(:current_coordinate)     { Coordinate.new(:g6) }
        let(:destination_coordinate) { Coordinate.new(:e5) }

        before do
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end
    end

    context 'when move is invalid' do
      context 'when target coordinate is same as current coordinate' do
        let(:current_coordinate)     { Coordinate.new(:h3) }
        let(:destination_coordinate) { Coordinate.new(:h3) }

        before do
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns false' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(false)
        end
      end
    end
  end

  context 'when other pieces are needed: capturing a piece' do
    context 'when move is valid' do
      context 'when top-left wide L' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:c2) }
        let(:destination_coordinate) { Coordinate.new(:a3) }

        before do
          allow(knight).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top-left narrow L' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:d5) }
        let(:destination_coordinate) { Coordinate.new(:c7) }

        before do
          allow(knight).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top-right narrow L' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:d2) }
        let(:destination_coordinate) { Coordinate.new(:e4) }

        before do
          allow(knight).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top-right wide L' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:e3) }
        let(:destination_coordinate) { Coordinate.new(:g4) }

        before do
          allow(knight).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom-right wide L' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:b7) }
        let(:destination_coordinate) { Coordinate.new(:d6) }

        before do
          allow(knight).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom-right narrow L' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:e5) }
        let(:destination_coordinate) { Coordinate.new(:f3) }

        before do
          allow(knight).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom-left narrow L' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:g8) }
        let(:destination_coordinate) { Coordinate.new(:f6) }

        before do
          allow(knight).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom-left wide L' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:g6) }
        let(:destination_coordinate) { Coordinate.new(:e5) }

        before do
          allow(knight).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
          allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(knight).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = knight.valid_move?
          expect(move_validity).to be(true)
        end
      end
    end

    context 'when move is invalid' do
      context 'when piece has the same color' do
        context 'when top-left wide L' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:c2) }
          let(:destination_coordinate) { Coordinate.new(:a3) }

          before do
            allow(knight).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top-left narrow L' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:d5) }
          let(:destination_coordinate) { Coordinate.new(:c7) }

          before do
            allow(knight).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top-right narrow L' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:d2) }
          let(:destination_coordinate) { Coordinate.new(:e4) }
  
          before do
            allow(knight).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top-right wide L' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:e3) }
          let(:destination_coordinate) { Coordinate.new(:g4) }
  
          before do
            allow(knight).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom-right wide L' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:b7) }
          let(:destination_coordinate) { Coordinate.new(:d6) }
  
          before do
            allow(knight).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom-right narrow L' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:e5) }
          let(:destination_coordinate) { Coordinate.new(:f3) }
  
          before do
            allow(knight).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom-left narrow L' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:g8) }
          let(:destination_coordinate) { Coordinate.new(:f6) }
  
          before do
            allow(knight).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom-left wide L' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:g6) }
          let(:destination_coordinate) { Coordinate.new(:e5) }
  
          before do
            allow(knight).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end

      context 'when target piece is a king' do
        context 'when top-left wide L' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:c2) }
          let(:destination_coordinate) { Coordinate.new(:a3) }

          before do
            allow(knight).to receive(:color).and_return(:white)
            allow(king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top-left narrow L' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:d5) }
          let(:destination_coordinate) { Coordinate.new(:c7) }

          before do
            allow(knight).to receive(:color).and_return(:white)
            allow(king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top-right narrow L' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:d2) }
          let(:destination_coordinate) { Coordinate.new(:e4) }
  
          before do
            allow(knight).to receive(:color).and_return(:black)
            allow(king).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top-right wide L' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:e3) }
          let(:destination_coordinate) { Coordinate.new(:g4) }
  
          before do
            allow(knight).to receive(:color).and_return(:black)
            allow(king).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom-right wide L' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:b7) }
          let(:destination_coordinate) { Coordinate.new(:d6) }
  
          before do
            allow(knight).to receive(:color).and_return(:white)
            allow(king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom-right narrow L' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:e5) }
          let(:destination_coordinate) { Coordinate.new(:f3) }
  
          before do
            allow(knight).to receive(:color).and_return(:white)
            allow(king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom-left narrow L' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g8) }
          let(:destination_coordinate) { Coordinate.new(:f6) }
  
          before do
            allow(knight).to receive(:color).and_return(:white)
            allow(king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom-left wide L' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g6) }
          let(:destination_coordinate) { Coordinate.new(:e5) }
  
          before do
            allow(knight).to receive(:color).and_return(:black)
            allow(king).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(knight).to receive(:current_coordinate).and_return(current_coordinate)
            allow(knight).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(knight).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = knight.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end
    end
  end
end