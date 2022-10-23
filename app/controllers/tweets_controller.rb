class TweetsController < ApplicationController

def index


  latitud=session[:lat]
  if latitud.nil?     #Como la primera vez al abrir una aplicacion la ubicacion esta en nil, se dejara cargar los tweet ordenados por fecha de creacion
    @tweets = Tweet.order(:created_at)
  else
    @tweets = Tweet.order(  #Cuando en el controlador de la localizacion, detecta que la latitud esta en nil, ejecuta un codigo que la vuelve a renderizar, esta vez con la latitud cargada
      Arel.sql(
       "point(#{session[:lat]}, #{session[:lng]}) <-> location_point"
      )
  )
  end


  #


@tweets.all
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
