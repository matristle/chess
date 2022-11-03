require_relative '../lib/queen'
require_relative '../lib/piece'
require_relative '../lib/king'
require_relative '../lib/board'
require_relative '../lib/coordinate'

describe Queen do
  subject(:queen) { described_class.new(board:) }
  let(:board) { Board.new }

  context 'when other pieces aren\'t needed' do
    context 'when move is valid' do
      context 'when up' do
        let(:current_coordinate)     { Coordinate.new(:f1) }
        let(:destination_coordinate) { Coordinate.new(:f7) }

        before do
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when down' do
        let(:current_coordinate)     { Coordinate.new(:e3) }
        let(:destination_coordinate) { Coordinate.new(:e1) }

        before do
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when left' do
        let(:current_coordinate)     { Coordinate.new(:c1) }
        let(:destination_coordinate) { Coordinate.new(:a1) }

        before do
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when right' do
        let(:current_coordinate)     { Coordinate.new(:d4) }
        let(:destination_coordinate) { Coordinate.new(:g4) }

        before do
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top left' do
        let(:current_coordinate)     { Coordinate.new(:g2) }
        let(:destination_coordinate) { Coordinate.new(:b7) }

        before do
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top right' do
        let(:current_coordinate)     { Coordinate.new(:c3) }
        let(:destination_coordinate) { Coordinate.new(:f6) }

        before do
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom left' do
        let(:current_coordinate)     { Coordinate.new(:f5) }
        let(:destination_coordinate) { Coordinate.new(:b1) }

        before do
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom right' do
        let(:current_coordinate)     { Coordinate.new(:b4) }
        let(:destination_coordinate) { Coordinate.new(:d2) }

        before do
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end
    end

    context 'when move is invalid' do
      context 'when target coordinate is same as current coordinate' do
        let(:current_coordinate)     { Coordinate.new(:b6) }
        let(:destination_coordinate) { Coordinate.new(:b6) }

        before do
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns false' do
          move_validity = queen.valid_move?
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
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
                expect(move_validity).to be(false)
              end
            end

            context 'any file' do
              let(:current_coordinate)     { Coordinate.new(:d4) }
              let(:destination_coordinate) { Coordinate.new(:b7) }

              before do
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
                expect(move_validity).to be(false)
              end
            end
          end

          context 'right side of correct file' do
            context 'h-file' do
              let(:current_coordinate)     { Coordinate.new(:b2) }
              let(:destination_coordinate) { Coordinate.new(:h5) }

              before do
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
                expect(move_validity).to be(false)
              end
            end

            context 'any file' do
              let(:current_coordinate)     { Coordinate.new(:c3) }
              let(:destination_coordinate) { Coordinate.new(:g8) }

              before do
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
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
              let(:destination_coordinate) { Coordinate.new(:a1) }

              before do
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
                expect(move_validity).to be(false)
              end
            end

            context 'any file' do
              let(:current_coordinate)     { Coordinate.new(:f4) }
              let(:destination_coordinate) { Coordinate.new(:d1) }

              before do
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
                expect(move_validity).to be(false)
              end
            end
          end

          context 'right side of correct file' do
            context 'h-file' do
              let(:current_coordinate)     { Coordinate.new(:e6) }
              let(:destination_coordinate) { Coordinate.new(:h2) }

              before do
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
                expect(move_validity).to be(false)
              end
            end

            context 'any file' do
              let(:current_coordinate)     { Coordinate.new(:d5) }
              let(:destination_coordinate) { Coordinate.new(:f2) }

              before do
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
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
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
                expect(move_validity).to be(false)
              end
            end
            context 'any rank' do
              let(:current_coordinate)     { Coordinate.new(:h5) }
              let(:destination_coordinate) { Coordinate.new(:b7) }

              before do
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
                expect(move_validity).to be(false)
              end
            end
          end

          context 'below the correct rank' do
            context '1st rank' do
              let(:current_coordinate)     { Coordinate.new(:g6) }
              let(:destination_coordinate) { Coordinate.new(:f1) }

              before do
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
                expect(move_validity).to be(false)
              end
            end
            context 'any rank' do
              let(:current_coordinate)     { Coordinate.new(:g7) }
              let(:destination_coordinate) { Coordinate.new(:b1) }

              before do
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
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
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
                expect(move_validity).to be(false)
              end
            end

            context 'any rank' do
              let(:current_coordinate)     { Coordinate.new(:c3) }
              let(:destination_coordinate) { Coordinate.new(:f5) }

              before do
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
                expect(move_validity).to be(false)
              end
            end
          end

          context 'below the correct rank' do
            context '1st rank' do
              let(:current_coordinate)     { Coordinate.new(:b7) }
              let(:destination_coordinate) { Coordinate.new(:e1) }

              before do
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
                expect(move_validity).to be(false)
              end
            end

            context 'any rank' do
              let(:current_coordinate)     { Coordinate.new(:e5) }
              let(:destination_coordinate) { Coordinate.new(:g4) }

              before do
                allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
                allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
                allow(queen).to receive(:valid_board_move?).and_return(true)
              end

              it 'returns false' do
                move_validity = queen.valid_move?
                expect(move_validity).to be(false)
              end
            end
          end
        end
      end

      context 'when top left' do
        let(:current_coordinate)     { Coordinate.new(:g2) }
        let(:destination_coordinate) { Coordinate.new(:b7) }

        before do
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top right' do
        let(:current_coordinate)     { Coordinate.new(:c3) }
        let(:destination_coordinate) { Coordinate.new(:f6) }

        before do
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom left' do
        let(:current_coordinate)     { Coordinate.new(:f5) }
        let(:destination_coordinate) { Coordinate.new(:b1) }

        before do
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom right' do
        let(:current_coordinate)     { Coordinate.new(:b4) }
        let(:destination_coordinate) { Coordinate.new(:d2) }

        before do
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_board_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end
    end
  end

  context 'when other pieces are needed: capturing a piece' do
    context 'when move is valid' do
      context 'when up' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:c1) }
        let(:destination_coordinate) { Coordinate.new(:c3) }

        before do
          allow(queen).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when down' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:g7) }
        let(:destination_coordinate) { Coordinate.new(:g2) }

        before do
          allow(queen).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when left' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:f2) }
        let(:destination_coordinate) { Coordinate.new(:b2) }

        before do
          allow(queen).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when right' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:d5) }
        let(:destination_coordinate) { Coordinate.new(:g5) }

        before do
          allow(queen).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top left' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:g2) }
        let(:destination_coordinate) { Coordinate.new(:b7) }

        before do
          allow(queen).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when top right' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:c3) }
        let(:destination_coordinate) { Coordinate.new(:f6) }

        before do
          allow(queen).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom left' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:f5) }
        let(:destination_coordinate) { Coordinate.new(:b1) }

        before do
          allow(queen).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end

      context 'when bottom right' do
        let(:target_piece) { double('target_piece') }
        let(:current_coordinate)     { Coordinate.new(:b4) }
        let(:destination_coordinate) { Coordinate.new(:d2) }

        before do
          allow(queen).to receive(:color).and_return(:white)
          allow(target_piece).to receive(:color).and_return(:black)
          allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
          allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
          allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
          allow(queen).to receive(:valid_piece_move?).and_return(true)
        end

        it 'returns true' do
          move_validity = queen.valid_move?
          expect(move_validity).to be(true)
        end
      end
    end

    context 'when move is invalid' do
      context 'when piece has the same color' do
        context 'when up' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:c1) }
          let(:destination_coordinate) { Coordinate.new(:c3) }

          before do
            allow(queen).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(queen).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = queen.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when down' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:g7) }
          let(:destination_coordinate) { Coordinate.new(:g2) }

          before do
            allow(queen).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(queen).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = queen.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when left' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:f2) }
          let(:destination_coordinate) { Coordinate.new(:b2) }

          before do
            allow(queen).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(queen).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = queen.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when right' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:d5) }
          let(:destination_coordinate) { Coordinate.new(:g5) }

          before do
            allow(queen).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(queen).to receive(:valid_piece_move?).and_return(true)
          end

          it 'returns false' do
            move_validity = queen.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top left' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:g2) }
          let(:destination_coordinate) { Coordinate.new(:b7) }
  
          before do
            allow(queen).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(queen).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = queen.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when top right' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:c3) }
          let(:destination_coordinate) { Coordinate.new(:f6) }
  
          before do
            allow(queen).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(queen).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = queen.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom left' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:f5) }
          let(:destination_coordinate) { Coordinate.new(:b1) }
  
          before do
            allow(queen).to receive(:color).and_return(:white)
            allow(target_piece).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(queen).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = queen.valid_move?
            expect(move_validity).to be(false)
          end
        end

        context 'when bottom right' do
          let(:target_piece) { double('target_piece') }
          let(:current_coordinate)     { Coordinate.new(:b4) }
          let(:destination_coordinate) { Coordinate.new(:d2) }

          before do
            allow(queen).to receive(:color).and_return(:black)
            allow(target_piece).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(target_piece)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(queen).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = queen.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end

      context 'when target piece is a king' do
        context 'when top left' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:g2) }
          let(:destination_coordinate) { Coordinate.new(:b7) }
  
          before do
            allow(queen).to receive(:color).and_return(:white)
            allow(king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(queen).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = queen.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when top right' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:c3) }
          let(:destination_coordinate) { Coordinate.new(:f6) }
  
          before do
            allow(queen).to receive(:color).and_return(:white)
            allow(king).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(queen).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = queen.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when bottom left' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:f5) }
          let(:destination_coordinate) { Coordinate.new(:b1) }
  
          before do
            allow(queen).to receive(:color).and_return(:black)
            allow(king).to receive(:color).and_return(:white)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(queen).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = queen.valid_move?
            expect(move_validity).to be(false)
          end
        end
  
        context 'when bottom right' do
          let(:king) { King.new(board:) }
          let(:current_coordinate)     { Coordinate.new(:b4) }
          let(:destination_coordinate) { Coordinate.new(:d2) }
  
          before do
            allow(queen).to receive(:color).and_return(:black)
            allow(king).to receive(:color).and_return(:black)
            allow(board).to receive(:[]).with(destination_coordinate.to_sym).and_return(king)
            allow(queen).to receive(:current_coordinate).and_return(current_coordinate)
            allow(queen).to receive(:destination_coordinate).and_return(destination_coordinate)
            allow(queen).to receive(:valid_piece_move?).and_return(true)
          end
  
          it 'returns false' do
            move_validity = queen.valid_move?
            expect(move_validity).to be(false)
          end
        end
      end
    end
  end
end
