class StepsController < ApplicationController
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
            redirect_to  step_path(@step)
        else
            render :new
        end
    end

    def edit
        @step = Step.find_by(id: params[:id])
    end

    def show
        @step = Step.find_by(id: params[:id])
    end

    def index
        if params[:course_id] && course = Course.find_by_id(params[:course_id])
            @steps = course.steps
        else
            @steps = Step.all
        end

        # You can put a search bar here?
    end

    private

        def step_params
            params.require(:step).permit(:name, :description, :time, :category, :course_id, course_attributes: [:title, :description, :category, :time])
        end
end
