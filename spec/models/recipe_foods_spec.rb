require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    # this should run only in test enviroment else it will be painful
    User.destroy_all
    @user = User.create!(name: 'Kenny', email: 'kenny@gmail.com', password: '123456')
    @food = Food.create!(name: 'Coconut', measurement_unit: 'kg', quantity: 10, price: 20, user_id: @user.id)
    @recipe = Recipe.create!(name: 'Carrot', preparation_time: '10 min', cooking_time: '3 min', description: 'best food for winter',
                             public: true, user: @user)
    @recipe_food = RecipeFood.create!(quantity: '30', food_id: @food.id, recipe_id: @recipe.id)
  end

  it 'quantity should equal 30' do
    expect(@recipe_food.quantity) == '30'
  end
end
