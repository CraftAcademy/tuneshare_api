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

  describe 'unsuccessfully when user already liked the post' do
    before do
      2.times do
        post "/api/posts/#{existing_post.id}/likes",
             params: {
               like: {
                 post_id: existing_post.id
               }
             },
             headers: user_header
      end
    end

    it 'is expected to return a 422 status' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return an error message' do
      expect(response_json['message']).to eq "You can't like more than once"
    end
  end
end
