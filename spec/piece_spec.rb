require_relative '../lib/piece'

describe Piece do
  describe '#move' do
    it 'sends ValidityInspector#valid_move?' do
      board = double('board')
      validity_inspector = double('validity_inspector')
      allow(validity_inspector).to receive(:valid_move?)
      piece = Piece.new(board:, validity_inspector:)

      expect(validity_inspector).to receive(:valid_move?)
      piece.move(destination_coordinate: :c6)
    end
  end
end
