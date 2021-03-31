class MealsController < ApplicationController
    def index
        @meals = Meal.all
    end

    def show
        @meal = Meal.find_by(id: params[:id])
    end
end
