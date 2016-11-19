class PostsController < ApplicationController
  before_action :set_post
  before_action :set_feed, :except [:index, :new, :edit]

  def index
    @posts = feed.posts.all
  end

  def show
  end

  def new
    @post = feed.posts.new
  end

  def create
    @post = feed.posts.new(post_params)
    if @post.save
      redirect_to feeds_path(@post), success: 'Your post was added!'
    else
      render :new, error: 'Something went wrong, try again!'
    end
  end

  def edit
  end

  def update
    if @post.save(post_params)
      redirect_to feed_post(@post), success: 'Your post was edited!'
    else
      render :edit, error: 'Something went wrong, try again!'
  end

  def destroy
    @post.destroy
    redirect_to feeds_path
  end

  private
    def set_post
      @post = feed.posts.find(params[:id])
    end

    def set_feed
      @feed = Feed.find(params[:feed_id])
    end

    def post_params
      params.require(:post).permit(:title, :category, :body)
    end

end
