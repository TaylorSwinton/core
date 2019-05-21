class StepsController < ApplicationController
    before_action :check_login

    def new
        if params[:course_id] && course = Course.find_by_id(params[:course_id])
            @step = course.steps.build
        else
            @step = Step.new
            @step.build_course
        end
    end

    def create
        #make current course, and create a new step related to it.
        #byebug
        #@step = Step.create(step_params)
        @step = current_user.steps.build(step_params)
        #byebug
        
        if @step.save #if its valid then save and redirect
            #redirect_to  step_path(@step)
            @course = @step.course
            redirect_to course_steps_path(@course)
        else
            @step.build_course unless @step.course
            render :new
        end
    end

    def edit
        @step = Step.find_by(id: params[:id])
    end

    def show
        @step = Step.find_by(id: params[:id])
        @course = @step.course
    end

    def index
        if params[:course_id] && course = Course.find_by_id(params[:course_id])
            @steps = course.steps
            @course = course
        else
            @steps = Step.all
        end
    end

    
    def update
        @step = Step.find_by(id: params[:id])
        if @step.update(step_params)
          redirect_to step_path(@step)
        else
          render :edit
        end
    end

    def destroy
        @step = Step.find_by(id: params[:id])
        @step.destroy
        redirect_to user_path(@step.user)
    end

    private

        def step_params
            params.require(:step).permit(:name, :description, :category, :course_id, course_attributes: [:title, :description, :category, :time])
        end
end
