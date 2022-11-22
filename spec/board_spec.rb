require_relative '../lib/board'
require_relative '../lib/square'

describe Board do
  subject(:board) { Board.new }

  context 'when board is created' do
    it 'is empty' do
      expect(board.empty?).to be(true)
    end

    it 'has a checkered pattern' do
      expect(board.checkered?).to be(true)
    end

    it 'has 64 squares' do
      expect(board.number_of_squares).to eq(64)
    end

    it 'has 32 light squares' do
      expect(board.number_of_light_squares).to eq(32)
    end

    it 'has 32 dark squares' do
      expect(board.number_of_dark_squares).to eq(32)
    end

    it 'has a square on a1' do
      expect(board.square_at(Coordinate.new(:a1)) ).to eq(Square.new(color: :dark))
    end
  end

  context 'after setup' do
    before { board.setup_pieces }
    
    it 'is not empty' do
      expect(board.empty?).to eq(false)
    end

    context 'on side of the player with the white pieces' do
      it 'has a pawn on a2' do
        expect(board.square_at(Coordinate.new(:a2)).piece).to eq(:pawn)
      end
  
      it 'has a pawn on b2' do
        expect(board.square_at(Coordinate.new(:b2)).piece).to eq(:pawn)
      end
  
      it 'has a pawn on h2' do
        expect(board.square_at(Coordinate.new(:h2)).piece).to eq(:pawn)
      end
  
      it 'has a rook on a1' do
        expect(board.square_at(Coordinate.new(:a1)).piece).to eq(:rook)
      end
  
      it 'has a rook on h1' do
        expect(board.square_at(Coordinate.new(:h1)).piece).to eq(:rook)
      end
  
      it 'has a knight on b1' do
        expect(board.square_at(Coordinate.new(:b1)).piece).to eq(:knight)
      end
  
      it 'has a knight on g1' do
        expect(board.square_at(Coordinate.new(:g1)).piece).to eq(:knight)
      end
  
      it 'has a bishop on c1' do
        expect(board.square_at(Coordinate.new(:c1)).piece).to eq(:bishop)
      end
      
      it 'has a bishop on f1' do
        expect(board.square_at(Coordinate.new(:f1)).piece).to eq(:bishop)
      end
  
      it 'has a queen on d1' do
        expect(board.square_at(Coordinate.new(:d1)).piece).to eq(:queen)
      end
  
      it 'has a king on e1' do
        expect(board.square_at(Coordinate.new(:e1)).piece).to eq(:king)
      end
    end

    context 'on side of the player with the black pieces' do
      it 'has a pawn on a7' do
        expect(board.square_at(Coordinate.new(:a7)).piece).to eq(:pawn)
      end

      it 'has a pawn on b7' do
        expect(board.square_at(Coordinate.new(:b7)).piece).to eq(:pawn)
      end

      it 'has a pawn on g7' do
        expect(board.square_at(Coordinate.new(:g7)).piece).to eq(:pawn)
      end

      it 'has a rook on a1' do
        expect(board.square_at(Coordinate.new(:a8)).piece).to eq(:rook)
      end
  
      it 'has a rook on h8' do
        expect(board.square_at(Coordinate.new(:h8)).piece).to eq(:rook)
      end
  
      it 'has a knight on b8' do
        expect(board.square_at(Coordinate.new(:b8)).piece).to eq(:knight)
      end
  
      it 'has a knight on g8' do
        expect(board.square_at(Coordinate.new(:g8)).piece).to eq(:knight)
      end
  
      it 'has a bishop on c8' do
        expect(board.square_at(Coordinate.new(:c8)).piece).to eq(:bishop)
      end
      
      it 'has a bishop on f8' do
        expect(board.square_at(Coordinate.new(:f8)).piece).to eq(:bishop)
      end
  
      it 'has a queen on d8' do
        expect(board.square_at(Coordinate.new(:d8)).piece).to eq(:queen)
      end
  
      it 'has a king on e8' do
        expect(board.square_at(Coordinate.new(:e8)).piece).to eq(:king)
      end
    end
  end
end
