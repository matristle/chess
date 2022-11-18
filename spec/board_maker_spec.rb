require_relative '../lib/board_maker'

describe BoardMaker do
  describe '#file_to_number' do
    it 'returns 1 for a-file' do
      expect(BoardMaker.file_to_number('a')).to eq('1')
    end
  end
end
