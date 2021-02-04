RSpec.describe 'POST /api/posts/:post_id/likes', type: :request do
  let!(:existing_post) { create(:post) }
  let(:user) { create(:user, email: 'new@user.com') }
  let(:user_header) { user.create_new_auth_token }

  describe 'successfully like a post' do
    before do
      post "/api/posts/#{existing_post.id}/likes",
           params: {
             like: {
               post_id: existing_post.id
             }
           },
           headers: user_header
    end

    it 'is expected to return a 201 status' do
      expect(response).to have_http_status 201
    end

    it 'is expected to increase like count to 1' do
      expect(existing_post.likes.count).to eq 1
    end
  end

  describe 'successfully unlike a post' do
    let!(:existing_post) { create(:post) }
    let!(:like) { create(:like, post_id: existing_post.id) }
    before do    
        delete "/api/posts/#{existing_post.id}/likes/#{like.id}",
             params: {
               like: {
                 post_id: existing_post.id
               }
             },
             headers: user_header
    end

    it 'is expected to return a 204 status' do
      expect(response).to have_http_status 204
    end

    it 'is expected to decrease like count back to 0' do
      expect(existing_post.likes.count).to eq 0
    end
  end
end
