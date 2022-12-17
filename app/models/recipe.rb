class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :cooking_time, presence: true, length: { maximum: 20 }
  validates :preparation_time, presence: true, length: { maximum: 20 }
end
