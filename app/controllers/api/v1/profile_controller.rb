class Api::V1::ProfileController < ApplicationController

    def index
        options = {
            include: [:tickets]
        }  
        render json: UserSerializer.new(current_user, options).serialized_json, status: :accepted
    end

end
