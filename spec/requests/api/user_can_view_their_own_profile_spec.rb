RSpec.describe 'GET /api/users/:user_id', type: :request do
  let(:user) { create(:user) }
  let(:user_header) { user.create_new_auth_token }

  describe 'successfully view their profile' do
    before do
      get "/api/users/#{user.id}",
        headers: user_header
    end

    it 'is expected to return a 200 status' do
      expect(response).to have_http_status 200
    end
  end
end
