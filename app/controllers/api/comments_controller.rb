class Api::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    comment = current_user.comments.create(comment_params)
    if comment.persisted?
      render json: { comment: comment }, status: 201
    else
      render json: { message: comment.errors.full_messages.to_sentence }, status: 422
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end

# RSpec.describe 'POST /api/posts/:post_id/comments', type: :request do
#   let(:user) { create(:user, email: 'user@new.com') }
#   let(:user_header) { user.create_new_auth_token }
#   let!(:post) { create(:post) }

#   describe 'successfully create a comment' do
#     before do
#       post "/api/posts/#{post.id}/comments",
#            params: {
#              comment: {
#                content: 'Awesome stuff!'
#               #  post_id: post.id
#              }
#            },
#            headers: user_header
#     end

#     it 'is expected to return a 201 status' do
#       expect(response).to have_http_status 201
#     end

#     it 'is expected to return the comment that was created' do
#       expect(post.comments[0]['content']).to eq 'Awesome stuff!'
#     end
#   end
# end
