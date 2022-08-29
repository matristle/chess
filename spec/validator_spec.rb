require_relative '../lib/validator'

describe Validator do
  describe '#valid_move?' do
    context 'when move is valid' do
      it 'returns true' do
        validator = Validator.new
        result = validator.valid_move?

        expect(result).to be(true)
      end
    end
  end
end
