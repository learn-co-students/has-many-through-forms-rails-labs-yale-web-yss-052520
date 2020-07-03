class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment.build_user
    @users = User.all
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.categories.build
    @categories = Category.all
  end

  def create
    if params[:post][:categories_attributes]["0"][:name].empty?
      params[:post].delete(:categories_attributes)
    end
    post = Post.create(post_params)
    if params[:post][:category_ids][0].empty?
       params[:post].delete(:category_ids)
    else
        params[:post][:category_ids].each { |cat_id| post.category_ids << cat_id }
        params[:post].delete(:category_ids)
    end
    post.save
    # post = Post.create(post_params)
    redirect_to post
  end

  def new_cat_blank?
    params[:post][:categories_attributes]["0"][:name].empty?
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end

  
end
