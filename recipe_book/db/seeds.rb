# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
RecipeIngredient.destroy_all
Ingredient.destroy_all
Recipe.destroy_all


i1 = Ingredient.create(name: "tomato")
i2 = Ingredient.create(name: "sugar")
i3 = Ingredient.create(name: "cinnamon")
i4 = Ingredient.create(name: "brown sugar")
i5 = Ingredient.create(name: "garlic salt")
i6 = Ingredient.create(name: "lemon juice")

r1 = Recipe.create(name: "Grandma's Special Sweet-Maters")

ri1 = RecipeIngredient.create(recipe: Recipe.first, ingredient: Ingredient.first, quantity: 1)
ri2 = RecipeIngredient.create(recipe: Recipe.first, ingredient: Ingredient.second, quantity: 1)
ri3 = RecipeIngredient.create(recipe: Recipe.first, ingredient: Ingredient.third, quantity: 1)