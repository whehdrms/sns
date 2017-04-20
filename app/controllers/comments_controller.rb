class CommentsController < ApplicationController
  def create
    Comment.create(post_id: params[:id], user_id: current_user.id, content: params[:content])
    redirect_to :back
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to :back
  end
end
