class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find_by(id: params[:id])
    end

    def new
        @recipe = Recipe.new
        # 5.times {@recipe.recipe_ingredients.build}
    end

    def create 
        @recipe = Recipe.create(recipe_params)
        if @recipe.valid?
            redirect_to @recipe
        else
            flash[:errors] = @recipe.errors.full_messages
            redirect_to new_recipe_path
        end
    end

    private
    # def recipe_params(*args)
    #     params.require(:recipe).permit(*args)
    # end
    
    def recipe_params
        params.require(:recipe).permit!
    end
end
