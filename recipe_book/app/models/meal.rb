class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_recipes
  has_many :recipes, through: :meal_recipes

  accepts_nested_attributes_for :meal_recipes
end
