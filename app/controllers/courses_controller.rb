class CoursesController < ApplicationController
    before_action :check_login
    skip_before_action :verify_authenticity_token

    include CoursesHelper

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
         if @course.save
            #  respond_to do |f|
            #      f.html {redirect_to course_path(@course)}
            #      f.json {render json: @course}
            # end
            #turns into course.json if status is removed
            render json: @course, status: 301
            #redirect_to course_path(@course)
        else
            render :new
        end
    end

    def index
        #@courses = Course.all
        if params[:category]
            cat_filters
            responding_json
        else
            @courses = Course.all
            responding_json
        end
    end

    def show
        @course = Course.find_by(id: params[:id])
        respond_to do |f|
            f.html {render :show}
            f.json {render json: @course}
        end
    end

    def destroy
        @course = Course.find_by(id: params[:id])
        @course.destroy
        respond_to do |f|
            f.html {redirect_to courses_path}
            f.json {head :no_content}
        end
        #redirect_to courses_path
    end
    
    def edit
        @course = Course.find_by(id: params[:id])
    end

    def update
        @course = Course.find_by(id: params[:id])
        if @course.update(course_params)
            respond_to do |f|
                f.html {redirect_to course_path(@course)}
                f.json {render json: @course}
            end
            #redirect_to course_path(@course)
        else
          render :edit
        end
    end


    private
        
        def course_params
            params.require(:course).permit(:title, :description, :time, :category)
        end

        def responding_json
            respond_to do |f|
                f.html {render :index}
                f.json {render json: @courses}
            end
        end

        # def responding_json
        #     respond_to do |f|
        #         f.html {render :index}
        #         f.json: Course.to_json(include: :steps)
        #     end
        # end

        def course_responders
            respond_to do |f|
                f.html
                f.json {render json: @posts}
            end
        end
    
end
