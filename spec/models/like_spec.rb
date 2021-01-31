RSpec.describe Like, type: :model do
  describe 'Factory Bot' do
    it 'is expected to be valid' do
      expect(create(:like)).to be_valid
    end
  end
end
