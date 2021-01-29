RSpec.describe 'GET /api/posts', type: :request do
  let(:user) {create(:user)}
  let(:user_headers) {user.create_new_auth_token}
  let!(:post) { 3.times { create(:post, user_id: user.id)} }
  describe 'successfully get a list of posts' do
    before do 
      get '/api/posts',
      headers: user_headers
    end 

    it 'is expected to return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return all posts' do
      expect(response_json['posts'].count).to eq 3
    end

    it 'is expected to have a track name in the first post' do
      expect(response_json['posts'][0]['track']).to eq 'MyTrack'
    end

    it 'is expected to have an artist in the second post' do
      expect(response_json['posts'][1]['artists']).to eq 'MyArtist'
    end

    it 'is expected to have an image in the third post' do
      expect(response_json['posts'][2]['image']).to eq 'MyImage'
    end
  end
end
