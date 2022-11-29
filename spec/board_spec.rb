require_relative 'custom_matchers'
require_relative '../lib/board'
require_relative '../lib/board_maker'

describe Board do
  include CustomMatchers

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

  context 'after setting up pieces on board' do
    before { board.setup_pieces }
    
    it 'is not empty' do
      expect(board).to_not be_empty
    end

    context 'on side of the player with the white pieces' do
    
      it 'has a pawn on a2' do
        a2 = Coordinate.new(:a2)
        
        expect(board).to have_a_pawn_at a2
        expect(board).to have_a_white_piece_at a2
      end
      
      it 'has a pawn on b2' do
        b2 = Coordinate.new(:b2)
        
        expect(board).to have_a_pawn_at b2
        expect(board).to have_a_white_piece_at b2
      end
      
      it 'has a pawn on h2' do
        h2 = Coordinate.new(:h2)
        
        expect(board).to have_a_pawn_at h2
        expect(board).to have_a_white_piece_at h2
      end
      
      it 'has a rook on a1' do
        a1 = Coordinate.new(:a1)
        
        expect(board).to have_a_rook_at a1
        expect(board).to have_a_white_piece_at a1
      end
      
      it 'has a rook on h1' do
        h1 = Coordinate.new(:h1)
        
        expect(board).to have_a_rook_at h1
        expect(board).to have_a_white_piece_at h1
      end
      
      it 'has a knight on b1' do
        b1 = Coordinate.new(:b1)
        
        expect(board).to have_a_knight_at b1
        expect(board).to have_a_white_piece_at b1
      end
      
      it 'has a knight on g1' do
        g1 = Coordinate.new(:g1)
        
        expect(board).to have_a_knight_at g1
        expect(board).to have_a_white_piece_at g1
      end
      
      it 'has a bishop on c1' do
        c1 = Coordinate.new(:c1)
        
        expect(board).to have_a_bishop_at c1
        expect(board).to have_a_white_piece_at c1
      end
      
      it 'has a bishop on f1' do
        f1 = Coordinate.new(:f1)
        
        expect(board).to have_a_bishop_at f1
        expect(board).to have_a_white_piece_at f1
      end
      
      it 'has a queen on d1' do
        d1 = Coordinate.new(:d1)
        
        expect(board).to have_a_queen_at d1
        expect(board).to have_a_white_piece_at d1
      end
      
      it 'has a king on e1' do
        e1 = Coordinate.new(:e1)
        
        expect(board).to have_a_king_at e1
        expect(board).to have_a_white_piece_at e1
      end
    end
    
    context 'on side of the player with the black pieces' do
      it 'has a pawn on a7' do
        a7 = Coordinate.new(:a7)
        
        expect(board).to have_a_pawn_at a7
        expect(board).to have_a_black_piece_at a7
      end
      
      it 'has a pawn on b7' do
        b7 = Coordinate.new(:b7)
        
        expect(board).to have_a_pawn_at b7
        expect(board).to have_a_black_piece_at b7
      end
      
      it 'has a pawn on g7' do
        g7 = Coordinate.new(:g7)
        
        expect(board).to have_a_pawn_at g7
        expect(board).to have_a_black_piece_at g7
      end

      it 'has a rook on a8' do
        a8 = Coordinate.new(:a8)

        expect(board).to have_a_rook_at a8
        expect(board).to have_a_black_piece_at a8
      end
  
      it 'has a rook on h8' do
        h8 = Coordinate.new(:h8)

        expect(board).to have_a_rook_at h8
        expect(board).to have_a_black_piece_at h8
      end
  
      it 'has a knight on b8' do
        b8 = Coordinate.new(:b8)

        expect(board).to have_a_knight_at b8
        expect(board).to have_a_black_piece_at b8
      end
  
      it 'has a knight on g8' do
        g8 = Coordinate.new(:g8)

        expect(board).to have_a_knight_at g8
        expect(board).to have_a_black_piece_at g8
      end
  
      it 'has a bishop on c8' do
        c8 = Coordinate.new(:c8)

        expect(board).to have_a_bishop_at c8
        expect(board).to have_a_black_piece_at c8
      end
      
      it 'has a bishop on f8' do
        f8 = Coordinate.new(:f8)

        expect(board).to have_a_bishop_at f8
        expect(board).to have_a_black_piece_at f8
      end
  
      it 'has a queen on d8' do
        d8 = Coordinate.new(:d8)

        expect(board).to have_a_queen_at d8
        expect(board).to have_a_black_piece_at d8
      end
  
      it 'has a king on e8' do
        e8 = Coordinate.new(:e8)

        expect(board).to have_a_king_at e8
        expect(board).to have_a_black_piece_at e8
      end
    end
  end

  it 'can know if there is a rook on d5' do
    d5 = Coordinate.new(:d5)

    board.place(Rook.new(:black), d5)

    expect(board).to have_a_rook_at(d5)
  end

  it 'can place a rook on c4' do
    c4 = Coordinate.new(:c4)

    board.place(Rook.new(:black), c4)
    
    expect(board).to have_a_rook_at(c4)
  end

  it 'can know if there is a white piece on f6' do
    f6 = Coordinate.new(:f6)

    board.place(King.new(:white), f6)

    expect(board).to have_a_white_piece_at f6
  end

  it 'can know if there is a black piece on b3' do
    b3 = Coordinate.new(:b3)

    board.place(Knight.new(:black), b3)

    expect(board).to be_black_piece_at(b3)
  end

  context 'moving pieces' do
    it 'freemoves rook from a1 to a2 on the board' do
      board_maker = BoardMaker.new
      board = Board.new(board_maker)
      rook = Rook.new(:white)
      current_coordinate     = Coordinate.new(:a1)
      destination_coordinate = Coordinate.new(:a2)
      
      board.move(rook, current_coordinate, destination_coordinate)
  
      expect(board).to_not have_a_rook_at current_coordinate
      expect(board).to have_a_rook_at destination_coordinate
    end

    it 'freemoves rook from b5 to h8 on the board' do
      board_maker = BoardMaker.new
      board = Board.new(board_maker)
      rook = Rook.new(:white)
      current_coordinate     = Coordinate.new(:b5)
      destination_coordinate = Coordinate.new(:h8)
      
      board.move(rook, current_coordinate, destination_coordinate)
  
      expect(board).to_not have_a_rook_at current_coordinate
      expect(board).to have_a_rook_at destination_coordinate
    end

    it 'freemoves knight from g8 to b2 on the board' do
      board_maker = BoardMaker.new
      board = Board.new(board_maker)
      knight = Knight.new(:white)
      current_coordinate     = Coordinate.new(:g8)
      destination_coordinate = Coordinate.new(:b2)
      
      board.move(knight, current_coordinate, destination_coordinate)
  
      expect(board).to_not have_a_knight_at current_coordinate
      expect(board).to have_a_knight_at destination_coordinate
    end
  end
end
