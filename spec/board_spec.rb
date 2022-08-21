require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    subject(:board) { Board.new }
    let(:board_structure) { board.board_structure }

    it 'creates an empty board with 64 cells' do
      expect(board_structure.size).to eq(64)
    end

    context 'when a coordinate is valid' do
      it 'contains a cell with a coordinate' do
        expect(board_structure[:b6]).to eq('')
      end

      it 'contains a cell on the first rank' do
        expect(board_structure[:b1]).to eq('')
      end

      it 'contains a cell on the last rank' do
        expect(board_structure[:d8]).to eq('')
      end

      it 'contains a cell on the a-file' do
        expect(board_structure[:a5]).to eq('')
      end

      it 'contains a cell on the h-file' do
        expect(board_structure[:h4]).to eq('')
      end
    end

    context 'when a coordinate is invalid' do
      it 'does not contain a poser coordinate' do
        expect(board_structure[:o9]).to be_nil
      end

      it 'does not contain a coordinate with only a letter' do
        expect(board_structure[:e]).to be_nil
      end

      it 'does not contain a capitalized coordinate' do
        expect(board_structure[:A3]).to be_nil
      end
    end
  end

  describe '#transport_to'
end
