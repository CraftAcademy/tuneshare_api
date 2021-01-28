RSpec "api/auth" type: :request do
  describe 'successfully login' do
    let(:user) {create (:user)}
    
    is "is expected to find user with correct attributes" do
      expect(user)
    end
  end
end