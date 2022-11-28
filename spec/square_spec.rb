require_relative '../lib/square'
require_relative '../lib/pawn'
require_relative '../lib/rook'
require_relative '../lib/knight'
require_relative '../lib/bishop'
require_relative '../lib/queen'
require_relative '../lib/king'

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
    square.host(Pawn.new(:white))

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
    a_square.host(Knight.new(:black))
    another_square = Square.new(color: :light)
    another_square.host(Pawn.new(:white))

    expect(a_square.occupied_like?(another_square)).to be(true)
  end

  it 'can be empty when another square is occupied by a piece' do
    a_square       = Square.new(color: :light)
    no_op = a_square
    another_square = Square.new(color: :light)
    another_square.host(Queen.new(:black))
    
    expect(a_square.occupied_like?(another_square)).to be(false)
  end

  it 'can be empty like another square but these squares should not be occupied' do
    a_square       = Square.new(color: :light)
    another_square = Square.new(color: :light)

    expect(a_square.occupied_like?(another_square)).to be(false)
  end

  it 'can host a pawn' do
    square = Square.new(color: :light)

    square.host(Pawn.new(:white))

    expect(square.pawn_here?).to be(true)
  end
  
  it 'can host a rook' do
    square = Square.new(color: :dark)
    
    square.host(Rook.new(:white))
    
    expect(square.rook_here?).to be(true)
  end
  
  it 'can host a bishop' do
    square = Square.new(color: :dark)
    
    square.host(Bishop.new(:white))
    
    expect(square.bishop_here?).to be(true)
  end
  
  it 'can host a queen' do
    square = Square.new(color: :light)
    
    square.host(Queen.new(:white))
    
    expect(square.queen_here?).to be(true)
  end
  
  it 'can host a king' do
    square = Square.new(color: :dark)

    square.host(King.new(:white))
    
    expect(square.king_here?).to be(true)
  end
  
  it 'can host a knight' do
    square = Square.new(color: :light)
    
    square.host(Knight.new(:white))
    
    expect(square.knight_here?).to be(true)
  end
  
  it "doesn't host a rook when the occupant is actually a bishop" do
    square = Square.new(color: :light)
    
    square.host(Bishop.new(:black))
    
    expect(square.rook_here?).to be(false)
  end

  it "doesn't host a horse" do
    square = Square.new(color: :dark) 
    Horse = Struct.new(:class, :color)
    out_of_domain_piece = Horse.new(Horse, :white) 

    expect { square.host(out_of_domain_piece) }.to raise_error("The #{out_of_domain_piece.class} is not in the set of domain pieces")
  end

  it 'can have a white occupant piece' do
    square = Square.new(color: :light)

    square.host(Knight.new(:white))

    expect(square).to be_white_piece_here
  end

  it 'can have a black occupant piece' do
    square = Square.new(color: :light)

    square.host(Bishop.new(:black))

    expect(square).to be_black_piece_here
  end

  it 'does not have a white occupant piece when the occupant piece is black' do
    square = Square.new(color: :light)

    square.host(Knight.new(:black))

    expect(square).to_not be_white_piece_here
  end

  it 'does not have a black occupant piece when the occupant piece is white' do
    square = Square.new(color: :light)

    square.host(Knight.new(:white))

    expect(square).to_not be_black_piece_here
  end
end
