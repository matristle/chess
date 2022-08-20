require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    subject(:board) { Board.new }
    let(:board_structure) { board.board_structure }

    it 'creates an empty board with 64 cells' do
      expect(board_structure.size).to eq(64)
    end

    it 'contains a cell with a coordinate' do
      expect(board_structure[:b6]).to eq('')
    end
  end
end
