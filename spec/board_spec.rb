require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    subject(:board) { Board.new }
    let(:board_structure) { board.board_structure }

    it 'creates an empty board with 64 cells' do
      expect(board_structure.size).to eq(64)
    end
  end
end
