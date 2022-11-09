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
  validates :name, presence: true, length: { maximum: 250 }
  validates :preperation_time, :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
