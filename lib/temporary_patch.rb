module TemporaryPatch
  refine Symbol do
    def belongs_to?(set_of_pieces)
      set_of_pieces.include? self
    end
  end
end
