RSpec.describe 'POST /api/posts/:post_id/comments', type: :request do
  let!(:existing_post) { create(:post) }
  let(:user) { create(:user, email: 'new@user.com') }
  let(:user_header) { user.create_new_auth_token }

  describe 'successfully create a comment' do
    before do
      post "/api/posts/#{existing_post.id}/comments",
           params: {
             comment: {
               content: 'Awesome stuff!',
               post_id: existing_post.id,
             }
           },
           headers: user_header
    end

    it 'is expected to return a 201 status' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return the comment that was created' do
      expect(existing_post.comments[0]['content']).to eq 'Awesome stuff!'
    end
  end
end
