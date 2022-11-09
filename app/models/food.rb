# app/models/food.rb
class Food < ApplicationRecord
  belongs_to :user

  validates :name, :measurement_unit, presence: true
  validates :price, length: { minimum: 1 }
  validates :quantity, numericality: { only_integer: true }
end
