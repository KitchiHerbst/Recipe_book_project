class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(user_name: params[:user][:user_name])
        if @user && @user.authenticate(params[:user][:password])
            session[:id] = @user.id
            redirect_to @user
        else 
            flash[:errors] = ['Username or Password is incorrect']
            redirect_to login_path
        end
    end

    def delete
        session.clear
        redirect_to login_path
    end

end
