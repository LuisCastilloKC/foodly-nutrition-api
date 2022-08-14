class NutritionistsController < ApplicationController

    def index
        nutritionist = Nutritionist.all
        render json: nutritionist
    end

    def create 
        nutritionist = Nutritionist.create(nutritionist_params)
        if nutritionist.valid?
            payload = {nutritionist_id: nutritionist.id}
            token = encode_token(payload)
            render json: {nutritionist: nutritionist, token: token}, status: :created
        else
            render: json: {errors: nutritionist.errors.full_messages}
        end
    end

    def login
        nutritionist = Nutritionist.find_by(username: params[:nutritionist][:username])
        if nutritionist && nutritionist.authenticate(params[:nutritionist][:password])
            payload = {nutritionist_id: nutritionist.id}
            token = encode_token(payload)
            render json: {nutritionist: nutritionist, token: token}
        else
            render json: {error: "Invalid username or password"}
        end
    end

    def auto_login
        render json: current_user
    end

    private

    def nutritionist_params
        params.require(:nutritionist).permit(:username, :email, :password)
    end
end