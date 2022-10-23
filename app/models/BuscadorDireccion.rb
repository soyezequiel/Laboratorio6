class BuscadorDireccion
    include HTTParty
    base_uri "https://api.geoapify.com/v1/geocode/reverse"
    def initialize(lat , lon)
       @lat=lat
       @lon=lon
    end


    def direccion
        response= self.class.get("/",{
            query:{
                api_key: Rails.application.credentials.l.geoapify,
                lat: @lat,
                lon: @lon
                }
        })
   caracteristicas= (response["features"][0])["properties"]
   resultado= "#{caracteristicas["address_line1"]}, CP#{caracteristicas["address_line2"]}, "

    end
end
