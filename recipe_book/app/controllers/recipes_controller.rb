class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find_by(id: params[:id])
    end

    def new
        @recipe = Recipe.new
        @recipe_ingredient = RecipeIngredient.new
    end

    def create
        # byebug
        @recipe = Recipe.create(recipe_params(:id, :name))
        flash[:recipe] = @recipe
        flash[:number] = params[:number]
        if @recipe.valid?
            redirect_to new_recipe_ingredient_path
        else
            flash[:errors] = @recipe.errors.full_messages
            redirect_to new_recipe_path
        end
    end

    private
    def recipe_params(*args)
        params.require(:recipe).permit(*args)
    end
end
