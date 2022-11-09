# app/models/recipe.rb
class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true, length: { maximum: 250 }
  validates :preperation_time, :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
