class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    new_recipe = Recipe.new(user: current_user, name: params[:recipe][:name],
                            preparation_time: params[:recipe][:preparation_time],
                            cooking_time: params[:recipe][:cooking_time],
                            description: params[:recipe][:description],
                            public: params[:recipe][:public])
    if new_recipe.save
      redirect_to new_user_recipe_path(params[:user_id])

    else
      render inline: '<p>Error</p>'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to user_recipes_path
  end
end
