class CoursesController < ApplicationController

    def index
        @courses = Course.all
    end

    def show
        @course = Course.find_by(id: params[:id])
    end

    def destroy
        @course = Course.find_by(id: params[:id])
        @course.destroy
        redirect_to courses_path
    end
    
    def edit
        @course = Course.find_by(id: params[:id])
    end

    def update
        @course = Course.find_by(id: params[:id])
        if @course.update(course_params)
          redirect_to course_path(@course)
        else
          render :edit
        end
    end


    private
        
        def course_params
            params.require(:course).permit(:title, :description, :time, :category)
        end
    
end
