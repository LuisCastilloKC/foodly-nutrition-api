class ApplicationController < ActionController::API

    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, ENV['JWT_SECRET_PASSWORD'])
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, ENV['JWT_SECRET_PASSWORD'], true, algorithm: ENV['JWT_ALGORIGTH'])
            rescue JWT::DecodeError
                nill
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            user = User.find_by(id: user_id)
        end
    end

    def logged_in?
         !!current_user
    end

    def authorized
        render json: { message: ' Please login or signup'}, status: :unauthorized unless logged_in?
    end

end
