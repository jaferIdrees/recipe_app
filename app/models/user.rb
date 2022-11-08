# app/models/users.rb
class User < ApplicationRecord
    has_many :foods 
end
