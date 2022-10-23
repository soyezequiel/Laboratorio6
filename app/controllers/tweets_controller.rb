class TweetsController < ApplicationController
LP=[
[-34.922395, -57.993827],
[-34.953635, -57.952628],
[-34.919650, -57.915378],
[-34.888751, -57.956623],
]
def index()
#Itero sobre todos los puntos
path = LP.map do |point|
  #Un punto es un arreglo de dos elementos, lat y long
  #los junto con una coma usando #join  join significa unir
  #envuelvo el punto entre parentesis
  #todo en un string
  "(#{point.join(",")})"
end
#Finalmente, junto todos los strings anteriores
#con una coma entre ellos

path=path.join(",")
#En lugar de escribir el path completo en la misma
#consulta, uso interpolacion de string para
#agregar el path que armamos en el paso anterior

  latitud=session[:lat]
  if latitud.nil?     #Como la primera vez al abrir una aplicacion la ubicacion esta en nil, se dejara cargar los tweet ordenados por fecha de creacion
    @tweets = Tweet.order(:created_at)
  else
    @tweets=Tweet.where(
      "location_point <@ polygon(path '#{path}')"
    )
    @tweets = @tweets.order(  #Cuando en el controlador de la localizacion, detecta que la latitud esta en nil, ejecuta un codigo que la vuelve a renderizar, esta vez con la latitud cargada
      Arel.sql(
       "point(#{session[:lat]}, #{session[:lng]}) <-> location_point"
      )
  )
  end

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
