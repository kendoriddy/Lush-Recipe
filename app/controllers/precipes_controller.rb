class PrecipesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @recipes = Recipe.where(public: true)
    authorize! :read, @recipes.first
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
