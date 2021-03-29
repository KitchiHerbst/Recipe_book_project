class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.all
    end

    def show
        @ingredient = Ingredient.find_by(id: params[:id])
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.create(ingredient_params(:name))
        if @ingredient.valid?
            redirect_to @ingredient
        else
            flash[:errors] = @ingredient.errors.full_messages
            redirect_to new_ingredient_path 
        end
    end

    private
    def ingredient_params(*args)
        params.require(:ingredient).permit(:name)
    end
end
