require_relative 'custom_matchers'
require_relative '../lib/move_validator'
require_relative '../lib/board'
require_relative '../lib/board_maker'
require_relative '../lib/piece_arranger'

describe MoveValidator do
  include CustomMatchers

  subject(:move_validator) { MoveValidator.new }

  let(:board) { Board.new(board_maker:, piece_arranger:, move_validator:) }
    let(:board_maker)    { BoardMaker.new }
    let(:piece_arranger) { PieceArranger.new }

  describe '#any_intervening_piece_between?' do
    context "when there's an intervening piece between a plotted move" do
      context 'rook-like scanning' do
        it 'returns true when scanning upwards' do
          initial_coordinate     = Coordinate.new(:c4)
          destination_coordinate = Coordinate.new(:c7)
          intervening_knight_coordinate = Coordinate.new(:c6)
          intervening_knight = Knight.new(:white)
          rook = Rook.new(:white)
          board.place(rook, initial_coordinate)
          board.place(intervening_knight, intervening_knight_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(true)    
        end
  
        it 'returns true when scanning downwards' do
          initial_coordinate     = Coordinate.new(:b6)
          destination_coordinate = Coordinate.new(:b2)
          intervening_knight_coordinate = Coordinate.new(:b4)
          intervening_knight = Knight.new(:white)
          rook = Rook.new(:black)
          board.place(rook, initial_coordinate)
          board.place(intervening_knight, intervening_knight_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(true)    
        end
  
        it 'returns true when scanning leftwards' do
          initial_coordinate     = Coordinate.new(:d6)
          destination_coordinate = Coordinate.new(:a6)
          intervening_knight_coordinate = Coordinate.new(:b6)
          intervening_knight = Knight.new(:white)
          rook = Rook.new(:black)
          board.place(rook, initial_coordinate)
          board.place(intervening_knight, intervening_knight_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(true)    
        end
  
        it 'returns true when scanning rightwards' do
          initial_coordinate     = Coordinate.new(:c2)
          destination_coordinate = Coordinate.new(:f2)
          intervening_knight_coordinate = Coordinate.new(:e2)
          intervening_knight = Knight.new(:white)
          rook = Rook.new(:black)
          board.place(rook, initial_coordinate)
          board.place(intervening_knight, intervening_knight_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(true)    
        end
      end

      context 'bishop-like scanning' do
        it 'returns true when scanning top-right diagonal' do
          initial_coordinate     = Coordinate.new(:d3)
          destination_coordinate = Coordinate.new(:g6)
          intervening_knight_coordinate = Coordinate.new(:f5)
          intervening_knight = Knight.new(:white)
          bishop = Bishop.new(:white)
          board.place(bishop, initial_coordinate)
          board.place(intervening_knight, intervening_knight_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(true) 
        end

        it 'returns true when scanning top-left diagonal' do
          initial_coordinate     = Coordinate.new(:e1)
          destination_coordinate = Coordinate.new(:b4)
          intervening_knight_coordinate = Coordinate.new(:d2)
          intervening_knight = Knight.new(:white)
          bishop = Bishop.new(:white)
          board.place(bishop, initial_coordinate)
          board.place(intervening_knight, intervening_knight_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(true) 
        end

        it 'returns true when scanning bottom-right diagonal' do
          initial_coordinate     = Coordinate.new(:c7)
          destination_coordinate = Coordinate.new(:h2)
          intervening_knight_coordinate = Coordinate.new(:e5)
          intervening_knight = Knight.new(:white)
          bishop = Bishop.new(:white)
          board.place(bishop, initial_coordinate)
          board.place(intervening_knight, intervening_knight_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(true) 
        end

        it 'returns true when scanning bottom-left diagonal' do
          initial_coordinate     = Coordinate.new(:e4)
          destination_coordinate = Coordinate.new(:b1)
          intervening_knight_coordinate = Coordinate.new(:d3)
          intervening_knight = Knight.new(:white)
          bishop = Bishop.new(:white)
          board.place(bishop, initial_coordinate)
          board.place(intervening_knight, intervening_knight_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(true) 
        end
      end
    end
    
    context "when there isn't an intervening piece between a rook" do
      context 'intended to move upwards' do
        it 'returns false' do
          initial_coordinate     = Coordinate.new(:c4)
          destination_coordinate = Coordinate.new(:c7)
          rook = Rook.new(:white)
          board.place(rook, initial_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(false)    
        end
      end

      context 'intended to move downwards' do
        it 'returns false' do
          initial_coordinate     = Coordinate.new(:f6)
          destination_coordinate = Coordinate.new(:f1)
          rook = Rook.new(:white)
          board.place(rook, initial_coordinate)
  
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(false)    
        end
      end

      context 'intended to move leftwards' do
        it 'returns false' do
          initial_coordinate     = Coordinate.new(:f4)
          destination_coordinate = Coordinate.new(:c4)
          rook = Rook.new(:white)
          board.place(rook, initial_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(false)    
        end
      end

      context 'intended to move rightwards' do
        it 'returns false' do
          initial_coordinate     = Coordinate.new(:b7)
          destination_coordinate = Coordinate.new(:d7)
          rook = Rook.new(:white)
          board.place(rook, initial_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(false)    
        end
      end
    end

    context "when there isn't an intervening piece between a bishop" do
      context "intended to move diagonally at top-right" do
        it 'returns false' do
          initial_coordinate     = Coordinate.new(:c2)
          destination_coordinate = Coordinate.new(:f5)
          bishop = Bishop.new(:white)
          board.place(bishop, initial_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(false)  
        end
      end

      context "intended to move diagonally at top-left" do
        it 'returns false' do
          initial_coordinate     = Coordinate.new(:d4)
          destination_coordinate = Coordinate.new(:a7)
          bishop = Bishop.new(:white)
          board.place(bishop, initial_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(false)  
        end
      end

      context "intended to move diagonally at bottom-right" do
        it 'returns false' do
          initial_coordinate     = Coordinate.new(:c6)
          destination_coordinate = Coordinate.new(:g2)
          bishop = Bishop.new(:white)
          board.place(bishop, initial_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(false)  
        end
      end

      context "intended to move diagonally at bottom-left" do
        it 'returns false' do
          initial_coordinate     = Coordinate.new(:h5)
          destination_coordinate = Coordinate.new(:e2)
          bishop = Bishop.new(:white)
          board.place(bishop, initial_coordinate)
    
          expect(move_validator.any_intervening_piece_between?(initial_coordinate, destination_coordinate, board)).to be(false)  
        end
      end
    end
  end
end
