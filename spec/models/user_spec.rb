RSpec.describe User, type: :model do
  it 'is expected to have valid Factory' do
    expect(create(:user)).to be_valid
  end
end
