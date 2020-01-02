class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :created_at
  belongs_to :ticket
  belongs_to :user
end
