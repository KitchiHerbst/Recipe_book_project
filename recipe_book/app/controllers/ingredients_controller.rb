class IngredientsController < ApplicationController
    before_action :current_user, only: [:index, :show, :edit, :new]
    before_action :not_logged_in, only: [:show, :edit, :index, :new]
    
    def index
        @user = User.find_by(id: session[:id])
        @ingredients = Ingredient.all
    end

    def show
        @user = User.find_by(id: session[:id])
        @ingredient = Ingredient.find_by(id: params[:id])
    end

    def new
        @user = User.find_by(id: session[:id])
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
        params.require(:ingredient).permit(*args)
    end
end
