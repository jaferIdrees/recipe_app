class RecipesController < ApplicationController
  def initialize
    super()
    @added_foods = []
  end

  # @@added_foods = []

  def index
    @user = current_user
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = @recipe.foods
  end

  def new
    @@added_foods = []
    @recipe = Recipe.new

    foods = Food.where(user_id: current_user.id)
    @food_choices = []

    foods.each do |food|
      @food_choices << [food.name, food.id]
    end
  end

  def create
    new_recipe = Recipe.new(user: current_user, name: params[:name],
                            preparation_time: params[:preparation_time],
                            cooking_time: params[:cooking_time],
                            description: params[:description],
                            public: params[:public])
    if new_recipe.save
      
      @@added_foods.each do |food|
        RecipeFood.create(quantity: food[:quantity], recipe_id: new_recipe.id, food_id: food[:id])
      end
      # redirect_to user_recipes_path
    else
      render inline: '<p>Error</p>'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to user_recipes_path
  end

  def add_food
    # binding.b
    food = {
      id: params[:food],
      quantity: params[:quantity]
    }
    @@added_foods << food
    
  end
end
