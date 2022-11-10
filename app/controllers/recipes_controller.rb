class RecipesController < ApplicationController
  # def initialize
  #   super()
  #   @added_foods = []
  # end

  @@added_foods = []

  def index
    @user = current_user
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.new
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
    def foods
      foods = []
      @recipe_foods.each do |f|
        food = { name: Food.find(f.food_id).name,
                 quantity: f.quantity,
                 price: Food.find(f.food_id).price,
                 id: f.id }
        foods << food
      end
      foods
    end
    @foods = foods
    @food_choices = food_choices
  end

  def new
    @@added_foods = []
    @recipe = Recipe.new
    @food_choices = food_choices
  end

  def food_choices
    foods = Food.where(user_id: current_user.id)
    @food_choices = []

    foods.each do |food|
      @food_choices << [food.name, food.id]
    end
    @food_choices
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
