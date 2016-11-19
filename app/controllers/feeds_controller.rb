class FeedsController < ApplicationController

  def index
    @feed = Feed.all
  end

  def show
    @feed = Feed.category(feed_params)
  end

  private
    def feed_params
      params.require(:feed).permit(:category)
    end
end
