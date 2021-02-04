class Api::LikesController < ApplicationController
  before_action :find_like, only: [:destroy] 

  def create
    if already_liked?
      destroy
      # render json: { message: "You can't like more than once" }, status: 422
    else
    like = current_user.likes.create(like_params)
    render status: 201 
    end
  end

  def destroy
    if already_liked?
      render json: { message: "You can't destoy me!!!" }, status: 422
    else 
      @like = current_user.likes.find(params[:id])   #destroy(like_params) 
      @like.destroy
      # render status: 200
    end
  end

  private

  def find_like
    likes = Post.likes.find(params[:id])
  end

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
