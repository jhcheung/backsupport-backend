class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    before_action :admin_or_self_authorized, only: [:update]

    
    def create
        user = User.create(user_params)
        options = {
          include: [:tickets]
        }
        if user.valid?
          token = encode_token({ user_id: user.id })
          render json: UserSerializer.new(user, options).serialized_json, jwt: token, status: :created
        else
          render json: { error: 'Failed to create user' }, status: :not_acceptable
        end
    end

    def update
      user = User.find(params[:id])
      options = {
        include: [:tickets]
      }
      if user.update(user_params)
        render json: UserSerializer.new(user, options).serialized_json, status: :no_content
      else
        render json: { error: 'Failed to update user' }, status: :not_acceptable
      end
    end
     
    private
    
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :agent, :admin, :avatar)
    end
    
end
