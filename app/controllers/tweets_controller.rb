class TweetsController < ApplicationController

def index
  @tweets = Tweet.order(:created_at)
end
def show
  @tweet=Tweet.find(params[:id])
end
def new
      @tweet=Tweet.new
end
def create
  @tweet=Tweet.new(tweet_params)
  if  @tweet.save
    redirect_to @tweet, notice: "todo legal"
  else
    render :new
  end
end
def tweet_params
  params.require(:tweet).permit(:content, :monster_id, :location_point)
end
end
