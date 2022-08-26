require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    subject(:board) { Board.new }

    it 'creates an empty board with 64 cells' do
      expect(board.size).to eq(64)
    end

    context 'when a coordinate is valid' do
      it 'contains a cell with a coordinate' do
        expect(board[:b6]).to eq('')
      end

      it 'contains a cell on the first rank' do
        expect(board[:b1]).to eq('')
      end

      it 'contains a cell on the last rank' do
        expect(board[:d8]).to eq('')
      end

      it 'contains a cell on the a-file' do
        expect(board[:a5]).to eq('')
      end

      it 'contains a cell on the h-file' do
        expect(board[:h4]).to eq('')
      end
    end

    context 'when a coordinate is invalid' do
      it 'does not contain a poser coordinate' do
        expect(board[:o9]).to be_nil
      end

      it 'does not contain a coordinate with only a letter' do
        expect(board[:e]).to be_nil
      end

      it 'does not contain a capitalized coordinate' do
        expect(board[:A3]).to be_nil
      end
    end
  end

  describe '#transport' do
    subject(:board) { Board.new }

    context 'when destination coordinate is valid' do
      it 'transports the rook from a1 to a3' do
        starting_coordinate    = :a1
        destination_coordinate = :a3
        rook = double('rook')
        allow(board).to receive(:selected_piece).and_return(rook)

        board.transport(destination_coordinate:)

        expect(board[destination_coordinate]).to be(rook)
        expect(board[starting_coordinate]).to eq('')
      end

      it 'transports the bishop from c4 to f7' do
        starting_coordinate    = :c4
        destination_coordinate = :f7
        bishop = double('bishop')
        allow(board).to receive(:selected_piece).and_return(bishop)

        board.transport(destination_coordinate:)

        expect(board[destination_coordinate]).to be(bishop)
        expect(board[starting_coordinate]).to eq('')
      end

      it 'transports the knight from g1 to f3' do
        starting_coordinate    = :g1
        destination_coordinate = :f3
        knight = double('knight')
        allow(board).to receive(:selected_piece).and_return(knight)

        board.transport(destination_coordinate:)

        expect(board[destination_coordinate]).to be(knight)
        expect(board[starting_coordinate]).to eq('')
      end

      it 'transports the pawn from e2 to e4' do
        starting_coordinate    = :e2
        destination_coordinate = :e4
        pawn = double('pawn')
        allow(board).to receive(:selected_piece).and_return(pawn)

        board.transport(destination_coordinate:)

        expect(board[destination_coordinate]).to be(pawn)
        expect(board[starting_coordinate]).to eq('')
      end
    end

    context 'when destination coordinate does not exist' do
      it 'does not transport the rook from b1 to b10' do
        starting_coordinate    = :b1
        destination_coordinate = :b10
        rook = double('rook')
        allow(board).to receive(:selected_piece).and_return(rook)

        expect { board.transport(destination_coordinate:) }.to_not change { board[starting_coordinate] }
        expect(board[destination_coordinate]).to be_nil
      end
    end
  end
end
