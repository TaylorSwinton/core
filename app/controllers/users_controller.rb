class UsersController < ApplicationController

    #loading the signup form
    def new
        @user = User.new
    end

    #signup
    def create
        @user = User.new(user_params)
        if @user.save
            #logging in the user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        
    end


    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :admin)
    end

end
