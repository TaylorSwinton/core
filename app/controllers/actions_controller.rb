class ActionsController < ApplicationController
    def new
        @action = Action.new
    end

    def create
        #make current course, and create a new action related to it.
        @action = current_course.actions.build(action_params)

        if @action.save
            redirect_to  action_path(@action)
        else
            render :new
        end
    end

    def edit
        @pet = Pet.find_by(id: params[:id])
    end

    private

        def action_params
            params.require(:action).permit(:step, :time, :description)
        end
end
