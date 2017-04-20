class PostController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_check, only: [:edit,:update, :destroy]

  def index
    @all_post = Post.all
    @user = current_user
    @comment = Comment.all
  end

  def new
  end

  def create
    new_post = Post.new(content: params[:content], user_id: current_user.id)
    if new_post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  def edit
  end

  def update
    @post.content = params[:content]
    if @post.save
      redirect_to '/'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to '/'
  end

  private
  def authenticate_check
    @post = Post.find(params[:id])
    unless @post.user.id == current_user.id
      redirect_to '/'
    end
  end
end
