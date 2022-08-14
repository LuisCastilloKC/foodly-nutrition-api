class ApplicationController < ActionController::API

    def encode_token(payload)
        JWT.encode(payload, ENV['JWT_SECRET_PASSWORD'])
    end

    def auth_header
        request.headers['Authorization']
    end

    def decode_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, ENV['JWT_SECRET_PASSWORD'], true, algorithm: ENV['JWT_ALGORIGTH'])
            rescue JWT::DecodeError
                nill
            end
        end
    end
    
end
