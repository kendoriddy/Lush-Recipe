require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    # this should run only in test enviroment else it will be painful
    User.destroy_all
    @user = User.create!(name: 'Kenny', email: 'kenny@gmail.com', password: '123456')
    @food = Food.create!(name: 'Coconut', measurement_unit: 'kg', quantity: 10, price: 20, user_id: @user.id)
  end

  it 'should create a food by current user' do
    expect(@food).to be_valid
    expect(@food.user).to eq @user
  end
  it 'should have name' do
    expect(@food.name).to eq 'Coconut'
  end
  it 'should have measurment unit' do
    expect(@food.measurement_unit).to eq 'kg'
  end
  it 'should have quantity' do
    expect(@food.quantity).to eq 10
  end
  it 'should have price' do
    expect(@food.price).to eq 20
  end
end
