class RecipeFoodsController < ApplicationController
  def create
    recipe_food = RecipeFood.new(food_id: params[:recipe_food][:food], recipe_id: params[:recipe_id],
                                 quantity: params[:recipe_food][:quantity])
    redirect_to user_recipe_path(id: params[:recipe_id]) if recipe_food.save
  end

  def destroy
    RecipeFood.find(params[:id]).destroy
    redirect_to user_recipe_path(id: params[:recipe_id])
  end
end
