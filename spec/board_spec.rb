require_relative 'custom_matchers'
require_relative '../lib/board'
require_relative '../lib/board_maker'

describe Board do
  subject(:board) { Board.new(board_maker) }
  let(:board_maker) { BoardMaker.new }

  context 'when created' do
    it 'is empty' do
      expect(board).to be_empty
    end
    
    it 'has 64 squares' do
      expect(board.number_of_squares).to eq(64)
    end

    it 'has 32 light squares' do
      expect(board.number_of_light_squares).to eq(32)
    end

    it 'has 32 dark squares' do
      expect(board.number_of_dark_squares).to eq(32)
    end
  end

  context 'after setup' do
    before { board.setup_pieces }
    
    it 'is not empty' do
      expect(board).to_not be_empty
    end

    context 'on side of the player with the white pieces' do
      include CustomMatchers
      
      it 'has a pawn on a2' do
        a2 = Coordinate.new(:a2)
        hosting_square = board.square_at(a2)
        
        expect(hosting_square).to be_pawn_here
        expect(hosting_square).to have_a_white_piece
      end
      
      it 'has a pawn on b2' do
        b2 = Coordinate.new(:b2)
        hosting_square = board.square_at(b2)
        
        expect(hosting_square).to be_pawn_here
        expect(hosting_square).to have_a_white_piece
      end
      
      it 'has a pawn on h2' do
        h2 = Coordinate.new(:h2)
        hosting_square = board.square_at(h2)
        
        expect(hosting_square).to be_pawn_here
        expect(hosting_square).to have_a_white_piece
      end
      
      it 'has a rook on a1' do
        a1 = Coordinate.new(:a1)
        hosting_square = board.square_at(a1)
        
        expect(hosting_square).to be_rook_here
        expect(hosting_square).to have_a_white_piece
      end
      
      it 'has a rook on h1' do
        h1 = Coordinate.new(:h1)
        hosting_square = board.square_at(h1)
        
        expect(hosting_square).to be_rook_here
        expect(hosting_square).to have_a_white_piece
      end
      
      it 'has a knight on b1' do
        b1 = Coordinate.new(:b1)
        hosting_square = board.square_at(b1)
        
        expect(hosting_square).to be_knight_here
        expect(hosting_square).to have_a_white_piece
      end
      
      it 'has a knight on g1' do
        g1 = Coordinate.new(:g1)
        hosting_square = board.square_at(g1)
        
        expect(hosting_square).to be_knight_here
        expect(hosting_square).to have_a_white_piece
      end
      
      it 'has a bishop on c1' do
        c1 = Coordinate.new(:c1)
        hosting_square = board.square_at(c1)
        
        expect(hosting_square).to be_bishop_here
        expect(hosting_square).to have_a_white_piece
      end
      
      it 'has a bishop on f1' do
        f1 = Coordinate.new(:f1)
        hosting_square = board.square_at(f1)
        
        expect(hosting_square).to be_bishop_here
        expect(hosting_square).to have_a_white_piece
      end
      
      it 'has a queen on d1' do
        d1 = Coordinate.new(:d1)
        hosting_square = board.square_at(d1)
        
        expect(hosting_square).to be_queen_here
        expect(hosting_square).to have_a_white_piece
      end
      
      it 'has a king on e1' do
        e1 = Coordinate.new(:e1)
        hosting_square = board.square_at(e1)
        
        expect(hosting_square).to be_king_here
        expect(hosting_square).to have_a_white_piece
      end
    end
    
    context 'on side of the player with the black pieces' do
      include CustomMatchers
      
      it 'has a pawn on a7' do
        a7 = Coordinate.new(:a7)
        hosting_square = board.square_at(a7)
        
        expect(hosting_square).to be_pawn_here
        expect(hosting_square).to have_a_black_piece
      end
      
      it 'has a pawn on b7' do
        b7 = Coordinate.new(:b7)
        hosting_square = board.square_at(b7)
        
        expect(hosting_square).to be_pawn_here
        expect(hosting_square).to have_a_black_piece
      end
      
      it 'has a pawn on g7' do
        g7 = Coordinate.new(:g7)
        hosting_square = board.square_at(g7)
        
        expect(hosting_square).to be_pawn_here
        expect(hosting_square).to have_a_black_piece
      end

      it 'has a rook on a8' do
        a8 = Coordinate.new(:a8)
        hosting_square = board.square_at(a8)

        expect(hosting_square).to be_rook_here
        expect(hosting_square).to have_a_black_piece
      end
  
      it 'has a rook on h8' do
        h8 = Coordinate.new(:h8)
        hosting_square = board.square_at(h8)

        expect(hosting_square).to be_rook_here
        expect(hosting_square).to have_a_black_piece
      end
  
      it 'has a knight on b8' do
        b8 = Coordinate.new(:b8)
        hosting_square = board.square_at(b8)

        expect(hosting_square).to be_knight_here
        expect(hosting_square).to have_a_black_piece
      end
  
      it 'has a knight on g8' do
        g8 = Coordinate.new(:g8)
        hosting_square = board.square_at(g8)

        expect(hosting_square).to be_knight_here
        expect(hosting_square).to have_a_black_piece
      end
  
      it 'has a bishop on c8' do
        c8 = Coordinate.new(:c8)
        hosting_square = board.square_at(c8)

        expect(hosting_square).to be_bishop_here
        expect(hosting_square).to have_a_black_piece
      end
      
      it 'has a bishop on f8' do
        f8 = Coordinate.new(:f8)
        hosting_square = board.square_at(f8)

        expect(hosting_square).to be_bishop_here
        expect(hosting_square).to have_a_black_piece
      end
  
      it 'has a queen on d8' do
        d8 = Coordinate.new(:d8)
        hosting_square = board.square_at(d8)

        expect(hosting_square).to be_queen_here
        expect(hosting_square).to have_a_black_piece
      end
  
      it 'has a king on e8' do
        e8 = Coordinate.new(:e8)
        hosting_square = board.square_at(e8)

        expect(hosting_square).to be_king_here
        expect(hosting_square).to have_a_black_piece
      end
    end
  end
end
