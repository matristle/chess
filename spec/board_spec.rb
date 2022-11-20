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
  end
end
