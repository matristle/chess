require_relative '../lib/piece'

describe Piece do
  describe '#move' do
    it 'sends Board#transport' do
      board = double('board')
      allow(board).to receive(:transport)
      piece = Piece.new(board:)

      expect(board).to receive(:transport)
      piece.move(destination_coordinate: :h3)
    end
  end
end
