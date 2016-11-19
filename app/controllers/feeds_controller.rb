class FeedsController < ApplicationController
  before_action :set_feed, only: [:show]

  def index
    @feeds = Feed.all
    @feed = Feed.new
    @profile = Profile.all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)
    if @feed.save
      redirect_to feed_path(@feed), success: 'You are now in!'
    else
      render :new, error: 'Something went wrong!'
    end
  end

  def show
  end

  private
    def feed_params
      params.require(:feed).permit(:category, :user_id)
    end

    def set_feed
      @feed = Feed.find(params[:id])
    end
end
