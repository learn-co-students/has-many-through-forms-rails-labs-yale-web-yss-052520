class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @commenters = @post.comments.map {|comment| User.find(comment.user_id) }.uniq 
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # byebug
    post = Post.create(post_params)
    # byebug
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
