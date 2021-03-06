class PostsController < ApplicationController
  before_action :set_profile
  before_action :set_post, except: [:new, :create]

  def show
    paginate(page: params[:page], per_page: 15)
  end

  def new
    @post = @profile.posts.new
  end

  def create
    @post = @profile.posts.new(post_params)
    @post.feed_id = Feed.find_by(category: @post.category).try(:id)
    if @post.save
      redirect_to profile_path(@profile), success: 'Your post was added!'
    else
      render :new, error: 'Something went wrong, try again!'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to profile_path(@profile), success: 'Your post was edited!'
    else
      render :edit, error: 'Something went wrong, try again!'
    end
  end

  def destroy
    @post.destroy
    redirect_to profile_path(@profile)
  end

  private
    def set_post
      @post = @profile.posts.find(params[:id])
    end

    def set_profile
      @profile = Profile.find(params[:profile_id])
    end

    def post_params
      params.require(:post).permit(:title, :category, :body, :feed_id, :profile_id)
    end

end
