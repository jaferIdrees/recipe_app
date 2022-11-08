class FoodsController < ApplicationController
  before_action :set_user 
  before_action :set_food, only: %i[ show edit update destroy ]

  def index
    @foods = Food.where(user_id:params[:user_id])
  end

  def new
    food = Food.new 
  end

  def show 
  end

  def destroy 
    @food.destroy 
    redirect_to user_foods_path, notice:"Food was successfully destroyed."
  end

  def create
  end

  private 
  def set_user 
    @user = User.find(params[:user_id])
  end
  def set_food
    @food= Food.find(params[:id])
  end
end
