require_relative '../lib/piece'

describe Piece do
  describe '#move' do
    it 'sends message to the board' do
      board = double('board')
      allow(board).to receive(:transport)
      piece = Piece.new(board:)
      
      expect(board).to receive(:transport)
      piece.move(:h3)
    end
  end
end
