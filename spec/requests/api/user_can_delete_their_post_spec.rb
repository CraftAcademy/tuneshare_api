RSpec.describe 'DELETE /api/posts/:post_id', type: :request do
  let(:user) { create(:user) }
  let(:user_header) { user.create_new_auth_token }
  let!(:post) { create(:post, user_id: user.id) }
  describe 'successfully delete their post' do
    before do
      delete "/api/posts/#{post.id}",
             params: { post_id: post.id },
             headers: user_header
    end

    it 'is expected to return a 204 status' do
      expect(response).to have_http_status 204
    end

    it 'is expected to decrease post count back to 0' do
      expect(Post.count).to eq 0
    end
  end
end
