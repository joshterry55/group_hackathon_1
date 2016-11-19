class FeedsController < ApplicationController
  before_action :set_feed, only: [:show]

  def index
    @feeds = Feed.new
  end

  def show
    @feed = Feed.category(feed_params)
  end

  private
    def feed_params
      params.require(:feed).permit(:category)
    end

    def set_feed
      @feed = Feed.find(params[:id])
    end
end
