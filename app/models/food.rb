# app/models/food.rb
class Food < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :recipe_foods

  validates :name, :measurement_unit, presence: true
  validates :price, length: { minimum: 1 }
  validates :quantity, numericality: { only_integer: true }
end
