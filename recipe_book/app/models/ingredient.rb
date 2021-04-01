class Ingredient < ApplicationRecord
    has_many :recipe_ingredients, dependent: :destroy
    has_many :recipes, through: :recipe_ingredients

    validates :name, uniqueness: true
    validates :name, presence: true
end
