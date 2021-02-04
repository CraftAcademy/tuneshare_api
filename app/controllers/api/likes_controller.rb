class Api::LikesController < ApplicationController
  before_action :find_like, only: [:destroy] 

  def create
    if already_liked?
      destroy
    else
    like = current_user.likes.create(like_params)
    render status: 201 
    end
  end

  def destroy
      like = current_user.likes.destroy(like_params)
      render status: 200
  end

  private

  def find_like
    Like.find(params[:id])
  end

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
