RSpec.describe 'DELETE /api/posts/:post_id', type: :request do
  let!(:post) { create(:post) }
  describe 'successfully delete their post' do
    before do
      delete "/api/posts/#{post.id}",
             params: { post_id: post.id }
    end

    it 'is expected to return a 204 status' do
      expect(response).to have_http_status 204
    end

    it 'is expected to decrease post count back to 0' do
      expect(Post.count).to eq 0
    end
  end
end
