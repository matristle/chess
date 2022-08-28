require_relative '../lib/validity_inspector'

describe ValidityInspector do
  describe '#valid_move?' do
    validity_inspector = ValidityInspector.new

    result = validity_inspector.valid_move?

    expect(result).to be(true)
  end
end
