class UsersController < ApplicationController
    before_action :current_user, only: [:show, :edit]
    before_action :not_logged_in, only: [:show, :edit]

    def show
        @user = User.find_by(id: session[:id])
    end

    def new
        @user = User.new
    end

    def create
        if user_params[:password] == user_params[:password_confirmation]
            @user = User.create(user_params)
            if @user.valid?
                session[:id] = @user.id 
                redirect_to user_path(@user)
            else
                flash[:errors] = @user.errors.full_messages
                redirect_to new_user_path
            end
        else
            flash[:errors] = ["Password does not match"]
        end
    end

    def edit
        @user = User.find_by(id: session[:id])
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

    def destroy
        User.destroy(session[:id])
        redirect_to '/login'
    end

    private

    def user_params
        params.require(:user).permit(:id, :first_name, :last_name, :user_name, :password, :password_confirmation)
    end

end
