class Validator
  def valid_move?(board:)
    valid_piece_move?(board:) && valid_board_move?(board:)
  end

  private

  def valid_piece_move?(board:)
    selected_piece = board.selected_piece
    current_coordinate = selected_piece.current_coordinate
    destination_coordinate = selected_piece.destination_coordinate
    piece_class = selected_piece.class

    if piece_class == Rook
      current_coordinate = current_coordinate.to_s.chars
      destination_coordinate = destination_coordinate.to_s.chars

      return true if current_coordinate[0] == destination_coordinate[0] || current_coordinate[1] == destination_coordinate[1]
    end

    return false
  end

  def valid_board_move?(board:)
    return true
  end
end
