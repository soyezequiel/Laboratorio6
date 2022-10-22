class Phone
    include HTTParty
    base_uri "https://phonevalidation.abstractapi.com/v1/"
    def initialize(numero)
        @tel=numero
    end
    def valid?
        response= self.class.get("/",{
            query:{
                api_key: Rails.application
                .credentials
                .l[:pepito],
                phone: @tel
                }
        })
        response["valid"]

    end
end
#< ApplicationRecord

        # Rails.application.credentials.abstractapi_api_key
        #response["is_valid_number"]X
