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
    elsif piece_class == Bishop
      current_coordinate = current_coordinate.to_s.chars
      destination_coordinate = destination_coordinate.to_s.chars

      first_file_letter = :a
      first_file_number = 1
      file_number_mapping = { first_file_letter: first_file_number }

      7.times do
        first_file_letter = first_file_letter.succ
        first_file_number = first_file_number.succ

        file_number_mapping[first_file_letter] = first_file_number
      end

      rank_difference = destination_coordinate[1].to_i - current_coordinate[1].to_i
      file_difference = file_number_mapping[destination_coordinate[0].to_sym] - file_number_mapping[current_coordinate[0].to_sym]

      return true if rank_difference == file_difference
    end

    return false
  end

  def valid_board_move?(board:)
    return true
  end
end
