class RecipeFoodsController < ApplicationController
  def create
    
    recipe_food = RecipeFood.new(food_id: params[:recipe_food][:food],recipe_id: params[:recipe_id],quantity: params[:recipe_food][:quantity] )
    if recipe_food.save
      redirect_to user_recipe_path(id: params[:recipe_id])
    end
  end

  def destroy
    # binding.b
    RecipeFood.find(params[:id]).destroy
    redirect_to user_recipe_path(id: params[:recipe_id])
  end
end
