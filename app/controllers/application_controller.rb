class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, ENV['jwt_secret'])
    end
    
    def auth_header
        request.headers['Authorization']
    end
    
    def decoded_token       
        if auth_header
            token = auth_header.split(' ')[1]
            # headers: { 'Authorization': 'Bearer <token>' }
            begin
              JWT.decode(token, ENV['jwt_secret'], true, algorithm: 'HS256')
              # JWT.decode => [{ "beef"=>"steak" }, { "alg"=>"HS256" }]
            rescue JWT::DecodeError
              nil
            end
        end
    end

    def current_user
        if decoded_token
          # decoded_token=> [{"user_id"=>2}, {"alg"=>"HS256"}]
          # or nil if we can't decode the token
          user_id = decoded_token[0]['user_id']
          @user = User.find_by(id: user_id)
        end
    end
    
    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

    def admin_or_self_authorized
        if current_user && current_user.admin || current_user.id == params[:id]
            current_user
        end
    end


    def admin_authorized
        if current_user && current_user.admin
            current_user
        end
    end

    def agent_authorized
        if current_user && current_user.agent
            current_user
        end
    end
    
    
    
end
