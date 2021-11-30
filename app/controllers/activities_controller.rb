class ActivitiesController < ApplicationController
    def index 
        activities  = Activity.all
        render json: activities, status: :ok
    end

    def destroy 
        delete_activity = Activity.find_by(id: params[:id])
        if  delete_activity
            delete_activity.destroy
            head :no_content
        else  
            render json: {
                "error": "Activity not found"
              }, status: :not_found 
        end
      


    end
end
