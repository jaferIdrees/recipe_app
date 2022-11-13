# app/models/recipe_food.rb
class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
end
