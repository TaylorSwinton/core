module CoursesHelper
    def cat_filters
        case params[:category]
        when "Workout"
        @courses = Course.workout
        when "Journaling"
        @courses = Course.journaling
        when "Meditation"
        @courses = Course.meditation
        when "All"
        @courses = Course.all
        end
    end
end
