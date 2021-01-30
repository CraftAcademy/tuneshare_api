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
    params.require(:comment).permit(:content, :post_id)
  end
end