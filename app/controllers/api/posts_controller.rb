class Api::PostsController < ApplicationController
  def index
    posts = Post.all
    render json: { posts: posts }
  end

  def create
    post = Post.create(post_params)
    if post.persisted?
      render json: { message: 'Your post was successfully created!' }, status: 201
    else
      render json: { message: post.errors.full_messages.to_sentence}, status: 422
    end
  end

  private

  def post_params
    params.require(:post).permit(:track, :artists, :image, :preview, :description)
  end
end
