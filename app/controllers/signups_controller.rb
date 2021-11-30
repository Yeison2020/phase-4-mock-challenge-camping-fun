class SignupsController < ApplicationController
# Remember I need to use the valid? because I'm usin the strong params
    def create
        new_people = Signup.create(signup_params)
        # Important to accesss values Using OOP Please Remember this always.
        if new_people.valid?
            render json: new_people.activity,status: :created
        else  
            render json: { errors: ['validation errors'] }, status: :unprocessable_entity
        end

    end


    private 

    def signup_params 
        params.permit(:camper_id,:activity_id,:time)

    end
end
