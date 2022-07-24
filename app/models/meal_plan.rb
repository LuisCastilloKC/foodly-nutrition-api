class MealPlan < ApplicationRecord
  belongs_to :nutritionist
  belongs_to :patient
end
