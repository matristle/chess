require_relative '../lib/piece'

describe Piece do
  it 'is white' do
    expect(Piece.new(:white)).to be_white
  end

  it 'is black' do
    expect(Piece.new(:black)).to be_black
  end

  context 'when passing in unwanted inputs during a piece initialization' do
    context 'and the foul input is for color' do
      let(:not_to_be_created_piece) { Piece.new(foul_color_input) }
      let(:foul_color_input) { :green }

      it 'raises foul color input error' do
        expect { not_to_be_created_piece }.to raise_error("Foul color input. The square color must be either :black or :white, not #{foul_color_input}")
      end
    end
  end
end
