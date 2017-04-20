class LikesController < ApplicationController
  def like_toggle
    like = Like.find_by(post_id: params[:id], user_id: current_user.id)

    if like.present?
      like.destroy
    else
      Like.create(post_id: params[:id], user_id: current_user.id)
    end
      redirect_to :back
  end
end
