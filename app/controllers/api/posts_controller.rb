class Api::PostsController < ApplicationController
  def index
    posts = Post.all
    render json: { posts: posts }
  end

  def create
    post = Post.create(post_params)
    render json: { message: 'Your post was successfully created!' }, status: 201 if post.persisted?
  rescue StandardError => e
    render json: { message: e.message }, status: 404
  end

  private

  def post_params
    params.require(:post).permit(:track_name, :artists, :image, :preview_url, :description)
  end
end
