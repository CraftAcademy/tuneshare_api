RSpec.describe Post, type: :model do
  describe 'is expected to have db columns' do
    it { is_expected.to have_db_column :track }
    it { is_expected.to have_db_column :artists }
    it { is_expected.to have_db_column :image }
    it { is_expected.to have_db_column :preview }
    it { is_expected.to have_db_column :description }
  end

  describe 'is expected to have validation' do
    it { is_expected.to validate_presence_of :track }
    it { is_expected.to validate_presence_of :artists }
    it { is_expected.to validate_presence_of :description }
  end

  describe 'Factory Bot' do
    it 'is expected to be valid' do
      expect(create(:post)).to be_valid
    end
  end
end
