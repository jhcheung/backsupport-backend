class TicketSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :open, :owner_id, :customer_id, :created_at
  belongs_to :customer, record_type: :user, serializer: UserSerializer
  belongs_to :owner, record_type: :user, serializer: UserSerializer
  has_many :messages
end
