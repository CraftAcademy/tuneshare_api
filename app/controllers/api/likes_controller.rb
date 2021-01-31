class Api::LikesController < ApplicationController
  def create
    if already_liked?
      render json: { message: "You can't like more than once" }, status: 422
    else
    like = current_user.likes.create(like_params)
    render status: 201 if like.persisted?
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
