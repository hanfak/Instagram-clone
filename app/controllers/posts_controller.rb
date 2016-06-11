class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to @post
    else
      flash[:alert] = "Halt, you fiend! You need an image to post here!"
      render :new
    end

  end

  def show
    @post = find_post
  end

  def edit
    @post = find_post
  end

  def update
    @post = find_post
    if @post.update(post_params)
      flash[:success] = "Post updated hombre"
      redirect_to(post_path(@post))
    else
      flash[:alert] = "Something is wrong with your form!"
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def find_post
    Post.find(params[:id])
  end
end
