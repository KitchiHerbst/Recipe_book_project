class MealsController < ApplicationController
    before_action :current_user, only: [:index, :show, :edit, :new]
    before_action :not_logged_in, only: [:show, :edit, :index, :new]

    def index
        @user = User.find_by(id: session[:id])
        @meals = @user.meals 
    end

    def show
        @meal = Meal.find_by(id: params[:id])
        @recipes = @meal.recipes
        # byebug
    end

    def new
        @user = User.find_by(id: session[:id])
        @meal = Meal.new
    end 

    def create
        # byebug
        @meal = Meal.create(meal_params)
        redirect_to meals_path
    end

    def edit
        @meal = Meal.find_by(id: params[:id])
        @user = User.find_by(id: session[:id])
    end

    def update
        @meal = Meal.update(meal_params)
        redirect_to meals_path
    end

    def destroy
        Meal.destroy(params[:id])
        redirect_to meals_path 
    end

    private
    def meal_params
        params.require(:meal).permit!
    end
end
