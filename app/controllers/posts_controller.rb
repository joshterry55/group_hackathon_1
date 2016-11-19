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
    if @post.save
      redirect_to profile_path(@profile), success: 'Your post was added!'
    else
      render :new, error: 'Something went wrong, try again!'
    end
  end

  def edit
  end

  def update
    if @post.save(post_params)
      redirect_to profile_post(@post), success: 'Your post was edited!'
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
