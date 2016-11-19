class FeedsController < ApplicationController
  before_action :set_feed, only: [:show]

  def index
    @feeds = Feed.all
    @profile = Profile.all
  end

  def show
    @posts = @feed.posts
  end

  private
    def feed_params
      params.require(:feed).permit(:category, :user_id)
    end

    def set_feed
      @feed = Feed.find(params[:id])
    end
end
