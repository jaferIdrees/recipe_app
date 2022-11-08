# app/models/food.rb
class Food < ApplicationRecord
    belongs_to :user 
end
