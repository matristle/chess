require_relative '../lib/board'

describe Board do
  subject(:board) { Board.new }

  context 'when board is created' do
    it 'has 64 squares' do
      expect(board.number_of_squares).to eq(64)
    end

    it 'has an empty square' do
      expect(board[:a5]).to eq(:empty)
    end

    it 'has all of its squares empty' do
      expect(board.empty?).to be(true)
    end

    it 'has 32 white squares' do
      expect(board.white_square_number).to eq(32)
    end

    it 'has 32 black squares' do
      expect(board.black_square_number).to eq(32)
    end

    it 'has all desirable alphanumeric coordinates' do
      coordinates = %i[a1 a2 a3 a4 a5 a6 a7 a8 b1 b2 b3 b4 b5 b6 b7 b8 c1 c2 c3 c4 c5 c6 c7 c8 d1 d2 d3 d4 d5 d6 d7 d8 e1 e2 e3 e4 e5 e6 e7 e8 f1 f2 f3 f4 f5 f6 f7 f8 g1 g2 g3 g4 g5 g6 g7 g8 h1 h2 h3 h4 h5 h6 h7 h8]

      expect(board.all_coordinates).to eq(coordinates)
    end

    xit 'has black-white on first rank at the start' do
      expect(board[:a1].black?).to be(true)
      expect(board[:a2].white?).to be(true)
    end
  end
end
