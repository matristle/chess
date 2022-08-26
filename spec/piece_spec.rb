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

    context 'when move is valid' do
      it 'sends Board#transport' do
        board = double('board')
        validity_inspector = double('validity_inspector')
        allow(validity_inspector).to receive(:valid_move?).and_return(true)
        allow(board).to receive(:transport)
        piece = Piece.new(board:, validity_inspector:)

        expect(board).to receive(:transport)
        piece.move(destination_coordinate: :c6)
      end
    end

    context 'when move is not valid' do
      it 'does not send Board#transport' do
        board = double('board')
        validity_inspector = double('validity_inspector')
        allow(validity_inspector).to receive(:valid_move?).and_return(false)
        allow(board).to receive(:transport)
        piece = Piece.new(board:, validity_inspector:)

        expect(board).to_not receive(:transport)
        piece.move(destination_coordinate: :c6)
      end
    end
  end
end
