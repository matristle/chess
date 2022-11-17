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
  end
end
