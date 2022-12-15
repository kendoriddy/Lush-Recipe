class FoodsController < ApplicationController
    skip_before_action :authenticate_user!

    def index
        @foods = current_user.foods
    end

    def show
        @food = Food.find(params[:id])
        @user = User.find(params[:user_id])
    end

    def new
        @food = Food.new
    end

    def create
        @food = current_user.foods.new(food_params)

        if @food.save
            redirect_to foods_path, notice: 'New Food successfully added.'
        else
            flash[:alert] = 'Food adding Failed. Please try again.'
        end
    end

    def destroy
        food = Food.find(params[:id])

        unless food.user = current_user
            return flash[:alert] = "You do not have permission to delete this food as it belongs to another user"
        end

        if food.destroy
            flash[:notice] = 'Food deleted successfully.'
          else
            flash[:alert] = 'Food deleting Failed. Please try again.'
          end
          redirect_back(fallback_location: root_path)
    end

    def food_params
        params.require(:food).permit(:name, :quantity, :measurement_unit, :price)
    end
end
