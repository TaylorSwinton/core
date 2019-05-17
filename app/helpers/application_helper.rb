module ApplicationHelper
    def current_course
        @current_course ||= Course.find_by_id(session[:course_id])
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
end
