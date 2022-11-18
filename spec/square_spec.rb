require_relative '../lib/square'

describe Square do
  it 'can have the color white' do
    square = Square.new(color: :white)

    expect(square.white?).to eq(true)
  end

  it 'can have the color black' do
    square = Square.new(color: :black)

    expect(square.black?).to eq(true)
  end

  it 'can be empty' do
    square = Square.new(color: :white)

    expect(square.empty?).to eq(true)
  end

  it 'can be occupied' do
    square = Square.new(color: :black, status: :occupied)

    expect(square.occupied?).to eq(true)
  end

  it 'can have a different color compared to another square' do
    a_square       = Square.new(color: :black)
    another_square = Square.new(color: :white)

    expect(a_square.same_color_as?(another_square)).to be(false)
  end
  
  it 'can have the same color as another square' do
    a_square       = Square.new(color: :white)
    another_square = Square.new(color: :white)
    
    expect(a_square.same_color_as?(another_square)).to be(true)
  end

  it 'can be empty when another square is occupied' do
    a_square       = Square.new(color: :white, status: :empty)
    another_square = Square.new(color: :white, status: :occupied)
    
    expect(a_square.has_a_piece_like?(another_square)).to be(false)
  end
  
  it 'can have a piece when other square has a piece' do
    a_square       = Square.new(color: :black, status: :occupied)
    another_square = Square.new(color: :white, status: :occupied)

    expect(a_square.has_a_piece_like?(another_square)).to be(true)
  end
  
  context 'when passing in unwanted inputs during square initialization' do
    context 'and the foul input is for color' do
      let(:not_to_be_created_square) { Square.new(color: foul_color_input) }
      let(:foul_color_input) { :green }

      it 'raises foul color input error' do
        expect { not_to_be_created_square }.to raise_error("Foul color input. The square color must be either :black or :white, not #{foul_color_input}")
      end
    end

    context 'and the foul input is for status' do
      let(:not_to_be_created_square) { Square.new(color: valid_color_input, status: foul_status_input) }
      let(:valid_color_input) { :white }
      let(:foul_status_input) { :empty_AND_occupied! }

      it 'raise foul status input error' do
        expect { not_to_be_created_square }.to raise_error("Foul status input. Status must be either :empty or :occupied, not #{foul_status_input}")
      end
    end
  end
end