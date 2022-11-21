require_relative '../lib/square'

describe Square do
  context 'when passing in unwanted inputs during square initialization' do
    context 'and the foul input is for color' do
      let(:not_to_be_created_square) { Square.new(color: foul_color_input) }
      let(:foul_color_input) { :green }

      it 'raises foul color input error' do
        expect { not_to_be_created_square }.to raise_error("Foul color input. The square color must be either :dark or :light, not #{foul_color_input}")
      end
    end
  end

  it 'can be light colored' do
    square = Square.new(color: :light)

    expect(square.light?).to eq(true)
  end

  it 'can be dark colored' do
    square = Square.new(color: :dark)

    expect(square.dark?).to eq(true)
  end

  it 'can be empty' do
    square = Square.new(color: :light)

    expect(square.empty?).to eq(true)
  end

  it 'can be occupied' do
    square = Square.new(color: :dark)
    square.host(:pawn)

    expect(square.occupied?).to eq(true)
  end

  it 'can have the same color as another square' do
    a_square       = Square.new(color: :light)
    another_square = Square.new(color: :light)
    
    expect(a_square.same_color_as?(another_square)).to be(true)
  end

  it 'can have a different color compared to another square' do
    a_square       = Square.new(color: :dark )
    another_square = Square.new(color: :light)

    expect(a_square.same_color_as?(another_square)).to be(false)
  end
  
  it 'can be occupied by a piece like another square' do
    a_square = Square.new(color: :dark)
    a_square.host(:knight)
    another_square = Square.new(color: :light)
    another_square.host(:pawn)

    expect(a_square.occupied_like?(another_square)).to be(true)
  end

  it 'can be empty when another square is occupied by a piece' do
    a_square       = Square.new(color: :light)
    no_op = a_square
    another_square = Square.new(color: :light)
    another_square.host(:queen)
    
    expect(a_square.occupied_like?(another_square)).to be(false)
  end

  it 'can be empty like another square but these squares should not be occupied' do
    a_square       = Square.new(color: :light)
    another_square = Square.new(color: :light)

    expect(a_square.occupied_like?(another_square)).to be(false)
  end

  it 'can host a pawn' do
    square = Square.new(color: :light)

    square.host(:pawn)

    expect(square.piece).to be(:pawn)
  end

  it 'can host a rook' do
    square = Square.new(color: :dark)

    square.host(:rook)

    expect(square.piece).to be(:rook)
  end

  it 'can host a bishop' do
    square = Square.new(color: :dark)

    square.host(:bishop)

    expect(square.piece).to be(:bishop)
  end

  it 'can host a queen' do
    square = Square.new(color: :light)

    square.host(:queen)

    expect(square.piece).to be(:queen)
  end

  it 'can host a king' do
    square = Square.new(color: :dark)

    square.host(:king)

    expect(square.piece).to be(:king)
  end

  it 'can host a knight' do
    square = Square.new(color: :light)

    square.host(:knight)

    expect(square.piece).to be(:knight)
  end

  it 'can\'t host a horse' do
    square = Square.new(color: :dark) 
    out_of_domain_piece = :horse

    expect { square.host(out_of_domain_piece) }.to raise_error("The #{out_of_domain_piece} is not in the set of domain pieces")
  end
end
