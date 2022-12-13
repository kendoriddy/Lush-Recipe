class FoodsController < ApplicationController
    def index
        @foods = current_user.foods
    end

    def show
    end

    def create
    end

    def destroy
    end
end
