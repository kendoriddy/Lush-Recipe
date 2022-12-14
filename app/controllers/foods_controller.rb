class FoodsController < ApplicationController
  before_action :set_user

  def index
    @foods = @user.foods
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = @user.foods.new(food_params)

    if @food.save
      redirect_to foods_path, notice: 'New Food successfully added.'
    else
      flash[:alert] = 'Food adding Failed. Please try again.'
    end
  end

  def edit
    @food = @user.foods.find(params[:id])
  end

  def update
    @food = @user.foods.find(params[:id])
    if @food.update(food_params)
      redirect_to foods_path, notice: 'Food was successfully updated.'
    else
      flash[:alert] = 'Food updating Failed. Please try again.'
    end
  end

  def destroy
    food = Food.find(params[:id])

    return flash[:alert] = 'You do not have permission to delete this food as it belongs to another user' unless (food.user = @user)

    if food.destroy
      flash[:notice] = 'Food deleted successfully.'
    else
      flash[:alert] = 'Food deleting Failed. Please try again.'
    end
    redirect_back(fallback_location: root_path)
  end

  def general
    @foods = @user.foods
    @user.recipes.map do |recipe|
      recipe.recipe_foods.map do |recipe_food|
        food = recipe_food.food
        test = @foods.select { |f| f.name == food.name }[0]
        test.quantity = test.quantity - recipe_food.quantity
      end
    end
    @foods = @foods.select { |f| f.quantity.negative? }
    @foods.each { |f| f.quantity *= -1 }
    @total = 0
    @foods.each do |food|
      @total += (food.price * food.quantity)
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :quantity, :measurement_unit, :price)
  end

  def set_user
    @user = current_user
  end
end
