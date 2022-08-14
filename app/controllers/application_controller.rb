class ApplicationController < ActionController::API

    before_action :unauthorized

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

    def current_nutritionist
        if decoded_token
            nutritionist_id = decoded_token[0]['nutritionist_id']
            nutritionist = Nutritionist.find_by(id: nutritionist_id)
        end
    end

    def logged_in?
         !!current_nutritionist
    end

    def authorized
        render json: { message: ' Please login or signup'}, status: :unauthorized unless logged_in?
    end

end
