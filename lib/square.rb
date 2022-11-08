class Square
  attr_reader :piece

  def initialize(status = :empty)
    @status = status
    @watchers = []
  end

  def add(piece)
    @status = :occupied
    @piece = piece
  end

  def add_watcher(piece_class)
    @watchers << piece_sym(piece_class)
  end

  def watchers?
    !watchers.empty?
  end

  def empty?
    status == :empty
  end

  def occupied?
    status == :occupied
  end

  def piece_color
    piece.color
  end

  private

  attr_reader :status, :watchers

  def piece_sym(piece_class)
    piece_class.to_s
               .downcase
               .to_sym
  end
end
