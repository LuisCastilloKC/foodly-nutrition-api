class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        nutritionist = Nutritionist.find_by(username: nutritionist_login_params[:username])

        if nutritionist && nutritionist.authenticate(nutritionist_login_params[:password])
            token = encode_token({ nutritionist_id: nutritionist.id })
            render json: {
                nutritionist: NutritionistSerializer.new(nutritionist),
                token: token
            },
            status: :accepted
        else
            render json: {
                message: 'Invdalid username or password'
            },
            status: :unauthorized
        end
    end


end