class ApplicationController < ActionController::API

    def encode_token(payload)
        JWT.encode(payload, ENV['JWT_SECRET_PASSWORD'])
    end
    

end
