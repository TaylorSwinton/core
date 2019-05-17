class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Sorry, your email or password was incorrect"
            render :new
        end
    end

    def home
        
    end

    #logout route
    def destroy
        session.clear
        redirect_to '/'
    end
    
end