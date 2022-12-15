class RecipesController < ApplicationController
  before_action :set_user
  before_action :set_recipe, only: [:show, :destroy]

  def index
    @recipes = @user.recipes
  end


  def show
  end


  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = @user
    if @recipe.save
      redirect_to recipes_path, notice: "recipe created successfully"
    else
      render :new, notice: "notsaved"
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_recipe
    @recipe = set_user.recipes.find(params[:id])
  end


  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end

end
