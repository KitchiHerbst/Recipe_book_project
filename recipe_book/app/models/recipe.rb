class Recipe < ApplicationRecord
    has_many :meal_recipes
    has_many :meals, through: :meal_recipes
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    accepts_nested_attributes_for :recipe_ingredients
    #has_many :reviews
    validates :name, presence: true
    validates :name, uniqueness: true
end
