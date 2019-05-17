class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    #login route
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

    #omniauth Facebook login
    def fbcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
            u.password = auth['uid']
        end
        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end

    def home
        
    end

    #logout route
    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end
    
end