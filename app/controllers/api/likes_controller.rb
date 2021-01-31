class Api::LikesController < ApplicationController
  def create
    like = current_user.likes.create(like_params)
    render status: 201 if like.persisted?
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
