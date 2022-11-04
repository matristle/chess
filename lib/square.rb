class Square
  def initialize
    @watchers = []
  end

  def add_watcher(piece_class)
    @watchers << piece_sym(piece_class)
  end

  def watchers?
    !watchers.empty?
  end

  private

  attr_reader :watchers

  def piece_sym(piece_class)
    piece_class.to_s
               .downcase
               .to_sym
  end
end
