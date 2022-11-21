require_relative '../lib/coordinate'

describe Coordinate do
  it 'can partly represent the a-file' do
    expect(Coordinate.new(:a4).file).to eq('a')
  end

  it 'can partly represent the b-file' do
    expect(Coordinate.new(:b8).file).to eq('b')
  end

  it 'can partly represent the 1st rank' do
    expect(Coordinate.new(:g1).rank).to eq('1')
  end

  it 'can partly represent the 2nd rank' do
    expect(Coordinate.new(:e2).rank).to eq('2')
  end

  it 'can fully represent a coordinate as a symbol' do
    expect(Coordinate.new(:f7).symbol).to be(:f7)
  end

  context 'when passing in an out-of-bounds input to square initialization' do
    context 'and the foul input is for file' do
      it 'raises out of bounds error' do
        out_of_bounds_file_input = 'i'
        in_bounds_rank_input     = '3'
        invalid_coordinate_input = (out_of_bounds_file_input + in_bounds_rank_input).to_sym

        expect { Coordinate.new(invalid_coordinate_input) }.to raise_error("'#{out_of_bounds_file_input}' is out of bounds: file letters must be between 'a' and 'h'")
      end
    end

    context 'and the foul input is for rank' do
      it 'raises out of bounds error' do
        in_bounds_file_input     = 'c' 
        out_of_bounds_rank_input = '0'
        invalid_coordinate_input = (in_bounds_file_input + out_of_bounds_rank_input).to_sym
        
        expect { Coordinate.new(invalid_coordinate_input) }.to raise_error("'#{out_of_bounds_rank_input}' is out of bounds: rank numbers must be between '1' and '8'")
      end
    end
  end

  describe '::file_to_number' do
    it 'returns 1 for a-file' do
      expect(Coordinate.file_to_number('a')).to eq('1')
    end

    it 'returns 4 for d-file' do
      expect(Coordinate.file_to_number('d')).to eq('4')
    end

    it 'returns 8 for h-file' do
      expect(Coordinate.file_to_number('h')).to eq('8')
    end
  end

  describe '::file_to_number_mapping' do
    it 'returns mapped out hash' do
      expected_hash = { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8 }

      expect(Coordinate.file_number_mapping).to eq(expected_hash)
    end
  end
end
