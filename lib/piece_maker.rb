class PieceMaker
  def self.set_of_piece_classes
    [Pawn, Rook, Knight, Bishop, Queen, King]
  end

  def self.make(piece_class, color)
    if piece_class == Pawn
      Pawn
    elsif piece_class == Rook
      Rook
    elsif piece_class == Knight
      Knight
    elsif piece_class == Bishop
      Bishop
    elsif piece_class == Queen
      Queen
    elsif piece_class == King
      King
    end.new(color)
  end
end
