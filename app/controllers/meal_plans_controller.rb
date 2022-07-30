class MealPlansController < ApplicationController 

    def index
        mealplans = MealPlans.all
        render json: mealplans
    end

    def create
        mealplan = MealPlans.create(mealplan_param)

        if mealplan.save
            render json: mealplan, status: :created
        else
            render json: mealplan.errors, status: :unprocessable_entity
        end
    end
