# app/models/recipe.rb
class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  def total_food_count
    recipe_foods.count
  end

  def total_price
    5 # this should be implemnted from new assocation
  end
end
