class ActionsController < ApplicationController
    def new
        if params[:course_id] && course = Course.find_by_id(params[:course_id])
            @action = course.actions.build
        else
            @action = Action.new
        end
    end

    def create
        #make current course, and create a new action related to it.
        @action = current_user.actions.build(action_params)

        if @action.save #if its valid then save and redirect
            redirect_to  action_path(@action)
        else
            render :new
        end
    end

    def edit
        @action = Action.find_by(id: params[:id])
    end

    def show
        @action = Action.find_by(id: params[:id])
    end

    def index
        if params[:course_id] && course = Course.find_by_id(params[:course_id])
            @actions = course.actions
        else
            @actions = Action.all
        end

        # You can put a search bar here?
    end

    private

        def action_params
            params.require(:action).permit(:step, :description, :time, :category, :course_id)
        end
end
