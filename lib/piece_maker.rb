require_relative 'pawn'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'

class PieceMaker
  PIECE_CLASSES = {
    pawn:   Pawn,
    rook:   Rook,
    knight: Knight,
    bishop: Bishop,
    queen:  Queen,
    king:   King
  }
  
  def self.make(piece_class_symbol, color)
    PIECE_CLASSES[piece_class_symbol].new(color)
  end

  def self.set_of_piece_class_symbols
    PIECE_CLASSES.keys
  end

  def self.piece_classes
    PIECE_CLASSES.values
  end
end
