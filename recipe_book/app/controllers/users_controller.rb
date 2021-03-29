class UsersController < ApplicationController
    def show
        @user = User.find_by(id: params[:id])
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params(:id, :first_name, :last_name, :user_name, :password))
        if @user.valid?
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params(:first_name, :last_name, :user_name, :password))
        if @user.valid?
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path
        end
    end

    private
    def user_params(*args)
        params.require(:user).permit(*args)
    end
end
