require_relative '../lib/piece'

describe Piece do
  describe '#move' do
    it 'sends Validator#valid_move?' do
      board = double('board')
      validator = double('validator')
      allow(validator).to receive(:valid_move?)
      piece = Piece.new(board:, validator:)

      expect(validator).to receive(:valid_move?)
      piece.move(destination_coordinate: :c6)
    end

    context 'when move is valid' do
      it 'sends Board#transport' do
        board = double('board')
        validator = double('validator')
        allow(validator).to receive(:valid_move?).and_return(true)
        allow(board).to receive(:transport)
        piece = Piece.new(board:, validator:)

        expect(board).to receive(:transport)
        piece.move(destination_coordinate: :c6)
      end
    end

    context 'when move is not valid' do
      it 'does not send Board#transport' do
        board = double('board')
        validator = double('validator')
        allow(validator).to receive(:valid_move?).and_return(false)
        allow(board).to receive(:transport)
        piece = Piece.new(board:, validator:)

        expect(board).to_not receive(:transport)
        piece.move(destination_coordinate: :c6)
      end
    end
  end
end
