require_relative '../lib/rook'

describe Rook do
  describe '#move_to' do
    it 'sends message to the board' do
      board = double('board')
      allow(board).to receive(:transport_to)
      rook = Rook.new(board:)
      
      expect(board).to receive(:transport_to)
      rook.move_to(:h3)
    end
  end
end
