class PieceMaker
  def self.set_of_piece_classes
    [Pawn, Rook, Knight, Bishop, Queen, King]
  end

  def self.make(piece_class, color)
    case piece_class.to_s.to_sym
    when :Pawn
      Pawn
    when :Rook
      Rook
    when :Knight
      Knight
    when :Bishop
      Bishop
    when :Queen
      Queen
    when :King
      King
    end.new(color)
  end
end
