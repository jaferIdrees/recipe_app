# app/models/users.rb
class User < ApplicationRecord
  has_many :foods
  has_many :recipes

end
