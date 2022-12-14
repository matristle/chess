require_relative 'custom_matchers'
require_relative '../lib/board'
require_relative '../lib/board_maker'
require_relative '../lib/piece_arranger'
require_relative '../lib/move_validator'
require_relative '../lib/rook'
require_relative '../lib/knight'

describe Board do
  include CustomMatchers

  subject(:board) { Board.new(board_maker:, piece_arranger:, move_validator:) }
    let(:board_maker)    { BoardMaker.new }
    let(:piece_arranger) { PieceArranger.new }
    let(:move_validator) { MoveValidator.new }
  
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
  
  context "stationary move -- same initial and destination coordinate" do
    it "raises an error when move is from c2 to c2" do
      initial_coordinate     = Coordinate.new(:c2)
      destination_coordinate = initial_coordinate
      rook = Rook.new(:black)
      board.place(rook, initial_coordinate)
        
      expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::StationaryMoveError)
    end
  end

  context "move from an empty square" do
    it "raise an error" do
      expect { board.move_piece(Coordinate.new(:b6), Coordinate.new(:b8)) }.to raise_error(MoveValidator::NoPieceFromStartError)
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

      it 'can move rook from f5 to f6 then back to f5' do
        initial_coordinate     = Coordinate.new(:f5)
        destination_coordinate = Coordinate.new(:f6)
        rook = Rook.new(:white)
        board.place(rook, initial_coordinate)
        
        board.move_piece(initial_coordinate, destination_coordinate)
        board.move_piece(destination_coordinate, initial_coordinate)
        
        expect(board).to_not have_a_rook_on destination_coordinate
        expect(board).to have_a_rook_on initial_coordinate
      end
    end
    
    context 'captures' do
      it 'captures an undefended opponent piece -- upwards on the same file' do
        initial_coordinate     = Coordinate.new(:e5)
        destination_coordinate = Coordinate.new(:e7)
        capturing_rook = Rook.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_rook, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_rook_on destination_coordinate
      end

      it 'captures an undefended opponent piece -- downwards on the same file' do
        initial_coordinate     = Coordinate.new(:g3)
        destination_coordinate = Coordinate.new(:g1)
        capturing_rook = Rook.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_rook, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_rook_on destination_coordinate
      end

      it 'captures an undefended opponent piece -- leftwards on the same rank' do
        initial_coordinate     = Coordinate.new(:c6)
        destination_coordinate = Coordinate.new(:a6)
        capturing_rook = Rook.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_rook, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_rook_on destination_coordinate
      end

      it 'captures an undefended opponent piece -- rightwards on the same rank' do
        initial_coordinate     = Coordinate.new(:f1)
        destination_coordinate = Coordinate.new(:h1)
        capturing_rook = Rook.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_rook, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)

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

        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::CapturedAllyError)
      end
      
      it "doesn't capture a king" do
        initial_coordinate     = Coordinate.new(:a3)
        destination_coordinate = Coordinate.new(:a7)
        capturing_rook = Rook.new(:white)
        uncaptureable_opponent_king = King.new(:black)
        board.place(capturing_rook, initial_coordinate)
        board.place(uncaptureable_opponent_king, destination_coordinate)
        
        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::CapturedKingError)
      end

      it "doesn't capture when there's an intervening piece between the move" do
        initial_coordinate     = Coordinate.new(:e5)
        destination_coordinate = Coordinate.new(:e8)
        intervening_bishop_coordinate = Coordinate.new(:e7)
        capturing_rook = Rook.new(:black)
        target_opponent_knight = Knight.new(:white)
        intervening_bishop = Bishop.new(:white)
        board.place(capturing_rook, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)
        board.place(intervening_bishop, intervening_bishop_coordinate)

        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::InterveningPieceError)
      end
    end

    it "doesn't move rook from g6 to h7" do
      initial_coordinate     = Coordinate.new(:g6)
      destination_coordinate = Coordinate.new(:h7)
      rook = Rook.new(:white)
      board.place(rook, initial_coordinate)
      
      expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(Board::InvalidMoveError)
    end
    
    it "doesn't move rook from a4 to e1" do
      initial_coordinate     = Coordinate.new(:a4)
      destination_coordinate = Coordinate.new(:e1)
      rook = Rook.new(:white)
      board.place(rook, initial_coordinate)
      
      expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(Board::InvalidMoveError)
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

    context 'captures' do
      it 'captures an undefended opponent piece -- making an upper-right narrow L' do
        initial_coordinate     = Coordinate.new(:c2)
        destination_coordinate = Coordinate.new(:d4)
        capturing_knight = Knight.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_knight_on destination_coordinate
      end

      it 'captures an undefended opponent piece -- making an upper-right wide L' do
        initial_coordinate     = Coordinate.new(:e4)
        destination_coordinate = Coordinate.new(:g5)
        capturing_knight = Knight.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'captures an undefended opponent piece -- making an upper-left narrow L' do
        initial_coordinate     = Coordinate.new(:b2)
        destination_coordinate = Coordinate.new(:a4)
        capturing_knight = Knight.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'captures an undefended opponent piece -- making an upper-left wide L' do
        initial_coordinate     = Coordinate.new(:d5)
        destination_coordinate = Coordinate.new(:b6)
        capturing_knight = Knight.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'captures an undefended opponent piece -- making a lower-right narrow L' do
        initial_coordinate     = Coordinate.new(:c3)
        destination_coordinate = Coordinate.new(:d1)
        capturing_knight = Knight.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'captures an undefended opponent piece -- making a lower-right wide L' do
        initial_coordinate     = Coordinate.new(:e4)
        destination_coordinate = Coordinate.new(:g3)
        capturing_knight = Knight.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'captures an undefended opponent piece -- making a lower-left narrow L' do
        initial_coordinate     = Coordinate.new(:c6)
        destination_coordinate = Coordinate.new(:b4)
        capturing_knight = Knight.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)
  
        board.move_piece(initial_coordinate, destination_coordinate)
  
        expect(board).to have_a_knight_on destination_coordinate
      end
  
      it 'captures an undefended opponent piece -- making a lower-left wide L' do
        initial_coordinate     = Coordinate.new(:d8)
        destination_coordinate = Coordinate.new(:b7)
        capturing_knight = Knight.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)
  
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

        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::CapturedAllyError)
      end

      it "doesn't capture a king" do
        initial_coordinate     = Coordinate.new(:a3)
        destination_coordinate = Coordinate.new(:a7)
        capturing_knight = Knight.new(:white)
        uncaptureable_opponent_king = King.new(:black)
        board.place(capturing_knight, initial_coordinate)
        board.place(uncaptureable_opponent_king, destination_coordinate)
        
        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::CapturedKingError)
      end
    end
    
    it "doesn't move a knight from d5 to a2" do
      initial_coordinate     = Coordinate.new(:d5)
      destination_coordinate = Coordinate.new(:a2)
      knight = Knight.new(:white)
      board.place(knight, initial_coordinate)

      expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(Board::InvalidMoveError)
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

    context 'captures' do
      it 'captures an undefended opponent piece -- moving along a top-right diagonal' do
        initial_coordinate     = Coordinate.new(:e3)
        destination_coordinate = Coordinate.new(:g5)
        capturing_bishop = Bishop.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_bishop, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_bishop_on destination_coordinate
      end

      it 'captures an undefended opponent piece -- moving along a top-left diagonal' do
        initial_coordinate     = Coordinate.new(:d2)
        destination_coordinate = Coordinate.new(:a5)
        capturing_bishop = Bishop.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_bishop, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_bishop_on destination_coordinate
      end

      it 'captures an undefended opponent piece -- moving along a bottom-right diagonal' do
        initial_coordinate     = Coordinate.new(:c5)
        destination_coordinate = Coordinate.new(:f2)
        capturing_bishop = Bishop.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_bishop, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)

        board.move_piece(initial_coordinate, destination_coordinate)

        expect(board).to have_a_bishop_on destination_coordinate
      end

      it 'captures an undefended opponent piece -- moving along a bottom-left diagonal' do
        initial_coordinate     = Coordinate.new(:h6)
        destination_coordinate = Coordinate.new(:c1)
        capturing_bishop = Bishop.new(:white)
        target_opponent_knight = Knight.new(:black)
        board.place(capturing_bishop, initial_coordinate)
        board.place(target_opponent_knight, destination_coordinate)

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

        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::CapturedAllyError)
      end

      it "doesn't capture a king" do
        initial_coordinate     = Coordinate.new(:a3)
        destination_coordinate = Coordinate.new(:a7)
        capturing_bishop = Bishop.new(:white)
        uncaptureable_opponent_king = King.new(:black)
        board.place(capturing_bishop, initial_coordinate)
        board.place(uncaptureable_opponent_king, destination_coordinate)
        
        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::CapturedKingError)
      end
    end

    it "doesn't move a bishop from f1 to a5" do
      initial_coordinate     = Coordinate.new(:f1)
      destination_coordinate = Coordinate.new(:a5)
      bishop = Bishop.new(:white)
      board.place(bishop, initial_coordinate)
      
      expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(Board::InvalidMoveError)
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

    context 'captures' do
      context 'rook-like behavior' do
        it 'captures an undefended opponent piece -- upwards on the same file' do
          initial_coordinate     = Coordinate.new(:e5)
          destination_coordinate = Coordinate.new(:e7)
          capturing_queen = Queen.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'captures an undefended opponent piece -- downwards on the same file' do
          initial_coordinate     = Coordinate.new(:g3)
          destination_coordinate = Coordinate.new(:g1)
          capturing_queen = Queen.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'captures an undefended opponent piece -- leftwards on the same rank' do
          initial_coordinate     = Coordinate.new(:c6)
          destination_coordinate = Coordinate.new(:a6)
          capturing_queen = Queen.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'captures an undefended opponent piece -- rightwards on the same rank' do
          initial_coordinate     = Coordinate.new(:f1)
          destination_coordinate = Coordinate.new(:h1)
          capturing_queen = Queen.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
      end

      context 'bishop-like behavior' do
        it 'captures an undefended opponent piece -- moving along a top-right diagonal' do
          initial_coordinate     = Coordinate.new(:e3)
          destination_coordinate = Coordinate.new(:g5)
          capturing_queen = Queen.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'captures an undefended opponent piece -- moving along a top-left diagonal' do
          initial_coordinate     = Coordinate.new(:d2)
          destination_coordinate = Coordinate.new(:a5)
          capturing_queen = Queen.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'captures an undefended opponent piece -- moving along a bottom-right diagonal' do
          initial_coordinate     = Coordinate.new(:c5)
          destination_coordinate = Coordinate.new(:f2)
          capturing_queen = Queen.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to have_a_queen_on destination_coordinate
        end
  
        it 'captures an undefended opponent piece -- moving along a bottom-left diagonal' do
          initial_coordinate     = Coordinate.new(:h6)
          destination_coordinate = Coordinate.new(:c1)
          capturing_queen = Queen.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_queen, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
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

        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::CapturedAllyError)
      end

      it "doesn't capture a king" do
        initial_coordinate     = Coordinate.new(:a3)
        destination_coordinate = Coordinate.new(:a7)
        capturing_queen = Queen.new(:white)
        uncaptureable_opponent_king = King.new(:black)
        board.place(capturing_queen, initial_coordinate)
        board.place(uncaptureable_opponent_king, destination_coordinate)
        
        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::CapturedKingError)
      end
    end

    it "doesn't move queen from d2 to g7" do
      initial_coordinate     = Coordinate.new(:d2)
      destination_coordinate = Coordinate.new(:g7)
      queen = Queen.new(:white)
      board.place(queen, initial_coordinate)

      expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(Board::InvalidMoveError)
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

        it 'can move king from f5 to f6 then back to f5' do
          initial_coordinate     = Coordinate.new(:f5)
          destination_coordinate = Coordinate.new(:f6)
          king = King.new(:white)
          board.place(king, initial_coordinate)
          
          board.move_piece(initial_coordinate, destination_coordinate)
          board.move_piece(destination_coordinate, initial_coordinate)
          
          expect(board).to_not have_a_king_on destination_coordinate
          expect(board).to have_a_king_on initial_coordinate
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

    context 'captures' do
      context 'rook-like behavior' do
        it 'captures an undefended opponent piece -- upwards on the same file' do
          initial_coordinate     = Coordinate.new(:e5)
          destination_coordinate = Coordinate.new(:e6)
          capturing_king = King.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate        end
  
        it 'captures an undefended opponent piece -- downwards on the same file' do
          initial_coordinate     = Coordinate.new(:g3)
          destination_coordinate = Coordinate.new(:g2)
          capturing_king = King.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate        end
  
        it 'captures an undefended opponent piece -- leftwards on the same rank' do
          initial_coordinate     = Coordinate.new(:c6)
          destination_coordinate = Coordinate.new(:b6)
          capturing_king = King.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate        end
  
        it 'captures an undefended opponent piece -- rightwards on the same rank' do
          initial_coordinate     = Coordinate.new(:f1)
          destination_coordinate = Coordinate.new(:g1)
          capturing_king = King.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate        end
      end

      context 'bishop-like behavior' do
        it 'captures an undefended opponent piece -- moving along a top-right diagonal' do
          initial_coordinate     = Coordinate.new(:e3)
          destination_coordinate = Coordinate.new(:f4)
          capturing_king = King.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate        end
  
        it 'captures an undefended opponent piece -- moving along a top-left diagonal' do
          initial_coordinate     = Coordinate.new(:d2)
          destination_coordinate = Coordinate.new(:c3)
          capturing_king = King.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate        end
  
        it 'captures an undefended opponent piece -- moving along a bottom-right diagonal' do
          initial_coordinate     = Coordinate.new(:c5)
          destination_coordinate = Coordinate.new(:d4)
          capturing_king = King.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
          expect(board).to have_a_king_on destination_coordinate        end
  
        it 'captures an undefended opponent piece -- moving along a bottom-left diagonal' do
          initial_coordinate     = Coordinate.new(:h6)
          destination_coordinate = Coordinate.new(:g5)
          capturing_king = King.new(:white)
          target_opponent_knight = Knight.new(:black)
          board.place(capturing_king, initial_coordinate)
          board.place(target_opponent_knight, destination_coordinate)
  
          board.move_piece(initial_coordinate, destination_coordinate)
  
          expect(board).to_not have_a_king_on initial_coordinate
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

        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::CapturedAllyError)
      end

      it "doesn't capture an opponent king" do
        initial_coordinate     = Coordinate.new(:a3)
        destination_coordinate = Coordinate.new(:a4)
        capturing_king = King.new(:white)
        uncaptureable_opponent_king = King.new(:black)
        board.place(capturing_king, initial_coordinate)
        board.place(uncaptureable_opponent_king, destination_coordinate)
        
        expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::CapturedKingError)
      end
    end
    
    context "when moving into an opponent piece's moveset" do
      context 'rook moveset' do
        context 'when guarding pieces are allies' do
          it 'can move king from c2 to b2 if guarding piece from the top is an ally' do
            initial_coordinate     = Coordinate.new(:c2)
            destination_coordinate = Coordinate.new(:b2)
            guarding_ally_rook_coordinate = Coordinate.new(:b5)
            moving_king = King.new(:black)
            guarding_ally_rook = Rook.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_rook, guarding_ally_rook_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end

          it 'can move king from e6 to f7 if guarding piece from the bottom is an ally' do
            initial_coordinate     = Coordinate.new(:e6)
            destination_coordinate = Coordinate.new(:f7)
            guarding_ally_rook_coordinate = Coordinate.new(:f1)
            moving_king = King.new(:black)
            guarding_ally_rook = Rook.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_rook, guarding_ally_rook_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end

          it 'can move king from c5 to d4 if guarding piece from the left is an ally' do
            initial_coordinate     = Coordinate.new(:c5)
            destination_coordinate = Coordinate.new(:d4)
            guarding_ally_rook_coordinate = Coordinate.new(:a4)
            moving_king = King.new(:black)
            guarding_ally_rook = Rook.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_rook, guarding_ally_rook_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end

          it 'can move king from d7 to d6 if guarding piece from the right is an ally' do
            initial_coordinate     = Coordinate.new(:d7)
            destination_coordinate = Coordinate.new(:d6)
            guarding_ally_rook_coordinate = Coordinate.new(:h6)
            moving_king = King.new(:black)
            guarding_ally_rook = Rook.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_rook, guarding_ally_rook_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end
        end

        it "raises an error when a rook is holding the rank from the left side" do
          initial_coordinate     = Coordinate.new(:d3)
          destination_coordinate = Coordinate.new(:d4)
          guarding_rook_coordinate = Coordinate.new(:b4)
          moving_king = King.new(:white)
          guarding_rook = Rook.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_rook, guarding_rook_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end

        it "raises an error when a rook is holding the rank from the right side" do
          initial_coordinate     = Coordinate.new(:d3)
          destination_coordinate = Coordinate.new(:d4)
          guarding_rook_coordinate = Coordinate.new(:h4)
          moving_king = King.new(:white)
          guarding_rook = Rook.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_rook, guarding_rook_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end

        it "raises an error when a rook is holding the file from upwards" do
          initial_coordinate     = Coordinate.new(:e5)
          destination_coordinate = Coordinate.new(:f5)
          guarding_rook_coordinate = Coordinate.new(:f7)
          moving_king = King.new(:white)
          guarding_rook = Rook.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_rook, guarding_rook_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end

        it "raises an error when a rook is holding the file from downwards" do
          initial_coordinate     = Coordinate.new(:b6)
          destination_coordinate = Coordinate.new(:c6)
          guarding_rook_coordinate = Coordinate.new(:c1)
          moving_king = King.new(:white)
          guarding_rook = Rook.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_rook, guarding_rook_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end
      end
      
      context 'bishop moveset' do
        context 'when guarding pieces are allies' do
          it 'can move king from c2 to b2 if guarding piece from the top-right diagonal is an ally' do
            initial_coordinate     = Coordinate.new(:c2)
            destination_coordinate = Coordinate.new(:b2)
            guarding_ally_bishop_coordinate = Coordinate.new(:g7)
            moving_king = King.new(:black)
            guarding_ally_bishop = Bishop.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_bishop, guarding_ally_bishop_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end

          it 'can move king from g1 to h1 if guarding piece from the top-left diagonal is an ally' do
            initial_coordinate     = Coordinate.new(:g1)
            destination_coordinate = Coordinate.new(:h1)
            guarding_ally_bishop_coordinate = Coordinate.new(:d5)
            moving_king = King.new(:black)
            guarding_ally_bishop = Bishop.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_bishop, guarding_ally_bishop_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end

          it 'can move king from a8 to a7 if guarding piece from the bottom-right diagonal is an ally' do
            initial_coordinate     = Coordinate.new(:a8)
            destination_coordinate = Coordinate.new(:a7)
            guarding_ally_bishop_coordinate = Coordinate.new(:e3)
            capturing_king = King.new(:black)
            guarding_ally_bishop = Bishop.new(:black)
            board.place(capturing_king, initial_coordinate)
            board.place(guarding_ally_bishop, guarding_ally_bishop_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end

          it 'can move king from g4 to h4 if guarding piece from the bottom-left diagonal is an ally' do
            initial_coordinate     = Coordinate.new(:g4)
            destination_coordinate = Coordinate.new(:h4)
            guarding_ally_bishop_coordinate = Coordinate.new(:f2)
            capturing_king = King.new(:black)
            guarding_ally_bishop = Bishop.new(:black)
            board.place(capturing_king, initial_coordinate)
            board.place(guarding_ally_bishop, guarding_ally_bishop_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end
        end

        it "raises an error when a bishop is holding the square from top right diagonal" do
          initial_coordinate     = Coordinate.new(:e1)
          destination_coordinate = Coordinate.new(:e2)
          guarding_bishop_coordinate = Coordinate.new(:g4)
          moving_king = King.new(:white)
          guarding_bishop = Bishop.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_bishop, guarding_bishop_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end

        it "raises an error when a bishop is holding the square from top left diagonal" do
          initial_coordinate     = Coordinate.new(:g4)
          destination_coordinate = Coordinate.new(:g5)
          guarding_bishop_coordinate = Coordinate.new(:d8)
          moving_king = King.new(:white)
          guarding_bishop = Bishop.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_bishop, guarding_bishop_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end

        it "raises an error when a bishop is holding the square from bottom right diagonal" do
          initial_coordinate     = Coordinate.new(:b5)
          destination_coordinate = Coordinate.new(:b6)
          guarding_bishop_coordinate = Coordinate.new(:e3)
          moving_king = King.new(:white)
          guarding_bishop = Bishop.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_bishop, guarding_bishop_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end

        it "raises an error when a bishop is holding the square from bottom left diagonal" do
          initial_coordinate     = Coordinate.new(:f6)
          destination_coordinate = Coordinate.new(:f7)
          guarding_bishop_coordinate = Coordinate.new(:d5)
          moving_king = King.new(:white)
          guarding_bishop = Bishop.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_bishop, guarding_bishop_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end
      end

      context 'queen moveset' do
        context 'when guarding pieces are allies' do
          context 'rook-like moveset' do
            it 'can move king from c2 to b2 if guarding piece from the top-right diagonal is an ally' do
              initial_coordinate     = Coordinate.new(:c2)
              destination_coordinate = Coordinate.new(:b2)
              guarding_ally_queen_coordinate = Coordinate.new(:g7)
              moving_king = King.new(:black)
              guarding_ally_queen = Queen.new(:black)
              board.place(moving_king, initial_coordinate)
              board.place(guarding_ally_queen, guarding_ally_queen_coordinate)
      
              board.move_piece(initial_coordinate, destination_coordinate)
      
              expect(board).to_not have_a_king_on initial_coordinate
              expect(board).to have_a_king_on destination_coordinate  
            end
  
            it 'can move king from g1 to h1 if guarding piece from the top-left diagonal is an ally' do
              initial_coordinate     = Coordinate.new(:g1)
              destination_coordinate = Coordinate.new(:h1)
              guarding_ally_queen_coordinate = Coordinate.new(:d5)
              moving_king = King.new(:black)
              guarding_ally_queen = Queen.new(:black)
              board.place(moving_king, initial_coordinate)
              board.place(guarding_ally_queen, guarding_ally_queen_coordinate)
      
              board.move_piece(initial_coordinate, destination_coordinate)
      
              expect(board).to_not have_a_king_on initial_coordinate
              expect(board).to have_a_king_on destination_coordinate  
            end
  
            it 'can move king from a8 to a7 if guarding piece from the bottom-right diagonal is an ally' do
              initial_coordinate     = Coordinate.new(:a8)
              destination_coordinate = Coordinate.new(:a7)
              guarding_ally_queen_coordinate = Coordinate.new(:e3)
              capturing_king = King.new(:black)
              guarding_ally_queen = Queen.new(:black)
              board.place(capturing_king, initial_coordinate)
              board.place(guarding_ally_queen, guarding_ally_queen_coordinate)
      
              board.move_piece(initial_coordinate, destination_coordinate)
      
              expect(board).to_not have_a_king_on initial_coordinate
              expect(board).to have_a_king_on destination_coordinate  
            end
  
            it 'can move king from g4 to h4 if guarding piece from the bottom-left diagonal is an ally' do
              initial_coordinate     = Coordinate.new(:g4)
              destination_coordinate = Coordinate.new(:h4)
              guarding_ally_queen_coordinate = Coordinate.new(:f2)
              capturing_king = King.new(:black)
              guarding_ally_queen = Queen.new(:black)
              board.place(capturing_king, initial_coordinate)
              board.place(guarding_ally_queen, guarding_ally_queen_coordinate)
      
              board.move_piece(initial_coordinate, destination_coordinate)
      
              expect(board).to_not have_a_king_on initial_coordinate
              expect(board).to have_a_king_on destination_coordinate  
            end
          end

          context 'bishop-like moveset' do
            it 'can move king from c2 to b2 if guarding piece from the top-right diagonal is an ally' do
              initial_coordinate     = Coordinate.new(:c2)
              destination_coordinate = Coordinate.new(:b2)
              guarding_ally_queen_coordinate = Coordinate.new(:g7)
              moving_king = King.new(:black)
              guarding_ally_queen = Queen.new(:black)
              board.place(moving_king, initial_coordinate)
              board.place(guarding_ally_queen, guarding_ally_queen_coordinate)
      
              board.move_piece(initial_coordinate, destination_coordinate)
      
              expect(board).to_not have_a_king_on initial_coordinate
              expect(board).to have_a_king_on destination_coordinate  
            end
  
            it 'can move king from g1 to h1 if guarding piece from the top-left diagonal is an ally' do
              initial_coordinate     = Coordinate.new(:g1)
              destination_coordinate = Coordinate.new(:h1)
              guarding_ally_queen_coordinate = Coordinate.new(:d5)
              moving_king = King.new(:black)
              guarding_ally_queen = Queen.new(:black)
              board.place(moving_king, initial_coordinate)
              board.place(guarding_ally_queen, guarding_ally_queen_coordinate)
      
              board.move_piece(initial_coordinate, destination_coordinate)
      
              expect(board).to_not have_a_king_on initial_coordinate
              expect(board).to have_a_king_on destination_coordinate  
            end
  
            it 'can move king from a8 to a7 if guarding piece from the bottom-right diagonal is an ally' do
              initial_coordinate     = Coordinate.new(:a8)
              destination_coordinate = Coordinate.new(:a7)
              guarding_ally_queen_coordinate = Coordinate.new(:e3)
              capturing_king = King.new(:black)
              guarding_ally_queen = Queen.new(:black)
              board.place(capturing_king, initial_coordinate)
              board.place(guarding_ally_queen, guarding_ally_queen_coordinate)
      
              board.move_piece(initial_coordinate, destination_coordinate)
      
              expect(board).to_not have_a_king_on initial_coordinate
              expect(board).to have_a_king_on destination_coordinate  
            end
  
            it 'can move king from g4 to h4 if guarding piece from the bottom-left diagonal is an ally' do
              initial_coordinate     = Coordinate.new(:g4)
              destination_coordinate = Coordinate.new(:h4)
              guarding_ally_queen_coordinate = Coordinate.new(:f2)
              capturing_king = King.new(:black)
              guarding_ally_queen = Queen.new(:black)
              board.place(capturing_king, initial_coordinate)
              board.place(guarding_ally_queen, guarding_ally_queen_coordinate)
      
              board.move_piece(initial_coordinate, destination_coordinate)
      
              expect(board).to_not have_a_king_on initial_coordinate
              expect(board).to have_a_king_on destination_coordinate  
            end
          end
        end

        context 'rook-like moveset' do
          it "raises an error when a queen is holding the rank from the left side" do
            initial_coordinate     = Coordinate.new(:d3)
            destination_coordinate = Coordinate.new(:d4)
            guarding_queen_coordinate = Coordinate.new(:b4)
            moving_king = King.new(:white)
            guarding_queen = Queen.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_queen, guarding_queen_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
  
          it "raises an error when a queen is holding the rank from the right side" do
            initial_coordinate     = Coordinate.new(:d3)
            destination_coordinate = Coordinate.new(:d4)
            guarding_queen_coordinate = Coordinate.new(:h4)
            moving_king = King.new(:white)
            guarding_queen = Queen.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_queen, guarding_queen_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
  
          it "raises an error when a queen is holding the file from upwards" do
            initial_coordinate     = Coordinate.new(:e5)
            destination_coordinate = Coordinate.new(:f5)
            guarding_queen_coordinate = Coordinate.new(:f7)
            moving_king = King.new(:white)
            guarding_queen = Queen.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_queen, guarding_queen_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
  
          it "raises an error when a rook is holding the file from downwards" do
            initial_coordinate     = Coordinate.new(:b6)
            destination_coordinate = Coordinate.new(:c6)
            guarding_rook_coordinate = Coordinate.new(:c1)
            moving_king = King.new(:white)
            guarding_rook = Rook.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_rook, guarding_rook_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
        end

        context 'bishop-like moveset' do
          it "raises an error when a queen is holding the square from top right diagonal" do
            initial_coordinate     = Coordinate.new(:e1)
            destination_coordinate = Coordinate.new(:e2)
            guarding_queen_coordinate = Coordinate.new(:g4)
            moving_king = King.new(:white)
            guarding_queen = Queen.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_queen, guarding_queen_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
  
          it "raises an error when a queen is holding the square from top left diagonal" do
            initial_coordinate     = Coordinate.new(:g4)
            destination_coordinate = Coordinate.new(:g5)
            guarding_queen_coordinate = Coordinate.new(:d8)
            moving_king = King.new(:white)
            guarding_queen = Queen.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_queen, guarding_queen_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
  
          it "raises an error when a queen is holding the square from bottom right diagonal" do
            initial_coordinate     = Coordinate.new(:b5)
            destination_coordinate = Coordinate.new(:b6)
            guarding_queen_coordinate = Coordinate.new(:e3)
            moving_king = King.new(:white)
            guarding_queen = Queen.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_queen, guarding_queen_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
  
          it "raises an error when a queen is holding the square from bottom left diagonal" do
            initial_coordinate     = Coordinate.new(:f6)
            destination_coordinate = Coordinate.new(:f7)
            guarding_queen_coordinate = Coordinate.new(:d5)
            moving_king = King.new(:white)
            guarding_queen = Queen.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_queen, guarding_queen_coordinate)
            
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
        end
        
        context 'queen next to the king' do
          it "raises an error when a queen is holding the square from bottom left diagonal" do
            initial_coordinate     = Coordinate.new(:g8)
            destination_coordinate = Coordinate.new(:f7)
            guarding_queen_coordinate = Coordinate.new(:g7)
            moving_king = King.new(:white)
            guarding_queen = Queen.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_queen, guarding_queen_coordinate)
            
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
        end
      end
      
      context 'king moveset' do
        context 'rook-like moveset' do
          it "raises an error when a king is holding the rank from the left side" do
            initial_coordinate     = Coordinate.new(:d3)
            destination_coordinate = Coordinate.new(:d4)
            guarding_king_coordinate = Coordinate.new(:c4)
            moving_king = King.new(:white)
            guarding_king = King.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_king, guarding_king_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
  
          it "raises an error when a queen is holding the rank from the right side" do
            initial_coordinate     = Coordinate.new(:b2)
            destination_coordinate = Coordinate.new(:b3)
            guarding_king_coordinate = Coordinate.new(:b4)
            moving_king = King.new(:white)
            guarding_king = King.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_king, guarding_king_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
  
          it "raises an error when a queen is holding the file from upwards" do
            initial_coordinate     = Coordinate.new(:e5)
            destination_coordinate = Coordinate.new(:f5)
            guarding_queen_coordinate = Coordinate.new(:f7)
            moving_king = King.new(:white)
            guarding_queen = Queen.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_queen, guarding_queen_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
  
          it "raises an error when a rook is holding the file from downwards" do
            initial_coordinate     = Coordinate.new(:g6)
            destination_coordinate = Coordinate.new(:h6)
            guarding_rook_coordinate = Coordinate.new(:h5)
            moving_king = King.new(:white)
            guarding_rook = Rook.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_rook, guarding_rook_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
        end

        context 'bishop-like moveset' do
          it "raises an error when a king is holding the square from top right diagonal" do
            initial_coordinate     = Coordinate.new(:b3)
            destination_coordinate = Coordinate.new(:c3)
            guarding_queen_coordinate = Coordinate.new(:d4)
            moving_king = King.new(:white)
            guarding_queen = King.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_queen, guarding_queen_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
  
          it "raises an error when a king is holding the square from top left diagonal" do
            initial_coordinate     = Coordinate.new(:g1)
            destination_coordinate = Coordinate.new(:f1)
            guarding_queen_coordinate = Coordinate.new(:e2)
            moving_king = King.new(:white)
            guarding_queen = King.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_queen, guarding_queen_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
  
          it "raises an error when a king is holding the square from bottom right diagonal" do
            initial_coordinate     = Coordinate.new(:b5)
            destination_coordinate = Coordinate.new(:c4)
            guarding_queen_coordinate = Coordinate.new(:b3)
            moving_king = King.new(:white)
            guarding_queen = King.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_queen, guarding_queen_coordinate)
    
            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
  
          it "raises an error when a king is holding the square from bottom left diagonal" do
            initial_coordinate     = Coordinate.new(:g7)
            destination_coordinate = Coordinate.new(:f7)
            guarding_queen_coordinate = Coordinate.new(:e6)
            moving_king = King.new(:white)
            guarding_queen = King.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_queen, guarding_queen_coordinate)

            expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
          end
        end

        it "can move to the destination square if the nearest piece isn't guarding it" do
          initial_coordinate     = Coordinate.new(:b1)
          destination_coordinate = Coordinate.new(:a2)
          not_guarding_king_coordinate = Coordinate.new(:a5)
          moving_king = King.new(:white)
          not_guarding_king = King.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(not_guarding_king, not_guarding_king_coordinate)

          board.move_piece(initial_coordinate, destination_coordinate)

          expect(board).to have_a_king_on destination_coordinate
        end
      end

      context 'knight moveset' do
        context 'when guarding pieces are allies' do
          it 'can move king from a5 to b5 if guarding piece from upper-right narrow L is an ally' do
            initial_coordinate     = Coordinate.new(:a5)
            destination_coordinate = Coordinate.new(:b5)
            guarding_ally_knight_coordinate = Coordinate.new(:c7)
            moving_king = King.new(:black)
            guarding_ally_knight = Knight.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_knight, guarding_ally_knight_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end

          it 'can move king from f4 to e5 if guarding piece from upper-right wide L is an ally' do
            initial_coordinate     = Coordinate.new(:f4)
            destination_coordinate = Coordinate.new(:e5)
            guarding_ally_knight_coordinate = Coordinate.new(:d7)
            moving_king = King.new(:black)
            guarding_ally_knight = Knight.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_knight, guarding_ally_knight_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end

          it 'can move king from d2 to d3 if guarding piece from upper-left narrow L is an ally' do
            initial_coordinate     = Coordinate.new(:d2)
            destination_coordinate = Coordinate.new(:d3)
            guarding_ally_knight_coordinate = Coordinate.new(:c5)
            moving_king = King.new(:black)
            guarding_ally_knight = Knight.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_knight, guarding_ally_knight_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end

          it 'can move king from g5 to f4 if guarding piece from upper-left wide L is an ally' do
            initial_coordinate     = Coordinate.new(:g5)
            destination_coordinate = Coordinate.new(:f4)
            guarding_ally_knight_coordinate = Coordinate.new(:d5)
            moving_king = King.new(:black)
            guarding_ally_knight = Knight.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_knight, guarding_ally_knight_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end

          it 'can move king from d6 to c7 if guarding piece from lower-right narrow L is an ally' do
            initial_coordinate     = Coordinate.new(:d6)
            destination_coordinate = Coordinate.new(:c7)
            guarding_ally_knight_coordinate = Coordinate.new(:d5)
            moving_king = King.new(:black)
            guarding_ally_knight = Knight.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_knight, guarding_ally_knight_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end

          it 'can move king from b3 to c4 if guarding piece from lower-right wide L is an ally' do
            initial_coordinate     = Coordinate.new(:b3)
            destination_coordinate = Coordinate.new(:c4)
            guarding_ally_knight_coordinate = Coordinate.new(:e3)
            moving_king = King.new(:black)
            guarding_ally_knight = Knight.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_knight, guarding_ally_knight_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end

          it 'can move king from f5 to f4 if guarding piece from lower-left narrow L is an ally' do
            initial_coordinate     = Coordinate.new(:f5)
            destination_coordinate = Coordinate.new(:f4)
            guarding_ally_knight_coordinate = Coordinate.new(:e2)
            moving_king = King.new(:black)
            guarding_ally_knight = Knight.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_knight, guarding_ally_knight_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end

          it 'can move king from e4 to d3 if guarding piece from lower-left wide L is an ally' do
            initial_coordinate     = Coordinate.new(:e4)
            destination_coordinate = Coordinate.new(:d3)
            guarding_ally_knight_coordinate = Coordinate.new(:b2)
            moving_king = King.new(:black)
            guarding_ally_knight = Knight.new(:black)
            board.place(moving_king, initial_coordinate)
            board.place(guarding_ally_knight, guarding_ally_knight_coordinate)
    
            board.move_piece(initial_coordinate, destination_coordinate)
    
            expect(board).to_not have_a_king_on initial_coordinate
            expect(board).to have_a_king_on destination_coordinate  
          end
        end

        it "raises an error when a knight is holding the square from an upper-right narrow L" do
          initial_coordinate     = Coordinate.new(:e3)
          destination_coordinate = Coordinate.new(:d4)
          guarding_knight_coordinate = Coordinate.new(:e6)
          moving_king = King.new(:white)
          guarding_knight = Knight.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_knight, guarding_knight_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end

        it "raises an error when a knight is holding the square from an upper-right wide L" do
          initial_coordinate     = Coordinate.new(:a6)
          destination_coordinate = Coordinate.new(:b6)
          guarding_knight_coordinate = Coordinate.new(:d7)
          moving_king = King.new(:white)
          guarding_knight = Knight.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_knight, guarding_knight_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end

        it "raises an error when a knight is holding the square from an upper-left narrow L" do
          initial_coordinate     = Coordinate.new(:d2)
          destination_coordinate = Coordinate.new(:d1)
          guarding_knight_coordinate = Coordinate.new(:c3)
          moving_king = King.new(:white)
          guarding_knight = Knight.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_knight, guarding_knight_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end

        it "raises an error when a knight is holding the square from an upper-left wide L" do
          initial_coordinate     = Coordinate.new(:h8)
          destination_coordinate = Coordinate.new(:g7)
          guarding_knight_coordinate = Coordinate.new(:e8)
          moving_king = King.new(:white)
          guarding_knight = Knight.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_knight, guarding_knight_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end

        it "raises an error when a knight is holding the square from an lower-right narrow L" do
          initial_coordinate     = Coordinate.new(:f6)
          destination_coordinate = Coordinate.new(:e5)
          guarding_knight_coordinate = Coordinate.new(:f3)
          moving_king = King.new(:white)
          guarding_knight = Knight.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_knight, guarding_knight_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end

        it "raises an error when a knight is holding the square from an lower-right wide L" do
          initial_coordinate     = Coordinate.new(:b4)
          destination_coordinate = Coordinate.new(:c4)
          guarding_knight_coordinate = Coordinate.new(:e3)
          moving_king = King.new(:white)
          guarding_knight = Knight.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_knight, guarding_knight_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end

        it "raises an error when a knight is holding the square from an lower-left narrow L" do
          initial_coordinate     = Coordinate.new(:h3)
          destination_coordinate = Coordinate.new(:g3)
          guarding_knight_coordinate = Coordinate.new(:f1)
          moving_king = King.new(:white)
          guarding_knight = Knight.new(:black)
          board.place(moving_king, initial_coordinate)
          board.place(guarding_knight, guarding_knight_coordinate)
  
          expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end
      end
    end
    
    it "doesn't move king from g2 to c7" do
      initial_coordinate     = Coordinate.new(:g2)
      destination_coordinate = Coordinate.new(:c7)
      king = King.new(:black)
      board.place(king, initial_coordinate)

      expect { board.move_piece(initial_coordinate, destination_coordinate) }.to raise_error(Board::InvalidMoveError)
    end
  end

  context 'castling' do
    context 'short castling' do
      context 'white king' do
        it 'can short castle white king' do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:g1)
          rook_initial_coordinate      = Coordinate.new(:h1)
          rook_destination_coordinate  = Coordinate.new(:f1)
          castling_king = King.new(:white)
          castling_rook = Rook.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
  
          board.move_piece(king_initial_coordinate, king_destination_coordinate)
  
          expect(board).to have_a_king_on king_destination_coordinate
          expect(board).to have_a_rook_on rook_destination_coordinate
        end

        it "can't short castle white king when its destination square is covered by another piece" do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:g1)
          rook_initial_coordinate      = Coordinate.new(:h1)
          sniping_bishop_coordinate = Coordinate.new(:c5)
          castling_king = King.new(:white)
          castling_rook = Rook.new(:white)
          sniping_bishop = Bishop.new(:black)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.place(sniping_bishop, sniping_bishop_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end
  
        it "can't short castle white king when the squares before its destination square covered by another piece" do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:g1)
          rook_initial_coordinate      = Coordinate.new(:h1)
          sniping_bishop_coordinate = Coordinate.new(:a6)
          castling_king = King.new(:white)
          castling_rook = Rook.new(:white)
          sniping_bishop = Bishop.new(:black)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.place(sniping_bishop, sniping_bishop_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::CastlingThroughGuardedSquareError)
        end

        it "can't short castle white king if it has moved before" do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:g1)
          rook_initial_coordinate      = Coordinate.new(:h1)
          castle_restricting_coordinate = Coordinate.new(:e2)
          castling_king = King.new(:white)
          castling_rook = Rook.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.move_piece(king_initial_coordinate, castle_restricting_coordinate)
          board.move_piece(castle_restricting_coordinate, king_initial_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::PreviouslyMovedKingCastlingError)
        end
  
        it "can't short castle white king if its corresponding rook on h1 has moved before" do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:g1)
          rook_initial_coordinate      = Coordinate.new(:h1)
          castle_restricting_coordinate = Coordinate.new(:h2)
          castling_king = King.new(:white)
          castling_rook = Rook.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.move_piece(rook_initial_coordinate, castle_restricting_coordinate)
          board.move_piece(castle_restricting_coordinate, rook_initial_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::PreviouslyMovedRookCastlingError)
        end

        it "can't short castle white king if it's in check" do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:g1)
          castling_rook_coordinate = Coordinate.new(:h1)
          checking_rook_coordinate = Coordinate.new(:e8)
          castling_king = King.new(:white)
          castling_rook = Rook.new(:white)
          checking_rook = Rook.new(:black)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, castling_rook_coordinate)
          board.place(checking_rook, checking_rook_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::CastlingWhenInCheckError)
        end
      end

      context 'black king' do 
        it 'can short castle black king' do
          king_initial_coordinate     = Coordinate.new(:e8)
          king_destination_coordinate = Coordinate.new(:g8)
          rook_initial_coordinate      = Coordinate.new(:h8)
          rook_destination_coordinate  = Coordinate.new(:f8)
          castling_king = King.new(:black)
          castling_rook = Rook.new(:black)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
  
          board.move_piece(king_initial_coordinate, king_destination_coordinate)
  
          expect(board).to have_a_king_on king_destination_coordinate
          expect(board).to have_a_rook_on rook_destination_coordinate
        end
  
        it "can't short castle black king when its destination square is covered by another piece" do
          king_initial_coordinate     = Coordinate.new(:e8)
          king_destination_coordinate = Coordinate.new(:g8)
          rook_initial_coordinate      = Coordinate.new(:h8)
          sniping_bishop_coordinate = Coordinate.new(:a2)
          castling_king = King.new(:black)
          castling_rook = Rook.new(:black)
          sniping_bishop = Bishop.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.place(sniping_bishop, sniping_bishop_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end
  
        it "can't short castle black king when the squares before its destination square covered by another piece" do
          king_initial_coordinate     = Coordinate.new(:e8)
          king_destination_coordinate = Coordinate.new(:g8)
          rook_initial_coordinate      = Coordinate.new(:h8)
          sniping_bishop_coordinate = Coordinate.new(:a3)
          castling_king = King.new(:black)
          castling_rook = Rook.new(:black)
          sniping_bishop = Bishop.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.place(sniping_bishop, sniping_bishop_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::CastlingThroughGuardedSquareError)
        end

        it "can't short castle black king if it has moved before" do
          king_initial_coordinate     = Coordinate.new(:e8)
          king_destination_coordinate = Coordinate.new(:g8)
          rook_initial_coordinate      = Coordinate.new(:h8)
          castle_restricting_coordinate = Coordinate.new(:e7)
          castling_king = King.new(:black)
          castling_rook = Rook.new(:black)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.move_piece(king_initial_coordinate, castle_restricting_coordinate)
          board.move_piece(castle_restricting_coordinate, king_initial_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::PreviouslyMovedKingCastlingError)
        end

        it "can't short castle black king if its corresponding rook on h8 has moved before" do
          king_initial_coordinate     = Coordinate.new(:e8)
          king_destination_coordinate = Coordinate.new(:g8)
          rook_initial_coordinate      = Coordinate.new(:h8)
          castle_restricting_coordinate = Coordinate.new(:h7)
          castling_king = King.new(:black)
          castling_rook = Rook.new(:black)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.move_piece(rook_initial_coordinate, castle_restricting_coordinate)
          board.move_piece(castle_restricting_coordinate, rook_initial_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::PreviouslyMovedRookCastlingError)
        end

        it "can't short castle black king if it's in check" do
          king_initial_coordinate     = Coordinate.new(:e8)
          king_destination_coordinate = Coordinate.new(:g8)
          castling_rook_coordinate = Coordinate.new(:h8)
          checking_rook_coordinate = Coordinate.new(:e2)
          castling_king = King.new(:black)
          castling_rook = Rook.new(:black)
          checking_rook = Rook.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, castling_rook_coordinate)
          board.place(checking_rook, checking_rook_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::CastlingWhenInCheckError)
        end
      end
    end

    context 'long castling' do
      context 'white king' do
        it 'can long castle white king' do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:c1)
          rook_initial_coordinate      = Coordinate.new(:a1)
          rook_destination_coordinate  = Coordinate.new(:d1)
          castling_king = King.new(:white)
          castling_rook = Rook.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
  
          board.move_piece(king_initial_coordinate, king_destination_coordinate)
  
          expect(board).to have_a_king_on king_destination_coordinate
          expect(board).to have_a_rook_on rook_destination_coordinate
        end

        it "can't long castle white king when its destination square is covered by another piece" do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:c1)
          rook_initial_coordinate      = Coordinate.new(:a1)
          sniping_bishop_coordinate = Coordinate.new(:f4)
          castling_king = King.new(:white)
          castling_rook = Rook.new(:white)
          sniping_bishop = Bishop.new(:black)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.place(sniping_bishop, sniping_bishop_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end
  
        it "can't long castle white king when the square before its destination square covered by another piece" do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:c1)
          rook_initial_coordinate      = Coordinate.new(:a1)
          sniping_bishop_coordinate = Coordinate.new(:a4)
          castling_king = King.new(:white)
          castling_rook = Rook.new(:white)
          sniping_bishop = Bishop.new(:black)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.place(sniping_bishop, sniping_bishop_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::CastlingThroughGuardedSquareError)
        end

        it "can't long castle white king if it has moved before" do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:c1)
          rook_initial_coordinate      = Coordinate.new(:a1)
          castle_restricting_coordinate = Coordinate.new(:d2)
          castling_king = King.new(:white)
          castling_rook = Rook.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.move_piece(king_initial_coordinate, castle_restricting_coordinate)
          board.move_piece(castle_restricting_coordinate, king_initial_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::PreviouslyMovedKingCastlingError)
        end
  
        it "can't long castle white king if its corresponding rook on a1 has moved before" do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:c1)
          rook_initial_coordinate      = Coordinate.new(:a1)
          castle_restricting_coordinate = Coordinate.new(:a4)
          castling_king = King.new(:white)
          castling_rook = Rook.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.move_piece(rook_initial_coordinate, castle_restricting_coordinate)
          board.move_piece(castle_restricting_coordinate, rook_initial_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::PreviouslyMovedRookCastlingError)
        end

        it "can't long castle white king if there are intervening piece between the castling king and its destination square" do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:c1)
          rook_initial_coordinate      = Coordinate.new(:a1)
          castling_king = King.new(:white)
          castling_rook = Rook.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.place(Bishop.new(:white), Coordinate.new(:d1))

          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::InterveningPieceError)
        end

        it "can't long castle white king if its corresponding rook is not on a1" do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:c1)
          wandering_rook_coordinate = Coordinate.new(:a5)
          castling_king = King.new(:white)
          wandering_rook = Rook.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(wandering_rook, wandering_rook_coordinate)

          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(Board::InvalidMoveError)
        end

        it "can't long castle white king if it's in check" do
          king_initial_coordinate     = Coordinate.new(:e1)
          king_destination_coordinate = Coordinate.new(:c1)
          castling_rook_coordinate = Coordinate.new(:a1)
          checking_rook_coordinate = Coordinate.new(:e5)
          castling_king = King.new(:white)
          castling_rook = Rook.new(:white)
          checking_rook = Rook.new(:black)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, castling_rook_coordinate)
          board.place(checking_rook, checking_rook_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::CastlingWhenInCheckError)
        end
      end

      context 'black king' do
        it 'can long castle black king' do
          king_initial_coordinate     = Coordinate.new(:e8)
          king_destination_coordinate = Coordinate.new(:c8)
          rook_initial_coordinate      = Coordinate.new(:a8)
          rook_destination_coordinate  = Coordinate.new(:d8)
          castling_king = King.new(:black)
          castling_rook = Rook.new(:black)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
  
          board.move_piece(king_initial_coordinate, king_destination_coordinate)
  
          expect(board).to have_a_king_on king_destination_coordinate
          expect(board).to have_a_rook_on rook_destination_coordinate
        end

        it "can't long castle black king when its destination square is covered by another piece" do
          king_initial_coordinate     = Coordinate.new(:e8)
          king_destination_coordinate = Coordinate.new(:c8)
          rook_initial_coordinate      = Coordinate.new(:a8)
          sniping_bishop_coordinate = Coordinate.new(:e6)
          castling_king = King.new(:black)
          castling_rook = Rook.new(:black)
          sniping_bishop = Bishop.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.place(sniping_bishop, sniping_bishop_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::IntoOpponentMovesetError)
        end
  
        it "can't long castle black king when the square before its destination square covered by another piece" do
          king_initial_coordinate     = Coordinate.new(:e8)
          king_destination_coordinate = Coordinate.new(:c8)
          rook_initial_coordinate      = Coordinate.new(:a8)
          sniping_bishop_coordinate = Coordinate.new(:h4)
          castling_king = King.new(:black)
          castling_rook = Rook.new(:black)
          sniping_bishop = Bishop.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.place(sniping_bishop, sniping_bishop_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::CastlingThroughGuardedSquareError)
        end

        it "can't long castle black king if it has moved before" do
          king_initial_coordinate     = Coordinate.new(:e8)
          king_destination_coordinate = Coordinate.new(:c8)
          rook_initial_coordinate      = Coordinate.new(:a8)
          castle_restricting_coordinate = Coordinate.new(:f7)
          castling_king = King.new(:black)
          castling_rook = Rook.new(:black)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.move_piece(king_initial_coordinate, castle_restricting_coordinate)
          board.move_piece(castle_restricting_coordinate, king_initial_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::PreviouslyMovedKingCastlingError)
        end
  
        it "can't long castle black king if its corresponding rook on a8 has moved before" do
          king_initial_coordinate     = Coordinate.new(:e8)
          king_destination_coordinate = Coordinate.new(:c8)
          rook_initial_coordinate      = Coordinate.new(:a8)
          castle_restricting_coordinate = Coordinate.new(:a6)
          castling_king = King.new(:black)
          castling_rook = Rook.new(:black)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, rook_initial_coordinate)
          board.move_piece(rook_initial_coordinate, castle_restricting_coordinate)
          board.move_piece(castle_restricting_coordinate, rook_initial_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::PreviouslyMovedRookCastlingError)
        end

        it "can't long castle black king if it's in check" do
          king_initial_coordinate     = Coordinate.new(:e8)
          king_destination_coordinate = Coordinate.new(:c8)
          castling_rook_coordinate = Coordinate.new(:a8)
          checking_rook_coordinate = Coordinate.new(:e5)
          castling_king = King.new(:black)
          castling_rook = Rook.new(:black)
          checking_rook = Rook.new(:white)
          board.place(castling_king, king_initial_coordinate)
          board.place(castling_rook, castling_rook_coordinate)
          board.place(checking_rook, checking_rook_coordinate)
  
          expect { board.move_piece(king_initial_coordinate, king_destination_coordinate) }.to raise_error(MoveValidator::CastlingWhenInCheckError)
        end
      end
    end
  end

  context 'checks' do
    context 'moving rooks' do
      it 'can move king after being checked' do
        king_initial_coordinate     = Coordinate.new(:e1)
        king_destination_coordinate = Coordinate.new(:f2)
        rook_initial_coordinate      = Coordinate.new(:h8)
        rook_destination_coordinate  = Coordinate.new(:e8)
        king = King.new(:white)
        checking_rook = Rook.new(:black)
        board.place(king, king_initial_coordinate) 
        board.place(checking_rook, rook_initial_coordinate) 
        board.move_piece(rook_initial_coordinate, rook_destination_coordinate)
        board.move_piece(king_initial_coordinate, king_destination_coordinate)
  
        expect(board).to have_a_king_on king_destination_coordinate
      end

      it "can't move another piece that's not capturing the only checking piece while king is in check" do
        king_initial_coordinate = Coordinate.new(:e1)
        irrelevant_knight_initial_coordinate     = Coordinate.new(:c5)
        irrelevant_knight_destination_coordinate = Coordinate.new(:b7)
        checking_rook_coordinate  = Coordinate.new(:e8)
        king = King.new(:white)
        checking_rook = Rook.new(:black)
        irrelevant_knight = Knight.new(:white)
        board.place(king, king_initial_coordinate) 
        board.place(checking_rook, checking_rook_coordinate)
        board.place(irrelevant_knight, irrelevant_knight_initial_coordinate)

        expect { board.move_piece(irrelevant_knight_initial_coordinate, irrelevant_knight_destination_coordinate) }.to raise_error(Board::AnotherPieceMovedWhenKingInCheckError)
      end

      it "can capture the only checking piece with a piece other than the king" do
        king_coordinate = Coordinate.new(:d7)
        checking_rook_coordinate = Coordinate.new(:d4)
        capturing_bishop_initial_coordinate = Coordinate.new(:f6)
        capturing_bishop_destination_coordinate = checking_rook_coordinate
        king = King.new(:black)
        checking_rook = Rook.new(:white)
        capturing_bishop = Bishop.new(:black)
        board.place(king, king_coordinate)
        board.place(checking_rook, checking_rook_coordinate)
        board.place(capturing_bishop, capturing_bishop_initial_coordinate)
        board.move_piece(capturing_bishop_initial_coordinate, capturing_bishop_destination_coordinate)

        expect(board).to have_a_bishop_on capturing_bishop_destination_coordinate
      end

      context 'discovered checks' do
        it "can't move another piece that's not capturing the only checking piece while king is in check" do
          king_coordinate = Coordinate.new(:c1)
          irrelevant_bishop_initial_coordinate     = Coordinate.new(:h3)
          irrelevant_bishop_destination_coordinate = Coordinate.new(:g2)
          queen_coordinate = Coordinate.new(:g5)
          path_clearing_knight_coordinate = Coordinate.new(:g2)
          king = King.new(:white)
          irrelevant_bishop = Bishop.new(:white)
          checking_queen = Queen.new(:black)
          path_clearing_knight = Knight.new(:black)
          board.place(king, king_coordinate) 
          board.place(irrelevant_bishop, irrelevant_bishop_initial_coordinate) 
          board.place(checking_queen, queen_coordinate)
          board.place(path_clearing_knight, path_clearing_knight_coordinate)

          expect { board.move_piece(irrelevant_bishop_initial_coordinate, irrelevant_bishop_destination_coordinate) }.to raise_error(Board::AnotherPieceMovedWhenKingInCheckError)
        end
      end

      context 'double checks' do
        it "raises an error when captures one of the checking pieces" do
          king_coordinate = Coordinate.new(:f2)
          checking_knight_coordinate = Coordinate.new(:d3)
          checking_bishop_coordinate = Coordinate.new(:b6)
          illegally_capturing_sniper_bishop_initial_coordinate     = Coordinate.new(:f5)
          illegally_capturing_sniper_bishop_destination_coordinate = checking_knight_coordinate
          king = King.new(:white)
          checking_knight = Knight.new(:black)
          checking_bishop = Bishop.new(:black)
          illegally_capturing_sniper_bishop = Bishop.new(:white)
          board.place(king, king_coordinate)
          board.place(checking_knight, checking_knight_coordinate)
          board.place(checking_bishop, checking_bishop_coordinate)
          board.place(illegally_capturing_sniper_bishop, illegally_capturing_sniper_bishop_initial_coordinate)

          expect { board.move_piece(illegally_capturing_sniper_bishop_initial_coordinate, illegally_capturing_sniper_bishop_destination_coordinate) }.to raise_error(Board::AnotherPieceMovedWhenKingInCheckError)
        end
      end
    end

    context 'moving bishops' do
      it 'can move king after being checked' do
        king_initial_coordinate     = Coordinate.new(:e8)
        king_destination_coordinate = Coordinate.new(:f7)
        bishop_initial_coordinate      = Coordinate.new(:f1)
        bishop_destination_coordinate  = Coordinate.new(:b5)
        king = King.new(:black)
        checking_bishop = Bishop.new(:white)
        board.place(king, king_initial_coordinate) 
        board.place(checking_bishop, bishop_initial_coordinate) 
        board.move_piece(bishop_initial_coordinate, bishop_destination_coordinate)
        board.move_piece(king_initial_coordinate, king_destination_coordinate)
  
        expect(board).to have_a_king_on king_destination_coordinate
      end

      it "can't move another piece that's not capturing the only checking piece while king is in check" do
        king_initial_coordinate = Coordinate.new(:e1)
        irrelevant_knight_initial_coordinate     = Coordinate.new(:c5)
        irrelevant_knight_destination_coordinate = Coordinate.new(:b7)
        bishop_initial_coordinate      = Coordinate.new(:f6)
        bishop_destination_coordinate  = Coordinate.new(:c3)
        king = King.new(:white)
        checking_bishop = Bishop.new(:black)
        irrelevant_knight = Knight.new(:white)
        board.place(king, king_initial_coordinate) 
        board.place(checking_bishop, bishop_initial_coordinate)
        board.place(irrelevant_knight, irrelevant_knight_initial_coordinate)
        board.move_piece(bishop_initial_coordinate, bishop_destination_coordinate)

        expect { board.move_piece(irrelevant_knight_initial_coordinate, irrelevant_knight_destination_coordinate) }.to raise_error(Board::AnotherPieceMovedWhenKingInCheckError)
      end
    end

    context 'moving queens' do
      it 'can move king after being checked' do
        king_initial_coordinate     = Coordinate.new(:e1)
        king_destination_coordinate = Coordinate.new(:f2)
        queen_initial_coordinate      = Coordinate.new(:h8)
        queen_destination_coordinate  = Coordinate.new(:e8)
        king = King.new(:white)
        checking_queen = Queen.new(:black)
        board.place(king, king_initial_coordinate) 
        board.place(checking_queen, queen_initial_coordinate) 
        board.move_piece(queen_initial_coordinate, queen_destination_coordinate)
        board.move_piece(king_initial_coordinate, king_destination_coordinate)
  
        expect(board).to have_a_king_on king_destination_coordinate
      end

      it "can't move another piece that's not capturing the only checking piece while king is in check" do
        king_initial_coordinate = Coordinate.new(:e1)
        irrelevant_knight_initial_coordinate     = Coordinate.new(:c5)
        irrelevant_knight_destination_coordinate = Coordinate.new(:b7)
        queen_initial_coordinate      = Coordinate.new(:h8)
        queen_destination_coordinate  = Coordinate.new(:e8)
        king = King.new(:white)
        checking_queen = Queen.new(:black)
        irrelevant_knight = Knight.new(:white)
        board.place(king, king_initial_coordinate) 
        board.place(checking_queen, queen_initial_coordinate)
        board.place(irrelevant_knight, irrelevant_knight_initial_coordinate)
        board.move_piece(queen_initial_coordinate, queen_destination_coordinate)

        expect { board.move_piece(irrelevant_knight_initial_coordinate, irrelevant_knight_destination_coordinate) }.to raise_error(Board::AnotherPieceMovedWhenKingInCheckError)
      end

      it 'can move king after being checked' do
        king_initial_coordinate     = Coordinate.new(:e8)
        king_destination_coordinate = Coordinate.new(:f7)
        queen_initial_coordinate      = Coordinate.new(:f1)
        queen_destination_coordinate  = Coordinate.new(:b5)
        king = King.new(:black)
        checking_queen = Queen.new(:white)
        board.place(king, king_initial_coordinate) 
        board.place(checking_queen, queen_initial_coordinate) 
        board.move_piece(queen_initial_coordinate, queen_destination_coordinate)
        board.move_piece(king_initial_coordinate, king_destination_coordinate)
  
        expect(board).to have_a_king_on king_destination_coordinate
      end

      it "can't move another piece that's not capturing the only checking piece while king is in check" do
        king_initial_coordinate = Coordinate.new(:e1)
        irrelevant_knight_initial_coordinate     = Coordinate.new(:c5)
        irrelevant_knight_destination_coordinate = Coordinate.new(:b7)
        queen_initial_coordinate      = Coordinate.new(:f6)
        queen_destination_coordinate  = Coordinate.new(:c3)
        king = King.new(:white)
        checking_queen = Queen.new(:black)
        irrelevant_knight = Knight.new(:white)
        board.place(king, king_initial_coordinate) 
        board.place(checking_queen, queen_initial_coordinate)
        board.place(irrelevant_knight, irrelevant_knight_initial_coordinate)
        board.move_piece(queen_initial_coordinate, queen_destination_coordinate)

        expect { board.move_piece(irrelevant_knight_initial_coordinate, irrelevant_knight_destination_coordinate) }.to raise_error(Board::AnotherPieceMovedWhenKingInCheckError)
      end
    end

    context 'moving knights' do
      it 'can move king after being checked' do
        king_initial_coordinate     = Coordinate.new(:d5)
        king_destination_coordinate = Coordinate.new(:d4)
        knight_initial_coordinate      = Coordinate.new(:f5)
        knight_destination_coordinate  = Coordinate.new(:h6)
        king = King.new(:black)
        checking_knight = Knight.new(:white)
        board.place(king, king_initial_coordinate) 
        board.place(checking_knight, knight_initial_coordinate) 
        board.move_piece(knight_initial_coordinate, knight_destination_coordinate)
        board.move_piece(king_initial_coordinate, king_destination_coordinate)
  
        expect(board).to have_a_king_on king_destination_coordinate
      end

      it "can't move another piece that's not capturing the only checking piece while king is in check" do
        king_initial_coordinate = Coordinate.new(:f2)
        irrelevant_bishop_initial_coordinate     = Coordinate.new(:h7)
        irrelevant_bishop_destination_coordinate = Coordinate.new(:b1)
        knight_initial_coordinate      = Coordinate.new(:f6)
        knight_destination_coordinate  = Coordinate.new(:g4)
        king = King.new(:white)
        checking_knight = Knight.new(:black)
        irrelevant_bishop = Bishop.new(:white)
        board.place(king, king_initial_coordinate) 
        board.place(checking_knight, knight_initial_coordinate)
        board.place(irrelevant_bishop, irrelevant_bishop_initial_coordinate)
        board.move_piece(knight_initial_coordinate, knight_destination_coordinate)

        expect { board.move_piece(irrelevant_bishop_initial_coordinate, irrelevant_bishop_destination_coordinate) }.to raise_error(Board::AnotherPieceMovedWhenKingInCheckError)
      end
    end
  end

  context 'pins' do
    context 'moving rooks' do
      context "absolute pin -- can't move within pinning piece's moveset" do
        it "doesn't move a diagonally pinned rook from f2 to f1" do
          pinning_bishop_coordinate = Coordinate.new(:b6)
          pinned_rook_initial_coordinate     = Coordinate.new(:f2)
          pinned_rook_destination_coordinate = Coordinate.new(:f1)
          king_coordinate = Coordinate.new(:g1)
          pinning_bishop = Bishop.new(:black)
          pinned_rook = Rook.new(:white)
          king = King.new(:white)
          board.place(pinning_bishop, pinning_bishop_coordinate)
          board.place(pinned_rook, pinned_rook_initial_coordinate)
          board.place(king, king_coordinate)
          
          expect { board.move_piece(pinned_rook_initial_coordinate, pinned_rook_destination_coordinate) }.to raise_error(MoveValidator::MovedPinnedPieceError)
        end
      end

      context "partial pin -- can only move with moveset that coincides with the pinning piece's moveset" do
        it "can move a horizontally pinned rook to capture its pinning queen" do
          pinning_queen_coordinate = Coordinate.new(:d3)
          pinned_rook_initial_coordinate     = Coordinate.new(:g3)
          pinned_rook_destination_coordinate = pinning_queen_coordinate
          king_coordinate = Coordinate.new(:h3)
          pinning_queen = Queen.new(:white)
          pinned_rook = Rook.new(:black)
          king = King.new(:black)
          board.place(pinning_queen, pinning_queen_coordinate)
          board.place(pinned_rook, pinned_rook_initial_coordinate)
          board.place(king, king_coordinate)
          board.move_piece(pinned_rook_initial_coordinate, pinned_rook_destination_coordinate)

          expect(board).to have_a_rook_on pinned_rook_destination_coordinate
        end
      end
    end

    context 'moving bishops' do
      context "absolute pin -- can't move within pinning piece's moveset" do
        it "doesn't move a horizontally pinned rook from c4 to f7" do
          pinning_rook_coordinate = Coordinate.new(:g4)
          pinned_bishop_initial_coordinate     = Coordinate.new(:c4)
          pinned_bishop_destination_coordinate = Coordinate.new(:f7)
          king_coordinate = Coordinate.new(:b4)
          pinning_rook = Rook.new(:black)
          pinned_bishop = Bishop.new(:white)
          king = King.new(:white)
          board.place(pinning_rook, pinning_rook_coordinate)
          board.place(pinned_bishop, pinned_bishop_initial_coordinate)
          board.place(king, king_coordinate)
          
          expect { board.move_piece(pinned_bishop_initial_coordinate, pinned_bishop_destination_coordinate) }.to raise_error(MoveValidator::MovedPinnedPieceError)
        end
      end
    end

    context 'moving queens' do
      context "partial pin" do
        it "doesn't move a vertically pinned rook from f5 to c2" do
          pinning_rook_coordinate = Coordinate.new(:f1)
          pinned_queen_initial_coordinate     = Coordinate.new(:f5)
          pinned_queen_destination_coordinate = Coordinate.new(:c2)
          king_coordinate = Coordinate.new(:f8)
          pinning_rook = Rook.new(:black)
          pinned_queen = Queen.new(:white)
          king = King.new(:white)
          board.place(pinning_rook, pinning_rook_coordinate)
          board.place(pinned_queen, pinned_queen_initial_coordinate)
          board.place(king, king_coordinate)
          
          expect { board.move_piece(pinned_queen_initial_coordinate, pinned_queen_destination_coordinate) }.to raise_error(MoveValidator::MovedPinnedPieceError)
        end
      end
    end

    context 'moving kings' do
      it "can move a pseudo-pinned king" do
        pinning_queen_coordinate = Coordinate.new(:e7)
        pseudopinned_king_initial_coordinate     = Coordinate.new(:e4)
        pseudopinned_king_destination_coordinate = Coordinate.new(:f5)
        king_coordinate = Coordinate.new(:e2)
        pinning_queen = Queen.new(:black)
        pseudopinned_king = King.new(:white)
        king = King.new(:black)
        board.place(pinning_queen, pinning_queen_coordinate)
        board.place(pseudopinned_king, pseudopinned_king_initial_coordinate)
        board.place(king, king_coordinate)
        board.move_piece(pseudopinned_king_initial_coordinate, pseudopinned_king_destination_coordinate)

        expect(board).to have_a_king_on pseudopinned_king_destination_coordinate
      end
    end
  end

  context 'checkmates' do
    # possibly the responsibility of a GameArbiter or similar

    it "declares checkmate when the opponent king has no legal moves" do
       checkmating_rook_initial_coordinate     = Coordinate.new(:g2)
       checkmating_rook_destination_coordinate = Coordinate.new(:h2)
       companion_guarding_rook_coordinate = Coordinate.new(:g1)
       checkmated_king_coordinate = Coordinate.new(:h7)
       checkmating_rook        = Rook.new(:white)
       companion_guarding_rook = Rook.new(:white)
       checkmated_king = King.new(:black)
       board.place(checkmating_rook, checkmating_rook_initial_coordinate)
       board.place(companion_guarding_rook, companion_guarding_rook_coordinate)
       board.place(checkmated_king, checkmated_king_coordinate)
       board.move_piece(checkmating_rook_initial_coordinate, checkmating_rook_destination_coordinate)

       expect(board.checkmate?(checkmating_rook_initial_coordinate, checkmating_rook_destination_coordinate)).to be(true)
    end

    it "doesn't declare checkmate when the opponent has legal moves" do
       checkmating_rook_initial_coordinate     = Coordinate.new(:g2)
       checkmating_rook_destination_coordinate = Coordinate.new(:h2)
       checkmated_king_coordinate = Coordinate.new(:h7)
       checkmating_rook = Rook.new(:white)
       checkmated_king = King.new(:black)
       board.place(checkmating_rook, checkmating_rook_initial_coordinate)
       board.place(checkmated_king, checkmated_king_coordinate)
       board.move_piece(checkmating_rook_initial_coordinate, checkmating_rook_destination_coordinate)

       expect(board.checkmate?(checkmating_rook_initial_coordinate, checkmating_rook_destination_coordinate)).to be(false)
    end

    it "doesn't declare checkmate when the opponent isn't in check i.e. in stalemate" do
      stalemating_queen_initial_coordinate     = Coordinate.new(:d3)
      stalemating_queen_destination_coordinate = Coordinate.new(:f1)
      stalemated_king_coordinate = Coordinate.new(:h2)
      companion_guarding_rook_coordinate = Coordinate.new(:g7)
      stalemating_queen       = Queen.new(:black)
      companion_guarding_rook = Rook.new(:black)
      stalemated_king = King.new(:white)
      board.place(stalemating_queen, stalemating_queen_initial_coordinate)
      board.place(stalemated_king, stalemated_king_coordinate)
      board.place(companion_guarding_rook, companion_guarding_rook_coordinate)
      board.move_piece(stalemating_queen_initial_coordinate, stalemating_queen_destination_coordinate)

      expect(board.checkmate?(stalemating_queen_destination_coordinate, stalemating_queen_destination_coordinate)).to be(false)
    end

    it "doesn't declare checkmate when the piece inducing checkmate can be captured by the king" do
      checkmating_queen_initial_coordinate     = Coordinate.new(:g7)
      checkmating_queen_destination_coordinate = Coordinate.new(:b7)
      checkmated_king_coordinate = Coordinate.new(:a8)
      checkmating_queen = Queen.new(:black)
      checkmated_king = King.new(:white)
      board.place(checkmating_queen, checkmating_queen_initial_coordinate)
      board.place(checkmated_king, checkmated_king_coordinate)
      board.move_piece(checkmating_queen_initial_coordinate, checkmating_queen_destination_coordinate)

      expect(board.checkmate?(checkmating_queen_initial_coordinate, checkmating_queen_destination_coordinate)).to be(false)
    end
    
    it "doesn't declare checkmate when the piece inducing checkmate can be captured by another piece" do
      supporting_bishop_coordinate = Coordinate.new(:b7)
      checkmating_queen_initial_coordinate     = Coordinate.new(:g5)
      checkmating_queen_destination_coordinate = Coordinate.new(:g2)
      checkmated_king_coordinate = Coordinate.new(:h2)
      defending_queen_coordinate = Coordinate.new(:f1)
      supporting_bishop = Bishop.new(:black)
      checkmating_queen = Queen.new(:black)
      defending_queen = Queen.new(:white)
      checkmated_king = King.new(:white)
      board.place(supporting_bishop, supporting_bishop_coordinate)
      board.place(checkmating_queen, checkmating_queen_initial_coordinate)
      board.place(checkmated_king, checkmated_king_coordinate)
      board.place(defending_queen, defending_queen_coordinate)
      board.move_piece(checkmating_queen_initial_coordinate, checkmating_queen_destination_coordinate)

      expect(board.checkmate?(checkmating_queen_initial_coordinate, checkmating_queen_destination_coordinate)).to be(false)
    end
  end

  context 'draws' do
    context 'stalemates' do
      it "declares stalemate if king has no legal moves but in not check" do
        stalemating_queen_initial_coordinate     = Coordinate.new(:b1)
        stalemating_queen_destination_coordinate = Coordinate.new(:b6)
        stalemated_king_coordinate = Coordinate.new(:a8)
        stalemating_queen = Queen.new(:black)
        stalemated_king = King.new(:white)
        board.place(stalemating_queen, stalemating_queen_initial_coordinate)
        board.place(stalemated_king, stalemated_king_coordinate)
        board.move_piece(stalemating_queen_initial_coordinate, stalemating_queen_destination_coordinate)

        expect(board.stalemate?(stalemating_queen_destination_coordinate, stalemating_queen_destination_coordinate)).to be(true)
      end

      it "doesn't declare stalemate when the king has no legal moves but it's in check i.e. the king is in checkmate" do
        checkmating_queen_initial_coordinate     = Coordinate.new(:c3)
        checkmating_queen_destination_coordinate = Coordinate.new(:g7)
        companion_guarding_bishop_coordinate = Coordinate.new(:b2)
        checkmated_king_coordinate = Coordinate.new(:g8)
        checkmating_queen = Queen.new(:black)
        companion_guarding_bishop = Bishop.new(:black)
        checkmated_king = King.new(:white)
        board.place(checkmating_queen, checkmating_queen_initial_coordinate)
        board.place(companion_guarding_bishop, companion_guarding_bishop_coordinate)
        board.place(checkmated_king, checkmated_king_coordinate)
        board.move_piece(checkmating_queen_initial_coordinate, checkmating_queen_destination_coordinate)

        expect(board.stalemate?(checkmating_queen_initial_coordinate, checkmating_queen_destination_coordinate)).to be(false)
      end

      it "doesn't declare stalemate when the king is not in check but it has legal moves" do
        erratically_moving_queen_initial_coordinate     = Coordinate.new(:c3)
        erratically_moving_queen_destination_coordinate = Coordinate.new(:h3)
        companion_guarding_bishop_coordinate = Coordinate.new(:b2)
        unchallenged_king_coordinate = Coordinate.new(:f8)
        erratically_moving_queen = Queen.new(:black)
        companion_guarding_bishop = Bishop.new(:black)
        unchallenged_king = King.new(:white)
        board.place(erratically_moving_queen, erratically_moving_queen_initial_coordinate)
        board.place(companion_guarding_bishop, companion_guarding_bishop_coordinate)
        board.place(unchallenged_king, unchallenged_king_coordinate)
        board.move_piece(erratically_moving_queen_initial_coordinate, erratically_moving_queen_destination_coordinate)

        expect(board.stalemate?(erratically_moving_queen_initial_coordinate, erratically_moving_queen_destination_coordinate)).to be(false)
      end

      it "doesn't declare stalemate when the king is only in check" do
        checking_queen_initial_coordinate     = Coordinate.new(:h1)
        checking_queen_destination_coordinate = Coordinate.new(:c6)
        checked_king_coordinate = Coordinate.new(:g6)
        checking_queen = Queen.new(:white)
        checked_king = King.new(:black)
        board.place(checking_queen, checking_queen_initial_coordinate)
        board.place(checked_king, checked_king_coordinate)
        board.move_piece(checking_queen_initial_coordinate, checking_queen_destination_coordinate)

        expect(board.stalemate?(checking_queen_initial_coordinate, checking_queen_destination_coordinate)).to be(false)
      end
    end
  end

  describe 'position information encoding' do
    context 'piece placement information encoding' do
      it 'returns a FEN sequence representing piece placement for an empty board' do
        empty_board_fen_sequence = board.to_fen.to_s

        expect(empty_board_fen_sequence).to eq("8/8/8/8/8/8/8/8 -")
      end

      context "white pieces" do
        it 'returns a FEN sequence representing piece placement for a board with 1 white rook on the h-file' do
          white_rook = Rook.new(:white)
          h1 = Coordinate.new(:h1)
          board.place(white_rook, h1)
  
          edge_white_rook_board_fen_sequence = board.to_fen.to_s
  
          expect(edge_white_rook_board_fen_sequence).to eq("8/8/8/8/8/8/8/7R -")
        end

        it 'returns a FEN sequence representing piece placement for a board with 1 white knight on the h-file' do
          white_knight = Knight.new(:white)
          h1 = Coordinate.new(:h1)
          board.place(white_knight, h1)
  
          edge_white_knight_board_fen_sequence = board.to_fen.to_s
  
          expect(edge_white_knight_board_fen_sequence).to eq("8/8/8/8/8/8/8/7N -")
        end

        it 'returns a FEN sequence representing piece placement for a board with 1 white bishop on the h-file' do
          white_bishop = Bishop.new(:white)
          h1 = Coordinate.new(:h1)
          board.place(white_bishop, h1)
  
          edge_white_bishop_board_fen_sequence = board.to_fen.to_s
  
          expect(edge_white_bishop_board_fen_sequence).to eq("8/8/8/8/8/8/8/7B -")
        end

        it 'returns a FEN sequence representing piece placement for a board with 1 white queen on the h-file' do
          white_queen = Queen.new(:white)
          h1 = Coordinate.new(:h1)
          board.place(white_queen, h1)
  
          edge_white_queen_board_fen_sequence = board.to_fen.to_s
  
          expect(edge_white_queen_board_fen_sequence).to eq("8/8/8/8/8/8/8/7Q -")
        end

        it 'returns a FEN sequence representing piece placement for a board with 1 white king on the h-file' do
          white_king = King.new(:white)
          h1 = Coordinate.new(:h1)
          board.place(white_king, h1)
  
          edge_white_king_board_fen_sequence = board.to_fen.to_s
  
          expect(edge_white_king_board_fen_sequence).to eq("8/8/8/8/8/8/8/7K -")
        end

        it 'returns a FEN sequence representing piece placement for a board with 1 white piece on the a-file' do
          white_rook = Rook.new(:white)
          a1 = Coordinate.new(:a1)
          board.place(white_rook, a1)
  
          edge_white_rook_board_fen_sequence = board.to_fen.to_s
  
          expect(edge_white_rook_board_fen_sequence).to eq("8/8/8/8/8/8/8/R7 -")
        end
  
        it 'returns a FEN sequence representing piece placement for a board with a white piece in between empty squares' do
          white_rook = Rook.new(:white)
          e1 = Coordinate.new(:e1)
          board.place(white_rook, e1)
          
          center_white_rook_board_fen_sequence = board.to_fen.to_s
  
          expect(center_white_rook_board_fen_sequence).to eq("8/8/8/8/8/8/8/4R3 -")
        end
  
        it 'returns a FEN sequence representing piece placement for a board with 2 white pieces in between empty squares of 2 consecutive ranks' do
          first_white_rook  = Rook.new(:white)
          second_white_rook = Rook.new(:white)
          c4 = Coordinate.new(:c4)
          d5 = Coordinate.new(:d5)
          board.place(first_white_rook, c4)
          board.place(second_white_rook, d5)
          
          two_white_rooks_in_consecutive_ranks_board_fen_sequence = board.to_fen.to_s
  
          expect(two_white_rooks_in_consecutive_ranks_board_fen_sequence).to eq("8/8/8/3R4/2R5/8/8/8 -")
        end
  
        it 'returns a FEN sequence representing piece placement for a board with 2 white pieces in between empty squares of 2 non-consecutive ranks' do
          first_white_rook  = Rook.new(:white)
          second_white_rook = Rook.new(:white)
          e2 = Coordinate.new(:e2)
          f6 = Coordinate.new(:f6)
          board.place(first_white_rook, e2)
          board.place(second_white_rook, f6)
          
          two_white_rooks_in_consecutive_ranks_board_fen_sequence = board.to_fen.to_s
  
          expect(two_white_rooks_in_consecutive_ranks_board_fen_sequence).to eq("8/8/5R2/8/8/8/4R3/8 -")
        end
  
        it 'returns a FEN sequence representing piece placement for a board with 2 consecutive white pieces on a rank' do
          first_white_rook  = Rook.new(:white)
          second_white_rook = Rook.new(:white)
          f7 = Coordinate.new(:f7)
          g7 = Coordinate.new(:g7)
          board.place(first_white_rook, f7)
          board.place(second_white_rook, g7)
          
          two_consecutive_white_rooks_on_one_rank_board_fen_sequence = board.to_fen.to_s
  
          expect(two_consecutive_white_rooks_on_one_rank_board_fen_sequence).to eq("8/5RR1/8/8/8/8/8/8 -")
        end
  
        it 'returns a FEN sequence representing piece placement for a board with 2 non-consecutive white pieces on a rank' do
          first_white_rook  = Rook.new(:white)
          second_white_rook = Rook.new(:white)
          b3 = Coordinate.new(:b3)
          h3 = Coordinate.new(:h3)
          board.place(first_white_rook, b3)
          board.place(second_white_rook, h3)
          
          two_non_consecutive_white_rooks_on_one_rank_board_fen_sequence = board.to_fen.to_s
  
          expect(two_non_consecutive_white_rooks_on_one_rank_board_fen_sequence).to eq("8/8/8/8/8/1R5R/8/8 -")
        end
      end

      context "black pieces" do
        it 'returns a FEN sequence representing piece placement for a board with 1 black piece on the h-file' do
          black_rook = Rook.new(:black)
          h1 = Coordinate.new(:h1)
          board.place(black_rook, h1)
  
          edge_black_rook_board_fen_sequence = board.to_fen.to_s
  
          expect(edge_black_rook_board_fen_sequence).to eq("8/8/8/8/8/8/8/7r -")
        end

        it 'returns a FEN sequence representing piece placement for a board with 1 black knight on the h-file' do
          black_knight = Knight.new(:black)
          h1 = Coordinate.new(:h1)
          board.place(black_knight, h1)
  
          edge_black_knight_board_fen_sequence = board.to_fen.to_s
  
          expect(edge_black_knight_board_fen_sequence).to eq("8/8/8/8/8/8/8/7n -")
        end

        it 'returns a FEN sequence representing piece placement for a board with 1 black bishop on the h-file' do
          black_bishop = Bishop.new(:black)
          h1 = Coordinate.new(:h1)
          board.place(black_bishop, h1)
  
          edge_black_bishop_board_fen_sequence = board.to_fen.to_s
  
          expect(edge_black_bishop_board_fen_sequence).to eq("8/8/8/8/8/8/8/7b -")
        end

        it 'returns a FEN sequence representing piece placement for a board with 1 black queen on the h-file' do
          black_queen = Queen.new(:black)
          h1 = Coordinate.new(:h1)
          board.place(black_queen, h1)
  
          edge_black_queen_board_fen_sequence = board.to_fen.to_s
  
          expect(edge_black_queen_board_fen_sequence).to eq("8/8/8/8/8/8/8/7q -")
        end

        it 'returns a FEN sequence representing piece placement for a board with 1 black king on the h-file' do
          black_king = King.new(:black)
          h1 = Coordinate.new(:h1)
          board.place(black_king, h1)
  
          edge_black_king_board_fen_sequence = board.to_fen.to_s
  
          expect(edge_black_king_board_fen_sequence).to eq("8/8/8/8/8/8/8/7k -")
        end

        it 'returns a FEN sequence representing piece placement for a board with 1 black piece on the a-file' do
          black_rook = Rook.new(:black)
          a1 = Coordinate.new(:a1)
          board.place(black_rook, a1)
  
          edge_black_rook_board_fen_sequence = board.to_fen.to_s
  
          expect(edge_black_rook_board_fen_sequence).to eq("8/8/8/8/8/8/8/r7 -")
        end
  
        it 'returns a FEN sequence representing piece placement for a board with a black piece in between empty squares' do
          black_rook = Rook.new(:black)
          e1 = Coordinate.new(:e1)
          board.place(black_rook, e1)
          
          center_black_rook_board_fen_sequence = board.to_fen.to_s
  
          expect(center_black_rook_board_fen_sequence).to eq("8/8/8/8/8/8/8/4r3 -")
        end
  
        it 'returns a FEN sequence representing piece placement for a board with 2 black pieces in between empty squares of 2 consecutive ranks' do
          first_black_rook  = Rook.new(:black)
          second_black_rook = Rook.new(:black)
          c4 = Coordinate.new(:c4)
          d5 = Coordinate.new(:d5)
          board.place(first_black_rook, c4)
          board.place(second_black_rook, d5)
          
          two_black_rooks_in_consecutive_ranks_board_fen_sequence = board.to_fen.to_s
  
          expect(two_black_rooks_in_consecutive_ranks_board_fen_sequence).to eq("8/8/8/3r4/2r5/8/8/8 -")
        end
  
        it 'returns a FEN sequence representing piece placement for a board with 2 black pieces in between empty squares of 2 non-consecutive ranks' do
          first_black_rook  = Rook.new(:black)
          second_black_rook = Rook.new(:black)
          e2 = Coordinate.new(:e2)
          f6 = Coordinate.new(:f6)
          board.place(first_black_rook, e2)
          board.place(second_black_rook, f6)
          
          two_black_rooks_in_consecutive_ranks_board_fen_sequence = board.to_fen.to_s
  
          expect(two_black_rooks_in_consecutive_ranks_board_fen_sequence).to eq("8/8/5r2/8/8/8/4r3/8 -")
        end
  
        it 'returns a FEN sequence representing piece placement for a board with 2 consecutive black pieces on a rank' do
          first_black_rook  = Rook.new(:black)
          second_black_rook = Rook.new(:black)
          f7 = Coordinate.new(:f7)
          g7 = Coordinate.new(:g7)
          board.place(first_black_rook, f7)
          board.place(second_black_rook, g7)
          
          two_consecutive_black_rooks_on_one_rank_board_fen_sequence = board.to_fen.to_s
  
          expect(two_consecutive_black_rooks_on_one_rank_board_fen_sequence).to eq("8/5rr1/8/8/8/8/8/8 -")
        end
  
        it 'returns a FEN sequence representing piece placement for a board with 2 non-consecutive black pieces on a rank' do
          first_black_rook  = Rook.new(:black)
          second_black_rook = Rook.new(:black)
          b3 = Coordinate.new(:b3)
          h3 = Coordinate.new(:h3)
          board.place(first_black_rook, b3)
          board.place(second_black_rook, h3)
          
          two_non_consecutive_black_rooks_on_one_rank_board_fen_sequence = board.to_fen.to_s
  
          expect(two_non_consecutive_black_rooks_on_one_rank_board_fen_sequence).to eq("8/8/8/8/8/1r5r/8/8 -")
        end
      end

      it 'returns a FEN sequence representing piece placement for a set-up first rank' do
        board.place( Rook.new(:white)  , Coordinate.new(:a1) )
        board.place( Rook.new(:white)  , Coordinate.new(:h1) )
        board.place( Knight.new(:white), Coordinate.new(:b1) )
        board.place( Knight.new(:white), Coordinate.new(:g1) )
        board.place( Bishop.new(:white), Coordinate.new(:c1) )
        board.place( Bishop.new(:white), Coordinate.new(:f1) )
        board.place( Queen.new(:white) , Coordinate.new(:d1) )
        board.place( King.new(:white)  , Coordinate.new(:e1) )

        empty_board_fen_sequence = board.to_fen.to_s

        expect(empty_board_fen_sequence).to eq("8/8/8/8/8/8/8/RNBQKBNR KQ")
      end

      it 'returns a FEN sequence representing piece placement for a set-up eighth rank' do
        board.place( Rook.new(:black)  , Coordinate.new(:a8) )
        board.place( Rook.new(:black)  , Coordinate.new(:h8) )
        board.place( Knight.new(:black), Coordinate.new(:b8) )
        board.place( Knight.new(:black), Coordinate.new(:g8) )
        board.place( Bishop.new(:black), Coordinate.new(:c8) )
        board.place( Bishop.new(:black), Coordinate.new(:f8) )
        board.place( Queen.new(:black) , Coordinate.new(:d8) )
        board.place( King.new(:black)  , Coordinate.new(:e8) )

        empty_board_fen_sequence = board.to_fen.to_s

        expect(empty_board_fen_sequence).to eq("rnbqkbnr/8/8/8/8/8/8/8 kq")
      end
    end

    context 'castling availability encoding' do
      it 'returns a FEN sequence representing castling availability when white is able to castle kingside' do
        board.place( King.new(:white), Coordinate.new(:e1) )
        board.place( Rook.new(:white), Coordinate.new(:h1) )

        white_with_kingside_castling_move_fen_sequence = board.to_fen.to_s

        expect(white_with_kingside_castling_move_fen_sequence).to eq("8/8/8/8/8/8/8/4K2R K")
      end

      it 'returns a FEN sequence representing castling availability when white is able to castle queenside' do
        board.place( King.new(:white), Coordinate.new(:e1) )
        board.place( Rook.new(:white), Coordinate.new(:a1) )

        white_with_queenside_castling_move_fen_sequence = board.to_fen.to_s

        expect(white_with_queenside_castling_move_fen_sequence).to eq("8/8/8/8/8/8/8/R3K3 Q")
      end

      it 'returns a FEN sequence representing castling availability when black is able to castle kingside' do
        board.place( King.new(:black), Coordinate.new(:e8) )
        board.place( Rook.new(:black), Coordinate.new(:h8) )

        black_with_kingside_castling_move_fen_sequence = board.to_fen.to_s

        expect(black_with_kingside_castling_move_fen_sequence).to eq("4k2r/8/8/8/8/8/8/8 k")
      end

      it 'returns a FEN sequence representing castling availability when black is able to castle queenside' do
        board.place( King.new(:black), Coordinate.new(:e8) )
        board.place( Rook.new(:black), Coordinate.new(:a8) )

        black_with_queenside_castling_move_fen_sequence = board.to_fen.to_s

        expect(black_with_queenside_castling_move_fen_sequence).to eq("r3k3/8/8/8/8/8/8/8 q")
      end

      it 'returns a FEN sequence representing castling availability when black and white are able to castle kingside' do
        board.place( King.new(:white), Coordinate.new(:e1) )
        board.place( Rook.new(:white), Coordinate.new(:h1) )
        board.place( King.new(:black), Coordinate.new(:e8) )
        board.place( Rook.new(:black), Coordinate.new(:h8) )

        white_and_black_with_kingside_castling_move_fen_sequence = board.to_fen.to_s

        expect(white_and_black_with_kingside_castling_move_fen_sequence).to eq("4k2r/8/8/8/8/8/8/4K2R Kk")
      end

      it 'returns a FEN sequence representing castling availability when black and white are able to castle queenside' do
        board.place( King.new(:white), Coordinate.new(:e1) )
        board.place( Rook.new(:white), Coordinate.new(:a1) )
        board.place( King.new(:black), Coordinate.new(:e8) )
        board.place( Rook.new(:black), Coordinate.new(:a8) )

        white_and_black_with_queenside_castling_move_fen_sequence = board.to_fen.to_s

        expect(white_and_black_with_queenside_castling_move_fen_sequence).to eq("r3k3/8/8/8/8/8/8/R3K3 Qq")
      end

      it 'returns a FEN sequence representing castling availability when neither black and white are able to castle either side' do
        board.place( King.new(:white), Coordinate.new(:e2) )
        board.place( Rook.new(:white), Coordinate.new(:a1) )
        board.place( King.new(:black), Coordinate.new(:e7) )
        board.place( Rook.new(:black), Coordinate.new(:a8) )

        no_castling_move_fen_sequence = board.to_fen.to_s

        expect(no_castling_move_fen_sequence).to eq("r7/4k3/8/8/8/8/4K3/R7 -")
      end


    end
  end

end
