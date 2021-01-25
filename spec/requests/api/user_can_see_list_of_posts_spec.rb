RSpec.describe 'GET /api/posts', type: :request do
  let!(:post) { 3.times { create(:post) } }
  describe 'successfully get a list of posts' do
    before do
      get '/api/posts'
    end

    it 'is expected to return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return all posts' do
      expect(response_json['posts'].count).to eq 3
    end
  end
end
