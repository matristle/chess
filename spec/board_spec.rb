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
    context 'without any other piece on the board' do
      it 'moves rook from f5 to f6 -- upwards on the same file' do
        initial_coordinate     = Coordinate.new(:f5)
        destination_coordinate = Coordinate.new(:f6)
        rook = Rook.new(:white)
        board.place(rook, initial_coordinate)
        
        board.move_piece(initial_coordinate, destination_coordinate)
        
        expect(board).to_not have_a_rook_on initial_coordinate
        expect(board).to have_a_rook_on destination_coordinate
      end
  
      it 'moves rook from d4 to d2 -- downwards on the same file' do
        initial_coordinate     = Coordinate.new(:f5)
        destination_coordinate = Coordinate.new(:f6)
        rook = Rook.new(:white)
        board.place(rook, initial_coordinate)
        
        board.move_piece(initial_coordinate, destination_coordinate)
        
        expect(board).to_not have_a_rook_on initial_coordinate
        expect(board).to have_a_rook_on destination_coordinate
      end
  
      it 'moves rook from d3 to b3 -- leftwards on the same rank' do
        initial_coordinate     = Coordinate.new(:d3)
        destination_coordinate = Coordinate.new(:b3)
        rook = Rook.new(:black)
        board.place(rook, initial_coordinate)
        
        board.move_piece(initial_coordinate, destination_coordinate)
        
        expect(board).to_not have_a_rook_on initial_coordinate
        expect(board).to have_a_rook_on destination_coordinate
      end
  
      it 'moves rook from c5 to g5 -- rightwards on the same rank' do
        initial_coordinate     = Coordinate.new(:d3)
        destination_coordinate = Coordinate.new(:b3)
        rook = Rook.new(:black)
        board.place(rook, initial_coordinate)
        
        board.move_piece(initial_coordinate, destination_coordinate)
        
        expect(board).to_not have_a_rook_on initial_coordinate
        expect(board).to have_a_rook_on destination_coordinate
      end
    end
    
    context 'when capturing another piece' do
      it 'captures an enemy piece -- upwards on the same file' do
        initial_coordinate     = Coordinate.new(:e5)
        destination_coordinate = Coordinate.new(:e7)
        capturing_rook = Rook.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_rook, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_rook_on destination_coordinate
      end

      it 'captures an enemy piece -- downwards on the same file' do
        initial_coordinate     = Coordinate.new(:g3)
        destination_coordinate = Coordinate.new(:g1)
        capturing_rook = Rook.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_rook, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_rook_on destination_coordinate
      end

      it 'captures an enemy piece -- leftwards on the same rank' do
        initial_coordinate     = Coordinate.new(:c6)
        destination_coordinate = Coordinate.new(:a6)
        capturing_rook = Rook.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_rook, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_rook_on destination_coordinate
      end

      it 'captures an enemy piece -- rightwards on the same rank' do
        initial_coordinate     = Coordinate.new(:f1)
        destination_coordinate = Coordinate.new(:h1)
        capturing_rook = Rook.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_rook, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_rook_on destination_coordinate
      end

      it "doesn't capture an ally piece" do
        initial_coordinate     = Coordinate.new(:e5)
        destination_coordinate = Coordinate.new(:e7)
        capturing_rook = Rook.new(:black)
        ally_knight = Knight.new(:black)
        board.place(capturing_rook, initial_coordinate)
        board.place(ally_knight, destination_coordinate)

        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it")
      end
      
      it "doesn't capture a king" do
        initial_coordinate     = Coordinate.new(:a3)
        destination_coordinate = Coordinate.new(:a7)
        capturing_rook = Rook.new(:white)
        uncaptureable_enemy_king = King.new(:black)
        board.place(capturing_rook, initial_coordinate)
        board.place(uncaptureable_enemy_king, destination_coordinate)
        
        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it")
      end

      it "doesn't capture when there's an intervening piece between the move" do
        initial_coordinate     = Coordinate.new(:e5)
        destination_coordinate = Coordinate.new(:e8)
        intervening_bishop_coordinate = Coordinate.new(:e7)
        capturing_rook = Rook.new(:black)
        target_enemy_knight = Knight.new(:white)
        intervening_bishop = Bishop.new(:white)
        board.place(capturing_rook, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)
        board.place(intervening_bishop, intervening_bishop_coordinate)

        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("The move is invalid since there's an intervening piece on #{intervening_bishop_coordinate.symbol} between #{initial_coordinate.symbol} and #{destination_coordinate.symbol}")
      end
    end

    it "doesn't move rook from g6 to h7" do
      initial_coordinate     = Coordinate.new(:g6)
      destination_coordinate = Coordinate.new(:h7)
      rook = Rook.new(:white)
      board.place(rook, initial_coordinate)
      
      expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("That piece can't move to #{destination_coordinate.symbol}")
    end
    
    it "doesn't move rook from a4 to e1" do
      initial_coordinate     = Coordinate.new(:a4)
      destination_coordinate = Coordinate.new(:e1)
      rook = Rook.new(:white)
      board.place(rook, initial_coordinate)
      
      expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("That piece can't move to #{destination_coordinate.symbol}")
    end
  end

  context 'moving knights' do
    context 'without any other piece on the board' do
      it 'moves a knight from b6 to c8 -- making an upper-right narrow L' do
        initial_coordinate     = Coordinate.new(:b6)
        destination_coordinate = Coordinate.new(:c8)
        knight = Knight.new(:black)
        board.place(knight, initial_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to_not have_a_knight_on initial_coordinate
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'moves a knight from d4 to f5 -- making an upper-right wide L' do
        initial_coordinate     = Coordinate.new(:d4)
        destination_coordinate = Coordinate.new(:f5)
        knight = Knight.new(:white)
        board.place(knight, initial_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to_not have_a_knight_on initial_coordinate
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'moves a knight from c5 to b7 -- making an upper-left narrow L' do
        initial_coordinate     = Coordinate.new(:c5)
        destination_coordinate = Coordinate.new(:b7)
        knight = Knight.new(:black)
        board.place(knight, initial_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to_not have_a_knight_on initial_coordinate
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'moves a knight from d1 to b2 -- making an upper-left wide L' do
        initial_coordinate     = Coordinate.new(:d1)
        destination_coordinate = Coordinate.new(:b2)
        knight = Knight.new(:white)
        board.place(knight, initial_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to_not have_a_knight_on initial_coordinate
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'moves a knight from d6 to e4 -- making a lower-right narrow L' do
        initial_coordinate     = Coordinate.new(:d6)
        destination_coordinate = Coordinate.new(:e4)
        knight = Knight.new(:black)
        board.place(knight, initial_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to_not have_a_knight_on initial_coordinate
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'moves a knight from f3 to h2 -- making a lower-right wide L' do
        initial_coordinate     = Coordinate.new(:f3)
        destination_coordinate = Coordinate.new(:h2)
        knight = Knight.new(:white)
        board.place(knight, initial_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to_not have_a_knight_on initial_coordinate
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'moves a knight from g6 to f4 -- making a lower-left narrow L' do
        initial_coordinate     = Coordinate.new(:g6)
        destination_coordinate = Coordinate.new(:f4)
        knight = Knight.new(:black)
        board.place(knight, initial_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to_not have_a_knight_on initial_coordinate
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'moves a knight from c5 to a4 -- making a lower-left wide L' do 
        initial_coordinate     = Coordinate.new(:c5)
        destination_coordinate = Coordinate.new(:a4)
        knight = Knight.new(:white)
        board.place(knight, initial_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to_not have_a_knight_on initial_coordinate
        expect(board).to have_a_knight_on destination_coordinate
      end
    end

    context 'when capturing another piece' do
      it 'captures an enemy piece -- making an upper-right narrow L' do
        initial_coordinate     = Coordinate.new(:c2)
        destination_coordinate = Coordinate.new(:d4)
        capturing_knight = Knight.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_knight_on destination_coordinate
      end

      it 'captures an enemy piece -- making an upper-right wide L' do
        initial_coordinate     = Coordinate.new(:e4)
        destination_coordinate = Coordinate.new(:g5)
        capturing_knight = Knight.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'captures an enemy piece -- making an upper-left narrow L' do
        initial_coordinate     = Coordinate.new(:b2)
        destination_coordinate = Coordinate.new(:a4)
        capturing_knight = Knight.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'captures an enemy piece -- making an upper-left wide L' do
        initial_coordinate     = Coordinate.new(:d5)
        destination_coordinate = Coordinate.new(:b6)
        capturing_knight = Knight.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'captures an enemy piece -- making a lower-right narrow L' do
        initial_coordinate     = Coordinate.new(:c3)
        destination_coordinate = Coordinate.new(:d1)
        capturing_knight = Knight.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'captures an enemy piece -- making a lower-right wide L' do
        initial_coordinate     = Coordinate.new(:e4)
        destination_coordinate = Coordinate.new(:g3)
        capturing_knight = Knight.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'captures an enemy piece -- making a lower-left narrow L' do
        initial_coordinate     = Coordinate.new(:c6)
        destination_coordinate = Coordinate.new(:b4)
        capturing_knight = Knight.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'captures an enemy piece -- making a lower-left wide L' do
        initial_coordinate     = Coordinate.new(:d8)
        destination_coordinate = Coordinate.new(:b7)
        capturing_knight = Knight.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to have_a_knight_on destination_coordinate
      end

      it "doesn't capture an ally piece" do
        initial_coordinate     = Coordinate.new(:e5)
        destination_coordinate = Coordinate.new(:e7)
        capturing_knight = Knight.new(:black)
        ally_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(ally_knight, destination_coordinate)

        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it")
      end

      it "doesn't capture a king" do
        initial_coordinate     = Coordinate.new(:a3)
        destination_coordinate = Coordinate.new(:a7)
        capturing_knight = Knight.new(:white)
        uncaptureable_enemy_king = King.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(uncaptureable_enemy_king, destination_coordinate)
        
        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it")
      end
    end
    
    it "doesn't move a knight from d5 to a2" do
      initial_coordinate     = Coordinate.new(:d5)
      destination_coordinate = Coordinate.new(:a2)
      knight = Knight.new(:white)
      board.place(knight, initial_coordinate)

      expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("That piece can't move to #{destination_coordinate.symbol}")
    end
  end

  context 'moving bishops' do
    context 'without any other piece on the board' do
      it 'moves a bishop from f1 to h3 -- moving along a top-right diagonal' do
        initial_coordinate     = Coordinate.new(:f1)
        destination_coordinate = Coordinate.new(:h3)
        bishop = Bishop.new(:white)
        board.place(bishop, initial_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to_not have_a_bishop_on initial_coordinate
        expect(board).to have_a_bishop_on destination_coordinate
      end
  
      it 'moves a bishop from f5 to c8 -- moving along a top-left diagonal' do
        initial_coordinate     = Coordinate.new(:f5)
        destination_coordinate = Coordinate.new(:c8)
        bishop = Bishop.new(:black)
        board.place(bishop, initial_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to_not have_a_bishop_on initial_coordinate
        expect(board).to have_a_bishop_on destination_coordinate
      end
  
      it 'moves a bishop from e6 to g4 -- moving along a bottom-right diagonal' do
        initial_coordinate     = Coordinate.new(:e6)
        destination_coordinate = Coordinate.new(:g4)
        bishop = Bishop.new(:white)
        board.place(bishop, initial_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to_not have_a_bishop_on initial_coordinate
        expect(board).to have_a_bishop_on destination_coordinate
      end
  
      it 'moves a bishop from c7 to a5 -- moving along a bottom-left diagonal' do
        initial_coordinate     = Coordinate.new(:c7)
        destination_coordinate = Coordinate.new(:a5)
        bishop = Bishop.new(:black)
        board.place(bishop, initial_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to_not have_a_bishop_on initial_coordinate
        expect(board).to have_a_bishop_on destination_coordinate
      end
    end

    context 'when capturing another piece' do
      it 'captures an enemy piece -- moving along a top-right diagonal' do
        initial_coordinate     = Coordinate.new(:e3)
        destination_coordinate = Coordinate.new(:g5)
        capturing_bishop = Bishop.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_bishop, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_bishop_on destination_coordinate
      end

      it 'captures an enemy piece -- moving along a top-left diagonal' do
        initial_coordinate     = Coordinate.new(:d2)
        destination_coordinate = Coordinate.new(:a5)
        capturing_bishop = Bishop.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_bishop, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_bishop_on destination_coordinate
      end

      it 'captures an enemy piece -- moving along a bottom-right diagonal' do
        initial_coordinate     = Coordinate.new(:c5)
        destination_coordinate = Coordinate.new(:f2)
        capturing_bishop = Bishop.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_bishop, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_bishop_on destination_coordinate
      end

      it 'captures an enemy piece -- moving along a bottom-left diagonal' do
        initial_coordinate     = Coordinate.new(:h6)
        destination_coordinate = Coordinate.new(:c1)
        capturing_bishop = Bishop.new(:white)
        target_enemy_knight = Knight.new(:black)
        board.place(capturing_bishop, initial_coordinate)
        board.place(target_enemy_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_bishop_on destination_coordinate
      end

      it "doesn't capture an ally piece" do
        initial_coordinate     = Coordinate.new(:e5)
        destination_coordinate = Coordinate.new(:e7)
        capturing_bishop = Bishop.new(:black)
        ally_knight = Knight.new(:black)
        board.place(capturing_bishop, initial_coordinate)
        board.place(ally_knight, destination_coordinate)

        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it")
      end

      it "doesn't capture a king" do
        initial_coordinate     = Coordinate.new(:a3)
        destination_coordinate = Coordinate.new(:a7)
        capturing_bishop = Bishop.new(:white)
        uncaptureable_enemy_king = King.new(:black)
        board.place(capturing_bishop, initial_coordinate)
        board.place(uncaptureable_enemy_king, destination_coordinate)
        
        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it")
      end
    end

    it "doesn't move a bishop from f1 to a5" do
      initial_coordinate     = Coordinate.new(:f1)
      destination_coordinate = Coordinate.new(:a5)
      bishop = Bishop.new(:white)
      board.place(bishop, initial_coordinate)
      
      expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("That piece can't move to #{destination_coordinate.symbol}")
    end
  end

  context 'moving queens' do
    context 'without any other piece on the board' do
      context 'rook-like behavior' do
        it 'moves queen from c3 to c7 -- upwards on the same file' do
          initial_coordinate     = Coordinate.new(:c3)
          destination_coordinate = Coordinate.new(:c7)
          queen = Queen.new(:black)
          board.place(queen, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_queen_on initial_coordinate
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'moves queen from b5 to b1 -- downwards on the same file' do
          initial_coordinate     = Coordinate.new(:b5)
          destination_coordinate = Coordinate.new(:b1)
          queen = Queen.new(:white)
          board.place(queen, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_queen_on initial_coordinate
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'moves queen from f6 to c6 -- leftwards on the same rank' do
          initial_coordinate     = Coordinate.new(:f6)
          destination_coordinate = Coordinate.new(:c6)
          queen = Queen.new(:white)
          board.place(queen, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_queen_on initial_coordinate
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'moves queen from e2 to g2 -- rightwards on the same rank' do
          initial_coordinate     = Coordinate.new(:e2)
          destination_coordinate = Coordinate.new(:g2)
          queen = Queen.new(:black)
          board.place(queen, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_queen_on initial_coordinate
          expect(board).to have_a_queen_on destination_coordinate
        end
      end
  
      context 'bishop-like behavior' do
        it 'moves queen from d6 to f8 -- moving along a top-right diagonal' do
          initial_coordinate     = Coordinate.new(:d6)
          destination_coordinate = Coordinate.new(:f8)
          queen = Queen.new(:white)
          board.place(queen, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_queen_on initial_coordinate
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'moves queen from e2 to c4 -- moving along a top-left diagonal' do
          initial_coordinate     = Coordinate.new(:e2)
          destination_coordinate = Coordinate.new(:c4)
          queen = Queen.new(:black)
          board.place(queen, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_queen_on initial_coordinate
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'moves queen from c6 to g2 -- moving along a bottom-right diagonal' do
          initial_coordinate     = Coordinate.new(:c6)
          destination_coordinate = Coordinate.new(:g2)
          queen = Queen.new(:white)
          board.place(queen, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_queen_on initial_coordinate
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'moves queen from g7 to a1 -- moving along a bottom-left diagonal' do
          initial_coordinate     = Coordinate.new(:g7)
          destination_coordinate = Coordinate.new(:a1)
          queen = Queen.new(:black)
          board.place(queen, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_queen_on initial_coordinate
          expect(board).to have_a_queen_on destination_coordinate
        end
      end
    end

    context 'when capturing another piece' do
      context 'rook-like behavior' do
        it 'captures an enemy piece -- upwards on the same file' do
          initial_coordinate     = Coordinate.new(:e5)
          destination_coordinate = Coordinate.new(:e7)
          capturing_queen = Queen.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'captures an enemy piece -- downwards on the same file' do
          initial_coordinate     = Coordinate.new(:g3)
          destination_coordinate = Coordinate.new(:g1)
          capturing_queen = Queen.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'captures an enemy piece -- leftwards on the same rank' do
          initial_coordinate     = Coordinate.new(:c6)
          destination_coordinate = Coordinate.new(:a6)
          capturing_queen = Queen.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'captures an enemy piece -- rightwards on the same rank' do
          initial_coordinate     = Coordinate.new(:f1)
          destination_coordinate = Coordinate.new(:h1)
          capturing_queen = Queen.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
      end

      context 'bishop-like behavior' do
        it 'captures an enemy piece -- moving along a top-right diagonal' do
          initial_coordinate     = Coordinate.new(:e3)
          destination_coordinate = Coordinate.new(:g5)
          capturing_queen = Queen.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'captures an enemy piece -- moving along a top-left diagonal' do
          initial_coordinate     = Coordinate.new(:d2)
          destination_coordinate = Coordinate.new(:a5)
          capturing_queen = Queen.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'captures an enemy piece -- moving along a bottom-right diagonal' do
          initial_coordinate     = Coordinate.new(:c5)
          destination_coordinate = Coordinate.new(:f2)
          capturing_queen = Queen.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'captures an enemy piece -- moving along a bottom-left diagonal' do
          initial_coordinate     = Coordinate.new(:h6)
          destination_coordinate = Coordinate.new(:c1)
          capturing_queen = Queen.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
      end

      it "doesn't capture an ally piece" do
        initial_coordinate     = Coordinate.new(:e5)
        destination_coordinate = Coordinate.new(:e7)
        capturing_queen = Queen.new(:black)
        ally_knight = Knight.new(:black)
        board.place(capturing_queen, initial_coordinate)
        board.place(ally_knight, destination_coordinate)

        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it")
      end

      it "doesn't capture a king" do
        initial_coordinate     = Coordinate.new(:a3)
        destination_coordinate = Coordinate.new(:a7)
        capturing_queen = Queen.new(:white)
        uncaptureable_enemy_king = King.new(:black)
        board.place(capturing_queen, initial_coordinate)
        board.place(uncaptureable_enemy_king, destination_coordinate)
        
        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it")
      end
    end

    it "doesn't move queen from d2 to g7" do
      initial_coordinate     = Coordinate.new(:d2)
      destination_coordinate = Coordinate.new(:g7)
      queen = Queen.new(:white)
      board.place(queen, initial_coordinate)

      expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("That piece can't move to #{destination_coordinate.symbol}")
    end
  end

  context 'moving kings' do
    context 'without any other piece on the board' do
      context 'rook-like behavior' do
        it 'moves king from a6 to a7 -- upwards on the same file' do
          initial_coordinate     = Coordinate.new(:a6)
          destination_coordinate = Coordinate.new(:a7)
          king = King.new(:white)
          board.place(king, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate
        end
  
        it 'moves king from c6 to c5 -- downwards on the same file' do
          initial_coordinate     = Coordinate.new(:c6)
          destination_coordinate = Coordinate.new(:c5)
          king = King.new(:black)
          board.place(king, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate
        end
  
        it 'moves king from e7 to d7 -- leftwards on the same rank' do
          initial_coordinate     = Coordinate.new(:e7)
          destination_coordinate = Coordinate.new(:d7)
          king = King.new(:white)
          board.place(king, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate
        end
  
        it 'moves king from c3 to d3 -- rightwards on the same rank' do
          initial_coordinate     = Coordinate.new(:c3)
          destination_coordinate = Coordinate.new(:d3)
          king = King.new(:black)
          board.place(king, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate
        end
      end
  
      context 'bishop-like behavior' do
        it 'moves king from g2 to h3 -- moving along a top-right diagonal' do
          initial_coordinate     = Coordinate.new(:g2)
          destination_coordinate = Coordinate.new(:h3)
          king = King.new(:black)
          board.place(king, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate
        end
  
        it 'moves king from b5 to a6 -- moving along a top-left diagonal' do
          initial_coordinate     = Coordinate.new(:b5)
          destination_coordinate = Coordinate.new(:a6)
          king = King.new(:white)
          board.place(king, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate
        end
  
        it 'moves king from g7 to h6 -- moving along a bottom-right diagonal' do
          initial_coordinate     = Coordinate.new(:g7)
          destination_coordinate = Coordinate.new(:h6)
          king = King.new(:black)
          board.place(king, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate
        end
  
        it 'moves king from f3 to e2 -- moving along a bottom-left diagonal' do
          initial_coordinate     = Coordinate.new(:f3)
          destination_coordinate = Coordinate.new(:e2)
          king = King.new(:black)
          board.place(king, initial_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate
        end
      end
    end

    context 'when capturing another piece' do
      context 'rook-like behavior' do
        it 'captures an enemy piece -- upwards on the same file' do
          initial_coordinate     = Coordinate.new(:e5)
          destination_coordinate = Coordinate.new(:e6)
          capturing_king = King.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_king_on destination_coordinate
        end
  
        it 'captures an enemy piece -- downwards on the same file' do
          initial_coordinate     = Coordinate.new(:g3)
          destination_coordinate = Coordinate.new(:g2)
          capturing_king = King.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_king_on destination_coordinate
        end
  
        it 'captures an enemy piece -- leftwards on the same rank' do
          initial_coordinate     = Coordinate.new(:c6)
          destination_coordinate = Coordinate.new(:b6)
          capturing_king = King.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_king_on destination_coordinate
        end
  
        it 'captures an enemy piece -- rightwards on the same rank' do
          initial_coordinate     = Coordinate.new(:f1)
          destination_coordinate = Coordinate.new(:g1)
          capturing_king = King.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_king_on destination_coordinate
        end
      end

      context 'bishop-like behavior' do
        it 'captures an enemy piece -- moving along a top-right diagonal' do
          initial_coordinate     = Coordinate.new(:e3)
          destination_coordinate = Coordinate.new(:f4)
          capturing_king = King.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_king_on destination_coordinate
        end
  
        it 'captures an enemy piece -- moving along a top-left diagonal' do
          initial_coordinate     = Coordinate.new(:d2)
          destination_coordinate = Coordinate.new(:c3)
          capturing_king = King.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_king_on destination_coordinate
        end
  
        it 'captures an enemy piece -- moving along a bottom-right diagonal' do
          initial_coordinate     = Coordinate.new(:c5)
          destination_coordinate = Coordinate.new(:d4)
          capturing_king = King.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_king_on destination_coordinate
        end
  
        it 'captures an enemy piece -- moving along a bottom-left diagonal' do
          initial_coordinate     = Coordinate.new(:h6)
          destination_coordinate = Coordinate.new(:g5)
          capturing_king = King.new(:white)
          target_enemy_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_enemy_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_king_on destination_coordinate
        end
      end

      it "doesn't capture an ally piece" do
        initial_coordinate     = Coordinate.new(:e5)
        destination_coordinate = Coordinate.new(:e6)
        capturing_king = King.new(:black)
        ally_knight = Knight.new(:black)
        board.place(capturing_king, initial_coordinate)
        board.place(ally_knight, destination_coordinate)

        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it")
      end

      it "doesn't capture a king" do
        initial_coordinate     = Coordinate.new(:a3)
        destination_coordinate = Coordinate.new(:a4)
        capturing_king = King.new(:white)
        uncaptureable_enemy_king = King.new(:black)
        board.place(capturing_king, initial_coordinate)
        board.place(uncaptureable_enemy_king, destination_coordinate)
        
        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("The piece on #{destination_coordinate.symbol} is an ally, so the piece at #{initial_coordinate.symbol} can't replace it")
      end
    end
    
    xcontext "when moving an enemy piece's moveset" do
      it "raises an error -- enemy piece being a rook -- on destination coordinate rank" do
        initial_coordinate     = Coordinate.new(:d3)
        destination_coordinate = Coordinate.new(:d4)
        guarding_rook_coordinate = Coordinate.new(:b4)
        moving_king = King.new(:white)
        guarding_rook = Rook.new(:black)
        board.place(moving_king, initial_coordinate)
        board.place(guarding_rook, guarding_rook_coordinate)

        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("The king can't move into an opponent's piece moveset")
      end
    end
    
    it "doesn't move king from g2 to c7" do
      initial_coordinate     = Coordinate.new(:g2)
      destination_coordinate = Coordinate.new(:c7)
      king = King.new(:black)
      board.place(king, initial_coordinate)

      expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error("That piece can't move to #{destination_coordinate.symbol}")
    end
  end
end
