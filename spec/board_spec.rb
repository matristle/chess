require_relative '../lib/board'
require_relative '../lib/square'

describe Board do
  subject(:board) { Board.new }

  context 'when board is created' do
    it 'has 64 squares' do
      expect(board.number_of_squares).to eq(64)
    end

    it 'has all of its squares empty' do
      expect(board.empty?).to be(true)
    end

    it 'has 32 light squares' do
      expect(board.number_of_light_squares).to eq(32)
    end

    it 'has 32 dark squares' do
      expect(board.number_of_dark_squares).to eq(32)
    end

    it 'has a checkered pattern' do
      expect(board.checkered?).to be(true)
    end

    it 'has a square on a1' do
      expect(board.square_at(Coordinate.new(:a1)) ).to eq(Square.new(color: :dark))
    end
  end

  context 'after setup' do
    before { board.setup_pieces }

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
end
