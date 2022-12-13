class FoodsController < ApplicationController
    def index
        @foods = current_user.foods
    end

    def show
    end

    def new
        @food = Food.new
    end

    def create
        food = current_user.foods.new(food_params)

        if food.save
            redirect_to foods_path, notice: 'New Food successfully added.'
        else
            flash[:alert] = 'New Food adding Failed. Please try again.'
        end
    end

    def destroy
    end
end
