require_relative '../lib/board_maker'
require_relative '../lib/board'

describe BoardMaker do
  subject(:board_maker) { BoardMaker.new }
  let(:board) { Board.new(board_maker) }

  describe '#make -- when board is made' do
    it 'has a dark square on a1' do
      a1 = Coordinate.new(:a1)
      a1_square = board.square_at(a1)

      expect(a1_square).to be_dark
    end

    it 'has a light square on b1' do
      b1 = Coordinate.new(:b1)
      b1_square = board.square_at(b1)

      expect(b1_square).to be_light
    end

    it 'has a dark square on c1' do
      c1 = Coordinate.new(:c1)
      c1_square = board.square_at(c1)

      expect(c1_square).to be_dark
    end

    it 'has a light square on d1' do
      d1 = Coordinate.new(:d1)
      d1_square = board.square_at(d1)

      expect(d1_square).to be_light
    end

    it 'has a dark square on e1' do
      e1 = Coordinate.new(:e1)
      e1_square = board.square_at(e1)

      expect(e1_square).to be_dark
    end
    
    it 'has a light square on f1' do
      f1 = Coordinate.new(:f1)
      f1_square = board.square_at(f1)

      expect(f1_square).to be_light
    end

    it 'has a dark square on g1' do
      g1 = Coordinate.new(:g1)
      g1_square = board.square_at(g1)

      expect(g1_square).to be_dark
    end
    
    it 'has a light square on h1' do
      h1 = Coordinate.new(:h1)
      h1_square = board.square_at(h1)
      
      expect(h1_square).to be_light
    end

    it 'has a light square on a2' do
      a2 = Coordinate.new(:a2)
      a2_square = board.square_at(a2)

      expect(a2_square).to be_light
    end

    it 'has a dark square on b2' do
      b2 = Coordinate.new(:b2)
      b2_square = board.square_at(b2)

      expect(b2_square).to be_dark
    end

    it 'has a light square on c2' do
      c2 = Coordinate.new(:c2)
      c2_square = board.square_at(c2)

      expect(c2_square).to be_light
    end

    it 'has a dark square on d2' do
      d2 = Coordinate.new(:d2)
      d2_square = board.square_at(d2)

      expect(d2_square).to be_dark
    end
    
    it 'has a light square on e2' do
      e2 = Coordinate.new(:e2)
      e2_square = board.square_at(e2)

      expect(e2_square).to be_light
    end

    it 'has a dark square on f2' do
      f2 = Coordinate.new(:f2)
      f2_square = board.square_at(f2)

      expect(f2_square).to be_dark
    end
    
    it 'has a light square on g2' do
      g2 = Coordinate.new(:g2)
      g2_square = board.square_at(g2)
      
      expect(g2_square).to be_light
    end
    
    it 'has a dark square on h2' do
      h2 = Coordinate.new(:h2)
      h2_square = board.square_at(h2)

      expect(h2_square).to be_dark
    end

    it 'has a dark square on a3' do
      a3 = Coordinate.new(:a3)
      a3_square = board.square_at(a3)

      expect(a3_square).to be_dark
    end

    it 'has a light square on b3' do
      b3 = Coordinate.new(:b3)
      b3_square = board.square_at(b3)

      expect(b3_square).to be_light
    end

    it 'has a dark square on c3' do
      c3 = Coordinate.new(:c3)
      c3_square = board.square_at(c3)

      expect(c3_square).to be_dark
    end

    it 'has a light square on d3' do
      d3 = Coordinate.new(:d3)
      d3_square = board.square_at(d3)

      expect(d3_square).to be_light
    end

    it 'has a dark square on e3' do
      e3 = Coordinate.new(:e3)
      e3_square = board.square_at(e3)

      expect(e3_square).to be_dark
    end
    
    it 'has a light square on f3' do
      f3 = Coordinate.new(:f3)
      f3_square = board.square_at(f3)

      expect(f3_square).to be_light
    end

    it 'has a dark square on g3' do
      g3 = Coordinate.new(:g3)
      g3_square = board.square_at(g3)

      expect(g3_square).to be_dark
    end
    
    it 'has a light square on h3' do
      h3 = Coordinate.new(:h3)
      h3_square = board.square_at(h3)
      
      expect(h3_square).to be_light
    end
  end
end
