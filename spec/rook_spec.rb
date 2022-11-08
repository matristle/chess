require_relative '../lib/rook'
require_relative '../lib/piece'
require_relative '../lib/king'
require_relative '../lib/board'
require_relative '../lib/coordinate'
require_relative '../lib/bishop'
require_relative '../lib/queen'
require_relative '../lib/knight'
require_relative '../lib/square'

describe Rook do
  subject(:rook) { described_class.new(board:) }
  let(:board) { Board.new }

  context 'when other pieces aren\'t needed' do
    context 'when move is valid' do
      context 'when up' do
        let(:current_coordinate)     { Coordinate.new(:f1) }
        let(:destination_coordinate) { Coordinate.new(:f7) }

        before do
          allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
          allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
        end

        it 'returns true' do
          move_validity = rook.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when down' do
        let(:current_coordinate)     { Coordinate.new(:e3) }
        let(:destination_coordinate) { Coordinate.new(:e1) }

        before do
          allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
          allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
        end

        it 'returns true' do
          move_validity = rook.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when left' do
        let(:current_coordinate)     { Coordinate.new(:c1) }
        let(:destination_coordinate) { Coordinate.new(:a1) }

        before do
          allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
          allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
        end

        it 'returns true' do
          move_validity = rook.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when right' do
        let(:current_coordinate)     { Coordinate.new(:d4) }
        let(:destination_coordinate) { Coordinate.new(:g4) }

        before do
          allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
          allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
        end

        it 'returns true' do
          move_validity = rook.valid_move?
          expect(move_validity).to be(true)
        end
      end
    end

    context 'when move is invalid' do
      context 'when target coordinate is same as current coordinate' do
        let(:current_coordinate)     { Coordinate.new(:f4) }
        let(:destination_coordinate) { Coordinate.new(:f4) }

        before do
          allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
          allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
        end

        it 'returns false' do
          move_validity = rook.valid_move?
          expect(move_validity).to be(false)
        end
      end

      context 'when up' do
        context 'wrong file' do
          context 'left side of correct file' do
            context 'a-file' do
              let(:current_coordinate)     { Coordinate.new(:e1) }
              let(:destination_coordinate) { Coordinate.new(:a7) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end

            context 'any file' do
              let(:current_coordinate)     { Coordinate.new(:d4) }
              let(:destination_coordinate) { Coordinate.new(:b6) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end
          end

          context 'right side of correct file' do
            context 'h-file' do
              let(:current_coordinate)     { Coordinate.new(:b2) }
              let(:destination_coordinate) { Coordinate.new(:h5) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end

            context 'any file' do
              let(:current_coordinate)     { Coordinate.new(:c3) }
              let(:destination_coordinate) { Coordinate.new(:g8) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end
          end
        end
      end

      context 'when down' do
        context 'wrong file' do
          context 'left side of correct file' do
            context 'a-file' do
              let(:current_coordinate)     { Coordinate.new(:e6) }
              let(:destination_coordinate) { Coordinate.new(:a2) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end

            context 'any file' do
              let(:current_coordinate)     { Coordinate.new(:f4) }
              let(:destination_coordinate) { Coordinate.new(:d2) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end
          end

          context 'right side of correct file' do
            context 'h-file' do
              let(:current_coordinate)     { Coordinate.new(:e6) }
              let(:destination_coordinate) { Coordinate.new(:h3) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end

            context 'any file' do
              let(:current_coordinate)     { Coordinate.new(:d5) }
              let(:destination_coordinate) { Coordinate.new(:f2) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end
          end
        end
      end

      context 'when left' do
        context 'wrong rank' do
          context 'above the correct rank' do
            context '8th rank' do
              let(:current_coordinate)     { Coordinate.new(:e1) }
              let(:destination_coordinate) { Coordinate.new(:a8) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end
            context 'any rank' do
              let(:current_coordinate)     { Coordinate.new(:h5) }
              let(:destination_coordinate) { Coordinate.new(:b7) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end
          end

          context 'below the correct rank' do
            context '1st rank' do
              let(:current_coordinate)     { Coordinate.new(:g6) }
              let(:destination_coordinate) { Coordinate.new(:f1) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end
            context 'any rank' do
              let(:current_coordinate)     { Coordinate.new(:g7) }
              let(:destination_coordinate) { Coordinate.new(:b2) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end
          end
        end
      end

      context 'when right' do
        context 'wrong rank' do
          context 'above the correct rank' do
            context '8th rank' do
              let(:current_coordinate)     { Coordinate.new(:d2) }
              let(:destination_coordinate) { Coordinate.new(:g8) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end

            context 'any rank' do
              let(:current_coordinate)     { Coordinate.new(:c3) }
              let(:destination_coordinate) { Coordinate.new(:f5) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end
          end

          context 'below the correct rank' do
            context '1st rank' do
              let(:current_coordinate)     { Coordinate.new(:b7) }
              let(:destination_coordinate) { Coordinate.new(:e1) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end

            context 'any rank' do
              let(:current_coordinate)     { Coordinate.new(:e5) }
              let(:destination_coordinate) { Coordinate.new(:g4) }

              before do
                allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
                allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
              end

              it 'returns false' do
                move_validity = rook.valid_move?
                expect(move_validity).to be(false)
              end
            end
          end
        end
      end
    end
  end

  context 'when other pieces are needed: capturing a piece' do
    context 'when move is valid' do
      context 'when up' do
        let(:target_piece) { Rook.new(board:) }
        let(:current_coordinate)     { Coordinate.new(:c1) }
        let(:destination_coordinate) { Coordinate.new(:c3) }
        let(:capture_square) { Square.new }

        before do
          allow(rook).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
          allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
          allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
          capture_square.add(target_piece)
        end

        it 'returns true' do
          move_validity = rook.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when down' do
        let(:target_piece) { Bishop.new(board:) }
        let(:current_coordinate)     { Coordinate.new(:g7) }
        let(:destination_coordinate) { Coordinate.new(:g2) }
        let(:capture_square) { Square.new }

        before do
          allow(rook).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
          allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
          allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
          capture_square.add(target_piece)
        end

        it 'returns true' do
          move_validity = rook.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when left' do
        let(:target_piece) { Queen.new(board:) }
        let(:current_coordinate)     { Coordinate.new(:f2) }
        let(:destination_coordinate) { Coordinate.new(:b2) }
        let(:capture_square) { Square.new }

        before do
          allow(rook).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
          allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
          allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
          capture_square.add(target_piece)
        end

        it 'returns true' do
          move_validity = rook.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when right' do
        let(:target_piece) { Knight.new(board:) }
        let(:current_coordinate)     { Coordinate.new(:d5) }
        let(:destination_coordinate) { Coordinate.new(:g5) }
        let(:capture_square) { Square.new }

        before do
          allow(rook).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
          allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
          allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
          capture_square.add(target_piece)
        end

        it 'returns true' do
          move_validity = rook.valid_move?
          expect(move_validity).to be(true)
        end
      end
    end

    context 'when move is invalid' do
      context 'when piece has the same color' do
        context 'when up' do
          let(:target_piece) { Rook.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:c1) }
          let(:destination_coordinate) { Coordinate.new(:c3) }
          let(:capture_square) { Square.new }

          before do
            allow(rook).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
            allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end

          it 'returns false' do
            move_validity = rook.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when down' do
          let(:target_piece) { Bishop.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g7) }
          let(:destination_coordinate) { Coordinate.new(:g2) }
          let(:capture_square) { Square.new }

          before do
            allow(rook).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
            allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end

          it 'returns false' do
            move_validity = rook.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when left' do
          let(:target_piece) { Queen.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:f2) }
          let(:destination_coordinate) { Coordinate.new(:b2) }
          let(:capture_square) { Square.new }

          before do
            allow(rook).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
            allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end

          it 'returns false' do
            move_validity = rook.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when right' do
          let(:target_piece) { Knight.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:d5) }
          let(:destination_coordinate) { Coordinate.new(:g5) }
          let(:capture_square) { Square.new }

          before do
            allow(rook).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
            allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(target_piece)
          end

          it 'returns false' do
            move_validity = rook.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end

      context 'when target piece is a king' do
        context 'when up' do
          let(:uncaptureable_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:c1) }
          let(:destination_coordinate) { Coordinate.new(:c3) }
          let(:capture_square) { Square.new }

          before do
            allow(rook).to receive(:color).and_return(:white)
            allow(uncaptureable_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
            allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(uncaptureable_king)
          end

          it 'returns false' do
            move_validity = rook.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when down' do
          let(:uncaptureable_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g7) }
          let(:destination_coordinate) { Coordinate.new(:g2) }
          let(:capture_square) { Square.new }

          before do
            allow(rook).to receive(:color).and_return(:black)
            allow(uncaptureable_king).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
            allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(uncaptureable_king)
          end

          it 'returns false' do
            move_validity = rook.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when left' do
          let(:uncaptureable_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:f2) }
          let(:destination_coordinate) { Coordinate.new(:b2) }
          let(:capture_square) { Square.new }

          before do
            allow(rook).to receive(:color).and_return(:black)
            allow(uncaptureable_king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
            allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(uncaptureable_king)
          end

          it 'returns false' do
            move_validity = rook.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when right' do
          let(:uncaptureable_king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:d5) }
          let(:destination_coordinate) { Coordinate.new(:g5) }
          let(:capture_square) { Square.new }

          before do
            allow(rook).to receive(:color).and_return(:white)
            allow(uncaptureable_king).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(capture_square)
            allow(rook).to receive(:current_coordinate).and_return(current_coordinate)
            allow(rook).to receive(:destination_coordinate).and_return(destination_coordinate)
            capture_square.add(uncaptureable_king)
          end

          it 'returns false' do
            move_validity = rook.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end
    end
  end
end
