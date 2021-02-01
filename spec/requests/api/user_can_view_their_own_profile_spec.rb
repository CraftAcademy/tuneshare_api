RSpec.describe 'GET /api/users/:user_id', type: :request do
  let(:user) { create(:user) }
  let(:user_header) { user.create_new_auth_token }
  let!(:post) { create(:post, user_id: user.id)}

  describe 'successfully view their profile' do
    before do
      get "/api/users/#{user.id}",
        headers: user_header
    end

    it 'is expected to return a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return a user email' do
      expect(response_json["user"]["email"]).to eq "test-2@example.com"
    end

    it 'is expected to return posts of the user' do
      expect(response_json["user"]["posts"][0]["track"]).to eq "MyTrack"
    end
  end
end
