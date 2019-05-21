module ApplicationHelper
    def current_course
        @current_course ||= Course.find_by_id(session[:course_id])
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def check_login
        flash[:alert] = "Please Login or Sign up!"
        redirect_to '/' if !logged_in?
    end
end
