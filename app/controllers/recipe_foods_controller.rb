class RecipeFoodsController < ApplicationController
  def create
    render inline: 'test'
  end

  def destroy; end
end
