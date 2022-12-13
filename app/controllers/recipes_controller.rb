class RecipesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @user = current_user
    @recipes = @user.recipes
  end 


  def show  

  end 


  def destroy

  end 
    


end
