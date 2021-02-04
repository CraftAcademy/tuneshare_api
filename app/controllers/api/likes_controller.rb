class Api::LikesController < ApplicationController
  def create
    # if already_liked?
    #   render json: { message: "You can't like more than once" }, status: 422
    # else
    like = current_user.likes.create(like_params)
    render status: 201 
    # end
  end

  def destroy
   likes = current_user.likes.destroy(like_params) if already_liked?
   render status: 200
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
