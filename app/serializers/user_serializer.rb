class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :avatar, :agent, :admin
end
