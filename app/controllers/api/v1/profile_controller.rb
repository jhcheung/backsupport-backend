class Api::V1::ProfileController < ApplicationController

    def index
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

end
