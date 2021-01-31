class Api::LikesController < ApplicationController
  before_action :find_post
  def create
    like = @post.likes.create(user_id: current_user.id)
    render status: 201 if like.persisted?
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
