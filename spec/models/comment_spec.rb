RSpec.describe Comment, type: :model do
  describe 'is expected to have db columns' do
    it { is_expected.to have_db_column :content }
  end

  describe 'is expected to have validation' do
    it { is_expected.to validate_presence_of :content }
  end

  describe 'Factory Bot' do
    it 'is expected to be valid' do
      expect(create(:comment)).to be_valid
    end
  end
end
