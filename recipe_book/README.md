# Recipe_book_project

## <!-- Models -->
1. Users
2. Meals
3. Recipes
4. RecipeIngredients
5. Ingredients
6. Reviews(Stretch Goal) 

### <!-- Relationships -->

1. class User
    has_many :meals
    has_many :recipes, through: :meals
    has_many :reviews

2. class Meal 
    belongs_to :user
    has_many :meal_recipes
    has_many :recipes, through: :meal_recipes

3. class MealRecipe
    belongs_to :meal
    belongs_to :recipe
    
4. class Recipe 
    has_many :meal_recipes
    has_many :meals, through: :meal_recipes
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :reviews

5. class RecipeIngredient
    belongs_to :recipe
    belongs_to :ingredient

6. class Ingredient
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

7. class Review
    belongs_to :user
    belongs_to :recipe


#### <!-- MVP -->
<!-- 1. User can create an account and edit it later -->
<!-- 2. User can create a recipe  -->
<!-- 3. User account is only accessible to that user -->
<!-- 4. User can add unique ingredients if they arent in the database already  -->
<!-- 5. User can add a meal  -->
<!-- 6. User can see all recipes -->
<!-- 7. User can see all recipes with a specific ingredient -->
<!-- 8. User can see all meals  -->
<!-- 9. User can see all ingredients in a recipe -->


##### <!-- Stretch Goals -->
1. User can edit their own recipes
2. Appearance
3. User can create a Review that has a recipe


###### <!-- Class Attributes -->

1. User
    first_name
    last_name
    user_name
    password

2. Meal
    user_id
    name (Dinner, Lunch, Breakfast, Snack)
    date

3. MealRecipe
    meal_id
    recipe_id

4. Recipe
    name

5. RecipeIngredient
    recipe_id
    ingredient_id
    amount or quantity 

6. Ingredient
    name

7. Review
    user_id
    recipe_id
    rating
    description
<%= button_to "Delete meal", url: '/meals/destroy', method: :delete %><br>