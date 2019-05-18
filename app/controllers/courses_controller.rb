class CoursesController < ApplicationController
    def new
        @course = Course.new
        2.times {@course.actions.build}
    end

    def index
        @courses = Course.all
    end

    def edit
        @course = Course.find_by(id: params[:id])
    end

    def show
        @course = Course.find_by(id: params[:id])
    end

    def create
        #@course = current_user.courses.build(course_params)
        @course = Course.new(course_params)
        if @course.save
            redirect_to course_path(@course)
        else
            render :new
        end
    end

    private

    def course_params
        params.require(:course).permit(:title, :description, :time, :category, :action_id, action_attributes: [:step, :description, :time])
    end
end
