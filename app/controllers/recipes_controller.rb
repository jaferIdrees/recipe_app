class RecipesController < ApplicationController
  load_and_authorize_resource 
  before_action :set_food , :set_recipe_food, only: [:get_shopping_list]
  
  def initialize
    super()
    @added_foods = []
  end

  def index
    @user = current_user
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.new
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
    @foods = foods(@recipe_foods)
    @food_choices = food_choices
  end

  def foods(recipe_foods)
    foods = []
    recipe_foods.each do |f|
      food = { name: Food.find(f.food_id).name,
               quantity: f.quantity,
               price: Food.find(f.food_id).price,
               id: f.id }
      foods << food
    end
    foods
  end

  def new
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
      @added_foods.each do |food|
        RecipeFood.create(quantity: food[:quantity], recipe_id: new_recipe.id, food_id: food[:id])
      end
      redirect_to user_recipes_path, notice: 'Recipe was successfully created.'
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
    food = {
      id: params[:food],
      quantity: params[:quantity]
    }
    @added_foods << food
  end
  def neede_food 
    foods = []
    recipe_foods.each do |f|
      food = { name: Food.find(f.food_id).name,
              quantity: f.quantity,
              price: Food.find(f.food_id).price,
              id: f.id }
      foods << food
    end
    foods
  end 
  # food list of the user 
  # recipes foods 
  #  required = food -recipes_foods 
  # 


  #  price     
#  <tr>
# <td><%= shoping[:name] %></td>
# <td><%= shoping[:quantity] %> <%= shoping[:measurement_unit] %></td>
# <td>$<%= shoping[:quantity] * food[:price]%></td>
# </tr>
# 
#   

  def get_shopping_list
    @shopping_list =[]
   
    @recipe_foods.each do |recipe| 
      current_shop = {name:'',quantity:-1,measurement_unit:'',price:-1}
      food = @foods.select { |x| x.id == recipe.food_id}[0]
      current_shop[:name] = food.name
      current_shop[:quantity] = recipe.quantity - food.quantity 
      current_shop[:price] = food.price * current_shop[:quantity]
      current_shop[:measurement_unit] = food.measurement_unit

      
      @shopping_list << current_shop if  current_shop[:quantity].positive? 
    end
      
  end

  private 
  def set_food 
    @foods = Recipe.find(params[:recipe_id]).foods 
  end 

  def set_recipe_food 
    @recipe_foods = Recipe.find(params[:recipe_id]).recipe_foods
  end


end
