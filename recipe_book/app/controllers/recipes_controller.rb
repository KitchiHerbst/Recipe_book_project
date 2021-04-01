class RecipesController < ApplicationController
    before_action :current_user, only: [:index, :show, :edit, :new]
    before_action :not_logged_in, only: [:show, :edit, :index, :new]
    
    def index
        @user = User.find_by(id: session[:id])
        @recipes = Recipe.all
    end

    def show
        @user = User.find_by(id: session[:id])
        @recipe = Recipe.find_by(id: params[:id])
    end

    def new
        @user = User.find_by(id: session[:id])
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
    
    def recipe_params
        params.require(:recipe).permit!
    end
end
