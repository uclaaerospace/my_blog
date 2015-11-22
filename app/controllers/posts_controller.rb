class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def  create
    @post = Post.new(post_params)
    @post.save
    redirect_to "posts/#{@post.id}"
  end

   private

  # params.require(key).permit(filter)
  # key
  #   Strong Parameters を適用したい params の key を指定する。
  # filter
  #   Strong Parameters で許可するカラムを指定する。


  def post_params
    params.require(:post).permit(:title, :category, :body)
  end
end

  def show
    @post = Post.find(params[:id])
  end
end
