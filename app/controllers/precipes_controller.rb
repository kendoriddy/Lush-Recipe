class PrecipesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user
  def index
    @recipes = Recipe.where(public: true)
  end

  def show
  end


  private

  def set_user
    @user = current_user
  end 

  def set_recipe 
    @recipe = Recipe.find(params[:id])
  end 


end
