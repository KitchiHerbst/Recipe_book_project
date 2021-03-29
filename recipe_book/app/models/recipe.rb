class Recipe < ApplicationRecord
    has_many :meal_recipes
    has_many :meals, through: :meal_recipes
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    #has_many :reviews
end
