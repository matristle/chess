require_relative '../lib/board_maker'

describe BoardMaker do
  describe '::file_to_number' do
    it 'returns 1 for a-file' do
      expect(BoardMaker.file_to_number('a')).to eq('1')
    end

    it 'returns 4 for d-file' do
      expect(BoardMaker.file_to_number('d')).to eq('4')
    end

    it 'returns 8 for h-file' do
      expect(BoardMaker.file_to_number('h')).to eq('8')
    end
  end
end
