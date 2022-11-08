# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all if User.first 
5.times do  |x|
    User.create(name:"name#{x}");
end 

user = User.first  

Food.destroy_all if Food.first 
5.times do |x| 
    Food.create(name:"name#{x}",measurement_unit:"kg",price:x*2, quantity:x,user_id:user.id)
end 
