class Api::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def index
    posts = Post.order('created_at DESC')
    render json: posts, each_serializer: PostIndexSerializer
  end

  def create
    post = current_user.posts.create(post_params)
    if post.persisted?
      render json: { message: 'Your post was successfully created!' }, status: 201
    else
      render json: { message: post.errors.full_messages.to_sentence }, status: 422
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    post.destroy
    if post.persisted?
      render json: { message: "OPS, your post wants to stay" }, status: 400
    else
      render json: { message: "Your post has been deleted!" }, status: 204
    end
  end

  private

  def post_params
    params.require(:post).permit(:track, :artists, :image, :preview, :description)
  end
end
