class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :avatar, :agent, :admin
  has_many :tickets
  attribute :jwt_token do |object|
    JWT.encode({user_id: object.id}, ENV['jwt_secret'])
  end


end
