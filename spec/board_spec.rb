require_relative 'custom_matchers'
require_relative '../lib/board'
require_relative '../lib/board_maker'
require_relative '../lib/piece_arranger'
require_relative '../lib/rook'
require_relative '../lib/knight'


describe Board do
  include CustomMatchers

  subject(:board) { Board.new(board_maker, piece_arranger) }

  let(:board_maker)    { BoardMaker.new }
  let(:piece_arranger) { PieceArranger.new }
  
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
        
        expect(board).to have_a_pawn_on a2
        expect(board).to have_a_white_piece_on a2
      end
      
      it 'has a pawn on b2' do
        b2 = Coordinate.new(:b2)
        
        expect(board).to have_a_pawn_on b2
        expect(board).to have_a_white_piece_on b2
      end
      
      it 'has a pawn on h2' do
        h2 = Coordinate.new(:h2)
        
        expect(board).to have_a_pawn_on h2
        expect(board).to have_a_white_piece_on h2
      end
      
      it 'has a rook on a1' do
        a1 = Coordinate.new(:a1)
        
        expect(board).to have_a_rook_on a1
        expect(board).to have_a_white_piece_on a1
      end
      
      it 'has a rook on h1' do
        h1 = Coordinate.new(:h1)
        
        expect(board).to have_a_rook_on h1
        expect(board).to have_a_white_piece_on h1
      end
      
      it 'has a knight on b1' do
        b1 = Coordinate.new(:b1)
        
        expect(board).to have_a_knight_on b1
        expect(board).to have_a_white_piece_on b1
      end
      
      it 'has a knight on g1' do
        g1 = Coordinate.new(:g1)
        
        expect(board).to have_a_knight_on g1
        expect(board).to have_a_white_piece_on g1
      end
      
      it 'has a bishop on c1' do
        c1 = Coordinate.new(:c1)
        
        expect(board).to have_a_bishop_on c1
        expect(board).to have_a_white_piece_on c1
      end
      
      it 'has a bishop on f1' do
        f1 = Coordinate.new(:f1)
        
        expect(board).to have_a_bishop_on f1
        expect(board).to have_a_white_piece_on f1
      end
      
      it 'has a queen on d1' do
        d1 = Coordinate.new(:d1)
        
        expect(board).to have_a_queen_on d1
        expect(board).to have_a_white_piece_on d1
      end
      
      it 'has a king on e1' do
        e1 = Coordinate.new(:e1)
        
        expect(board).to have_a_king_on e1
        expect(board).to have_a_white_piece_on e1
      end
    end
    
    context 'on side of the player with the black pieces' do
      it 'has a pawn on a7' do
        a7 = Coordinate.new(:a7)
        
        expect(board).to have_a_pawn_on a7
        expect(board).to have_a_black_piece_on a7
      end
      
      it 'has a pawn on b7' do
        b7 = Coordinate.new(:b7)
        
        expect(board).to have_a_pawn_on b7
        expect(board).to have_a_black_piece_on b7
      end
      
      it 'has a pawn on g7' do
        g7 = Coordinate.new(:g7)
        
        expect(board).to have_a_pawn_on g7
        expect(board).to have_a_black_piece_on g7
      end

      it 'has a rook on a8' do
        a8 = Coordinate.new(:a8)

        expect(board).to have_a_rook_on a8
        expect(board).to have_a_black_piece_on a8
      end
  
      it 'has a rook on h8' do
        h8 = Coordinate.new(:h8)

        expect(board).to have_a_rook_on h8
        expect(board).to have_a_black_piece_on h8
      end
  
      it 'has a knight on b8' do
        b8 = Coordinate.new(:b8)

        expect(board).to have_a_knight_on b8
        expect(board).to have_a_black_piece_on b8
      end
  
      it 'has a knight on g8' do
        g8 = Coordinate.new(:g8)

        expect(board).to have_a_knight_on g8
        expect(board).to have_a_black_piece_on g8
      end
  
      it 'has a bishop on c8' do
        c8 = Coordinate.new(:c8)

        expect(board).to have_a_bishop_on c8
        expect(board).to have_a_black_piece_on c8
      end
      
      it 'has a bishop on f8' do
        f8 = Coordinate.new(:f8)

        expect(board).to have_a_bishop_on f8
        expect(board).to have_a_black_piece_on f8
      end
  
      it 'has a queen on d8' do
        d8 = Coordinate.new(:d8)

        expect(board).to have_a_queen_on d8
        expect(board).to have_a_black_piece_on d8
      end
  
      it 'has a king on e8' do
        e8 = Coordinate.new(:e8)

        expect(board).to have_a_king_on e8
        expect(board).to have_a_black_piece_on e8
      end
    end
  end

  context 'checking for presence of pieces on board' do
    describe '#rook_on?' do
      it 'can know if there is a rook on d5' do
        d5 = Coordinate.new(:d5)
    
        board.place(Rook.new(:black), d5)
    
        expect(board).to have_a_rook_on(d5)
      end
    end

    describe '#knight_on?' do
      it 'can know if there is a rook on b4' do
        b4 = Coordinate.new(:b4)

        board.place(Knight.new(:white), b4)

        expect(board).to have_a_knight_on b4
      end
    end

    describe '#bishop_on?' do
      it 'can know if there is a bishop on d8' do
        d8 = Coordinate.new(:d8)

        board.place(Bishop.new(:white), d8)

        expect(board).to have_a_bishop_on d8
      end
    end
    
    describe '#queen_on?' do
      it 'can know if there is a queen on f6' do
        f6 = Coordinate.new(:f6)

        board.place(Queen.new(:white), f6)

        expect(board).to have_a_queen_on f6
      end
    end
    
    describe '#king_on?' do
      it 'can know if there is a king on f2' do
        f2 = Coordinate.new(:f2)

        board.place(King.new(:black), f2)

        expect(board).to have_a_king_on f2
      end
    end

    describe '#pawn_on?' do
      it 'can know if there is a pawn on c7' do
        c7 = Coordinate.new(:c7)

        board.place(Pawn.new(:black), c7)

        expect(board).to have_a_pawn_on c7
      end
    end
  end

  context 'placing pieces' do
    describe '#place' do
      it 'can place a rook on c4' do
        c4 = Coordinate.new(:c4)
        
        board.place(Rook.new(:black), c4)
        
        expect(board).to have_a_rook_on(c4)
      end

      it 'can place a knight on a3' do
        a3 = Coordinate.new(:a3)
        
        board.place(Knight.new(:black), a3)
        
        expect(board).to have_a_knight_on(a3)
      end

      it 'can place a bishop on c4' do
        c4 = Coordinate.new(:c4)
        
        board.place(Bishop.new(:white), c4)
        
        expect(board).to have_a_bishop_on(c4)
      end

      it 'can place a queen on b3' do
        b3 = Coordinate.new(:b3)
        
        board.place(Queen.new(:black), b3)
        
        expect(board).to have_a_queen_on(b3)
      end

      it 'can place a king on f5' do
        f5 = Coordinate.new(:f5)
        
        board.place(King.new(:black), f5)
        
        expect(board).to have_a_king_on(f5)
      end

      it 'can place a pawn on b7' do
        b7 = Coordinate.new(:b7)
        
        board.place(Pawn.new(:white), b7)
        
        expect(board).to have_a_pawn_on(b7)
      end
    end
  end

  context 'checking for presence of pieces on board based on their color' do
    describe '#white_piece_on?' do
      it 'can know if there is a white piece on f6' do
        f6 = Coordinate.new(:f6)
        
        board.place(King.new(:white), f6)
        
        expect(board).to have_a_white_piece_on f6
      end
    end
    
    describe '#black_piece_on?' do
      it 'can know if there is a black piece on b3' do
        b3 = Coordinate.new(:b3)
        
        board.place(Knight.new(:black), b3)
        
        expect(board).to have_a_black_piece_on(b3)
      end
    end
  end
  
  context 'moving rooks' do
    it 'moves rook from f5 to f6 -- upwards on the same file' do
      current_coordinate     = Coordinate.new(:f5)
      destination_coordinate = Coordinate.new(:f6)
      rook = Rook.new(:white)
      board.place(rook, current_coordinate)
      
      board.move_piece(current_coordinate, destination_coordinate)
      
      expect(board).to_not have_a_rook_on current_coordinate
      expect(board).to have_a_rook_on destination_coordinate
    end

    it 'moves rook from d4 to d2 -- downwards on the same file' do
      current_coordinate     = Coordinate.new(:f5)
      destination_coordinate = Coordinate.new(:f6)
      rook = Rook.new(:white)
      board.place(rook, current_coordinate)
      
      board.move_piece(current_coordinate, destination_coordinate)
      
      expect(board).to_not have_a_rook_on current_coordinate
      expect(board).to have_a_rook_on destination_coordinate
    end

    it 'moves rook from d3 to b3 -- leftwards on the same rank' do
      current_coordinate     = Coordinate.new(:d3)
      destination_coordinate = Coordinate.new(:b3)
      rook = Rook.new(:black)
      board.place(rook, current_coordinate)
      
      board.move_piece(current_coordinate, destination_coordinate)
      
      expect(board).to_not have_a_rook_on current_coordinate
      expect(board).to have_a_rook_on destination_coordinate
    end

    it 'moves rook from c5 to g5 -- rightwards on the same rank' do
      current_coordinate     = Coordinate.new(:d3)
      destination_coordinate = Coordinate.new(:b3)
      rook = Rook.new(:black)
      board.place(rook, current_coordinate)
      
      board.move_piece(current_coordinate, destination_coordinate)
      
      expect(board).to_not have_a_rook_on current_coordinate
      expect(board).to have_a_rook_on destination_coordinate
    end

    
    it "doesn't move rook from g6 to h7" do
      current_coordinate     = Coordinate.new(:g6)
      destination_coordinate = Coordinate.new(:h7)
      rook = Rook.new(:white)
      board.place(rook, current_coordinate)
      
      expect { board.move_piece(current_coordinate, destination_coordinate) }.to raise_error("That piece can't move to #{destination_coordinate.symbol}")
    end
    
    it "doesn't move rook from a4 to e1" do
      current_coordinate     = Coordinate.new(:a4)
      destination_coordinate = Coordinate.new(:e1)
      rook = Rook.new(:white)
      board.place(rook, current_coordinate)
      
      expect { board.move_piece(current_coordinate, destination_coordinate) }.to raise_error("That piece can't move to #{destination_coordinate.symbol}")
    end
  end

  context 'moving knights' do
    it 'moves a knight from b6 to c8 -- making an upper-right narrow L' do
      current_coordinate     = Coordinate.new(:b6)
      destination_coordinate = Coordinate.new(:c8)
      knight = Knight.new(:black)
      board.place(knight, current_coordinate)

      board.move_piece(current_coordinate, destination_coordinate)

      expect(board).to_not have_a_knight_on current_coordinate
      expect(board).to have_a_knight_on destination_coordinate
    end

    it 'moves a knight from d4 to f5 -- making an upper-right wide L' do
      current_coordinate     = Coordinate.new(:d4)
      destination_coordinate = Coordinate.new(:f5)
      knight = Knight.new(:white)
      board.place(knight, current_coordinate)

      board.move_piece(current_coordinate, destination_coordinate)

      expect(board).to_not have_a_knight_on current_coordinate
      expect(board).to have_a_knight_on destination_coordinate
    end

    it 'moves a knight from c5 to b7 -- making an upper-left narrow L' do
      current_coordinate     = Coordinate.new(:c5)
      destination_coordinate = Coordinate.new(:b7)
      knight = Knight.new(:black)
      board.place(knight, current_coordinate)

      board.move_piece(current_coordinate, destination_coordinate)

      expect(board).to_not have_a_knight_on current_coordinate
      expect(board).to have_a_knight_on destination_coordinate
    end

    it 'moves a knight from d1 to b2 -- making an upper-left wide L' do
      current_coordinate     = Coordinate.new(:d1)
      destination_coordinate = Coordinate.new(:b2)
      knight = Knight.new(:white)
      board.place(knight, current_coordinate)

      board.move_piece(current_coordinate, destination_coordinate)

      expect(board).to_not have_a_knight_on current_coordinate
      expect(board).to have_a_knight_on destination_coordinate
    end

    it 'moves a knight from d6 to e4 -- making a lower-right narrow L' do
      current_coordinate     = Coordinate.new(:d6)
      destination_coordinate = Coordinate.new(:e4)
      knight = Knight.new(:black)
      board.place(knight, current_coordinate)

      board.move_piece(current_coordinate, destination_coordinate)

      expect(board).to_not have_a_knight_on current_coordinate
      expect(board).to have_a_knight_on destination_coordinate
    end

    it 'moves a knight from f3 to h2 -- making a lower-right wide L' do
      current_coordinate     = Coordinate.new(:f3)
      destination_coordinate = Coordinate.new(:h2)
      knight = Knight.new(:white)
      board.place(knight, current_coordinate)

      board.move_piece(current_coordinate, destination_coordinate)

      expect(board).to_not have_a_knight_on current_coordinate
      expect(board).to have_a_knight_on destination_coordinate
    end

    it 'moves a knight from g6 to f4 -- making a lower-left narrow L' do
      current_coordinate     = Coordinate.new(:g6)
      destination_coordinate = Coordinate.new(:f4)
      knight = Knight.new(:black)
      board.place(knight, current_coordinate)

      board.move_piece(current_coordinate, destination_coordinate)

      expect(board).to_not have_a_knight_on current_coordinate
      expect(board).to have_a_knight_on destination_coordinate
    end

    it 'moves a knight from c5 to a4 -- making a lower-left wide L' do 
      current_coordinate     = Coordinate.new(:c5)
      destination_coordinate = Coordinate.new(:a4)
      knight = Knight.new(:white)
      board.place(knight, current_coordinate)

      board.move_piece(current_coordinate, destination_coordinate)

      expect(board).to_not have_a_knight_on current_coordinate
      expect(board).to have_a_knight_on destination_coordinate
    end

    it "doesn't move a knight from d5 to a2" do
      current_coordinate     = Coordinate.new(:d5)
      destination_coordinate = Coordinate.new(:a2)
      knight = Knight.new(:white)
      board.place(knight, current_coordinate)

      expect { board.move_piece(current_coordinate, destination_coordinate) }.to raise_error("That piece can't move to #{destination_coordinate.symbol}")
    end
  end

  context 'moving bishops' do
    it 'moves a bishop from f1 to h3 -- moving along a top-right diagonal' do
      current_coordinate     = Coordinate.new(:f1)
      destination_coordinate = Coordinate.new(:h3)
      bishop = Bishop.new(:white)
      board.place(bishop, current_coordinate)

      board.move_piece(current_coordinate, destination_coordinate)

      expect(board).to_not have_a_bishop_on current_coordinate
      expect(board).to have_a_bishop_on destination_coordinate
    end

    it "doesn't move a bishop from f1 to a5" do
      current_coordinate     = Coordinate.new(:f1)
      destination_coordinate = Coordinate.new(:a5)
      bishop = Bishop.new(:white)
      board.place(bishop, current_coordinate)
      
      expect { board.move_piece(current_coordinate, destination_coordinate) }.to raise_error("That piece can't move to #{destination_coordinate.symbol}")
    end
  end
end
