require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    subject(:board) { Board.new }

    it 'creates an empty board with 64 cells' do
      expect(board.size).to eq(64)
    end

    context 'when a coordinate is valid' do
      it 'contains a cell with a coordinate' do
        expect(board[:b6]).to eq('')
      end

      it 'contains a cell on the first rank' do
        expect(board[:b1]).to eq('')
      end

      it 'contains a cell on the last rank' do
        expect(board[:d8]).to eq('')
      end

      it 'contains a cell on the a-file' do
        expect(board[:a5]).to eq('')
      end

      it 'contains a cell on the h-file' do
        expect(board[:h4]).to eq('')
      end
    end

    context 'when a coordinate is invalid' do
      it 'does not contain a poser coordinate' do
        expect(board[:o9]).to be_nil
      end

      it 'does not contain a coordinate with only a letter' do
        expect(board[:e]).to be_nil
      end

      it 'does not contain a capitalized coordinate' do
        expect(board[:A3]).to be_nil
      end
    end
  end

  describe '#transport' do
    subject(:board) { Board.new }

    it 'transports the rook from a1 to a3' do
      starting_cell    = :a1
      destination_cell = :a3
      rook = double('rook')
      allow(board).to receive(:selected_piece).and_return(rook)

      expect(board[destination_cell]).to be(rook)
      expect(board[starting_cell]).to be('')
      board.transport(destination_cell:)
    end
  end
end
