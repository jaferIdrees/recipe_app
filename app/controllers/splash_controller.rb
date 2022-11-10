class SplashController < ApplicationController
  skip_before_action :authenticate_user!  
  def index
    @public_recipes = Recipe.where(public: true)
  end
end
