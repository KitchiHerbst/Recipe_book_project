class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_recipes, dependent: :destroy
  has_many :recipes, through: :meal_recipes

  accepts_nested_attributes_for :meal_recipes, allow_destroy: true
end
