class NutritionistsController < ApplicationController

    def index
        nutritionist = Nutritionist.all
        render json: nutritionist
    end
end