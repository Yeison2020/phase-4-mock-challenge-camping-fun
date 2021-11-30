class CampersController < ApplicationController
    # The include just clean the serializer and does not include the camper serializer
    def index 
        #No using the serializer
        render json: Camper.all, include: [:id, :name, :age]

    end

    # While here the serializer apply and the index, because I added the the include did not  use the serializer.
    def show 
        camper = Camper.find_by(id: params[:id])
        if  camper
            # Using serializer
            render json: camper
        else 
            render json: {error: "Camper not found"}, status: :not_found
        end
    end


    def create 
        new_camper = Camper.create(camper_params)
        if new_camper.valid?
            # I added the inluclude to get new camper without Its activities
            render json: new_camper,include: [:id, :name, :age], status: :created
        else  
            # I  can add the number of the status instead
            # Example status: 422 better unprocessable_entity
            render json: {
                "errors": ["validation errors"]
              }, status: :unprocessable_entity
        end

    end



    private 

    def camper_params 
        params.permit(:name,:age)

    end
end
