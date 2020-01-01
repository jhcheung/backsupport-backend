class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content
  belongs_to :ticket
  belongs_to :user
end
