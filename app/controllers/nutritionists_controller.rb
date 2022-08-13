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
end