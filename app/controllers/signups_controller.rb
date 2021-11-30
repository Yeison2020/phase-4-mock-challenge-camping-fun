class SignupsController < ApplicationController

    def create
        new_people = Signup.create(signup_params)
        
        if new_people.valid?
            render json: new_people, status: :created
        else  
            render json: { errors: ['validation errors'] }, status: :unprocessable_entity
        end

    end


    private 

    def signup_params 
        params.permit(:camper_id,:activity_id,:time)

    end
end
