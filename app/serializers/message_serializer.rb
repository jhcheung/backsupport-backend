class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :created_at, :user_id, :ticket_id
  belongs_to :ticket
  belongs_to :user
end
