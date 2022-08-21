require_relative '../lib/piece'

describe Piece do
  describe '#move_to' do
    it 'sends message to the board' do
      board = double('board')
      allow(board).to receive(:transport_to)
      piece = Piece.new(board:)
      
      expect(board).to receive(:transport_to)
      piece.move_to(:h3)
    end
  end
end
